/**
 * Build script for Primes.
 * Run with node build/build.js.
 */
(function(){
	'use strict';
	console.log('Build started.');
	
	
	// Import required modules.
	var fs       = require('fs'),
		uglifyJs = require('uglify-js');
	
	var code;
	
	// Minify code.
	code = uglifyJs.minify('src/primes.js', {warnings: true}).code;
	fs.writeFileSync('dist/primes.min.js', code); // Write to file
	
	
	console.log('Build complete.');
})();