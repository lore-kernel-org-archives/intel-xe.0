Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91978C282D1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 01:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351F10E02D;
	Fri,  7 Mar 2025 01:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tQFymny8";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1278C10E02D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 01:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741310996;
 bh=5cpQP0hzTZtWeA8C7im5cMACSxvJjY3jAmD/qE1TD94=;
 h=Date:From:To:Cc:Subject:From;
 b=tQFymny8vzXAhaB0lvfY56YP1R55MPd2x4Qa7tkXocWnEMgafn/RszcU0bgitrCFD
 9kijNNBVJCztmET7ZPJaYCV80E05/uMy+1quBGR0kYOlxDfReGR0PptEhwvjBGv/vx
 r4NduCuWGSSZlnJnz97T1qaezGx9C31rzYZymSUBreTPvtnA76a05RZLvDiAb/4qIy
 J7+kcXQDDMrgSi1yTFV2nppDHZCxjbG+fDB5g7mxb2r7b+lCMd5QOu2AIxNcE1SJPf
 gqp/cAwaVpbJgr+BfSWtzvRMZF/g2JG4TNthyi59w56GZdfyjNJzWA1otumyEp8h09
 mJuOMmuhcRLhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87xv4qyhz4wcj;
 Fri,  7 Mar 2025 12:29:55 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:29:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the mm tree
Message-ID: <20250307122954.1ab65809@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A/UwyxC=0gWjqbYU.HO=+Ty";
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

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  mm/memory.c

between commit:

  089b22f60a0f ("mm: allow compound zone device pages")

from the mm-unstable branch of the mm tree and commit:

  1afaeb8293c9 ("mm/migrate: Trylock device page in do_swap_page")

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

diff --cc mm/memory.c
index d21f6cded7e3,59b804f4bf3f..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -4473,11 -4348,15 +4473,16 @@@ vm_fault_t do_swap_page(struct vm_faul
  			 * Get a page reference while we know the page can't be
  			 * freed.
  			 */
- 			get_page(vmf->page);
- 			pte_unmap_unlock(vmf->pte, vmf->ptl);
- 			pgmap =3D page_pgmap(vmf->page);
- 			ret =3D pgmap->ops->migrate_to_ram(vmf);
- 			put_page(vmf->page);
+ 			if (trylock_page(vmf->page)) {
+ 				get_page(vmf->page);
+ 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 -				ret =3D vmf->page->pgmap->ops->migrate_to_ram(vmf);
++				pgmap =3D page_pgmap(vmf->page);
++				ret =3D pgmap->ops->migrate_to_ram(vmf);
+ 				unlock_page(vmf->page);
+ 				put_page(vmf->page);
+ 			} else {
+ 				pte_unmap_unlock(vmf->pte, vmf->ptl);
+ 			}
  		} else if (is_hwpoison_entry(entry)) {
  			ret =3D VM_FAULT_HWPOISON;
  		} else if (is_pte_marker_entry(entry)) {

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKTBMACgkQAVBC80lX
0GwClgf/Q9BEVvi4igkfRfnzd88WJnP0/H1ZUBjUBg1JbqnhBVkVq7jC0M2uSkH1
pqBP0dIZCLLz15is+6hsCvXnY9eHfwfz4J+zR8/UbIi4M2H4heU7VbePjXya7dnX
gGdSkib3/aII3f7Q+ApSvhYthtaVCX6sVgM3uz9qXSXlIkNI4XHUCFAGYXWHmPFV
342UUykdLzbXIlT3KPqNpU9ug66ZlF1utnRJDJhN9trCNdX706DsVKBm9tujGPaR
cD+G/3lRZd1NwIfHye+kc1rmamZtw2kdz38BbP4oAcWnVZ6gU9ijwygvb8ZERx8L
OF230OP5BYu2rsQPIQ26zj2kGvRqlw==
=0lSR
-----END PGP SIGNATURE-----

--Sig_/A/UwyxC=0gWjqbYU.HO=+Ty--
