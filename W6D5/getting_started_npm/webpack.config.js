// webpack.config.js
var path = require('path');
const env = process.env.NODE_ENV

const config = {
   mode: env || 'development'
}
module.exports = {
  entry: './entry.jsx',
  output: {
    path: __dirname,
    filename: './bundle.js',
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};
