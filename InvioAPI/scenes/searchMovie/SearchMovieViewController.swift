//
//  SearchMovieViewController.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Lottie
import UIKit

/// SearchMovie Module ViewController
class SearchMovieViewController: BaseViewController {
    var presenter: SearchMoviePresenterProtocol!
    var factory: ViewControllerFactory!
    @IBOutlet var containerView: UIView!
    @IBOutlet var movieTitleText: UITextField!
    @IBOutlet var moviesTableView: UITableView!
    @IBOutlet var outerView: UIView!
    @IBOutlet var resultStack: UIStackView!
    @IBOutlet var viewAnimate: AnimationView!

    private var animationView: AnimationView?
    private let cellReuseIdentifier = "MovieCellReuseId"
    private let cellNibIdentifier = "MovieListCell"
    private let cellRowHeight: CGFloat = 200

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self

        let cellNib = UINib(nibName: cellNibIdentifier, bundle: nil)
        moviesTableView.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        resultStack.backgroundColor = .clear
        containerView.backgroundColor = .clear
        moviesTableView.backgroundColor = .clear
       
        self.title = "Movies"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func configureAndPlayNotFoundAnimation() {
        animationView = .init(name: "notFound")
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        animationView?.frame = viewAnimate.bounds
        animationView?.contentMode = .scaleAspectFit

        if let animation = animationView {
            viewAnimate.addSubview(animation)
        }
        viewAnimate.isHidden = false
        viewAnimate.backgroundColor = .clear

        viewAnimate.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        viewAnimate.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        viewAnimate.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        viewAnimate.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.leadingAnchor.constraint(equalTo: viewAnimate.leadingAnchor, constant: 0).isActive = true
        animationView?.trailingAnchor.constraint(equalTo: viewAnimate.trailingAnchor, constant: 0).isActive = true
        animationView?.bottomAnchor.constraint(equalTo: viewAnimate.bottomAnchor, constant: 0).isActive = true
        animationView?.topAnchor.constraint(equalTo: viewAnimate.topAnchor, constant: 0).isActive = true
        DispatchQueue.main.async { [weak self] in
            if let animationView = self?.animationView {
                animationView.play()
            }
        }
    }

    @IBAction func didTouchSearchButton(_ sender: Any) {
        guard let title = movieTitleText.text else {
            showAlert(title: "Warning", message: "Please enter a movie title.")
            return
        }
        presenter.sendSearchRequest(for: title)
    }
}

// MARK: - Table View

extension SearchMovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieListCell
        if let model = presenter.getViewModel(at: indexPath) {
            cell.viewModel = model
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellRowHeight)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToDetails(at: indexPath, vc: self)
    }
}

// MARK: - Implementing protocol

extension SearchMovieViewController: SearchMovieViewControllerProtocol {
    func addNavigationBar(_ navBar: UINavigationBar) {
        view.addSubview(navBar)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)
        let navigationItem = UINavigationItem(title: "Title")
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        navBar.items = [navigationItem]
    }

    func showErrorMessage(error: Error) {
        showAlert(title: "Warning", message: error.localizedDescription)
    }

    func displayNotFound() {
        configureAndPlayNotFoundAnimation()
        moviesTableView.isHidden = true
    }

    func displayMoviesTableView() {
        viewAnimate.isHidden = true
        animationView?.stop()
        moviesTableView.isHidden = false

        moviesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        moviesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        moviesTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        moviesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true

        DispatchQueue.main.async { [weak self] in
            self?.moviesTableView.reloadData()
        }
    }
}
