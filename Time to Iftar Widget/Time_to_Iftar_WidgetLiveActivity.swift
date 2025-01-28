//
//  Time_to_Iftar_WidgetLiveActivity.swift
//  Time to Iftar Widget
//
//  Created by Iman Morshed on 1/27/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Time_to_Iftar_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Time_to_Iftar_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Time_to_Iftar_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Time_to_Iftar_WidgetAttributes {
    fileprivate static var preview: Time_to_Iftar_WidgetAttributes {
        Time_to_Iftar_WidgetAttributes(name: "World")
    }
}

extension Time_to_Iftar_WidgetAttributes.ContentState {
    fileprivate static var smiley: Time_to_Iftar_WidgetAttributes.ContentState {
        Time_to_Iftar_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Time_to_Iftar_WidgetAttributes.ContentState {
         Time_to_Iftar_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Time_to_Iftar_WidgetAttributes.preview) {
   Time_to_Iftar_WidgetLiveActivity()
} contentStates: {
    Time_to_Iftar_WidgetAttributes.ContentState.smiley
    Time_to_Iftar_WidgetAttributes.ContentState.starEyes
}
