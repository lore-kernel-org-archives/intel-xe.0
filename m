Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C00CA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 14:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0E10E0C6;
	Thu,  8 Oct 2026 14:46:53 +0000 (UTC)
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Thu, 08 Oct 2026 14:46:52 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5CA10E0C6
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 14:46:52 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 60AC23F11B
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 16:40:19 +0200 (CEST)
Message-ID: <9d0c9f3c-acb8-4566-b313-a9eb8f17f332@hogyros.de>
Date: Thu, 8 Oct 2026 23:40:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
To: intel-xe@lists.freedesktop.org
References: <20261007153605.1743626-5-matthew.auld@intel.com>
 <20261007153605.1743626-8-matthew.auld@intel.com>
 <2c6a97ac21c5ef161dbac279f9b971f383b6b944.camel@linux.intel.com>
 <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xF9ICpKacmTwz5hCe9RbXYDH"
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xF9ICpKacmTwz5hCe9RbXYDH
Content-Type: multipart/mixed; boundary="------------thfJX4JWXJhvx0YgrlmZIj4Q";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Message-ID: <9d0c9f3c-acb8-4566-b313-a9eb8f17f332@hogyros.de>
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
References: <20261007153605.1743626-5-matthew.auld@intel.com>
 <20261007153605.1743626-8-matthew.auld@intel.com>
 <2c6a97ac21c5ef161dbac279f9b971f383b6b944.camel@linux.intel.com>
 <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
In-Reply-To: <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>

--------------thfJX4JWXJhvx0YgrlmZIj4Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzgvMjYgMTg6NDYsIE1hdHRoZXcgQXVsZCB3cm90ZToNCg0KPiBGcm9t
IHRoZSB1c2VyIGJ1ZyByZXBvcnQgaXQgc291bmRzIGxpa2UgdGhlIGRncHUgbGluZWFyIA0K
PiB3aW5kb3cgYnVmZmVyIGV4cG9ydGVkIHRvIHRoZSBjb21wb3NpdG9yIChpZ3B1KSBpcyBk
dWFsIHBsYWNlbWVudCBWUkFNICsgDQo+IFRULCBhbmQgc28gdGhpcyBub3cgYXR0ZW1wdHMg
dG8ga2VlcCB0aGF0IG1lbW9yeSBpbiBWUkFNIGluc3RlYWQgb2YgDQo+IG1vdmluZyBpdC4g
Q29tcG9zaXRvciB0aGVuIHVzZXMgcDJwIHRvIGFjY2VzcyBpdC4gSXQgd29ya3MgYnV0IA0K
PiBwZXJmb3JtYW5jZSBmYWxscyBvZmYgYSBtYXNzaXZlIGNsaWZmIGhlcmUuDQoNCklzIHRo
YXQgYmVjYXVzZSBpdCBpcyB1c2luZyBleHRlcm5hbCBtZW1vcnkgYXMgYSB0ZXh0dXJlIHNv
dXJjZSwgb3IgDQpiZWNhdXNlIGNvcHkgb3BlcmF0aW9ucyBhcmUgc2xvdyBmb3Igc29tZSBy
ZWFzb24/DQoNCklmIGl0IGlzIGZvciBhIHRleHR1cmUsIHRoZSBjbGllbnQgc2hvdWxkIHNh
eSBzbyBleHBsaWNpdGx5IGR1cmluZyB0aGUgDQppbXBvcnQsIGUuZy4gYSBWdWxrYW5bMV0g
Y2xpZW50IHdvdWxkIGdpdmUgYSANClZrRXh0ZXJuYWxNZW1vcnlJbWFnZUNyZWF0ZUluZm8g
cG9pbnRlciBpbiBwTmV4dCwgYW5kIGZpbGwgb3V0IHVzYWdlIGFzIA0KVktfSU1BR0VfVVNB
R0VfU0FNUExFRF9CSVQuDQoNCkkgdGhpbmsgdGhpcyB3b3VsZCBiZSB0aGUgaWRlYWwgcG9p
bnQgdG8gZWl0aGVyIG1ha2Ugc3VyZSB0aGUgaW1hZ2UgZW5kcyANCnVwIGluIGhvc3QgbWVt
b3J5LCBvciByZWplY3QgaXQgc28gdGhlIGNvbXBvc2l0b3IgY2FuIGRldGVjdCB0aGF0IHRo
aXMgDQppcyBub3QgYSBnb29kIHRleHR1cmUgc291cmNlLCBhbmQgaW5zZXJ0IGFuIGV4dHJh
IHRyYW5zZmVyLg0KDQogICAgU2ltb24NCg0KWzFdIFByZXN1bWFibHksIG90aGVyIGdyYXBo
aWNzIEFQSXMgaGF2ZSBzb21ldGhpbmcgc2ltaWxhci4NCg==

--------------thfJX4JWXJhvx0YgrlmZIj4Q--

--------------xF9ICpKacmTwz5hCe9RbXYDH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmrHq04ACgkQfr04e7CZ
CBEiIAf8CjUTsrGXW0FrOHExqteQ4jP0TS+IdT7QHMP3rzvbV1XqRJXZGfIJ28rH
FkUR5bM0KeKjJiFspKuZPWkdS/feOpD5huU4Z/YbsF/h/1z6xKS6v8jkSjLPPzIT
Nc2YxU+PuQQl8DsrEfl11In3qc/pzxF2ls57ZKu7pqrzmkyIla+ynfjHn41LsHs0
BvvySFRpoMQ6VeCDYAzthDOcOXH/BeZtsz+7DAh1BO7qdv/B3chNH0nMXoIAT9o8
7T2x29kn+Dao6izJ8mY+C2sZUpnkROo3VGw1felplTMypSYJAoF6chXtDTZgQD1E
EWjFSn20/YXJ3OGNekDuQSx0U5Bx7g==
=Z2OO
-----END PGP SIGNATURE-----

--------------xF9ICpKacmTwz5hCe9RbXYDH--
