/**
 * Build script for Primes.
 * Run with node build/build.js.
 */
(function(){
	'use strict';
	
	// File paths
	var inCodePath     = 'src/primes.js',          // Source path
		outCodePath    = 'dist/primes.js',         // Compiled output path
		outMinCodePath = 'dist/primes.min.js',     // Minified output path
		outMinMapPath  = 'dist/primes.min.js.map'; // Minified source map output path
	
	// Import required modules.
	var fs       = require('fs'),
		uglifyJs = require('uglify-js');
	
	// Declare other variables.
	var code, uglified;
	
	
	console.log('Build started.');
	
	// Compile code (a straight copy for now).
	code = fs.readFileSync(inCodePath);
	fs.writeFileSync(outCodePath, code);
	
	// Minify code.
	uglified = uglifyJs.minify(
		outCodePath,
		{
			warnings: true,
			outSourceMap: outMinMapPath
		}
	);
	fs.writeFileSync(outMinCodePath, uglified.code); // Write code to file
	fs.writeFileSync(outMinMapPath, uglified.map); // Write map to file
	
	
	console.log('Build complete.');
})();