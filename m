Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA30CCF2C9
	for <intel-xe@archiver.kernel.org>; Sun, 18 Oct 2026 04:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26210E41D;
	Sun, 18 Oct 2026 04:55:58 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D563E10E41D
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 04:55:57 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 91E903F11B
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 06:55:55 +0200 (CEST)
Message-ID: <721f4751-1350-40be-8822-81c584dcb4b6@hogyros.de>
Date: Sat, 17 Oct 2026 12:27:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/xe/forcewake: add delayed release for
 engine-cycle queries
To: intel-xe@lists.freedesktop.org
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kXifa3K4MNjDqtaIWps40qLu"
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
--------------kXifa3K4MNjDqtaIWps40qLu
Content-Type: multipart/mixed; boundary="------------0y7o4Tx5E8XaDfbfTIWWyduu";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org
Message-ID: <721f4751-1350-40be-8822-81c584dcb4b6@hogyros.de>
Subject: Re: [PATCH 0/3] drm/xe/forcewake: add delayed release for
 engine-cycle queries
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>

--------------0y7o4Tx5E8XaDfbfTIWWyduu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzE3LzI2IDEyOjE4LCBab25neWFvIEJhaSB3cm90ZToNCg0KPiBFbmdp
bmUtY3ljbGUgcXVlcmllcyBhcmUgaXNzdWVkIHJlcGVhdGVkbHkgYnkgcHJvZmlsZXJzIHN1
Y2ggYXMgVlR1bmUNCj4gYW5kIFBUSSB0byBjb3JyZWxhdGUgQ1BVIGFuZCBHUFUgdGltZXN0
YW1wcywgZm9yIGV4YW1wbGUgdGhyb3VnaCBMZXZlbA0KPiBaZXJvIHplRGV2aWNlR2V0R2xv
YmFsVGltZXN0YW1wcygpLiBFYWNoIHF1ZXJ5IHdha2VzIHRoZSBlbmdpbmUNCj4gZm9yY2V3
YWtlIGRvbWFpbiBhbmQgcHV0cyBpdCB0byBzbGVlcCBhZ2FpbiwgYW5kIHdhaXRpbmcgZm9y
IGJvdGgNCj4gYWNrbm93bGVkZ21lbnRzIGRvbWluYXRlcyB0aGUgcXVlcnkgbGF0ZW5jeS4N
Cg0KSSBzdXBwb3NlIHRoYXQNCg0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3Nlcmllcy8xNzU5NjIvDQoNCndpbGwgd2FudCB0byBkbyBzb21ldGhpbmcgc2ltaWxhciwg
YWx0aG91Z2ggbXkgc3VzcGljaW9uIGlzIHRoYXQgd2l0aCANCmRlbGF5ZWQgcmVsZWFzZSwg
dGhlIHNlbnNvciByZWZyZXNoIHN0b3BzIHdvcmtpbmcuDQoNCiAgICBTaW1vbg0K

--------------0y7o4Tx5E8XaDfbfTIWWyduu--

--------------kXifa3K4MNjDqtaIWps40qLu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmrS6zsACgkQfr04e7CZ
CBFfIgf/YA9+SYrkP7W0Fofh2TWEgGeCynZwr/2AB/IOJfPbJnFMSVEJvauZg50y
aSxagGA9GOMBGpxRE2pq11bujhzQBIoa4NzLJv5MAmtEjYfPkdTNq3enzluDt3bv
bFJPte3IrHzhbauUo48iba/lg0Oqlm4NSYgoZ7x4ep+Vk68okU2OL1inD1ZXkGL2
138OqNDvmHNiW2AF2TP5zlK6b2vFlWyQXlJOwm7B0if14UMPybT63p+Odw3Tj5vC
u4gpU6qdlIX1tcbRjqEumoGsDSmU+xjbbLsWQ0UAgzQv7pW3G3ql4lkybQy7WAFC
j0iL1t//mEaB7vwg4YuSQ2qpMbVtEA==
=0lME
-----END PGP SIGNATURE-----

--------------kXifa3K4MNjDqtaIWps40qLu--
