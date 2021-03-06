import Foundation

struct NewPageRoute: Route {
    let path = "/page"
    let action: NavigationAction = NewPageNavigationAction()
}

struct NewPageForSiteRoute: Route {
    let path = "/page/:domain"
    let action: NavigationAction = NewPageNavigationAction()
}

struct NewPageNavigationAction: NavigationAction {
    func perform(_ values: [String: String], source: UIViewController? = nil) {
        if let blog = blog(from: values) {
            WPTabBarController.sharedInstance()?.showPageEditor(forBlog: blog)
        } else {
            WPTabBarController.sharedInstance()?.showPageEditor()
        }
    }
}
