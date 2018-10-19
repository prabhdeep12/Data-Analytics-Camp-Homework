Attribute VB_Name = "Module1"
Sub MultipleYear_StockData()
  
Dim WS As Worksheet
    For Each WS In ActiveWorkbook.Worksheets
    WS.Activate
        LastRow = WS.Cells(Rows.Count, 1).End(xlUp).Row
        
        Dim i As Long
        Dim TicketNumber As String
        Dim OpenPrice As Double
        Dim YearlyChange As Double
        Dim ClosePrice As Double
        Dim PercentChange As Double
        Dim Column As Integer
        Column = 1
        Dim Row As Double
        Row = 2
        Dim Volume As Double
        Volume = 0
        
        Cells(1, "I").Value = "Ticker"
        Cells(1, "J").Value = "Yearly Change"
        Cells(1, "K").Value = "Percent Change"
        Cells(1, "L").Value = "Total Stock Volume"
      
        
        Open_Price = Cells(2, Column + 2).Value
        
        
        For i = 2 To LastRow
            If Cells(i + 1, Column).Value <> Cells(i, Column).Value Then
                TickerName = Cells(i, Column).Value
                Cells(Row, Column + 8).Value = TickerName
                ClosePrice = Cells(i, Column + 5).Value
                
                Cells(Row, Column + 9).Value = YearlyChange
                YearlyChange = ClosePrice - OpenPrice
                
              
                If (OpenPrice = 0 And ClosePrice = 0) Then
                    PercentChange = 0
                ElseIf (OpenPrice = 0 And ClosePrice <> 0) Then
                    PercentChange = 1
                Else
                    PercentChange = YearlyChange / OpenPrice
                    Cells(Row, Column + 10).Value = PercentChange
                    Cells(Row, Column + 10).NumberFormat = "0.00%"
                End If
                Volume = Volume + Cells(i, Column + 6).Value
                Cells(Row, Column + 11).Value = Volume
                
                Volume = 0
                
                Row = Row + 1
                
                OpenPrice = Cells(i + 1, Column + 2)
        
            Else
                Volume = Volume + Cells(i, Column + 6).Value
            End If
        Next i
    
        YCLastRow = WS.Cells(Rows.Count, Column + 8).End(xlUp).Row
        
        For j = 2 To YCLastRow
            If (Cells(j, Column + 9).Value > 0 Or Cells(j, Column + 9).Value = 0) Then
                Cells(j, Column + 9).Interior.ColorIndex = 10
            ElseIf Cells(j, Column + 9).Value < 0 Then
                Cells(j, Column + 9).Interior.ColorIndex = 3
            End If
        Next j
        
    Next WS
        
End Sub

