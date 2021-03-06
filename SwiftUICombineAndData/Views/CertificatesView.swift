//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by Arkasha Zuev on 09.01.2022.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var certificateVM = CertificateViewModel()
    @StateObject var networkReachability = NetworkReachability()
    @State private var selection: Int = 0
    
    var body: some View {
        VStack {
            if networkReachability.reachable {
                if certificateVM.certificates.count > 0 {
                    TabView(selection: $selection) {
                        ForEach(certificateVM.certificates.indices, id: \.self) { index in
                            CertificateCard(selection: $selection)
                                .padding(.horizontal, 8)
                                .environmentObject(certificateVM)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                } else {
                    ProgressView()
                }
            } else {
                Text("Please connect to the Internet to see your certifications.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
