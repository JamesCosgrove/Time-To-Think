//
//  SettingsView.swift
//  Time To Think
//
//  Created by James Cosgrove on 24/09/2019.
//  Copyright © 2019 James Cosgrove. All rights reserved.
//

import SwiftUI

struct SettingsModalView: View {
	@State var name = "James"
	@State var picker = 0
	
    var body: some View {
		return VStack {
			Handle()
			Picker(selection: $picker, label: Text("")) {
                Text("Bookmarks").tag(0)
                Text("Settings").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
				.padding()
			
			VStack(alignment: .center) {
				if picker == 0 {
					Spacer()
					BookmarksView()
					Spacer()
				}
				if picker == 1 {
					Spacer()
					
					Group {
						Divider()
						Text("About")
							.font(.headline)
							.fontWeight(.black)
						Text("This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.\nTo view a copy of this license, visit")
							.font(.caption)
							.multilineTextAlignment(.center)
							.lineLimit(3)
						Text("http://creativecommons.org/licenses/by-sa/3.0/")
							.foregroundColor(Color(UIColor.link))
							.font(.caption)
						Text("or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.")
							.font(.caption)
						
					}.multilineTextAlignment(.center)
					}
			}.padding()
		}
    }
}
