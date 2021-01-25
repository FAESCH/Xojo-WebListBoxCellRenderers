#tag Class
Protected Class ButtonColumn
Inherits WebListboxCellRenderer
	#tag Event
		Sub Deserialize(js as JSONItem)
		  // Restore the values of the column to the object
		  
		  Var obj As jsonitem = js.Value("captions")
		  Var tagsJS As JSONItem = js.Value("tags")
		  Var styleJS As JSONItem = js.Value("buttonstyles")
		  
		  Captions.ResizeTo(-1)
		  If obj.IsArray Then
		    Var c As Integer = obj.Count-1
		    For i As Integer = 0 To c
		      Captions.AddRow obj.Value(i)
		      Tags.AddRow tagsJS.Value(i)
		      ButtonStyles.AddRow styleJS.Value(i)
		    Next
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  Var code() As String
		  
		  // All custom cells extend the XojoWeb.ListboxCellRenderer class
		  code.AddRow "class ExampleButtonCell extends XojoWeb.ListboxCellRenderer {"
		  
		  // You must override the "render" method
		  // controlID (string): The identifier of the listbox control that the renderer is currently running under
		  // row (HTMLElement): The HTML DOM element of the entire row. This is provided so that you can make modifications to the entire row if necessary, like applying a style.
		  // data (object): The data that the Xojo portion of your control provided for this column
		  // rowIndex (number): The row number that is currently being rendered
		  // columnIndex (number): The column number that is currently being rendered
		  // cell (HTMLElement): The HTML DOM element of the cell that your renderer is responsible for.
		  code.AddRow "  render(controlID, row, data, rowIndex, columnIndex, cell) {"
		  
		  // Remove the text that's already in the cell
		  code.AddRow "    cell.innerHTML= '';"
		  
		  // Make a bootstrap buttons
		  code.AddRow "   for(let i=0;i<data.captions.length;i++) {"
		  code.AddRow "    let button = document.createElement('button');"
		  code.AddRow "    button.type = 'button';"
		  code.AddRow "    button.className = 'btn ' + data.buttonstyles[i] + ' btn-sm';"
		  code.AddRow "    button.innerHTML = data.captions[i];"
		  code.AddRow "    button.dataset.tag = data.tags[i];"
		  code.AddRow "    button.style.marginRight = '6px'"
		  
		  // Handle clicking on the button
		  code.AddRow "    button.addEventListener('click', function(ev) {"
		  code.AddRow "      ev.stopPropagation();"
		  code.AddRow "      var obj = new XojoWeb.JSONItem;"
		  code.AddRow "      obj.set('row', rowIndex);" // All extensions should include the row (default is -1)
		  code.AddRow "      obj.set('column', columnIndex);" // All extensions should include the column (default is -1)
		  code.AddRow "      obj.set('identifier', data.captions[i]);" // All extensions should include an identifier (default is "")
		  code.AddRow "      obj.set('value', button.dataset.tag);" // Including a value is optional (default is null)
		  code.AddRow "      XojoWeb.controls.lookup(controlID).triggerServerEvent('CustomCellAction', obj);"
		  code.AddRow "      return false;"
		  code.AddRow "    });"
		  
		  // Add our new content
		  code.AddRow "    cell.appendChild(button);"
		  code.AddRow "   }"
		  code.AddRow "  }"
		  code.AddRow "}"
		  
		  Return String.FromArray(code, EndOfLine.Windows)
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  // Use this code to convert the value(s) needed to render your codes to JSON.
		  // This is also used by non-datasource listboxes to store these settings for your column.
		  
		  Var js As New JSONItem
		  js.Value("captions") = Captions
		  js.Value("tags") = Tags
		  js.Value("buttonstyles") = ButtonStyles
		  
		  Return js
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(ParamArray WLB as WebListBoxButton)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  For Each Button As WebListBoxButton In WLB
		    
		    Captions.Add(Button.Caption)
		    Tags.Add(Button.Tag)
		    
		    Select Case Button.ButtonStyle
		      
		    Case WebListBoxButton.ButtonStyles.Primary
		      ButtonStyles.Add("btn-primary")
		    Case WebListBoxButton.ButtonStyles.Secondary
		      ButtonStyles.Add("btn-secondary")
		    Case WebListBoxButton.ButtonStyles.Success
		      ButtonStyles.Add("btn-success")
		    Case WebListBoxButton.ButtonStyles.Danger
		      ButtonStyles.Add("btn-danger")
		    Case WebListBoxButton.ButtonStyles.Warning
		      ButtonStyles.Add("btn-warning")
		    Case WebListBoxButton.ButtonStyles.Info
		      ButtonStyles.Add("btn-info")
		    Case WebListBoxButton.ButtonStyles.Light
		      ButtonStyles.Add("btn-light")
		    Case WebListBoxButton.ButtonStyles.Dark
		      ButtonStyles.Add("btn-dark")
		    Case WebListBoxButton.ButtonStyles.Link
		      ButtonStyles.Add("btn-link")
		      
		    Case Else
		      ButtonStyles.Add("btn-info")
		      
		    End Select
		    
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ButtonStyles() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Captions() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Tags() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
