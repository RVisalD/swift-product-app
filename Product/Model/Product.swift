//
//  Product.swift
//  Product
//
//  Created by RatanakVisal on 25/12/25.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

struct Dimensions: Codable {
    let width, height, depth: Double
}

struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20250430T094102053Z = "2025-04-30T09:41:02.053Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}


struct MockData {
    
    static let sampleProduct = Product(
        id: 1,
        title: "Wireless Bluetooth Headphones",
        description: "High-quality wireless headphones with noise cancellation and long battery life.",
        category: .fragrances,
        price: 199.99,
        discountPercentage: 15.0,
        rating: 4.6,
        stock: 120,
        tags: ["wireless", "bluetooth", "noise-cancelling"],
        brand: "SoundMax",
        sku: "SMX-HEAD-001",
        weight: 350,
        dimensions: Dimensions(
            width: 18.5,
            height: 22.0,
            depth: 8.0
        ),
        warrantyInformation: "1 year manufacturer warranty",
        shippingInformation: "Ships within 2–3 business days",
        availabilityStatus: .inStock,
        reviews: [
            Review(
                rating: 5,
                comment: "Amazing sound quality and very comfortable!",
                date: .the20250430T094102053Z,
                reviewerName: "John Doe",
                reviewerEmail: "john@example.com"
            ),
            Review(
                rating: 4,
                comment: "Great value for the price.",
                date: .the20250430T094102053Z,
                reviewerName: "Jane Smith",
                reviewerEmail: "jane@example.com"
            )
        ],
        returnPolicy: .the30DaysReturnPolicy,
        minimumOrderQuantity: 1,
        meta: Meta(
            createdAt: .the20250430T094102053Z,
            updatedAt: .the20250430T094102053Z,
            barcode: "123456789012",
            qrCode: "https://example.com/qr/123456789012"
        ),
        images: [
            "https://example.com/images/product1_1.png",
            "https://example.com/images/product1_2.png"
        ],
        thumbnail: "https://example.com/images/product1_thumb.png"
    )
    
    static let listSampleProduct = [sampleProduct, sampleProduct, sampleProduct]
}

