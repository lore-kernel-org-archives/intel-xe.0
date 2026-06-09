Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35128CD8CA4
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6F010E2ED;
	Tue,  9 Jun 2026 12:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X4KzwdBL";
	dkim-atps=neutral
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B551C10E2ED
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 12:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=OjjY
 SMPomOhwWFqEFMXz14LrPJYiz9EwEP/lmnYTl0Q=; b=X4KzwdBLdIf7wzZ/1YyW
 1aS+7NAQ0pKiYSXa5b4WxAtci+008jSKtGLyBhUOqDunqemK1tOy0PYbfSMeaCPg
 CuR2acJyL9SkRBcJCWCOokMsCwn1nDTdDDCcfGV4nvMahac+OHillaEpLuCdEopw
 9mRmsw4RWcKpYLSyA331jVYP3hmeFZBr6MKQEei51CZN5+4zC5GuaaXKYDV48ciV
 8lH2coWVP+0Pv4LcovFz7hJVT8Vfwe7VIEl2aOqSW6j8hYs9sOe3bXNcX+pUQQCw
 8xpmYgUyOKO93QMH5R4hfxCoIuIdZGLXq1nV8yQwHZpSaT3AXsaHs35he39cZHmX
 8g==
Received: (qmail 1274062 invoked from network); 9 Jun 2026 14:37:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 9 Jun 2026 14:37:43 +0200
X-UD-Smtp-Session: l3s3148p1@fFq1ZNFTXLMujnvA
Date: Tue, 9 Jun 2026 14:37:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 wsa@kernel.org, andriy.shevchenko@intel.com,
 mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com,
 linusw@kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 kernel test robot <lkp@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 ravitejax.veesam@intel.com
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
Message-ID: <aigJF6hd1EjRiGc-@ninjato>
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com>
 <90656be5-eca0-4a09-9b19-0c6e85f1d455@intel.com>
 <CANTFpSV7N=5U9yuXcU-D=PDpwj=kD__JU89UGL1HQOYiaL77qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oHvNJz1Mkf1rfBzj"
Content-Disposition: inline
In-Reply-To: <CANTFpSV7N=5U9yuXcU-D=PDpwj=kD__JU89UGL1HQOYiaL77qg@mail.gmail.com>
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


--oHvNJz1Mkf1rfBzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Linus, could you please drop commit ef76a3a28c79 from your fixes tree?
> The regression affects multiple machines including Intel CI and Nathan
> Chancellor's test systems.
>=20
> I will send a corrected version once the rewrite is complete.

Sending a revert patch seems like the better choice to me. His fixes
branch is probably in -next already?


--oHvNJz1Mkf1rfBzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmooCRMACgkQFA3kzBSg
KbaI+xAAidNB6SVhGcGwfOHSnpSKOEAvybQk277VBG7P0PcEF0cttdwI7D7IsETD
DX9cw18GsQppDW0xhQ6IF4zitAOzgLYIi3qQ8VxdnGGRFJOJP02MSwrYAgJ4Srts
nACqtagWqZn3HuqvKcIIlHkZUxC2CHQtNU2apiXa1QZRWN7pvPoV6KJJWZLsQ8O0
6FJ6Jho7Icukd+WIuVTChM3OS61q4EKrUy4aKuGl+NrDdA4+XerbPOuRVZm9yZ0V
FjbWX1yQ/dVMoYZW26tgoZcvPCn3wWq83x34ZfPD07zz2AH76o7qaRMGZqmK3Y50
8R46QLlUCeX0gWJTavefbVxj6jffv8Fsgbv0NcoSCAPblRL2JcH8lZdbz6v3KdBo
wG1SY1bIP+xWpwZlTkoXiizvl+d1zHdsUr4KBLg0t70U1or9w4BwDCMCmVrx6Oxr
CI/D1Gviv40dEmRkyBPCv+t5E8Xg/gzObAMVaUnBzJtdsk0+qUJofFBqUg3LKQrO
Qr5RfQOGrBZhS1qwBuYF0pwlJIRb1Yc0vCfJcV5roR14NmWr3vihDx0Ba37Kyddt
Sxx4Ai17oX1/RhtEPX1mUQVwNw23pArH99e5kAEEiU8n0yAeRIrG1GTTOcKZCTRE
996PE6za+z/Tl7xk2m1uK0FsQxLn4hmso0icL9TRL3OFBBWaGvA=
=b826
-----END PGP SIGNATURE-----

--oHvNJz1Mkf1rfBzj--
