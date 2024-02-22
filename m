Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A3C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 08:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C29410E8AC;
	Thu, 22 Feb 2024 08:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MB0VwYSq";
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C98410E8A2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708589090;
 bh=l0ui1hCzbYxwD4mbLRoZEH5+k2eehAg7p8zFKJxdMTU=;
 h=Date:From:To:Cc:Subject:From;
 b=MB0VwYSqerz/KhIXXUlj0MfYnRPdh2LUWwzPSC1Ngpqcu45b5wITWO5PtZWJkjaX3
 ug5VzGKjTG0TBkCn+/5bYMnwbedtKAi9Hf27QJ88u0RWYo3j5BI+8wK+yZIlXB0FrO
 Zkm/ajhk6Wv4V/QUHd9jIe5+288+KtnKOdt80ixK73IFsNcRvGYC/lwZX7DHN0uyOb
 yWFL6Oa5TDdmu/60CT9q7LNJDd6NZVXoKD8eILxdcFL9n46FD97A5ScjGavkUcv7/y
 hOfxGSL36qkYie/ZLSD99jfcGdJFQKEd6fR2iTyrx+KojYhQsgDbzkyWCoPrQaLDpV
 gn23bfMIAeW1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TgQfT6ZH6z4wcq;
 Thu, 22 Feb 2024 19:04:49 +1100 (AEDT)
Date: Thu, 22 Feb 2024 19:04:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Yury Norov <yury.norov@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20240222190448.26dc124d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aQVovtan3KdVGubS90.tuAQ";
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

--Sig_/aQVovtan3KdVGubS90.tuAQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (arm64 defconfig)
failed like this:

arch/arm64/kvm/hyp/nvhe/hyp-init.S: Assembler messages:
arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: found 'l', expected: ')'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:29:  Info: macro invoked from here
arch/arm64/kvm/hyp/nvhe/hyp-init.S:221:   Info: macro invoked from here
arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: non-constant expression in "=
.if" statement
arch/arm64/kvm/hyp/nvhe/hyp-init.S:557: Error: junk at end of line, first u=
nrecognized character is `l'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: found 'l', expected: ')'
arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: non-constant expression in "=
.if" statement
arch/arm64/kvm/hyp/nvhe/hyp-init.S:560: Error: junk at end of line, first u=
nrecognized character is `l'

and many, many more.

Bisected to commit

  b77cb9640f1f ("bits: introduce fixed-type genmasks")

I have reverted that commit (and the following 2) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/aQVovtan3KdVGubS90.tuAQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXXACAACgkQAVBC80lX
0Gxkagf/dpVUiLUHpKNPoRu1NrxT49fUSse97S6BtIFfbtUgDlaoiK4ejLEIR7d1
9V6Vg7fap7qQUsw8nr+fJT31GuBZR5RaumhNfs8vzXN8ZXjQqi7R8c5eRBkuofX9
3iLOUiaovEsLwUzoerc8FpFOFETUF7b4or9xqgQ48cURsgaTfb4ugRUfA0csaDlU
VUz2jCMSs7alHv7fMaegFGh8GeKOoK9+UyJySluZvmD2BtOGNrZFLp1kmsUFN10W
ZVU2CHa4Rg2gULeM/hKM7Xzi0rpaDAPtQnPURvzjMl+xp3dst+JiTwb9rAbbSbep
GKZoXH0QO3vTIsmmcv9x6zD5VN5IBA==
=JfaI
-----END PGP SIGNATURE-----

--Sig_/aQVovtan3KdVGubS90.tuAQ--
