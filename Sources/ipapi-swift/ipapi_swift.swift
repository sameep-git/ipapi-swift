import Foundation
let BaseURL = "https://api.ipquery.io"

struct ISPInfo: Decodable {
    let asn: Optional<String>
    let org: Optional<String>
    let isp: Optional<String>
}

struct LocationInfo: Decodable {
    let country:        Optional<String>
    let country_code:   Optional<String>
    let city:           Optional<String>
    let state:          Optional<String>
    let zipcode:        Optional<String>
    let latitude:       Optional<Float64>
    let longitude:      Optional<Float64>
    let timezone:       Optional<String>
    let localtime:      Optional<String>
}

struct RiskInfo: Decodable {
    let is_mobile:      Optional<Bool>
    let is_vpn:         Optional<Bool>
    let is_tor:         Optional<Bool>
    let is_proxy:       Optional<Bool>
    let is_datacenter:  Optional<Bool>
    let risk_score:     Optional<Int>
}

struct IPInfo: Decodable {
    let ip:             String
    let isp:            Optional<ISPInfo>
    let location:       Optional<LocationInfo>
    let risk:           Optional<RiskInfo>
}

func queryIP(ip: String) async throws -> IPInfo {
    let url = URL(string: BaseURL + "/\(ip)")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(IPInfo.self, from: data)
    return decoded
}
