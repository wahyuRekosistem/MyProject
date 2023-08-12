import UIKit

class BlueViewController: UIViewController {
    var dismissCallback: (() -> Void)?
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent // Set to .default for black text
      }
  
  override func viewDidLoad() {
          super.viewDidLoad()

          // Set the background color of the view to red
          view.backgroundColor = .red
    
          // Create a UIView for the status bar background
          let statusBarBackgroundView = UIView()
          statusBarBackgroundView.backgroundColor = .white
          statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false

          // Create a UIView for the header (white background)
          let headerView = UIView()
          headerView.backgroundColor = .white
          headerView.translatesAutoresizingMaskIntoConstraints = false

          // Create a UIButton for dismissal
          let closeButton = UIButton(type: .system)
          closeButton.setTitle("X", for: .normal)
          closeButton.tintColor = .black // Set the button text color to black
          closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
          closeButton.translatesAutoresizingMaskIntoConstraints = false

          // Create a UILabel for the title
          let titleLabel = UILabel()
          titleLabel.text = "blunion x Rekosistem"
          titleLabel.textColor = .black
          titleLabel.textAlignment = .center
          titleLabel.translatesAutoresizingMaskIntoConstraints = false

          // Add the views to the header view and set constraints for positioning and padding
          headerView.addSubview(closeButton)
          headerView.addSubview(titleLabel)
    
          // Add the status bar background view to the main view and set constraints
          view.addSubview(statusBarBackgroundView)
          NSLayoutConstraint.activate([
              statusBarBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
              statusBarBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              statusBarBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              statusBarBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          ])
    
          NSLayoutConstraint.activate([
              closeButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
              closeButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
              closeButton.widthAnchor.constraint(equalToConstant: 40),
              closeButton.heightAnchor.constraint(equalToConstant: 40),

              titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
              titleLabel.leadingAnchor.constraint(equalTo: closeButton.trailingAnchor),
          ])

          // Add the header view to the main view and set constraints
          view.addSubview(headerView)
          NSLayoutConstraint.activate([
              headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              headerView.heightAnchor.constraint(equalToConstant: 70), // Set header height
          ])

        // Set status bar text color to black
            UIApplication.shared.statusBarStyle = .default

      }


    @objc func closeButtonTapped() {
        // Dismiss the BlueViewController
      dismiss(animated: true) {
                  self.dismissCallback?() // Call the dismiss callback
              }
    }
}
