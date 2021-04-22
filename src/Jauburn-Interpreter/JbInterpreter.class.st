"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'printer',
		'return'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter class >> primitives [ 
 "Jauburn syntaxed primitives to interpet at initialization"

	^ #(
		'var println = function(x) { print(x); print(cr); };'
		'var input = function(x) { request: x; };' "need tocreate UIManager mock"
		'var concat = function(x,y) { return x, y; };' "need to check string syntax"
		'var length = function(x) { return x size; };'
		'var not = function(x) { return x not; };'
		'var abs = function(x) { return pos x; };'
		'var mod = function(x,y) { return x % y };'
		'var stringToNumber = function(x) { return str x; };'
		)
]

{ #category : #primitives }
JbInterpreter >> absBinding [

^ #abs -> [:s | s abs ]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [

^ #concat -> [:s1 :s2 | s1, s2]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	self initializePrimitives.
]

{ #category : #initialization }
JbInterpreter >> initializePrimitives [
	(self class selectors select: [ :each | each endsWith: 'Binding' ])
		do: [ :s | 
				| prim temp |
				prim := JbPrimitive new.
				temp := self perform: s.
				prim block: temp value.
				environment at: temp key put: prim ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [

  ^ #input -> [:s | UIManager default request: s ]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [

^ #length -> [:s | s size ]
]

{ #category : #primitives }
JbInterpreter >> modBinding [

^ #mod -> [:s1 :s2 | s1 \\ s2 ]
]

{ #category : #primitives }
JbInterpreter >> notBinding [

^ #not -> [:s | s not]
]

{ #category : #primitives }
JbInterpreter >> printBinding [

 ^ #print -> [:value | Transcript show: value. Transcript flush.]
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [

 ^ #println -> [:value | Transcript show: value; cr. Transcript flush. ]
]

{ #category : #accessing }
JbInterpreter >> return [ 

	^ return
]

{ #category : #accessing }
JbInterpreter >> return: anObject [ 

	return := anObject
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString).
	self return notNil ifTrue: [ ^ return ]
]

{ #category : #streaming }
JbInterpreter >> show: anObject [
	printer := anObject
]

{ #category : #primitives }
JbInterpreter >> stringToNumberBinding [

^ #stringToNumber -> [:s | s asInteger ] 
]
