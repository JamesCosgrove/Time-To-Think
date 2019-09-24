//
//  ContentView.swift
//  Time To Think
//
//  Created by James Cosgrove on 23/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    @State var list: [Int] = [0, -1, -2, -3]
	@State var color: [UIColor] = [.systemTeal, .systemGreen, .systemPink, .systemYellow]
    @State var degrees: [Double] = [-9, 9, 18, -18]
	
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
	
    var body: some View {
				
        let dragGesture = DragGesture()
            .updating($dragState) { (value, dragInfo, _) in
                dragInfo = .active(translation: value.translation)
            }
            .onEnded{_ in
                self.list = self.f(self.list)
            }

        return ZStack {
            Rectangle()
				.foregroundColor(Color(UIColor.systemBackground))
                .edgesIgnoringSafeArea(.all)
			VStack {
				WelcomeView()
				Spacer()
				ZStack {
					ForEach(0..<self.list.count, id: \.self) { i in
						CardView(index: Double(self.list[i]), color: Color(self.color[i]))
						
							.scaleEffect(self.list[i] == 0 ? (self.dragState.isActive ? 1.05 : 1) : 1)
							.rotationEffect(Angle(degrees:
								self.dragState.isActive ? 0 : (
									self.list[i] == 0 ? 0 : Double.random(in: -24...24)//(
//										self.list[i] == -1 ? Double.random(in: 0...24) : (
//											self.list[i] == -2 ? Double.random(in: -24...0) : (
//												self.list[i] == -3 ? Double.random(in: -24...0) : (
//													self.list[i] == -4 ? Double.random(in: -24...0) : (
//														self.list[i] == -5 ? Double.random(in: -24...0) : (
//															self.list[i] == -6 ? Double.random(in: -24...0) : (
//																self.list[i] == -7 ? Double.random(in: -24...0) : 0
//															)
//														)
//													)
//												)
//											)
//										)
//									)
								)
							))
							.gesture(dragGesture)
							.offset(
								x: self.list[i] == 0 ? self.viewState.width + self.dragState.translation.width * 0.8 : self.viewState.width - self.dragState.translation.width * 2,
								y: self.list[i] == 0 ? self.viewState.height + self.dragState.translation.height * 0.8 : self.viewState.height - self.dragState.translation.height * 2
							)
							.animation(.interpolatingSpring(stiffness: 50, damping: 30)
						)
					}
				}
				Spacer()
			}
        }
    }
    func f(_ list: [Int]) -> [Int] {
			var a = list
			let b = a.removeLast()
			a.insert(b, at: 0 )
			return a
    }
}

extension ContentView {
	enum DragState {
		   case inactive
		   case active(translation: CGSize)
		   
		   var translation: CGSize {
			   switch self {
			   case .inactive:
				   return .zero
			   case .active(let t):
				   return t
			   }
		   }
		   var isActive: Bool {
			   switch self {
			   case .inactive:
				   return false
			   case .active:
				   return true
			   }
		   }
	   }
}




#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
