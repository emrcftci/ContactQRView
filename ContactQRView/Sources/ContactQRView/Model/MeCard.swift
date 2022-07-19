//
//  MeCard.swift
//  ContactQRView
//
//  Created by Emre Çiftçi on 19.07.2022.
//

import Foundation

public struct MeCard {

  public let name: String
  public let sound: String
  public let phones: [String]
  public let email: String
  public let note: String
  public let birthDay: String
  public let address: String
  public let url: String
  public let nickName: String
  public let organization: String

  public init(
    name: String? = nil,
    sound: String? = nil,
    phones: [String]? = nil,
    email: String? = nil,
    note: String? = nil,
    birthDay: String? = nil,
    address: String? = nil,
    url: String? = nil,
    nickName: String? = nil,
    organization: String? = nil
  ) {
    self.name = name ?? ""
    self.sound = sound ?? ""
    self.phones = phones ?? []
    self.email = email ?? ""
    self.note = note ?? ""
    self.birthDay = birthDay ?? ""
    self.address = address ?? ""
    self.url = url ?? ""
    self.nickName = nickName ?? ""
    self.organization = organization ?? ""
  }
}
