Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D420CA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 22:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E6F10E28E;
	Mon,  8 Sep 2025 22:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sccjw1ZZ";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBDB10E29E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1757370781;
 bh=j0CjhsWMQ8bILkY81kFCeQtJHCh+PKx6p+HnmsFuj8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sccjw1ZZxKrM+PrUHNokR4nHFXslIYa5lL4M2f61kS1OmXDjH6pUXvHi+hqflbAox
 frhKMGbw7WzffOzbu1gvuUVzQnuvohSPC33IZ5PHk9PPbd+epBn86RlQwHqHDf6jH+
 5NwbaXlfMJ7CEUTgaACSHpissrGnOXXdXiBFo79DYrKYPPcJZpsFDQWLTq921P/1To
 KMuytcY8jbisytq9nrZ0q4cgUHGk9EfEQmgn2X4he5ZVVutlwH7TTeqbIZ1h35CJce
 56+iX85NNp24v9UaEXvYayvNpcg4jU8lJhhNt2UxmzNejVR1V/5eXnV7GUZ5ECH6lk
 CSUPfcvuRv/AA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cLMCx1WfYz4w9W;
 Tue,  9 Sep 2025 08:33:00 +1000 (AEST)
Date: Tue, 9 Sep 2025 08:33:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, David Gow <davidgow@google.com>, "Marie
 Zhussupova" <marievic@google.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kunit-next tree with the drm-xe
 tree
Message-ID: <20250909083300.23c7f85a@canb.auug.org.au>
In-Reply-To: <deyhm73xdrnlau54pycgquovbdr2pcqzeumdegavukzly6d6hf@xtgrsovs6i73>
References: <20250908172938.68a86c52@canb.auug.org.au>
 <deyhm73xdrnlau54pycgquovbdr2pcqzeumdegavukzly6d6hf@xtgrsovs6i73>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fCzIml7uGaiMiE9g1lgiliu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/fCzIml7uGaiMiE9g1lgiliu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Mon, 8 Sep 2025 08:26:37 -0500 Lucas De Marchi <lucas.demarchi@intel.com=
> wrote:
>
> >diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/test=
s/xe_pci.c
> >index e29ec1ce7231..c789bfb8af96 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_pci.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> >@@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_de=
sc);
> >
> > /**
> >  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data param=
eters
> >+ * @test: a test pointer =20
>=20
> to make this the same as other functions in
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c, I'd document this as:
>=20
> @test: the &kunit where this fake &xe_device will be used

Thanks, I have done that.

--=20
Cheers,
Stephen Rothwell

--Sig_/fCzIml7uGaiMiE9g1lgiliu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi/WZwACgkQAVBC80lX
0Gw2Qgf9G5DfQ35QsjsrOwOWWGW//o4zjRNSN+zjMn379K3cGph1cZupBVcdhvar
Vy+Dz74c9oUgMDprC2RWKh7Sv4eu4ZhgjitR9etA4OlSJ+aOewrWY0duznWhEG2R
y2OwEAFWaT5L39XV83BcuNEBc1EOC4Dr6zVWu77yxCcG7ip6go6/3Lq27VU4UybR
QnHKDB06zz1sCV2K/gmeRVwOYvCXrdUFkGOKuSp6e+k1GNachf8YEKHGM4ZWC61S
syeYlIBxyXH/01WjgF83LrTUh1/lcHKi8EPDqAMg/5YjHpa83xSVTb7IezzcaBEV
JOIqwSUDnVhFgo/Ae3pmyJN8I1ZgVw==
=mZLu
-----END PGP SIGNATURE-----

--Sig_/fCzIml7uGaiMiE9g1lgiliu--
