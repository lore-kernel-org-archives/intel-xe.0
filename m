Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C863FC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 03:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF710E180;
	Tue,  3 Jun 2025 03:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GJ13BEZb";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EE210E180
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1748922136;
 bh=KazgSLJgItPEUv418hcWutQjus3/BB+swqmSr6pE6Rk=;
 h=Date:From:To:Cc:Subject:From;
 b=GJ13BEZbcAnlEndoEZ51WEGIVXaqgajNo3S0RLfgi5FKShkmpWMfk7vX4PT7Q/I9B
 aokJ1jGlY4hc+jTEQl67gMwFf6fMjbUQjFpCl7IIosLiiCkuiH174LVzTempY8AEq2
 ZXFlxMXysbvKDmy/qbuQldyly+7zaR8OzAWX0GCwA/JEaMlywi96uXRkf5IlCC3ulK
 ujTf1Ci26vMxqael00eKDqyE3VKOT3PMXoluyODnhc/X/jYv3ZxsmSerhFy9O83U49
 FAtRDs70Yw+f+rcA9AKNgMPGWjZA2xP0VyxGUIWCLpeYf+64fkDHqbXxlREfvlW5I9
 Darr1iHw6g6Bw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBGjy66Rtz4x8S;
 Tue,  3 Jun 2025 13:42:14 +1000 (AEST)
Date: Tue, 3 Jun 2025 13:42:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the pci tree
Message-ID: <20250603134213.0a7baf0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5QudSraWDF4SD2Sa898V/6t";
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

--Sig_/5QudSraWDF4SD2Sa898V/6t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/Kconfig

between commit:

  8fe743b5eba0 ("PCI: Add CONFIG_MMU dependency")

from the pci tree and commit:

  e4931f8be347 ("drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/Kconfig
index 2169bc969ea1,98b46c534278..000000000000
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@@ -1,7 -1,9 +1,9 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_XE
  	tristate "Intel Xe Graphics"
 -	depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
 +	depends on DRM && PCI && (m || (y && KUNIT=3Dy))
+ 	depends on INTEL_VSEC || !INTEL_VSEC
+ 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
  	select INTERVAL_TREE
  	# we need shmfs for the swappable backing store, and in particular
  	# the shmem_readpage() which depends upon tmpfs

--Sig_/5QudSraWDF4SD2Sa898V/6t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+bxUACgkQAVBC80lX
0GzDCQf/eZW9Vpa0QXpju6qrfQrSfNEJh8JJQEtGKdcNeHmV/8y6wBdYyKVKEEAd
N7ZqR88SNt+UEUYsrYs7sxTqih8YCXSjkV9K9RX/iuI/+nJNRR780U5b9uOWMbjn
t9iZX41JpK3tHRRemD9H+BJfcN8md0mr+VAkfobK6izJnWOMamZazZWmbcxUyIVz
h/XGc/gDH4IWzqyiNSUt4z646qTQgApkUK1szxMA4mD3DAYcenK1ozj7peS1EHbA
fPSzgD4WQtn6lrQ1rOQ3AU67o+/2Jgqh9h8qT82ZvX/PqY/Qt6Lv4N56W/Kzb4Mk
HpMTSXRFCJsSI6bDFgfla+I8H1scHw==
=MfM+
-----END PGP SIGNATURE-----

--Sig_/5QudSraWDF4SD2Sa898V/6t--
