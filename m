Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6CDC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 22:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD6E10E2CB;
	Mon,  8 Jan 2024 22:58:04 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195BA10E350
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 22:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1704754678;
 bh=Et58EhwEA0tDd3zujt9GnM9dv5dsfHb9ovqlvrRfljs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=usFMCTdiVgqzfZTfu+P2BBjNYwj3OuTta4njS8C0pP9LFoQSAg+xX6rgJcxyp2Yle
 s/althnhCW++T7sAk5qG1YLbtTb9K4miFGNBQXmSFr1X4Q+BHVV3u6JFUS89O/yZ4w
 OeinwccBtUXlFaDl2h4AdRbmyk4Eu96+24qR7RWDACRWR7Q5Ll+fT+acvgfbARGBBF
 yS5MquaOttUx4MMO0Lf6ehveZL9LII0nVBbz+mWPbXBeommL1ULkxuN4NulCjEy5UW
 GuKCqjhU67D1Wm0LrkP6E206SL++A0onxEMaWmEPzMFy+5TXO1FHmZIaAIprLvTQXh
 JULkV24aFJr4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T88bp2xqYz4wbr;
 Tue,  9 Jan 2024 09:57:58 +1100 (AEDT)
Date: Tue, 9 Jan 2024 09:57:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [BUG] allmodconfig build error in next-20240108
Message-ID: <20240109095757.1313b2d9@canb.auug.org.au>
In-Reply-To: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ADUhnR/f0fUP1Nsqi8QDnxE";
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
Cc: lucas.dimarchi@intel.com, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--Sig_/ADUhnR/f0fUP1Nsqi8QDnxE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 8 Jan 2024 13:33:36 -0800 "Paul E. McKenney" <paulmck@kernel.org> w=
rote:
>
> Recent -next trees get the following build error for allmodconfig builds:
>=20
> ------------------------------------------------------------------------
>=20
> drivers/gpu/drm/xe/xe_gt_pagefault.c: In function =E2=80=98xe_guc_pagefau=
lt_handler=E2=80=99:
> ./include/linux/fortify-string.h:57:33: error: writing 16 bytes into a re=
gion of =C2=A0size 0 [-Werror=3Dstringop-overflow=3D]
> =C2=A0=C2=A0=C2=A057 | #define __underlying_memcpy =C2=A0 =C2=A0 __builti=
n_memcpy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^
> ./include/linux/fortify-string.h:644:9: note: in expansion of macro =E2=
=80=98__underlying_memcpy=E2=80=99
> =C2=A0=C2=A0644 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 __underlying_##op(p, q, __f=
ortify_size); \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~=
~~~~~~
> ./include/linux/fortify-string.h:689:26: note: in expansion of macro =E2=
=80=98__fortify_memcpy_chk=E2=80=99
> =C2=A0=C2=A0689 | #define memcpy(p, q, s)=C2=A0 __fortify_memcpy_chk(p, q=
, s, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/xe/xe_gt_pagefault.c:340:17: note: in expansion of macro =
=E2=80=98memcpy=E2=80=99
> =C2=A0=C2=A0340 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 memcpy(pf_queue->data + pf_queue->tail, msg, len * sizeof(u32));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^~~~~~
> In file included from drivers/gpu/drm/xe/xe_device_types.h:17,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from drivers/gpu/drm/xe/xe_vm_types.h:16,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from drivers/gpu/drm/xe/xe_bo.h:13,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from drivers/gpu/drm/xe/xe_gt_pagefault.c:16:
> drivers/gpu/drm/xe/xe_gt_types.h:102:25: note: at offset [1144, 265324] i=
nto destination object =E2=80=98tile=E2=80=99 of size 8
> =C2=A0=C2=A0102 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct xe_tile *tile;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|

Which architecture?  What compiler and version?  Anything special in your b=
uild
setup?  I do x86_64 allmodconfig builds all day with gcc v13.2 and I don't =
see
this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/ADUhnR/f0fUP1Nsqi8QDnxE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWcffUACgkQAVBC80lX
0GxIpQf8C+6WGqhvESkIIly6tjpCUu/1HJBcrCHnC+4k19bEzMzMINZ3E1cYSdnE
x6qj+3hXIFsiA8+0DYdJBriPX8b6CFm4I4+aS/2Ux72dMB+YlFQe98Bdm3eiCWAa
9w+T/aWevvwsFGgbhLf1whlsnEEx3KR/nZ7pwMyJpXie6NokWlSFUNt67K1odPwk
gskrA708EFZxGNveTpY73MHh5OVsoyazS5So5SP97cy/kemdasISkr7TVBGbfFju
3d8ww8F4YWfU6rAWSbejrkJCvbhJ2b2M0uzHF2ljdAeQUrc0cl7/iO0WzAzPwxgc
5vDoXAbboee5bLDZThu3ggTnV8j9DA==
=uG5V
-----END PGP SIGNATURE-----

--Sig_/ADUhnR/f0fUP1Nsqi8QDnxE--
