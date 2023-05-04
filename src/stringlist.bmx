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
bbdoc: A linked list of strings (temporary type until generic types can be used in nested modules)
EndRem
Type TStringList
	
	Field list:TList = CreateList()
	
	Rem
	bbdoc:
	EndRem
	Method Clear()
		list.Clear()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method IsEmpty:Int()
		Return list.IsEmpty()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Contains:Int(val:String)
		Return list.Contains(val)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method AddFirst(val:String)
		list.AddFirst(val)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method AddLast(val:String)
		list.AddLast(val)
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method First:String()
		Return String(list.First())
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Last:String()
		Return String(list.Last())
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method RemoveFirst:String()
		Return String(list.RemoveFirst())
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method RemoveLast:String()
		Return String(list.RemoveLast())
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Reverse()
		list.Reverse()
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method ToArray:String[]()
		Local arr:String[] = New String[list.Count()]
		
		Local i:Int = 0
		
		For Local str:String = EachIn list
			arr[i] = str
			i:+1
		Next
		
		Return arr
	EndMethod
	
	Rem
	bbdoc:
	EndRem
	Method Count:Int()
		Return list.Count()
	EndMethod
	
EndType