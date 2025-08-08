Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78D5C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 21:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82E10E98D;
	Fri,  8 Aug 2025 21:12:09 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12B10E98D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 21:12:08 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 12D9F3F108;
 Fri,  8 Aug 2025 23:12:02 +0200 (CEST)
Message-ID: <a1488184-da2a-4f6a-b955-9c6db9e0cca6@hogyros.de>
Date: Sat, 9 Aug 2025 06:11:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, jeffbai@aosc.io,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de> <aId7hYAfMxlBTV8x@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <aId7hYAfMxlBTV8x@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5URs8tDIzu92V8O8XrMq9jt7"
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
--------------5URs8tDIzu92V8O8XrMq9jt7
Content-Type: multipart/mixed; boundary="------------QDlEMWgxNt4yGFh4XutB2DFW";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, jeffbai@aosc.io,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
Message-ID: <a1488184-da2a-4f6a-b955-9c6db9e0cca6@hogyros.de>
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de> <aId7hYAfMxlBTV8x@intel.com>
In-Reply-To: <aId7hYAfMxlBTV8x@intel.com>

--------------QDlEMWgxNt4yGFh4XutB2DFW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDcvMjgvMjUgMjI6MzAsIFJvZHJpZ28gVml2aSB3cm90ZToNCg0KPj4gLQlk
cm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoJnhlLT5kcm0sICZiby0+dHRtLmJhc2UsIHNp
emUpOw0KPj4gKwlkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoJnhlLT5kcm0sICZiby0+
dHRtLmJhc2UsIGFsaWduZWRfc2l6ZSk7DQoNCj4gYnV0IHRoaXMgaXMgc3RyYW5nZS4NCj4g
dGhpbmsgdGhhdCB3ZSBjb3VsZCBnZXQgcmlkIG9mIHRoZSBhbGlnbmVkX3NpemUgdmFyaWFi
bGUgYW5kIG9ubHkgZ28gd2l0aA0KPiBzaXplID0gQUxJR04oc2l6ZSwgUEFHRV9TSVpFKQ0K
DQpJJ20gZ29pbmcgdGhyb3VnaCB0aGlzIGNvZGUsIGFuZCBpdCBpcyBtb3JlIGhvcnJpYmxl
IHRoYW4gYW50aWNpcGF0ZWQuDQoNClRoZSBwcm9ibGVtYXRpYyBwYXRoIHRoYXQgbWFrZXMg
c21hbGxlciBhbGxvY2F0aW9ucyBjb21lcyBmcm9tIA0KeGVfcHRfY3JlYXRlLCB3aGVyZSBh
IDRrIEJPIGlzIGNyZWF0ZWQgZm9yIGEgcGFnZSB0YWJsZS4gVGhpcyBuZWVkcyB0byANCmJl
IENQVSB2aXNpYmxlIGFzIHdlbGwsIHNvIGluIHRoZW9yeSBpdCBuZWVkcyB0byBiZSAxNi82
NC8yNTZrIGFsaWduZWQsIA0KZGVwZW5kaW5nIG9uIFBBR0VfU0laRS4gRXh0ZW5kaW5nIGl0
IGlzIHdhc3RlZnVsLCBidXQgdGhhdCdzIHdoYXQgd2UgZG8gDQpoZXJlLg0KDQpVc2luZyB0
aGUgb3JpZ2luYWwgc2l6ZSBtYWtlcyB0aGUgbWFwcGluZ3MgZmFpbCwgYmVjYXVzZSBsYXRl
ciBpdCB3YW50cyANCnRvIG1hcCBTWl80SyA+PiBQQUdFX1NISUZUICg9PSAwKSBwYWdlcy4N
Cg0KSSB3b25kZXIgaWYgdGhlcmUgc2hvdWxkIGJlIGEgd2F5IHRvIG1lcmdlIHNtYWxsZXIg
YWxsb2NhdGlvbnMsIG1heWJlIA0KZXZlbiBzcGVjaWFsLWNhc2UgcGFnZSB0YWJsZSBCT3Mg
aGVyZSAodXNlcnNwYWNlIG1lcmdlcyBzbWFsbGVyIA0KYWxsb2NhdGlvbnMgaXRzZWxmLCBz
byBpdCBzaG91bGQgbmV2ZXIgcmVxdWVzdCBsZXNzIHRoYW4gUEFHRV9TSVpFKS4NCg0KSSd2
ZSB0YWxrZWRbMV0gdG8gdGhlIE1lc2EgcGVvcGxlLCBhbmQgYmVjYXVzZSB0aGV5IGhhdmUg
dGhlaXIgb3duIA0KYWxsb2NhdG9yLCBpdCBzaG91bGQgYmUgb2theSB0byBkZWZpbmUgdGhl
IA0KRFJNX1hFX1FVRVJZX0NPTkZJR19NSU5fQUxJR05NRU5UIHBhcmFtZXRlciBhcyAibWlu
aW11bSBhbGlnbm1lbnQgdGhhdCANCmlzIG9rYXkgZm9yIGFueSB1c2Vyc3BhY2UgQk8gdHlw
ZSIgKGFzIG9wcG9zZWQgdG8gIm1pbmltdW0gYWxpZ25tZW50IGZvciANClZSQU0gQk9zIiwg
d2hpY2ggd291bGQgcmVxdWlyZSBNZXNhIHRvIGFsc28gYWxpZ24gdG8gDQpzeXNjb25mKF9T
Q19QQUdFU0laRSkgZm9yIENQVSB2aXNpYmxlIEJPcykuDQoNCkZvciBzb21lIHJlYXNvbiwg
ZXZlcnlvbmUgdHJpZXMgdG8gYXZvaWQgc2V0dGluZyBmbGFncyB0byBjbGFyaWZ5IHdoYXQg
DQp0aGV5IHdhbnQuIE1lc2EgZG9lcyBub3Qgc2V0IHRoZSBmbGFnIGZvciAidGhpcyBCTyBu
ZWVkcyB0byBiZSBDUFUgDQp2aXNpYmxlIiBpZiB0aGVyZSBpcyBubyBWUkFNIHRoYXQgZG9l
c24ndCBmaXQgaW4gdGhlIGFwZXJ0dXJlLCBzbyB0aGUgDQprZXJuZWwgY2FuJ3QgZW5mb3Jj
ZSBhbGlnbm1lbnQgaWYgdGhlIENQVSBoYXMgc3RyaWN0ZXIgcmVxdWlyZW1lbnRzIHRoYW4g
DQp0aGUgR1BVLiBUaGUga2VybmVsIHdvdWxkIGlnbm9yZSB0aGUgZmxhZyBhbnl3YXksIGJ1
dCB0aGF0J3Mgbm90IHRoZSBwb2ludC4NCg0KICAgIFNpbW9uDQoNClsxXSBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vaXNzdWVzLzEzNjU4DQo=

--------------QDlEMWgxNt4yGFh4XutB2DFW--

--------------5URs8tDIzu92V8O8XrMq9jt7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmiWaB4ACgkQfr04e7CZ
CBHSKAf+I27geCRJL2Fih2OzNbou5JvuLJJfmb4LdhSnrocan3J7TrPWTGG6XZiq
SOR5jrDVBhyGTsRCw29bWFIX29onwZr06JKtp6aYd6fH0qWt7GwTxo5VrAIdI+FO
rfzJebpSENE23+wgL/nEtYjxLfa4+I0Qw0Qb4lSVBjm46Fg540JGMukWlrjSGQbh
7u65UAEIUE2jfFUwPbBZpNARNwWReLCTPtvBwfWRXg53kwU2tsU52O80W4VgyA8m
R3xmzaIcxmjgT/YFPSc5LG1JUYnjbXkVa/zmhf8P42j+Rsg5Aoh4n6aPB9HTIo4N
wP0Oji5D+r+MBcgU5g5qF5S947N6Mg==
=ycM7
-----END PGP SIGNATURE-----

--------------5URs8tDIzu92V8O8XrMq9jt7--
