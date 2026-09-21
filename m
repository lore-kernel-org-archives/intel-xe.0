Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2708C982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 12:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968B310E144;
	Mon, 21 Sep 2026 12:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aa8uSrnH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AD110E144
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 12:01:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D702641620;
 Mon, 21 Sep 2026 12:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED291F000FF;
 Mon, 21 Sep 2026 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789992060;
 bh=zUC55LROEiFwXMeRcXEt/SWt5WnEKav8EfqNxM6wbr4=;
 h=Date:From:To:Cc:Subject;
 b=aa8uSrnHGKtj+GcLhOSrW6T5Stp/UZySGhQVOkaFUJV6XYMph7XcHi+zxYRr3aKK1
 F9uSWhDjNH18APJNNOU6hRbjCIWlDlBiSsuWzUoFxm6VLz+uV9EtGT3ojFy2tLrpVN
 yy10zYDUbx2IAYnQq16ysa/DSP8r9x8cr/LjWLJXZfF3YoJIn217fOk/thBXTIMNwZ
 Eh6548ZuU2tJgx51VYtsL4ca5uJf8ACEphQWsqgxlGxEZIbgz9/wJ3jfZ9YiFXh9QT
 lR/m7xj9G4UHhWi4TdQKkE9fMeJ6bul0UuJe462vjbhORxS4EXOboacQGWOddj+R6V
 a9OjZR51zYitA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 00AC21AC5367; Mon, 21 Sep 2026 13:00:55 +0100 (BST)
Date: Mon, 21 Sep 2026 14:00:55 +0200
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <arEcd0vIRVds2efB@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x1TgybkvmLrQMBdl"
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


--x1TgybkvmLrQMBdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  41dae8ac5a3e1 ("drm/xe/pm: introduce PM PME support")

=66rom the drm-intel tree and commit:

  320662381ca24 ("drm/xe: Poll GT for C6 before D3")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_pci.c
index b134d90c01a1c,d66d5a0339ae3..0000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -1380,9 -1379,7 +1379,9 @@@ static int xe_pci_runtime_suspend(struc
  {
  	struct pci_dev *pdev =3D to_pci_dev(dev);
  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
 +	unsigned int flags;
 +	bool pme_enabled;
- 	int err;
+ 	int err, ret;
 =20
  	/*
  	 * We hold an additional reference to the runtime PM to keep PF in D0
@@@ -1393,26 -1390,21 +1392,37 @@@
  	xe_assert(xe, !IS_SRIOV_VF(xe));
  	xe_assert(xe, !pci_num_vf(pdev));
 =20
 +	flags =3D memalloc_noreclaim_save();
 +	pme_enabled =3D xe->pme.capable && !xe->d3cold.allowed &&
 +		      pci_enable_wake(pdev, PCI_D3hot, true) =3D=3D 0;
 +	memalloc_noreclaim_restore(flags);
 +
 +	xe_pm_update_pme_enabled(xe, pme_enabled);
 +
  	err =3D xe_pm_runtime_suspend(xe);
 -	if (err)
 +	if (err) {
 +		if (pme_enabled) {
 +			flags =3D memalloc_noreclaim_save();
 +			pci_enable_wake(pdev, PCI_D3hot, false);
 +			memalloc_noreclaim_restore(flags);
 +
 +			xe_pm_update_pme_enabled(xe, false);
 +		}
 +
  		return err;
 +	}
 =20
+ 	err =3D xe_pm_wait_all_c6(xe);
+ 	if (err) {
+ 		drm_dbg(&xe->drm, "Resuming - GT C6 check failed!");
+ 		ret =3D xe_pm_runtime_resume(xe);
+ 		if (ret) {
+ 			drm_err(&xe->drm, "Resume failed after suspend was canceled");
+ 			return ret;
+ 		}
+ 		return err;
+ 	}
+=20
  	pci_save_state(pdev);
 =20
  	if (xe->d3cold.allowed) {

--x1TgybkvmLrQMBdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxHGYACgkQJNaLcl1U
h9CkQQf/dE1YUzDS64vYqjZwLlvC9ebthcbsfyxPgiHuYQZ8yX2RusLdi8spi2Hy
7k38jzAuxfmsEk+u4WzwSLthEuJAcjsD5CCRPoA8aFSS5w6tKkOv49iT8619KZlG
Krp7l7GpmRQ1vDTWD5Kulgw+4vaEwVBHyj2TMDMjMNZRxab0+MONzG3wOm7j6hw6
dywfnjNvw+9yJbRLe0ZLPIHpRVd6hVHdeyG/G0sY8YSkdgytUYIqNSamBMhvWI6E
usRoI0/Xwdf9eIWi+snRHKXutXQnt1Jj71fGpeFH4V34w5DB4kAgtL7bYM4rQWS9
zdKH0m/OowxYj/Htgd053ndJ4e8Jog==
=tRQt
-----END PGP SIGNATURE-----

--x1TgybkvmLrQMBdl--
