Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CCFEA4FBE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BF510E3FA;
	Mon, 23 Feb 2026 13:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VcUiBrIh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC08A10E3FA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 13:34:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFD3660054;
 Mon, 23 Feb 2026 13:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C36C116C6;
 Mon, 23 Feb 2026 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771853697;
 bh=G4fv3oqiIpZGsbhmrOEgxtUbmzhG1zxRuwGCElZSSoo=;
 h=Date:From:To:Cc:Subject:From;
 b=VcUiBrIhGVWcXCl0CC41RpL9wpqGHRoEGLzfC/vJR6eTOvkk7A/0g0NsZtnRprVDl
 tOJvcEgnK1gxNuNwwYnGe5JxgXX4em4NzXcEJVO99HY/pwuNiRvsHi9al0gnrapvLf
 ZoIpgPZqLoNPPZJ41a1ff4kbKmWdfaED8eD4aoDhtmQURP0OKoGWIoByNzfi8ikMii
 SffwQjIsdEj/zmS8Wqym3gVmfwtrKZedT8IoXAniS9Nuvp9z6+tCluK0qtRkh80d+Y
 paxiWD1tkQKkb5ep3zfkNT46MC8wWQdcR56M0OIE/6MIyZFqb7rFanV25S6vi7zHSU
 EosRLHueOpgpg==
Date: Mon, 23 Feb 2026 13:34:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Kees Cook <kees@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aZxXfTCmjfTd-lUL@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z73fIjOklE8xTSlG"
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


--Z73fIjOklE8xTSlG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/drm_suballoc.c

between commit:

  69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar=
 types")

=66rom the origin tree and commit:

  16843e6638b74 ("drm/sa: Split drm_suballoc_new() into SA alloc and init h=
elpers")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/drm_suballoc.c
index e44ad39e310cd,dc9bef3c0419d..0000000000000
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@@ -293,13 -293,37 +293,37 @@@ static bool drm_suballoc_next_hole(stru
  }
 =20
  /**
-  * drm_suballoc_new() - Make a suballocation.
+  * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
+  * @gfp: gfp flags used for memory allocation.
+  *
+  * Allocate memory for an uninitialized suballoc object. Intended usage is
+  * allocate memory for suballoc object outside of a reclaim tainted conte=
xt
+  * and then be initialized at a later time in a reclaim tainted context.
+  *
+  * @drm_suballoc_free() should be used to release the memory if returned
+  * suballoc object is in uninitialized state.
+  *
+  * Return: a new uninitialized suballoc object, or an ERR_PTR(-ENOMEM).
+  */
+ struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
+ {
+ 	struct drm_suballoc *sa;
+=20
 -	sa =3D kmalloc(sizeof(*sa), gfp);
++	sa =3D kmalloc_obj(*sa, gfp);
+ 	if (!sa)
+ 		return ERR_PTR(-ENOMEM);
+=20
+ 	sa->manager =3D NULL;
+=20
+ 	return sa;
+ }
+ EXPORT_SYMBOL(drm_suballoc_alloc);
+=20
+ /**
+  * drm_suballoc_insert() - Initialize a suballocation and insert a hole.
   * @sa_manager: pointer to the sa_manager
+  * @sa: The struct drm_suballoc.
   * @size: number of bytes we want to suballocate.
-  * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL but
-  *       the argument is provided for suballocations from reclaim context=
 or
-  *       where the caller wants to avoid pipelining rather than wait for
-  *       reclaim.
   * @intr: Whether to perform waits interruptible. This should typically
   *        always be true, unless the caller needs to propagate a
   *        non-interruptible context from above layers.

--Z73fIjOklE8xTSlG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcV3wACgkQJNaLcl1U
h9DeGAf8DaNc9rGM/7tR9Zl8JDunw1txc54ITcHZm6LQ/Ma8wQ5C8XbD/hfJd5JX
zOjuYxoQ+Qc6mHoGw/IaiO+IzC8Nz5aTmCoAKyXtFJK/8Xa1sU4a/2GRvaKOzbNY
sEVef19Cn57OcojZ/odQs2iEbPVkBBapDsGTdcd2gpcuSqCNnC1PaVGYbijBck9S
P4ZaWbhrOnYnQbCSwEP+UL5gd/yOND8G65LRS+jSZrrUu4CBHwSjx8SlhvkSSCz/
Y17esPYdhy764cyArk7uULilJQ2zqkQQe2lKUGkl/7GYlTeZxjN5y1AyTkVRPvjR
+0lTWnpjCpUNFic4aAuhGxjA8t+zxw==
=eo9O
-----END PGP SIGNATURE-----

--Z73fIjOklE8xTSlG--
