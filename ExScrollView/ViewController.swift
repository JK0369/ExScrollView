//
//  ViewController.swift
//  ExScrollView
//
//  Created by Jake.K on 2022/04/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private lazy var slider: UISlider = {
    let slider = UISlider()
    slider.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
    return slider
  }()
  private lazy var scrollView: UIScrollView = {
    let view = UIScrollView()
    view.minimumZoomScale = 1.0
    view.maximumZoomScale = 10.0
    view.bounces = false
    view.showsVerticalScrollIndicator = false
    view.showsHorizontalScrollIndicator = false
    return view
  }()
  private lazy var stackView: UIStackView = {
    let view = UIStackView()
    view.axis = .vertical
    view.spacing = 8
    return view
  }()
  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 50)
    label.text = "iOS 앱 개발 알아가기 테스트 label\niOS 앱 개발 알아가기 테스트 label\niOS 앱 개발 알아가기 테스트 label\niOS 앱 개발 알아가기 테스트 label\niOS 앱 개발 알아가기 테스트 label"
    label.numberOfLines = 0
    return label
  }()
  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("sample button", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.slider)
    self.view.addSubview(self.scrollView)
    self.scrollView.addSubview(self.stackView)
    [self.label, self.button].forEach(self.stackView.addArrangedSubview(_:))
    
    self.slider.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.left.right.equalToSuperview()
    }
    self.scrollView.snp.makeConstraints {
      $0.top.equalTo(self.slider.snp.bottom)
      $0.left.right.bottom.equalToSuperview()
    }
    // left, right를 걸지 않고 width로 해야하는것을 주의
    self.stackView.snp.makeConstraints {
      $0.top.bottom.width.equalToSuperview()
    }
    
    self.scrollView.delegate = self
  }
  
  @objc private func changeValue(_ sender: UISlider) {
    self.scrollView.zoomScale = CGFloat(sender.value * 10)
  }
}

extension ViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    self.label
  }
}
