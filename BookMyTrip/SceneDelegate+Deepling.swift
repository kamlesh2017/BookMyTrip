//
//  SceneDelegate+Deepling.swift
//  BookMyTrip
//
//  Created by Kamlesh Kumar Sharma on 17/01/25.
//

import UIKit

extension SceneDelegate {
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        
        let scheme = url.scheme
        let host = url.host
        
        guard scheme == "BMT" else {
            debugPrint("Unsupported URL scheme: \(scheme ?? "")")
            return
        }
        
        switch host {
        case "screen":
            let path = url.path
            
            if path == "/myTrips" {
                handleMyTrips()
            } else {
                debugPrint("Unsupported screen path: \(path)")
            }
            
        default:
            debugPrint("Unsupported URL host: \(host ?? "")")
        }
    }
    
    private func handleMyTrips() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootNavigationController = windowScene.windows.first?.rootViewController as? UINavigationController else {
            debugPrint("Failed to find navigation controller")
            return
        }
        rootNavigationController.popToRootViewController(animated: true)
        let vc = MyTripsVC()
        rootNavigationController.pushViewController(vc, animated: true)
    }
}
