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
Type TDoubleMap<A, B, C>
	
	Field map:TTreeMap<A, TTreeMap<B, C>> = New TTreeMap<A, TTreeMap<B, C>>()
	
	Rem
	bbdoc:
	EndRem
	Method Operator[]:TTreeMap<B, C>(ka:A)
		Return map[ka]
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Operator[]:C(ka:A, kb:B)
		If Not map[ka]
			Return Null
		EndIf
		
		Return map[ka][kb]
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Operator[]=(ka:A, kb:B, val:C)
		If Not map[ka]
			map[ka] = New TTreeMap<B, C>()
		EndIf
		
		map[ka][kb] = val
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method KeyExists:Int(ka:A)
		Return map[ka] <> Null
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method KeyExists:Int(ka:A, kb:B)
		If Not map[ka]
			Return False
		EndIf
		
		Return map[ka][kb] <> Null
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
		Local list:TLinkedList<B> = New TLinkedList<B>()
		
		For Local map:TTreeMap<B, C> = EachIn Self.map.Values()
			For Local key:B = EachIn map.Keys()
				list.AddLast(key)
			Next
		Next
		
		Return list
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Values:ICollection<C>(ka:A)
		If Not map[ka]
			Return New TArrayList<C>(0)
		EndIf
		
		Return map[ka].Values()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Values:ICollection<C>()
		Local list:TLinkedList<C> = New TLinkedList<C>()
		
		For Local ka:A = EachIn map.Keys()
			For Local v:C = EachIn map[ka].Values()
				list.AddLast(v)
			Next
		Next
		
		Return list
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Count:Int()
		Return map.Count()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Count:Int(ka:A)
		If Not map[ka]
			Return 0
		EndIf
		
		Return map[ka].Count()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method TotalCount:Int()
		Local count:Int
		
		For Local map:TTreeMap<B, C> = EachIn map.Values()
			count:+map.Count()
		Next
		
		Return count
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Remove:Int(ka:A)
		Return map.Remove(ka)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Remove:Int(ka:A, kb:B)
		If Not map[ka]
			Return False
		EndIf
		
		Return map[ka].Remove(kb)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method IsEmpty:Int()
		Return map.IsEmpty()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method IsEmpty:Int(ka:A)
		If Not map[ka]
			Return True
		EndIf
		
		Return map[ka].IsEmpty()
	EndMethod
	
EndType