Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ED0C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 14:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B321E10E04E;
	Tue, 29 Sep 2026 14:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AJkax/Mf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006210E04E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 14:56:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 35C1D600AA;
 Tue, 29 Sep 2026 14:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1771F000FF;
 Tue, 29 Sep 2026 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790693805;
 bh=YLHQOkQJ+bfGfOb0ek05tU4aGkIFHeMeGb8pp/X5qiY=;
 h=Date:From:To:Cc:Subject;
 b=AJkax/Mfebr0TLawLB4Rpr78oJCU2zaX9jJNl4ATWR//ozM3meUK3EvlBrNTcXnbT
 7z09EUcEoVCE7mBnodKyKE2o+K5wH5/KczjAanUPLTY2XtWTgGFLRgzOPKkDnwcWwU
 80UjqKf6bQX4UL429wX2f0GLmi2o9mjTKqCwa75zNE6LI5yei2D6x3zwR5lbgCSKUK
 R4tQCIDmPSq4GkLpxha3l50XltqVkq9FZWe79CyjXMwvgFinpHC9nyrgwanKtlCot+
 EUd9jgtJYiEc2Iu4Qd02TF3m735h7nG3SF0GCjpHuorsNGBGzGmBD1zIUwiNUFGsgv
 Gm69R9q8Z28kw==
Date: Tue, 29 Sep 2026 15:56:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <arvRqS8-Jivj4Rim@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EM5IYsxxoGxu3xlg"
Content-Disposition: inline
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


--EM5IYsxxoGxu3xlg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa_oob.rules

between commit:

  cc319238e3f66 ("drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms=
")

=66rom the origin tree and commits:

  d1b210c045f70 ("drm/xe/xe3p_lpg: Add support for Wa_16030224309")
  9453c528fc909 ("drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms=
")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_wa_oob.rules
index 3001155f8d09e,f35181fc4e49b..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@@ -14,6 -14,7 +14,7 @@@
  16017236439	PLATFORM(PVC)
  14019821291	MEDIA_VERSION_RANGE(1300, 2000)
  14015076503	MEDIA_VERSION(1300)
+ 22016122933	MEDIA_VERSION(1300)
  14018913170	GRAPHICS_VERSION_RANGE(1270, 1274)
  		MEDIA_VERSION(1300)
  		PLATFORM(DG2)
@@@ -74,3 -75,4 +75,4 @@@
  14027054324	GRAPHICS_VERSION(3511)
  14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sri=
ov_vf)
  		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
+ 16030224309	GRAPHICS_VERSION(3510)

--EM5IYsxxoGxu3xlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq70agACgkQJNaLcl1U
h9DKKQf+Iex0L+XMWa/tS9hDOOTcSz7mYINZa8BJBc1uwtU+hlQAFticRAGIzUt4
qxwLVLpNaSnE5eArj/CpymIY4hwPvTaM5WcekAfRWDOXyWr+wQ0tMwtX9B1yEySe
vHuvKjciYmbe6qr75KoKzi4niBlwr+RJ56PkhlOuWq0e9mv3FLfwFluv6yzNCmZ6
sG1bD5uSRiTpGF2UU3wXu0kyfZdwsYF/c3U9dZjnFcoQEijAH8M8zUv6qOAf8bAJ
PTUTo/PAPEDBtc6NpxK+Na3m7KN0QhUWXmznpVdal+jZJU35BO2nj7UM2ADo1f6i
Byu5oBkSSTq8CUYWnCF2OiYRd46Rdw==
=v9Tb
-----END PGP SIGNATURE-----

--EM5IYsxxoGxu3xlg--
