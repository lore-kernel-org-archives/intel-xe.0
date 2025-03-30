Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1801C28B20
	for <intel-xe@archiver.kernel.org>; Sun, 30 Mar 2025 23:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A013310E291;
	Sun, 30 Mar 2025 23:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="glndaPKs";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E1A10E291
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Mar 2025 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1743377172;
 bh=dzWqQDMsVbKcM6Kea1OPZ2gEKOfMd1pt8Yvj0Yve6hw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=glndaPKs2auJ8IM1hTYZSOFrjPau6+OUaCA+IY1YUKuF6hpLc50KDqzeaklUkVDDf
 E9k4JICtRJMxsQOmJLKKAbddvlDkJi6D4l7IC2BxubBXHUSys8pc0lDHDrCyRsyXac
 46nd85M2j2bWm6sJiMQJ5QeY6IWpynUPvM1v2nJPkjZDt3heOA72r+nFxfq+wGCVfc
 a0HB47BanX6Rw0z/lSIHmbkinErT+2+VfxRTo1/cTJgFKD5Lr5hZCqoMF3Z6+7lDmT
 eTrwRSv7YA7xlo/FEkr5/oDI/7zTUgLEeL+Hn0EjhWbYcuFjD+P4d/iyrOV/KtPWtN
 KXLcS82oxUIkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQr433yHdz4wnp;
 Mon, 31 Mar 2025 10:26:11 +1100 (AEDT)
Date: Mon, 31 Mar 2025 10:26:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250331102610.24f7cba4@canb.auug.org.au>
In-Reply-To: <20250307122954.1ab65809@canb.auug.org.au>
References: <20250307122954.1ab65809@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uEU_ZKYLPjEx++eyFKHewdg";
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

--Sig_/uEU_ZKYLPjEx++eyFKHewdg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 12:29:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drm-xe tree got a conflict in:
>=20
>   mm/memory.c
>=20
> between commit:
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")
>=20
> from the drm-xe tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc mm/memory.c
> index d21f6cded7e3,59b804f4bf3f..000000000000
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@@ -4473,11 -4348,15 +4473,16 @@@ vm_fault_t do_swap_page(struct vm_faul
>   			 * Get a page reference while we know the page can't be
>   			 * freed.
>   			 */
> - 			get_page(vmf->page);
> - 			pte_unmap_unlock(vmf->pte, vmf->ptl);
> - 			pgmap =3D page_pgmap(vmf->page);
> - 			ret =3D pgmap->ops->migrate_to_ram(vmf);
> - 			put_page(vmf->page);
> + 			if (trylock_page(vmf->page)) {
> + 				get_page(vmf->page);
> + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
>  -				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
> ++				pgmap =3D page_pgmap(vmf->page);
> ++				ret =3D pgmap->ops->migrate_to_ram(vmf);
> + 				unlock_page(vmf->page);
> + 				put_page(vmf->page);
> + 			} else {
> + 				pte_unmap_unlock(vmf->pte, vmf->ptl);
> + 			}
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret =3D VM_FAULT_HWPOISON;
>   		} else if (is_pte_marker_entry(entry)) {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uEU_ZKYLPjEx++eyFKHewdg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp0xIACgkQAVBC80lX
0GwBiAgAizDOKF19YZ2wzZJSfu00GpNC4vZW3qwfRrUwP9TZXcQggKitsovxTC7E
So0aEKLi2AajtpQAS8YO/7hda+LS5VHUgg6QOT16tDYF61wBORPXLKeevFUDtNBY
ALBvZRykGnIoQmEYTBy3CEztdF4Jjo2fItQamNMpN+5tsQpOs2Lx5RNkvqLdyxaM
H+dDx1L258+IISW4Ze57nv8xivqefwjSvxcgRoqz/vBZsOJv/Q9XdPPEg9EgUTn0
pgAocApjnQV+R8cK0GpcgGH8iL8Zrpx4/cryqubIDAKp54Kn3GhlvAtvJsX+6SFc
V0qncwrocpZwhOfE6C+Q6D/HPyqTyw==
=aNkb
-----END PGP SIGNATURE-----

--Sig_/uEU_ZKYLPjEx++eyFKHewdg--
