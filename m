Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28C3CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5689067;
	Mon, 13 Oct 2025 16:38:13 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7C89067
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:38:12 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40] (unknown
 [IPv6:2400:2410:b120:f200:9e5c:8eff:fec0:ee40])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id D22163F0F9;
 Mon, 13 Oct 2025 18:38:09 +0200 (CEST)
Message-ID: <ab28913c-59b5-4867-bb61-430275570cc7@hogyros.de>
Date: Tue, 14 Oct 2025 01:38:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com
References: <20251013034555.4121168-2-matthew.brost@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20251013034555.4121168-2-matthew.brost@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qS1hWJwhkZT3BsYIK0uJthV2"
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
--------------qS1hWJwhkZT3BsYIK0uJthV2
Content-Type: multipart/mixed; boundary="------------0Z9OT2pRrI0OigL4AX1tTgAl";
 protected-headers="v1"
From: Simon Richter <Simon.Richter@hogyros.de>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com
Message-ID: <ab28913c-59b5-4867-bb61-430275570cc7@hogyros.de>
Subject: Re: [v5,1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
References: <20251013034555.4121168-2-matthew.brost@intel.com>
In-Reply-To: <20251013034555.4121168-2-matthew.brost@intel.com>

--------------0Z9OT2pRrI0OigL4AX1tTgAl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEwLzEzLzI1IDEyOjQ1LCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KDQo+IFRo
ZSBidWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbSBmdW5jdGlvbiBpbiB0aGUgWGUgbWlncmF0
ZSBsYXllciBhc3N1bWVzDQo+IFBBR0VfU0laRSA9PSBYRV9QQUdFX1NJWkUgKDRLKSwgd2hp
Y2ggaXMgbm90IGEgdmFsaWQgYXNzdW1wdGlvbiBvbg0KPiBub24teDg2IHBsYXRmb3Jtcy4g
VGhpcyBwYXRjaCB1cGRhdGVzIGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtIHRvDQo+IGNv
cnJlY3RseSBoYW5kbGUgUEFHRV9TSVpFID4gNEsgYnkgcHJvZ3JhbW1pbmcgbXVsdGlwbGUg
NEsgR1BVIHBhZ2VzIHBlcg0KPiBDUFUgcGFnZS4NCj4gDQo+IHY1Og0KPiAgIC0gTWFzayBv
ZmYgbm9uLWFkZHJlc3MgYml0cyBkdXJpbmcgY29tcGFyZQ0KDQpUZXN0ZWQtYnk6IFNpbW9u
IFJpY2h0ZXIgPFNpbW9uLlJpY2h0ZXJAaG9neXJvcy5kZT4NCg0KICAgIFNpbW9uDQo=

--------------0Z9OT2pRrI0OigL4AX1tTgAl--

--------------qS1hWJwhkZT3BsYIK0uJthV2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEtjuqOJSXmNjSiX3Tfr04e7CZCBEFAmjtKu4ACgkQfr04e7CZ
CBHd/wgAmsOxA83OkgHMi9ZY3BLzo6h36CxwSTBwKaFTFelvwudC//EU89/tRtP6
SoDWhtJbJHi/cjZE6pRQ2ebsYxNGZPl1BKCaGYsaShCqmlC+hc6VBmn9PrnulCDO
DM4CEmdfVxAib7Wh2lgi3Xu+WWBNF3F7gLcQiy45Xl9BQ7+gjgESKpgGOc2XW8yF
G833cGEROs+F15t0ISKHAHdJlJ8UtjxpfXeZ2c8tF/YtigVFZBhsHoF5Qfa7HT+v
hE6Xr+grjbN967gR/H2PmHLJ+43baUvpd+glkj1doMeUyH6Lduo4Ay+lXgSZgSsp
52PZX8vZ98hzyi/bwGkCUv4gjH+2Ug==
=7ERB
-----END PGP SIGNATURE-----

--------------qS1hWJwhkZT3BsYIK0uJthV2--
