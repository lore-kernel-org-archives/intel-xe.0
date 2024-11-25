Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC56D3B7CB
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 01:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1C110E06C;
	Mon, 25 Nov 2024 01:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NbQBNF29";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D554310E06C
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 01:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1732496961;
 bh=NPFuZFCQNR5Yu8G5vMI1GfSK3jYB5bbGOIq1W9kVn5g=;
 h=Date:From:To:Cc:Subject:From;
 b=NbQBNF29Uba8no9mBtJ+Wc0Wgbl3WeuldOP/xHU6ibA4QAdkI+sNtfM9iG3yO2KpO
 rLexf67fC8h5ApDEiax8Jt4kqchMBrYBLr5oEctti5GRy8moQ4imLxQk2t4SUBPcTb
 BPdonLMvwJc4CwVu7ec/dB0VXLyvCiTfEdxSOfYaJ+JhZVdw1Ppe74JA8TqyBy7ueF
 /h0RPOG3Nxjw7DQa7nE20XET9dNG5tFT00mBUclJ5OrJOO92xh3ClghKajmrKwE+bV
 dkEmERGmd4F3PrYaK8ahMyDeaIcb/yHgdZ45jYdDrd7J8ZNJ2VD4gnSuPSeBLj6neB
 rIxEgoTL3aoMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxSKD2Jjkz4xcr;
 Mon, 25 Nov 2024 12:09:20 +1100 (AEDT)
Date: Mon, 25 Nov 2024 12:09:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matt Atwood <matthew.s.atwood@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with Linus' tree
Message-ID: <20241125120921.1bbc1930@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TRQk6h/duJpsAjl_b/MgMX=";
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

--Sig_/TRQk6h/duJpsAjl_b/MgMX=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  include/drm/intel/xe_pciids.h

between commit:

  493454445c95 ("drm/xe: switch to common PCI ID macros")

from Linus' tree and commit:

  ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")

from the drm-xe tree.

I fixed it up (I deleted the file and added the following merge fix patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Nov 2024 12:05:38 +1100
Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"

interacting with "drm/xe: switch to common PCI ID macros" from Linus'
tree.
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 32480b5563db..7883384acd5e 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
=20
 #endif /* __PCIIDS_H__ */
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/TRQk6h/duJpsAjl_b/MgMX=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdDzkEACgkQAVBC80lX
0GzECgf/YC2AiNdRic9ux2wvMJJ0CemZuFLuK4Jj/J+4zj0Ps/EzgjHiLrA2HqQ7
kW+qK7baw9lusW2LXKKYi/nx4W+83umMJrwlnwYNdTAxAIsawoYO9UCYy/7Sd5mi
I0Hi0U6g6FUss6vfItrjocpQIiBjoKifkNNHvVZhXSDfIz5nneQ8Ykq6FrcZ1Mlz
JDe5GvT07Mcb8MNXqnwpUDV4rIVf/7btkkXJk+j3yo8ad9as8KHNalNA2ezp+EiP
pYm3SYJ3i8k9lNmIKy7CEhFzk2eLw7UUTkAK3d+V9xqi/yT7+Ei1lKfB39ZBtcsS
doxGBTR2wAzC3GqBZl5hy//xiDTHNQ==
=vlyl
-----END PGP SIGNATURE-----

--Sig_/TRQk6h/duJpsAjl_b/MgMX=--
