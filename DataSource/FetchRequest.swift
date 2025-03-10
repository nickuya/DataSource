//
//  FetchRequest.swift
//  DataSource
//
//  Created by Nick Kuyakanon on 2/28/17.
//  Copyright © 2017 4f Tech. All rights reserved.
//

import Foundation
import PromiseKit
import CoreLocation

public class FetchRequest {
  public var offset: Int?
  public var limit: Int?
  
  var fetchConditions: FetchConditions = FetchConditions()
  
  public var sortDescriptors: [NSSortDescriptor] = []
  public var conditions: [String:Any] {
    return fetchConditions.conditions
  }
  
  public init(sortDescriptor: NSSortDescriptor? = nil, offset: Int? = nil, limit: Int? = nil) {
    if let sortDescriptor = sortDescriptor {
      self.sortDescriptors = [sortDescriptor]
    }
    
    self.offset = offset
    self.limit = limit
  }
  
  
  // MARK: - Filtering
  public func apply(filters: [Filter]?) -> FetchRequest {
    if let filters = filters {
      for filter in filters {
        filter.apply(to: self)
      }
    }
    
    return self
  }
  
  // MARK: - Sorting
  public func orderByAscending(_ key: String) {
    sortBy(key: key, ascending: true)
  }
  
  public func addAscendingOrder(_ key: String) {
    addSort(key: key, ascending: true)
  }
  
  public func orderByDescending(_ key: String) {
    sortBy(key: key, ascending: false)
  }
  
  public func addDescendingOrder(_ key: String) {
    addSort(key: key, ascending: false)
  }
  
  
  func sortBy(key: String, ascending: Bool) {
    sortDescriptors = []
    addSort(key: key, ascending: ascending)
  }
  
  func addSort(key: String, ascending: Bool) {
    sortDescriptors.append(NSSortDescriptor(key: key, ascending: ascending))
  }
  
  
  // MARK: - Conditions
  @discardableResult
  public func whereKeyExists(_ key: String) -> FetchRequest {
    self.fetchConditions.whereKeyExists(key)
    return self
  }

  @discardableResult
  public func whereKeyDoesNotExist(_ key: String) -> FetchRequest {
    self.fetchConditions.whereKeyDoesNotExist(key)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, equalTo object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, equalTo: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, greaterThan object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, greaterThan: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, greaterThanOrEqualTo object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, greaterThanOrEqualTo: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, lessThan object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, lessThan: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, lessThanOrEqualTo object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, lessThanOrEqualTo: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, notEqualTo object: Any) -> FetchRequest {
    self.fetchConditions.whereKey(key, notEqualTo: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, containedIn object: [Any]) -> FetchRequest {
    self.fetchConditions.whereKey(key, containedIn: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, notContainedIn object: [Any]) -> FetchRequest {
    self.fetchConditions.whereKey(key, notContainedIn: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, containsAllObjectsInArray object: [Any]) -> FetchRequest {
    self.fetchConditions.whereKey(key, containsAllObjectsInArray: object)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, matchesRegex regex: String, modifiers: Any? = nil) -> FetchRequest {
    self.fetchConditions.whereKey(key, matchesRegex: regex, modifiers: modifiers)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, nearCoordinates coordinates: CLLocationCoordinate2D, distance: Double? = nil) -> FetchRequest {
    self.fetchConditions.whereKey(key, nearCoordinates: coordinates, distance: distance)
    return self
  }
  
  @discardableResult
  public func whereKey(_ key: String, withinGeoBox geoBox: GeoBox) -> FetchRequest {
    self.fetchConditions.whereKey(key, withinGeoBox: geoBox)
    return self
  }
}


