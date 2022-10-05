Class {
	#name : #JavaDoc,
	#superclass : #Object,
	#category : #JavaDocPackage
}

{ #category : #'accessing - classes' }
JavaDoc >> ClassInstVarNames: aClass [

^ aClass instVarNames flatCollect: [ :each| ' ' ,each ,' ' ]   .
]

{ #category : #'as yet unclassified' }
JavaDoc >> ClassMethodsName: aClass [
^ aClass  selectors .
]

{ #category : #'accessing - classes' }
JavaDoc >> ClassName: aClass [
^ aClass printString .
]

{ #category : #'accessing - classes' }
JavaDoc >> ClassPackage: aClass [
^ aClass package  printString .
]

{ #category : #'accessing - classes' }
JavaDoc >> ClassSubClass: aClass [
^ aClass subclasses flatCollect: [ :each| ' ' ,each ,' ' ] .
]

{ #category : #'accessing - classes' }
JavaDoc >> ClassSuperClass: aClass [
^ aClass superclass printString .
]

{ #category : #html }
JavaDoc >> HtmlReport:aClass [
|strm file fileName methodeName|
methodeName:= self ClassMethodsName: aClass .
fileName := self ClassName: aClass .
strm := String streamContents: [ :out |
		out << '<!DOCTYPE html>';lf.
		out << '<html lang="en">'; lf.
		out <<  '<head>'; lf.
		out << '<title>'; lf.
		out <<(fileName) ; lf.
		out << '</title>'; lf.
	   out<<  '</head>'; lf.
	   out<<  '<body>'; lf.
	   out << '<h1 style="color:red;">'; lf.
		out <<('Classe :',fileName) ; lf.
		out << '</h1>'; lf.
		out << '<h2 style="color:blue;">'; lf.
		out <<('Package :',(self ClassPackage: aClass )) ; lf.
		out << '</h2>'; lf.
		out << '<h2 style="color:blue;">'; lf.
		out <<('SuperClass :',(self ClassSuperClass:  aClass )) ; lf.
		out << '</h2>'; lf.
		out << '<h2 style="color:blue;">'; lf.
		out <<('SubClasses :',(self ClassSubClass:  aClass )) ; lf.
		out << '</h2>'; lf.
	   out << '<h2 style="color:blue;">'; lf.
		out <<('Variable d instances  :',(self ClassInstVarNames:   aClass )) ; lf.
		out << '</h2>'; lf.
		out << '<table border>'; lf.
		out <<'<thead>' ; lf.
		out <<'<tr>' ; lf.
		out <<'<th>' ; lf.
		out <<'Methodes Names' ; lf.
		out <<'</th>' ; lf.
		out <<'<th>' ; lf.
		out <<'Comment' ; lf.
		out <<'</th>' ; lf.
		out <<'</tr>' ; lf.
		out <<'</thead>' ; lf.
		out <<'<tbody>' ; lf ;
		<<(methodeName  do:[:each|
		out <<'<tr>' ; lf.
	   out <<'<td>' ; lf.
	   out << each  ; lf.
	   out <<'</td>' ; lf.
	   out <<'<td>' ; lf.
	   out << '  '; lf.
	   out <<'</td>' ; lf.
	   out <<'</tr>' ; lf.
			] )  ; lf.	   
	
		out <<'</tbody>' ; lf.
		
		out <<'</table>' ; lf.
		out << '</h2>'; lf.
		 out<<  '</body></html>'; lf.
		 ].
	file := (fileName asString,'.html') asFileReference.
file ensureCreateFile.
file writeStreamDo: [ :stream | stream nextPutAll: strm   ].
	^ file. 
]
