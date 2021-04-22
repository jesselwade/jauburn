Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsFunctionToExpression [

	self interpret: 'var x = function() {};'.
	self assert: (interpreter environment includesKey: 'x').
	
	self interpret: 'var f = function (x) { return 2 * x;};'.
	self assert: (interpreter environment includesKey: 'f').
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	"unary operations"
	self interpret: 'var x = -3;'.
	self assert: (interpreter environment at: 'x') equals: -3.
	
	self interpret: 'var x = 3; var y = -x;'.
	self assert: (interpreter environment at: 'y') equals: -3.
	
	"binary operations"
	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6 / 2;'.
	self assert: (interpreter environment at: 'x') equals: 3.
	
	self interpret: 'var x = 6 - 2;'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
	self interpret: 'var x = 6 != 2;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 6 == 2;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 6 > 2;'.
	self assert: (interpreter environment at: 'x') equals: true. 
	
	self interpret: 'var x = 6 < 2;'.
	self assert: (interpreter environment at: 'x') equals: false. 
	
	self interpret: 'var x = 6 >= 6;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 6 <= 6;'.
	self assert: (interpreter environment at: 'x') equals: true.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #running }
JbInterpreterTest >> testFunctionArgumentEnvironment [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function (a, b, c) { z = a + b + c; };'.
	self interpret: 'f(1, 2, 3);'.
	self assert: (interpreter environment at: 'z') equals: 6. 
	
	
	
	

]

{ #category : #tests }
JbInterpreterTest >> testFunctionClosure [
	self interpret: 'var make_counter = function() { var count = 0; return function() { count = count + 1; return count; }; };'.
	self interpret: 'var c1 = make_counter();'.
	self interpret: 'var c2 = make_counter();'.
	self interpret: 'c1();'. 
	self interpret: 'c1();'.
	self interpret: 'var x = c1();'.
	self interpret: 'var y = c2();'.
	self assert: (interpreter environment at: 'x') equals: 3.	
	self assert: (interpreter environment at: 'y') equals: 1.
]

{ #category : #running }
JbInterpreterTest >> testFunctionExecutesExpression [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function () { z = 9; };'.
	self interpret: 'f();'.
	self assert: (interpreter environment at: 'z') equals: 9.
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testFunctionReturns [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function (x) { return 2 * x;};'.
	self interpret: 'z = f(3);'.
	self assert: (interpreter environment at: 'z' ) equals: 6.
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testFunctionReturnsEndsExecution [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function () { if ( true ) { return 1; } return 2; };'.
	self interpret: 'z = f();'.
	self assert: (interpreter environment at: 'z') equals: 1.
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testFunctionReturnsInsideIfElseStatement [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function () { if ( 1 == 2 ) { return 1; } else { return 2; } };'.
	self interpret: 'z = f();'.
	self assert: (interpreter environment at: 'z') equals: 2.
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testFunctionReturnsInsideIfStatement [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function () { if ( 1 == 1 ) { return 1; } };'.
	self interpret: 'z = f();'.
	self assert: (interpreter environment at: 'z') equals: 1.
	
	
	

]

{ #category : #running }
JbInterpreterTest >> testFunctionReturnsInsideWhileStatement [

	self interpret: 'var z = 0;'.
	self interpret: 'var f = function () { var x = 1; 
	var y = 0;
	while ( x < 11 ) { y = x + y; 
	x = x + 1; } return y; };'.
	self interpret: 'z = f();'.
	self assert: (interpreter environment at: 'z') equals: 55.
	
	
	

]
