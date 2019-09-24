//
//  WelcomeView.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
	@State private var showModal = false
	
	
	let date = Date()
	let formatter = DateFormatter()
	var result = String()
	var hour = Calendar.current.component(.hour, from: Date())
	var timeWord = String()
	
	init() {
		formatter.dateFormat = "EEEE, d MMMM"
		result = self.formatter.string(from: self.date).uppercased()
		
		

		switch hour {
			case 0..<12 :
				timeWord = NSLocalizedString("morning", comment: "Morning")
			case 12..<17 :
				timeWord = NSLocalizedString("afternoon", comment: "Afternoon")
			case 17..<24 :
				timeWord = NSLocalizedString("evening", comment: "Evening")
			default:
				timeWord = NSLocalizedString("Night", comment: "Night")
		}
	}

	var body: some View {
		HStack {
			VStack {
				
				Text(self.result)
					.font(.caption)
					.foregroundColor(Color(UIColor.secondaryLabel))
				Text("Good \(self.timeWord),\nJames")
					.multilineTextAlignment(.center)
					.lineLimit(2)
					.font(Font.title.weight(.black))
					.foregroundColor(Color(UIColor.label))
				Button(action: {
					self.showModal = true
				}) {
					Image(systemName: "person")
						.padding(.bottom)
						.imageScale(.medium)
						.font(Font.title.weight(.medium))
						//.font(.headline)
						.accentColor(Color(UIColor.secondaryLabel))
						.frame(width: 30, height: 30, alignment: .center)
				}.sheet(isPresented: self.$showModal, content: {
					SettingsModalView()
				})
			}

		}
	}
}
