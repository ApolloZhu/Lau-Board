//
//  InterfaceController.swift
//  Lau Board watchOS Extension
//
//  Created by Apollo Zhu on 9/15/17.
//  Copyright © 2017 Ben Cullen. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        table.setNumberOfRows(LauQuote.all.count,
                              withRowType: "LauQuote")
        for quote in LauQuote.all {
            (table.rowController(at: quote.id) as! TableGroupController)
                .label.setText(quote.name)
        }
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        Lau.only.speakQuote(id: rowIndex)
    }
}
