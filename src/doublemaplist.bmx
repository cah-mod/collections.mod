' Copyright (c) 2023 Carl A Husberg
' 
' This software is provided 'as-is', without any express or implied
' warranty. In no event will the authors be held liable for any damages
' arising from the use of this software.
' 
' Permission is granted to anyone to use this software for any purpose,
' including commercial applications, and to alter it and redistribute it
' freely, subject to the following restrictions:
' 
' 1. The origin of this software must not be misrepresented; you must not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgment in the product documentation would be
'    appreciated but is not required.
' 2. Altered source versions must be plainly marked as such, and must not be
'    misrepresented as being the original software.
' 3. This notice may not be removed or altered from any source distribution.

Rem
bbdoc:
EndRem
Type TDoubleMapList<A, B, C>
	
	Field map:TDoubleMap<A, B, TLinkedList<C>> = New TDoubleMap<A, B, TLinkedList<C>>()
	
	Rem
	bbdoc: Use to access a list using two keys, if the list does not exist it will be created.
	EndRem
	Method Operator[]:TLinkedList<C>(ka:A, kb:B)
		If Not map[ka, kb]
			map[ka, kb] = New TLinkedList<C>()
		EndIf
		
		Return map[ka, kb]
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Contains:Int(ka:A)
		Return map.KeyExists(ka)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Contains:Int(ka:A, kb:B)
		Return map.KeyExists(ka, kb)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Keys:ICollection<A>()
		Return map.Keys()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Keys:ICollection<B>(ka:A)
		If Not map[ka]
			Return New TArrayList<B>(0)
		EndIf
		
		Return map[ka].Keys()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method SubKeys:ICollection<B>()
		Return map.SubKeys()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method CountKeys:Int()
		Return map.Count()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method CountKeys:Int(ka:A)
		Return map.Count(ka)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Count:Int(ka:A)
		Local count:Int = 0
		
		For Local list:TLinkedList<C> = EachIn map.Values(ka)
			count :+ list.Count()
		Next
		
		Return count
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Count:Int()
		Local count:Int = 0
		
		For Local list:TLinkedList<C> = EachIn map.Values()
			count :+ list.Count()
		Next
		
		Return count
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Remove(ka:A)
		map.Remove(ka)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Remove(ka:A, kb:B)
		If Not KeyExists(ka, kb)
			Return
		EndIf
		
		map[ka].Remove(kb)
	EndMethod
	
EndType