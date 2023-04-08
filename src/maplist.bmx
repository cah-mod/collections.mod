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
Type TMapList<A, B>
	
	Field map:TTreeMap<A, TLinkedList<B>> = New TTreeMap<A, TLinkedList<B>>()
	
	Rem
	bbdoc:
	EndRem
	Method Operator[]:TLinkedList<B>(ka:A)
		If Not map[ka]
			map[ka] = New TLinkedList<B>()
		EndIf
		
		Return map[ka]
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method KeyExists:Int(ka:A)
		Return map.ContainsKey(ka)
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
	Method Values:ICollection<B>()
		Local out:TLinkedList<B> = New TLinkedList<B>()
		
		For Local list:TLinkedList<B> = EachIn map.Values()
			For Local val:B = EachIn list
				out.AddLast(val)
			Next
		Next
		
		Return out
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
	Method IsEmpty:Int()
		Return map.IsEmpty()
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
	Method TotalCount:Int()
		Local count:Int
		
		For Local list:TLinkedList<B> = EachIn map.Values()
			count:+list.Count()
		Next
		
		Return count
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method ToArray:B[]()
		Local out:TLinkedList<B> = New TLinkedList<B>()
		
		For Local list:TLinkedList<B> = EachIn map.Values()
			For Local val:B = EachIn list
				out.AddLast(val)
			Next
		Next
		
		Return out.ToArray()
	EndMethod
	
EndType