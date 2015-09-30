var fs = require('fs'), path = require('path');
var stream = require('stream');

var browserify = require('browserify');

process.chdir(path.resolve(__dirname, '..'));

// make ./dist if not exist
if (!fs.existsSync('dist')) {
    fs.mkdirSync('dist');
}

// build for web
browserify({standalone: 'jp.js', debug: true})
    .require('./index.js', {entry: true})
    .bundle()
    .on('error', function (err) { console.log('Error: ' + err.message) })
    .pipe(fs.createWriteStream('dist/jp.js'));
