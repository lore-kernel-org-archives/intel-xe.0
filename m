Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80165E6BF22
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 16:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422BB10EA0C;
	Fri, 30 Jan 2026 16:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SrgwlajY";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085F10EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 16:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 85B856001A;
 Fri, 30 Jan 2026 16:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0BBC4CEF7;
 Fri, 30 Jan 2026 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769789150;
 bh=DZ4KO2Z5a+isJNIjaIfUiwgAnYx0w+55wm3dNaxc0n8=;
 h=Date:From:To:Cc:Subject:From;
 b=SrgwlajYamNeaBOMfhqdqpxPqtYW40jy9nCq6leoeaLQ7kcAYjHNJJX8LJ7zSpCi7
 pb5ThenmRth9DFRXa/+XvqK7cEnk9im36ZOYR0E3xUoCRyYQL6lkbHxMaApWWeMU9t
 MIYjuwrKP3VHYCEvYpBLFsypiseWH0sIVjqVQCne8dGFrT2DoFzmHeFA0CmEJ0fgha
 dk2MjLDZpMEr1xGDhLiEBTNA3t6Fp20u1k1bog7rywOI7NKZ/4zfMAubEqCyqYOtFt
 2AukmiZVq4lEG58RC5QhQBOQavern7YjeCABEYrNfCHvHUrl7+MyntTYAXZtoteAwf
 U21gVJNOID+kw==
Date: Fri, 30 Jan 2026 16:05:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aXzW2mZ0Wn9PaNAG@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aWUnuYGGi8r63wGC"
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


--aWUnuYGGi8r63wGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_nvm.c

between commit:

  8a44241b0b83a ("drm/xe/nvm: Fix double-free on aux add failure")

=66rom the drm-fixes tree and commits:

  11035eab1b7d8 ("drm/xe/nvm: Manage nvm aux cleanup with devres")
  a3187c0c2bbd9 ("drm/xe/nvm: Fix double-free on aux add failure")
  7755ed58a49f4 ("drm/xe/nvm: Defer xe->nvm assignment until init succeeds")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_nvm.c
index 6f9dd519371c9,bc88804de5146..0000000000000
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@@ -133,12 -133,10 +133,10 @@@ int xe_nvm_init(struct xe_device *xe
  	if (WARN_ON(xe->nvm))
  		return -EFAULT;
 =20
- 	xe->nvm =3D kzalloc(sizeof(*nvm), GFP_KERNEL);
- 	if (!xe->nvm)
+ 	nvm =3D kzalloc(sizeof(*nvm), GFP_KERNEL);
+ 	if (!nvm)
  		return -ENOMEM;
 =20
- 	nvm =3D xe->nvm;
-=20
  	nvm->writable_override =3D xe_nvm_writable_override(xe);
  	nvm->non_posted_erase =3D xe_nvm_non_posted_erase(xe);
  	nvm->bar.parent =3D &pdev->resource[0];
@@@ -165,7 -163,6 +163,6 @@@
  	if (ret) {
  		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
  		kfree(nvm);
- 		xe->nvm =3D NULL;
  		return ret;
  	}
 =20
@@@ -173,8 -170,9 +170,9 @@@
  	if (ret) {
  		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
  		auxiliary_device_uninit(aux_dev);
- 		xe->nvm =3D NULL;
  		return ret;
  	}
+=20
+ 	xe->nvm =3D nvm;
  	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
  }

--aWUnuYGGi8r63wGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml81tkACgkQJNaLcl1U
h9B9gAf9Gz81T0ak8MX2C4I+KsQJbwSlibrrAD/mXwsiyF3spycSsdqJcxVrxry9
beQ49ppkSocN2TKIPmKaW04HARPJ/HxVfSzM1teiojNW4oao+zW6ujpQhcOJ4Yk8
iUhfovUMit0CgsUOgIicvP8C9v5WtnRzu6Vo5RUclMAksvuW19EDjT0swL5KXlTR
5L3/hlO2fyEsLWBxX8XI1a65ViJAOBPio/wXs2v6MF6l4gqQNT5be9DAd98jLO4l
jRf0e1ShS+CHjxcf8+rljDG4FwhjfJvnLI7ytNeWLqipfApWtQ0LhuCecUXz2Xho
sOLbygMvSS50ecCY/2dmz9yZXHRGtA==
=r4ld
-----END PGP SIGNATURE-----

--aWUnuYGGi8r63wGC--
