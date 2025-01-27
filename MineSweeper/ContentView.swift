//
//  ContentView.swift
//  MineSweeper
//
//  Created by Jasper Katalevsky on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numRows = 5
    @State private var numCols = 5
    @State private var hiddenButtons: Set<Int> = []
    var body: some View {
        VStack {
            
            HStack
            {
                Button(action: {
                    //TODO: Switch to flag mode
                }, label: {
                    Image("flag")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                Button(action: {
                    //TODO: Hint button, probably won't implement this
                }, label: {
                    Image("lightbulb")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                //TODO: Add the mine counter
                Button(action: {
                    
                }, label: {
                    Image("smiley")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                //TODO: Add a live clock
                Button(action: {
                    
                }, label: {
                    Image("gear")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                Button(action: {
                    
                }, label: {
                    Image("fullscreen")
                        .resizable()
                        .scaledToFit()
                })
                .buttonStyle(MineSweeperButtonStyle())
                
                
            }
            .frame(width: 350, height: 50)
            .border(Color(.blue))
            Spacer()
            
            VStack(spacing: 1)
            {
                ForEach(0..<numRows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<numCols, id: \.self) { column in
                            let index = row * self.numCols + column
                            
                            Button(action: {
                                hiddenButtons.insert(index)
                            }, label: {
                                Text("h")
                            })
                            .buttonStyle(MineSweeperButtonStyle())
                            .opacity(self.hiddenButtons.contains(index) ? 0 : 1)
                        }
                        
                    }
                    .padding()
                }
            }
            Spacer()
        }
    }
    func setMines(rows: Int, column: Int)
    {
        var mines = Array(repeating: Array(repeating: 0, count: rows), count: column)
        
    }
}


struct MineSweeperButtonStyle : ButtonStyle
{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .frame(width: 30, height: 30)
            .background(Color.gray)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.black, lineWidth: 1)
            )
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

#Preview {
    ContentView()
}
