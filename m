Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3203CCF07A0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 04:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9610E2A7;
	Thu, 10 Oct 2024 04:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OPc4TmS6";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250EB10E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 04:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728535136;
 bh=adfydLp+GrLJBYnZEHiwZhz3OHnz2HDLLti006J2PMI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OPc4TmS6sGfBYltlbp2Ds3FZ1IOKZrocTkoGuoWt6+hihyVLPuW/DHPwXT+ZxxcRJ
 Zd15CArJ9n2X8L9LdNXN5F/FBOqT/fWSCVbfmfRD/Cmzchr43NFXUSgE4aeTKsS11X
 vuNV8ydNYP/ZGLTVtxjRPlSW+TC8yeaJrnjD2UaY/M+DIyy8d6BVjC8C7YCg8yEDpl
 M6pRleabvIDr9kn1Cf+1koBczDbztK2+bEqd6FB3EtbuMBJCwYoUGG6CkZ7/2vDpAq
 UxCRVkNYsm2CDof2mulsAOMhehokPoSl9o1FcrOSLNXxMlxo6J7qBTe1twH8qoxdom
 QBlvZ/D+Oj4gA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPH8H0Y9Kz4wcL;
 Thu, 10 Oct 2024 15:38:54 +1100 (AEDT)
Date: Thu, 10 Oct 2024 15:38:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <20241010153855.588ec772@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
References: <20241001134423.62b12a80@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FzZfJ=e7szFsEhR2SZ/0mXT";
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

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 13:44:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the random tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
>=20
> Caused by commit
>=20
>   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/rando=
m.h>")
>=20
> interacting with commit
>=20
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
>=20
> from the drm-xe tree.
>=20
> I have applied the following merge fix patch for today.

The patch is now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Oct 2024 13:33:48 +1000
Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in
 <linux/random.h>"

interacting with commit

  5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

from the drm-xe tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe=
_bo.c
index cd811aa2b227..3e0ae40ebbd2 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -8,7 +8,7 @@
=20
 #include <linux/iosys-map.h>
 #include <linux/math64.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/swap.h>
=20
 #include <uapi/linux/sysinfo.h>


--=20
Cheers,
Stephen Rothwell

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcHWl8ACgkQAVBC80lX
0GxP+gf8C/0ob8vjxwnIqa5MHaBA2/matSb5MEnTJSbF7vlHacyMYeEdlKN9OvJs
iC5WNaRDuoaZjRqMH9X0hMw2H8l8R74jrYZJ/jc3N6CooX5FTymeT3MhMJJWei14
WOTdlMAb5JWT75SbyTo9DNVtsz3E/M5DI6fEHc8KwXW73ndbUa/QG67936yGN94/
JGnjOWqp1UhE2hj2oDdiKj4/mmYi6wCOwtdsqNs/nuQf7FxtLZgcRqRf9c7MkTwN
eR3mIDXHbQ4MFuIOcUwV4WZ2jWxs8pWU+L5W69ObaWxvLa8bE6ywZRrRNDhqZUFe
g6UQqGsHCs3ryS2BFrGmxf0viONGAA==
=P1WO
-----END PGP SIGNATURE-----

--Sig_/FzZfJ=e7szFsEhR2SZ/0mXT--
