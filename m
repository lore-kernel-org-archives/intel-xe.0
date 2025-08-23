Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8280BCA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 23 Aug 2025 09:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C00010E30D;
	Sat, 23 Aug 2025 09:33:03 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546C710E30D
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 09:33:02 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 1B1DF3F108
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Aug 2025 11:32:59 +0200 (CEST)
Message-ID: <b03f0c36-231e-4490-b146-19a5d8ee630f@hogyros.de>
Date: Sat, 23 Aug 2025 18:32:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] drm/xe: Convert xe_bo_create_user() for
 exhaustive eviction
To: intel-xe@lists.freedesktop.org
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-7-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250822094030.3499-7-thomas.hellstrom@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------E9cXkUa0YOawmK5lrYDbtGLu"
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
--------------E9cXkUa0YOawmK5lrYDbtGLu
Content-Type: multipart/mixed; boundary="------------dUUPATKVV2iZTOV0NfskUgTa";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Message-ID: <b03f0c36-231e-4490-b146-19a5d8ee630f@hogyros.de>
Subject: Re: [PATCH v2 06/16] drm/xe: Convert xe_bo_create_user() for
 exhaustive eviction
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-7-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250822094030.3499-7-thomas.hellstrom@linux.intel.com>

--------------dUUPATKVV2iZTOV0NfskUgTa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDgvMjIvMjUgMTg6NDAsIFRob21hcyBIZWxsc3Ryw7ZtIHdyb3RlOg0KDQo+
ICsJeGVfdmFsaWRhdGlvbl9ndWFyZCgmY3R4LCAmeGUtPnZhbCwgJmV4ZWMsIChzdHJ1Y3Qg
eGVfdmFsX2ZsYWdzKSB7LmludGVycnVwdGlibGUgPSB0cnVlfSwNCj4gKwkJCSAgICBlcnIp
IHsNCj4gKwkJaWYgKHZtKSB7DQo+ICsJCQllcnIgPSB4ZV92bV9kcm1fZXhlY19sb2NrKHZt
LCAmZXhlYyk7DQo+ICsJCQlkcm1fZXhlY19yZXRyeV9vbl9jb250ZW50aW9uKCZleGVjKTsN
Cj4gKwkJCWlmIChlcnIpDQo+ICsJCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwkJYm8gPSB4ZV9i
b19jcmVhdGVfdXNlcih4ZSwgdm0sIGFyZ3MtPnNpemUsIGFyZ3MtPmNwdV9jYWNoaW5nLA0K
PiArCQkJCSAgICAgICBib19mbGFncywgJmV4ZWMpOw0KPiArCQlkcm1fZXhlY19yZXRyeV9v
bl9jb250ZW50aW9uKCZleGVjKTsNCj4gKwkJaWYgKElTX0VSUihibykpIHsNCj4gKwkJCWVy
ciA9IFBUUl9FUlIoYm8pOw0KPiArCQkJeGVfdmFsaWRhdGlvbl9yZXRyeV9vbl9vb20oJmN0
eCwgJmVycik7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KDQpJIGNhbid0IHRyeSBpdCBhZ2Fp
biBiZWNhdXNlIHRoZSBwYXRjaCBzZXJpZXMgZG9lc24ndCBhcHBseSB0byB0aGUgDQpjdXJy
ZW50IGRybS10aXAsIGJ1dDogd2hlbiBJIHdhcyBydW5uaW5nIFBpZ2xpdCBhZ2FpbnN0IHRo
ZSBsYXN0IA0KdmVyc2lvbiwgSSBlbmRlZCB1cCBvbiB0aGUgZmFpbGluZyBwYXRoIGZvciB0
aGUgeGVfdmFsaWRhdGlvbl9ndWFyZCwgDQp3aXRoIDY0IHRocmVhZHMgY3JlYXRpbmcgYSBj
b250ZXh0LCBzdWJtaXR0aW5nIGEgc21hbGwgd29ya2xvYWQsIGFuZCANCmRpc21hbnRsaW5n
IHRoZSBjb250ZXh0IGFnYWluLg0KDQpBbSBJIHN1cHBvc2VkIHRvIGVuZCB1cCBpbiB0aGVy
ZT8NCg0KICAgIFNpbW9uDQo=

--------------dUUPATKVV2iZTOV0NfskUgTa--

--------------E9cXkUa0YOawmK5lrYDbtGLu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmipisgACgkQfr04e7CZ
CBHv0gf9EOM5+YS3PcivHn/EH3qLlPY3i/Xi1YDdv+X+rY0UuxKwoM/yLA4NyEVy
IomEkH3besKkAl7eGVeEf5vHTiGmzyKNdsjwTjG7C+PKryZhmPDcJjgVCiHbbcuq
EWC+ohCNVniGxiwgtP8QgPlLoMHM0SRKNgBLPV7B0eUYdvxLjIpqmnc7IyfanM9i
6aW8X6odEyTMibYGo5dVrU9wo2R/vR7CmdECdzZs0gtHB/VoLQz+elDkp9rTRKFa
sB/H4pWL/bdsH56qhjs+p6bh9Uv0oHe2aU1UHhfbjMpEfDERrqG1bBg5b/GwMtA9
Eg3m4kE8SGIeohWWwe1i08/25DjDSA==
=zeLV
-----END PGP SIGNATURE-----

--------------E9cXkUa0YOawmK5lrYDbtGLu--
