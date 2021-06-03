var path = require('path');
var webpack = require('webpack');
var BundleTracker = require('webpack-bundle-tracker');

module.exports = {
    // entry: './src/index.js',
    module:{
    rules: [
        {
            test: /\.js$|jsx/,
            exclude: /node_modules/,
            use: {
                loader: "babel-loader",
                options: {
                    presets: ["@babel/preset-env"]
                }
            }
        },
        {
            test: /\.css$/,
            exclude: /node_modules/,
            use: [
                'style-loader',
                'css-loader'
            ]
        },
        {
            test: /\.(woff(2)?|ttf|eot|svg|png|jpg)(\?v=\d+\.\d+\.\d+)?$/,
            exclude: /node_modules/,
            use: [
                {
                    loader: 'file-loader',
                    options: {
                        name: '[name].[ext]',
                        outputPath: 'webfonts/'
                    }
                }
            ]
        }
    ],
},
    devServer: {
        port: 8000,
        writeToDisk: true,
        hotOnly: true,
        writeToDisk: true,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
            "Access-Control-Allow-Headers":
                "X-Requested-With, content-type, Authorization",
        },
    },
    watch: true,
    plugins: [
        new BundleTracker({
            path: __dirname,
            filename: 'webpack-stats.json'
        }),
    ],
}