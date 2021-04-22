"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> gcd [ 

	^ 'var x = input("Enter a value to find greatest common denominator:");
		var y = input("Enter the second value:);
		var f = function gcd(a,b) { if (a == 0) return b;
                          if (b == 0) return a;
                          gcd (b, mod(a, b));
								};
		var o = f(x, y);
		print(o);'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"

	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]

{ #category : #'sample programs' }
JbSamplePrograms class >> sqrt [ 

	^ 'var i = input("Enter a value to find its square root:");
		var f = 	function sqrt(x) {var derivation = 1 / 1000;
							  var guess = x / 2;
							  var newGuess = ((guess + x) / guess ) / 2;
								if ((guess - newGuess) <= derivation)
								{ return newGuess; }
								else
								{ sqrt(newGuess); } };
		var o = f(i);
		print(o);' 
	
	"this one is kind of complicated. we need a derivation value and a first guess. then we recursively call this method printing each guess until our last guesses are within the derivation value ... or something like that!"
]
