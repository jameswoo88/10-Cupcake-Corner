//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by James Chun on 8/24/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderItem.name)
                TextField("Street address", text: $order.orderItem.streetAddress)
                TextField("City", text: $order.orderItem.city)
                TextField("Zip Code", text: $order.orderItem.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
                .disabled(!(order.hasVaildAddress))
            }
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }//end of body
    
}//End of struct

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}//End of struct
