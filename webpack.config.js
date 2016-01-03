var path = require('path');
var config = {
    context: __dirname + '/src',
    entry: {
        javascript: './main.js',
        html: './index.html'
    },
    output: {
        filename: 'bundle.js',
        path: __dirname + '/dist'
    },
    module: {
        loaders: [
            {test: /\.js$/, loader: "babel", exclude: /node_modules/, query: {presets: ['react', 'es2015']}},
            {test: /\.css$/, loader: 'style!css'},
            {test: /\.html$/, loader: 'file?name=[name].[ext]'}
        ]
    }
};
module.exports = config;
