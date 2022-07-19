//
//  QRView.swift
//  ContactQRView
//
//  Created by Emre Çiftçi on 19.07.2022.
//

import UIKit

public final class QRView: UIView, NibLoadable {

  // MARK: - Outlets

  @IBOutlet private weak var imageView: UIImageView!

  // MARK: - Properties

  private struct Constants {
    static let filterName = "CIQRCodeGenerator"
    static let key = "inputMessage"
    static let scaleFactor: CGFloat = 3
  }

  // MARK: - View's Lifecycle

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupFromNib()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupFromNib()
  }

  // MARK: - Configuration

  /// Sets QR Code image of given details
  /// - Parameter card: Contact details
  public func configure(with card: MeCard) {
    let cardText = generateMeCardText(from: card)
    imageView.image = qrCode(of: cardText)
  }

  // MARK: - Private Helpers

  /// Generates QR code of given MECARD text
  /// - Parameter text: MECARD text to generate QR
  /// - Returns: Generated QR image if possible
  private func qrCode(of text: String) -> UIImage? {
    let data = text.data(using: .ascii)

    guard let filter = CIFilter(name: Constants.filterName) else { return nil }

    filter.setValue(data, forKey: Constants.key)

    let transform = CGAffineTransform(scaleX: Constants.scaleFactor,
                                      y: Constants.scaleFactor)
    guard let output = filter.outputImage?.transformed(by: transform) else { return nil }

    return UIImage(ciImage: output)
  }

  /// Generates MECARD text with given `MeCard`
  /// - Parameter card: Contact details
  /// - Returns: MECARD text
  private func generateMeCardText(from card: MeCard) -> String {
    var cardText = "MECARD:N:\(card.name);EMAIL:\(card.email);NOTE:\(card.note);BDAY:\(card.birthDay);ADR:\(card.address);URL:\(card.url);NICKNAME:\(card.nickName);ORG:\(card.organization);"

    card.phones.forEach { phone in
      cardText += "TEL:\(phone);"
    }

    return cardText
  }
}
