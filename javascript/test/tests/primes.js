'use strict';

(function(){
	QUnit.module('Main');
	
	QUnit.test('isPrime()', function(assert){
		assert.equal(primes.isPrime(0), false, '0 is not prime.');
		assert.equal(primes.isPrime(1), false, '1 is not prime.');
		assert.equal(primes.isPrime(2), false, '2 is prime.');
		assert.equal(primes.isPrime(-15), false, '-15 is not prime.');
		assert.equal(primes.isPrime(7907), true, '7907 is prime.');
		assert.equal(primes.isPrime(3.14), false, '3.14 is not prime.');
		assert.equal(primes.isPrime(5), true, '5 is prime.');
	});
	
	QUnit.test('next()', function(assert){
		assert.equal(primes.next(0), 2, 'Next after 0 is 2.');
		assert.equal(primes.next(2), 3, 'Next after 2 is 3.');
		assert.equal(primes.next(-15), 2, 'Next after -15 is 2.');
		assert.equal(primes.next(509), 521, 'Next after 509 is 521.');
		assert.equal(primes.next(509), 521, 'Next after 6.5 is 7.');
		assert.equal(primes.next(3.14), 5, 'Next after 3.14 is 5.');
		assert.equal(primes.next(7907), 7919, 'Next after 7907 is 7919.');
	});
})();