Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C39DC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 05:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC54C10EA53;
	Fri, 17 Jan 2025 05:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MeD2Mih1";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D496810EA53
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1737092418;
 bh=3Gcr4u6GWQB/R9NXrSCOWD4JvrXfXkzDxfhy3/8rC8M=;
 h=Date:From:To:Cc:Subject:From;
 b=MeD2Mih1RE1UZYI8PYBpPyTbV0lTH9WHzWK1t1VpB281pWVp/l3C402yvQMno0n2+
 5bSn9qk/lDZHpGN8eD8rr/amEABrvvx8WlNgRGBlksNvkfRLXsQIoTfsIu5qFtCNNW
 5NhGtEhB7nMtwCxPu27BhUmi+TL7rddJ/kD8riq0dQndPIX8SM4nZe5PXuSmhb9LMN
 l3mkofVtg31B0WhxCylunuTJvHcytlKjOCjObMjrhQwVURhebK6AdJ5gU6ld6Y1TWR
 HL3ngZctZCXb577qYzsovLHo6R0XdMnkWPihU3kxQ+NQB2uhD+g7FuBilTuOJyQx67
 9TuZvJTIwVGhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ7qP453rz4xSY;
 Fri, 17 Jan 2025 16:40:17 +1100 (AEDT)
Date: Fri, 17 Jan 2025 16:40:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-xe tree
Message-ID: <20250117164023.3fdc00b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/seh82hf=ba+2xjJ5.MYG6N4";
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

--Sig_/seh82hf=ba+2xjJ5.MYG6N4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-xe tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817: WARNING: B=
ullet list ends without a blank line; unexpected unindent.
Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835: WARNING: D=
efinition list ends without a blank line; unexpected unindent.

Introduced by commit

  75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory barrier")

--=20
Cheers,
Stephen Rothwell

--Sig_/seh82hf=ba+2xjJ5.MYG6N4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJ7UcACgkQAVBC80lX
0Gw1dQf+J98+vN7J5yPnCCWKw4T7Hbis6/KAJ9HPoupFkFQt7lL1ep7Y875zhKrN
Ic0pT8jpN4XGF4+7U94hyEce8a3l0ZSJ90PpBSV1qkENevNHw37vFSuVtyjEp6oW
p95hAqM9PB1OYXjiTyPe+fYCwFDmiIGeeQ1YQi32dCB+Ey35jY9y//C6lHOi9Zp6
2RxoI70VDAAvZ8440pLzC/4BpNCLwhxZqXysIJzZlQKRqNFkmnXgAfeaM5dDGHNb
MHZFLByPj669fW5zjcP1Kgn+NbCceFG1wxds+rahF6nk82E9ghLJ4G/Y2ArYnJyN
6JmjjPcZPPurhO6CQ0nnltGpluhrYA==
=WUP/
-----END PGP SIGNATURE-----

--Sig_/seh82hf=ba+2xjJ5.MYG6N4--
