//
//  TextContentView.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct TextContent: View {
	
	@State private var showModal = false
	@State private var bookmark = false
	
	@State var netManager = NetworkingManager()
	
	var body: some View {
		
		return VStack {
			HStack {
				Spacer()
				Button(action: {
					self.bookmark.toggle()
				}) {
					HStack {
						Image(systemName: bookmark ? "bookmark.fill" : "bookmark")
							.foregroundColor(Color(UIColor.label))
							.font(Font.title.weight(.semibold))
							.imageScale(.medium)
						.frame(width: 30, height: 30, alignment: .center)
					}
				}
			}.padding()
			Text(netManager.topicList.title)
				.fontWeight(.black)
				.font(.headline)
				.foregroundColor(Color(UIColor.label))
			
			
			Text(netManager.topicList.text)
				.font(.body)
				.lineLimit(100)
				.multilineTextAlignment(.center)
				.padding(.horizontal)
	
			Button(action: {
                self.showModal = true
            }) {
                Image(systemName: "book")
					.padding(.top)
					.imageScale(.medium)
					.accentColor(Color(UIColor.label))
					.font(Font.title.weight(.medium))
				Text("Continue reading")
					.font(.headline)
					.accentColor(Color(UIColor.label))

			}.sheet(isPresented: self.$showModal, content: {
				DetailModalView()
			})
				.padding(.bottom)
			Spacer()

			
		}.frame(width: 290, height: 400, alignment: .center)
		
		
	}
}
