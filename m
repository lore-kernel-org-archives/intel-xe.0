Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207D6C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 03:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDE310EDB4;
	Fri, 31 May 2024 03:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SZIjdOfC";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F352610EDB4
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 03:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1717125517;
 bh=HoknV+HtmRIe4maEIT/mUg+T3WCjYAKX1WcJIResCkI=;
 h=Date:From:To:Cc:Subject:From;
 b=SZIjdOfC52y7Veu0faQjgCHrLMm+a554Dqoz9ubJmiRbJAJwJLBOx59lFZcaoFXlM
 yZR127grNOsV+7tYCBGbvLYhCuSmP5OcXLUilOGpIxzkufC7S78ljqweN3m02rDCXZ
 eJ1R/hRmEZGHSX12ghdQZ/xpG2EdUutzmNcmWbHQB3ntput760mBv0TcE8TpgI4505
 CUpeW1/V88su1c2QqYrGWEVh1kWWXaSrjZAE2cpTlMgSBiWo9cUzAFmz+2FkWPER9Y
 W50U7fCjTBrsl8v7VSMbU/S4SWWpe1VnaNnQKkgek0mC/nB2IlkABZxrJRJM0yQ7ZG
 +ImgOgKCQnxWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr7cX4whrz4x1C;
 Fri, 31 May 2024 13:18:36 +1000 (AEST)
Date: Fri, 31 May 2024 13:18:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20240531131835.62339471@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bXRMegfrycV3ynjtQdNKckB";
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

--Sig_/bXRMegfrycV3ynjtQdNKckB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_pci.c

between commit:

  ca5d5ecbb90d ("drm/xe/bmg: Enable the display support")

from the drm-intel tree and commit:

  37ea1aee18e7 ("drm/xe: Drop undesired prefix from the platform name")

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

diff --cc drivers/gpu/drm/xe/xe_pci.c
index d6859108cc69,e84da0cbb8e9..000000000000
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@@ -341,8 -342,7 +342,8 @@@ static const struct xe_device_desc lnl_
 =20
  static const struct xe_device_desc bmg_desc __maybe_unused =3D {
  	DGFX_FEATURES,
- 	PLATFORM(XE_BATTLEMAGE),
+ 	PLATFORM(BATTLEMAGE),
 +	.has_display =3D true,
  	.require_force_probe =3D true,
  };
 =20

--Sig_/bXRMegfrycV3ynjtQdNKckB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZQYsACgkQAVBC80lX
0GzPTQf+IHecx1bRuM2FRMQ/x7SCWU0rbUfIaxxepptlCtkjqZlefXFiZZbXIjV2
/jdPOyFw6ofc9tQYsopslFO/WyyNwKGVviZHRyLpsKrO2tKEFGbf18Qxt1EXOcCT
EISBxgrBQ5MR+3O1DBpUZje2NZNmsyvuwlI5TrD+HMISP5aEZUEpeLGHmtVluKC5
4Er3mdZKUQ8wYlnHGv1Wpv91BNMUIuOnInXHbNecj2UBiADsoZIYZdmfy6ocsyO9
sMpbYcEpkY7tu/d9RRUxyGhBwDI/0PkzEda9M3AbOqxbgRkuF2fg/6wDcXkOZDQh
jo14k4blD6F43eB+JLPOhzb/moEseA==
=59lo
-----END PGP SIGNATURE-----

--Sig_/bXRMegfrycV3ynjtQdNKckB--
