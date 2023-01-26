const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

// configure webpacker to load boostrap dependency modules automatically
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))

module.exports = environment
