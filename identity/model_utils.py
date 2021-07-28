#  MODEL UTILS FILE: this file contains all about models we will use for our application:

# import pytesseract
import fitz
import io
from PIL import Image
import cv2 as cv
import numpy as np
import re
import os
import matplotlib.image as mpimg
import pandas as pd
from glob import glob
from tensorflow.keras.models import load_model
from joblib import load

# Constants

# detector = MTCNN()  # face extractor
DIRECTORY = "static/images_extracted"

MODEL_FACE_EXTRACT_PATH = "static/model/face_detector.xml"
SCALE_FACTOR = 1.3
MIN_NEIGHBOURS = 2

MODEL_FACE_EMBED_PATH = "static/model/facenet_keras.h5"

MODEL_FACE_ClASS_PATH = "static/model/identity_model.sav"


# Get matricule from file
# def get_mat(image):
#     """
#     Helper function for account number recognition
#     :param image: a scanned image
#     :return: found or not found
#     """
#
#     found = None
#
#     string = pytesseract.image_to_string(image).strip()
#
#     match_search = re.search('0\d{10}', string)
#     if match_search:
#         found = match_search.group(0)
#
#     return found


def func_cv_cascade(image):
    """
    :param image:
    :return: faces list detected inside the image
    """
    face_cascade = cv.CascadeClassifier(MODEL_FACE_EXTRACT_PATH)

    gray = cv.cvtColor(image, cv.COLOR_BGR2GRAY)

    faces = face_cascade.detectMultiScale2(gray, 1.1, 4, minSize=(145, 145))

    return faces


# Function to extract image inside legal folder
def get_image_from_file(account_number=None, picture = None):
    """
    Whole function to loop inside scanned file, extract image and associate it to account number
    :param account_number: User account number to check
    :return: Image and account number founded
    """

    try:

        # read image and process it

        if picture is None:
            path_folder = DIRECTORY + "/" + account_number

            # Get corresponding document file
            path = os.path.join(path_folder, "*.jpeg")
            #
            file_path = glob(path)[0]
            if file_path is not None:
                img = cv.imread(file_path)

        else:
            img = picture

        face = cv.resize(img, (160, 160))

        model_embed = load_model(MODEL_FACE_EMBED_PATH)

        embedding = get_embedding(model_embed, face)

        # print(face.shape)
        #
        # print(embedding.shape)

        formatted_embedding = np.expand_dims(embedding, axis=0).reshape((1, -1))

        # print(formatted_embedding.shape)

        # Load pre-trained face model and  Classify the face
        model_classify = load(MODEL_FACE_ClASS_PATH)

        probabilities = model_classify.predict_proba(formatted_embedding).reshape(-1).tolist()
        classes = model_classify.classes_.tolist()

        predictions = list(zip(probabilities, classes))
        predictions.sort(reverse=True)

        # max_prob = np.argmin(probabilities)
        #
        # probability = 1 - probabilities [0][max_prob]
        #
        # prediction = (probability, model_classify.classes_[max_prob])

        return predictions

    except Exception as e:
        print("Error : {}".format(e))

    return None


# Model loading and training functions
def load_train_data(n):
    """ Loading train datasets"""

    lst = []
    for i in range(1, n + 1):
        filename = str(i) + '.jpg'
        x = mpimg.imread('datas_test/train/' + filename)
        x = cv.resize(x, (224, 224))
        lst.append(x)
    df = np.array(lst)
    y_train = pd.read_csv('datas_test/train/y_train.csv', header=None)
    y_train = y_train.values

    return df, y_train


def load_test_data(n):
    """"""
    lst = []
    for i in range(1, n + 1):
        filename = str(i) + '.jpg'
        x = mpimg.imread('datas_test/test/' + filename)
        x = cv.resize(x, (224, 224))
        lst.append(x)

    df = np.array(lst)
    y_test = pd.read_csv('datas_test/test/y_test.csv', header=None)
    y_test = y_test.values

    return df, y_test


def get_embedding(model, face):
    """
    Function to generate an embedding given a face
    :param model: The corresponding pre-trained model we'll use to generate embeddings
    :param face:
    :return: The corresponding embedding
    """

    face = np.array(face).astype('float32')

    mean, std = face.mean(), face.std()

    face = (face - mean) / std

    # convert to model input
    embed_face = np.expand_dims(face, axis=0)

    # get prediction
    pred = model.predict(embed_face)

    return pred[0]