/*
 * Copyright (c) 2017, Okta, Inc. and/or its affiliates. All rights reserved.
 * The Okta software accompanied by this notice is provided pursuant to the Apache License, Version 2.0 (the "License.")
 *
 * You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and limitations under the License.
 */

import OktaJWT

public class TestUtils {
    var jwts: [String: Any] = [:]

    init() { jwts = TestUtils.readFromPList("TestJWTs")}

    static var issuer = "https://demo-org.oktapreview.com/oauth2/default/"
    static var audience = "api://default"
    static var clientId = "0oae1enia6od2nlz00h7"

    static var exampleJWK = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "xtoffbHIv-dJredUF-wnkEHKLFzPXOQ7KxuuGKXiAssJhGE-aJXjT5lK-RLZYcWTGoCzXEubx80cB" +
               "nr4JvU_AQJ7abg4tfv6ygcAfocH_oxYFrUvwhuoEOHg160EHeYpVu8olZmOn06p8pI-FqSxAMpGPxn" +
               "sl_441Wc0BIgnBrGjqjjsCbOT_I9i3AdxJDfDnS442tTCkOouIEs5Gzx__FHT6CGgfffS65H8JECA7" +
               "-I1ZJqhhc-R2OIP_GCofWlawLLTwohZZ1FbREmGkGngeEXmU6hw7H-24XUM7WYPsA2ZpjiPLRJeqLH" +
               "2d88as37oKV-zqiVmItD13P0SPHKqXQ",
        "kid": "0XoqZmZm5nBQtRxTwq5T29s0TzqtDj0zsr8lFHp98vg",
        "kty": "RSA",
        "use": "sig"
    ]

    static var mysiteJWK = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "xtoffbHIv-dJredUF-wnkEHKLFzPXOQ7KxuuGKXiAssJhGE-aJXjT5lK-RLZYcWTGoCzXEubx80cB" +
               "nr4JvU_AQJ7abg4tfv6ygcAfocH_oxYFrUvwhuoEOHg160EHeYpVu8olZmOn06p8pI-FqSxAMpGPxn" +
               "sl_441Wc0BIgnBrGjqjjsCbOT_I9i3AdxJDfDnS442tTCkOouIEs5Gzx__FHT6CGgfffS65H8JECA7" +
               "-I1ZJqhhc-R2OIP_GCofWlawLLTwohZZ1FbREmGkGngeEXmU6hw7H-24XUM7WYPsA2ZpjiPLRJeqLH" +
               "2d88as37oKV-zqiVmItD13P0SPHKqXQ",
        "kid": "someKeyId",
        "kty": "RSA",
        "use": "sig"
    ]

    static var invalidJWK = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "someValue",
        "kid": "0XoqZmZm5nBQtRxTwq5T29s0TzqtDj0zsr8lFHp98vg",
        "kty": "RSA",
        "use": "sig"
    ]

    static var invalidJWKID = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "xtoffbHIv-dJredUF-wnkEHKLFzPXOQ7KxuuGKXiAssJhGE-aJXjT5lK-RLZYcWTGoCzXEubx80cB" +
               "nr4JvU_AQJ7abg4tfv6ygcAfocH_oxYFrUvwhuoEOHg160EHeYpVu8olZmOn06p8pI-FqSxAMpGPxn" +
               "sl_441Wc0BIgnBrGjqjjsCbOT_I9i3AdxJDfDnS442tTCkOouIEs5Gzx__FHT6CGgfffS65H8JECA7" +
               "-I1ZJqhhc-R2OIP_GCofWlawLLTwohZZ1FbREmGkGngeEXmU6hw7H-24XUM7WYPsA2ZpjiPLRJeqLH" +
               "2d88as37oKV-zqiVmItD13P0SPHKqXQ",
        "kid": "None",
        "kty": "RSA",
        "use": "sig"
    ]

    static var invalidJWKModulus = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "kDL-uc8IguAoTa4WHNdMIzMwpYKCtTibRr1UbgyKVT82kvV0Auwb-j3eoEs151vqFVEPudS0fK1aV" +
              "dyOVcdA_zkgChqJRNJypw9cwuJnsyApYzcM6_-JxN2aERlb1CEzP9T5vC_-S1ZAaLmeNAFB8CJ8LX" +
              "Z2lK2iSUn83B_7I-ealvkaIechjBB4Sz29aDDHMnlfth9DeC7wIwHLTCA6d8NEdUOAL9UdZWw1afK" +
              "-Uh72E-q7-1tNZBo9k3413grsVL7tnsuZjw7RHfZeXnMbBytR-gdqSJ8UeUZ-HdVE7SNdDG7NR3Mx" +
              "KgjNR7kNfOl4BYEw_cWLicRd413gqyYXYZ",
        "kid": "0XoqZmZm5nBQtRxTwq5T29s0TzqtDj0zsr8lFHp98vg",
        "kty": "RSA",
        "use": "sig"
    ]

    static var invalidJWKModulusForJWT = [
        "alg": "RS256",
          "e": "AQAB",
          "n": "kR7T4d_6RrTLQ4rdhdexVsGs6D0UwY9gZotmC7BEMvFovvnB0U3fy7WpmUn3aL9ooUJuDj19h17l3" +
              "gENKTaZOLucmLVq6HlK8coukxzk8_zhllrWXXFVwB3TlB-zR2EfWi_FKnyHHrSQ0lb1RfO7wberhy" +
              "_FK6n6WA5lCMYVfOGVm3aV6vfAojS7y1QzyimytitCRsOnIW7QmlZ1ZtKcEKb0pGdwSAAj-OSldZL" +
              "uLBj9B_t6HMq0xPVNhWgtYGDFNARaCIcvuP236VpGsw3EH4zfeKVMpScHC2j3y5JvMefn_iVgBzW7" +
              "9qs6QPbC6Y1_yCJv-ZRfur3Tk92Hq82XYZ",
        "kid": "0XoqZmZm5nBQtRxTwq5T29s0TzqtDj0zsr8lFHp98vg",
        "kty": "RSA",
        "use": "sig"
    ]

    static var exampleRSAKey = TestUtils.createRSAKey(modulus: TestUtils.exampleJWK["n"]!, exponent: TestUtils.exampleJWK["e"]!)

    class func createRSAKey(modulus: String, exponent: String) -> RSAKey? {
        // Create an RSAKey from JWK

        let tag = "com.okta.jwt.0XoqZmZm5nBQtRxTwq5T29s0TzqtDj0zsr8lFHp98vg"
        return try? RSAKey.registerOrUpdateKey(
            modulus: Utils.base64URLDecode(modulus)!,
            exponent: Utils.base64URLDecode(exponent)!,
            tag: tag
        )
    }

    class func readFromPList(_ name: String) -> [String : Any] {
        // Parse the given plist file

        if let path = Bundle.main.url(forResource: name, withExtension: "plist"),
            let data = try? Data(contentsOf: path) {
            if let result = try? PropertyListSerialization
                .propertyList(
                    from: data,
                    options: [],
                    format: nil
                ) as? [String: Any] {
                return result != nil ? result! : [:]
            }
        }
        return [:]
    }
}
