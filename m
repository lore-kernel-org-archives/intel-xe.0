Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF80CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B441910E04F;
	Wed,  8 Oct 2025 11:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OHNE8HQf";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026710E04F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:20:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EB7B04079A;
 Wed,  8 Oct 2025 11:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E2FC4CEF4;
 Wed,  8 Oct 2025 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759922421;
 bh=hPx7sPs78NXun8fEb27e++A5aDytEW/pauq+ggnhFdQ=;
 h=Date:From:To:Cc:Subject:From;
 b=OHNE8HQf/gFEugdITm552DkmPw6SDKlbu/SntHYtZqBUtZyZcTpEbZydiRW3cHQIP
 xFTzvmMuhwvrP3wajfmPUkkbMW3OcB7gElHuxOa6JL/trsig2a0NA+MzWmxVBES7RQ
 6ustjeVTkqkgUYpop7dQV79lLP0kiRbQTeubWp162uhsr59hkAgrBS6SvO92A7J1y5
 olNgrCwoYOaUkfbebpAdHCmqo0KLkUcQZPjPoXRVRC2imMRnJtgZNvhTOa6+0ffjEY
 5CUKTWyiBf5JkOMiCN/TeWLA1xQMS4DFabESsmq2kUWweHPteogGYT69oVMe5IYT1I
 aKGcbVYia52SQ==
Date: Wed, 8 Oct 2025 12:20:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm tree
Message-ID: <aOZI8fDHGbBaINxj@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L1fBzW+LfWEgLvKC"
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


--L1fBzW+LfWEgLvKC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_configfs.c

between commit:

  59b7ed0ba2e0f ("drm/xe/configfs: Improve doc for ctx_restore* attributes")

=66rom the drm tree and commits:

  47ca7acff4011 ("drm/xe/configfs: Improve doc for ctx_restore* attributes")
  c09a9933af08c ("drm/xe/pf: Add max_vfs configfs attribute to control PF m=
ode")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_configfs.c
index 1396634231857,464a79c2a9036..0000000000000
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c

--L1fBzW+LfWEgLvKC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjmSPAACgkQJNaLcl1U
h9AbrQf/TdDKMaK2X9bqkY0zjcglSOWKRNxLFHNJeLr1KGuPwCGtrQVfg6YdMVwc
8fJt0rpuykY01eIKzYsMDCTOHJeinUkz6SszxNU/QzR+daf8LqnDILl/qdRrxb4G
/Bk5EvpI4roAPsAq9uUAlUIW6QOKUiEggQpXT3KLSG7c2a+XzJQYsxEECXCMdzfX
683iWuG+F0BquA1Yad/LPNe4QmFN4tXkX3/R2JHWusOhAC+IgaCY+HYrIJeSo3uk
1hUcLxVM4YOzOkXxi1tcm27S+09wmqClSzO5roRs6Dy5e+rR4j+oe1b8aWNUiR6f
BAH2eE1iQnR19a2DMJlL+bdKMf9UGw==
=oPq3
-----END PGP SIGNATURE-----

--L1fBzW+LfWEgLvKC--
