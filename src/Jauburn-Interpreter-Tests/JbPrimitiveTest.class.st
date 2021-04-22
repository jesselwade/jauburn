Class {
	#name : #JbPrimitiveTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #running }
JbPrimitiveTest >> setUp [
	parser := JbParser new.
	interpreter := JbInterpreter new.
]

{ #category : #tests }
JbPrimitiveTest >> testInitializationCreatesPrimitives [

	
	self assert: (interpreter environment includesKey: 'abs').
	self assert: (interpreter environment includesKey: 'concat').
	self assert: (interpreter environment includesKey: 'input').
	self assert: (interpreter environment includesKey: 'length').
	self assert: (interpreter environment includesKey: 'mod').
	self assert: (interpreter environment includesKey: 'not').
	self assert: (interpreter environment includesKey: 'print').
	self assert: (interpreter environment includesKey: 'println').
	self assert: (interpreter environment includesKey: 'stringToNumber').
]

{ #category : #tests }
JbPrimitiveTest >> testPrimitivesExecuteExpression [

	interpreter run: 'var x = length("word");'.
	self assert: (interpreter environment at: 'x') equals: 4.
	
	interpreter run: 'var y = mod(3, 2);'.
	self assert: (interpreter environment at: 'y') equals: 1.
	
	interpreter run: 'var t = not(true);'.
	self assert: (interpreter environment at: 't') equals: false.
	
	interpreter run: 'var c = concat("a", "b");'.
	self assert: (interpreter environment at: 'c') equals: 'ab'.
	
	interpreter run: 'var s = stringToNumber("5");'.
	self assert: (interpreter environment at: 's') equals: 5.
	
	interpreter run: 'var z = abs(-9);'. 
	self assert: (interpreter environment at: 'z') equals: 9.
	
	
	
	"interpreter run: 'var i = input();'."
	
	"interpreter run: 'var p = print();'."
	
	"interpreter run: 'var p = println();'."

]
