Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B0BC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 05:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5F310E0F8;
	Wed, 10 Jan 2024 05:03:57 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BA10E0F8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 05:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1704863033;
 bh=8PQdV+sCXBurfHsJgRraVqjZBsjUZXo3blKQWPD3jkE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SbOv9znOZ76Pxvok7owHDDRU65apx+cX1S2fv+Zr2uTbmzqJygaP5sRjwuAOwTI3s
 i8tvi++Fuq+P3O8nwdGkl6zlhcWf9tnqzclC3vABucVKu5XTpS697oczH4bQQnUIgd
 x31gxDJg2bjKBTRQ4DbRV8euM9DVVrrgYvJNFx93VuANlVVsu7JlRBeyIneC5R6OJ0
 33fMrurpn7+4X9eWU3HTDwifCkFnvIAVhKg28O5FS4tiAJi8QLjf+lEkIKwr4Q9u+o
 KksEOJ+3A5X/fLNzJoTHm+av7HCeGetb5cLhdOnTmiRZgHY6OJ6QoZOjL1wMErIrjR
 AOduCWQU9migA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8wgX5ynHz4wcZ;
 Wed, 10 Jan 2024 16:03:52 +1100 (AEDT)
Date: Wed, 10 Jan 2024 16:03:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [BUG] allmodconfig build error in next-20240108
Message-ID: <20240110160335.2bad7d54@oak>
In-Reply-To: <3d14049c-d44c-4b33-9933-0f96055b8a70@paulmck-laptop>
References: <45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop>
 <20240109095757.1313b2d9@canb.auug.org.au>
 <341a4955-0cdd-48d0-bfbd-cc6f6f09df37@paulmck-laptop>
 <atbx7mspjbymkzgstk4l64qz3uky3wpmx4isrfg3ixgtvebdd2@cktpe4ejfk7k>
 <20240110081155.48bb0cbd@oak>
 <d61dfe52-9567-4f62-98f5-5c1e00cb4708@paulmck-laptop>
 <20240110095822.3ba3d979@canb.auug.org.au>
 <3d14049c-d44c-4b33-9933-0f96055b8a70@paulmck-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qi2gBvZmhSjDhm_0pAGQggf";
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--Sig_/Qi2gBvZmhSjDhm_0pAGQggf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, 9 Jan 2024 19:46:27 -0800 "Paul E. McKenney" <paulmck@kernel.org> w=
rote:
>
> On Wed, Jan 10, 2024 at 09:58:22AM +1100, Stephen Rothwell wrote:
> >
> > Maybe that line "subdir-ccflags-y +=3D $(call cc-option, -Wstringop-ove=
rflow)"
> > should just be removed as the setting of that option has been moved to =
the
> > normal C flags in the top level Makefile (out of Makefile.extrawarn). =
=20
>=20
> If you meant like this, no joy.  :-(

Actually I meant the one in drivers/gpu/drm/xe/Makefile

--=20
Cheers,
Stephen Rothwell

--Sig_/Qi2gBvZmhSjDhm_0pAGQggf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWeJTcACgkQAVBC80lX
0GxmEQf/dbbKDm5FsKocV5j89ymwcJw+M6c12PRQs4dpqD7LtxyPDykHF1Ct9/Qi
Ex0YC+kaYYPytGHd/f6Hpop94MeALH8VSDruTp++pOQmef9wH799wRy+O0yHkYcY
8oDUL7WIh/EsBm4cIS4AuuHt+NFDNkGy3N44Inb+gu//w101oK4vCNfLmWgQwy3g
7aCNHsO0bQzFQa5OV/lE9o+EFF9hbzHJfhj6W2EwUkHLbbGJI7m9wX00BLLdPJ0X
j5gT1dzSrCNbLG9QLDZ3wUzvuBlUZxn5GWxSBjUe3Jm89E2nUNkRiHb32WGWfmdq
/Lb54WC7OmY8ldE/j3pmkVQTeQehLw==
=DgtH
-----END PGP SIGNATURE-----

--Sig_/Qi2gBvZmhSjDhm_0pAGQggf--
