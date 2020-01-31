
import Alamofire
import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    let VKSecret = "7283583"
    
    var webView: WKWebView!
    var vkAPI = VKApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webViewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webViewConfig)
        webView.navigationDelegate = self
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        urlComponent.queryItems = [URLQueryItem(name: "client_id", value: VKSecret),
                                   URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                                   URLQueryItem(name: "display", value: "mobile"),
                                   URLQueryItem(name: "scope", value: "262150"),
                                   URLQueryItem(name: "response_type", value: "token"),
                                   URLQueryItem(name: "v", value: "5.103")]
        let request = URLRequest(url: urlComponent.url!)
        webView.load(request)
        view = webView
    }
    
}

extension LoginViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
        url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map{ $0.components(separatedBy: "=")}.reduce([String: String]()) {
            value, params in
        var dict = value
        let key = params[0]
        let value = params[1]
        dict[key] = value
        return dict
        }
        
        Session.shared.token = params["access_token"]!
        Session.shared.userId = params["user_id"]!
        
    
        
        
        
        decisionHandler(.cancel)
    }
    
}


