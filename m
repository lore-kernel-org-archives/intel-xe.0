Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A430E7717B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 12:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EFF10F0CE;
	Fri,  6 Dec 2024 12:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c9JrqhOB";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84E110E3EC
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 12:55:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 448D15C56D6;
 Fri,  6 Dec 2024 12:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620B4C4CED1;
 Fri,  6 Dec 2024 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733489737;
 bh=xZjeMwCjMjZYYhQFWvUA2joTRkTaHDdHdVZko+sl5jg=;
 h=Date:From:To:Cc:Subject:From;
 b=c9JrqhOBMKvV1OxcpwXZe4k32YiqNK5HLXqJa8e5iAXyZlNFt+a8GdE4SFByh2qsN
 XWfPD8VMXExHnEEl7ntX906+pb6OHf1juVZ8J9UZyoAFOtMSmh0CzyIl9o4mlOuW9n
 sgbyB5B+D5dPpWuXQkI4ATtfnICW0Jhn8ueYPIO06I7uldf4e/kisIaqymo958Sk6b
 UyVegc9f7rdQgrQ0mBu1J9zUlxJK+XblQ74f2EEbrSOzu/VAnwAHWKvAtghG8Vz1Ad
 L3bT6E/IWa90doXh0CTWME2QXci0cIwgEdwEv8o50wMU+Zw/601+1+lBkZLqlOEvDv
 T3W95XHV20EAA==
Date: Fri, 6 Dec 2024 12:55:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <Z1L0RdL5kQCXzRRV@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yqb3qgop15r2D2T9"
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


--yqb3qgop15r2D2T9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_devcoredump.c

between commit:

  5dce85fecb877 ("drm/xe: Move the coredump registration to the worker thre=
ad")

=66rom the drm-fixes tree and commits:

  90f51a7f4ec10 ("drm/xe: Move the coredump registration to the worker thre=
ad")
  906c4b306e934 ("drm/xe: Add mutex locking to devcoredump")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/gpu/drm/xe/xe_devcoredump.c
index f8947e7e917ec,71636e80b71da..0000000000000
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c

--yqb3qgop15r2D2T9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS9EQACgkQJNaLcl1U
h9AtxQf+LbiieYUYlYRCYegx4yY3aH7UB8QIZ5m/w5fCA07vo8XGn+161Zl1Wrjl
Eo2UY7RIMSqvqgyY3zxuHQwskfdBDuIMAsz1mcBMigpG1T7bkBuipnY+dkbQRytb
TP98U6MmcE9YTOcC/1LR8OrvkrKcos0V0+IqEyw+06iv9xqQH8uMyThnWEYAyGjO
fQnAu5I9kV4k4ApGc11glOZQMPUZSSQPhwIINMopj1gFMWbpmZLW5UcmXZF4XZdL
J2tsslw7QBeNmzImIUOWZ6u1Pcs81PnYcBncpUzDnPiS84C2NihW8wrkollA7i0U
MOrgTztGJh3CujHocqUszp+PxEriIQ==
=AIIM
-----END PGP SIGNATURE-----

--yqb3qgop15r2D2T9--
