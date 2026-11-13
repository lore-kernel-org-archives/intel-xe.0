Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60F606A891
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvnvnjKn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF80910E128;
	Fri, 13 Nov 2026 17:13:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93510E128
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 17:12:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 51C4D408D9;
 Fri, 13 Nov 2026 17:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369241F000C4;
 Fri, 13 Nov 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794589976;
 bh=cb9M2Q4puehnT0jF/YTjl8jyEFpR9I7Jkjnuxmfpmfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=lvnvnjKnYWI0PaH8fuArdpN4SITWdyLqsEI3kq5NEXD7o0QNn5WlI+UB99gN5RlHF
 sVSDpPNdseyVrRNRqHmbjCVoEN31XZOdIHJoq4wLHtDQwU6frBBZfScLN6YF6I2OXI
 4OXHrsagOOCyRcjiwpBkyWp5qug8aP9bV2783DtePt1Hq2qywYG3Lg3bb2zDcFRUHS
 Nq6ftt3XW6MpjR7xVNSw4oXXz1fRrDT5oN2kyq5WeePn8K9Ucom3O9oFE5831hP1TC
 q20oiRi54QVbWf5SguJ+d+wdldcntfdkDovg2B9iE+Vrq+oHvEB7jYOAeATzXiOxHt
 ID+Bzx5r2hl0w==
Date: Fri, 13 Nov 2026 17:12:52 +0000
From: Mark Brown <broonie@kernel.org>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLlBhdGNoX2FwcGxpZWQ6?=
 =?utf-8?Q?_failure_for_linux-next?= =?utf-8?Q?=3A?= manual merge of the
 drm-xe tree with the drm-fixes tree
Message-ID: <10b9f036-2bfb-410e-a63d-feb2e76bb572@sirena.org.uk>
References: <avc376Z6nj4HlOnJ@sirena.org.uk>
 <179458978035.21808.18177672178442576596@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hY6z+GLUEWIXp/HH"
Content-Disposition: inline
In-Reply-To: <179458978035.21808.18177672178442576596@9ac1b63fe3ea>
X-Cookie: Flee at once, all is discovered.
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--hY6z+GLUEWIXp/HH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:09:40PM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: linux-next: manual merge of the drm-xe tree with the drm-fixes tr=
ee
> URL   : https://patchwork.freedesktop.org/series/178515/
> State : failure

This isn't a patch submission...

--hY6z+GLUEWIXp/HH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr3RRMACgkQJNaLcl1U
h9Clogf9EZkdNIZsRY8aLT2Vy23pACSy6m26prqRhAYan3xFDfjVGX0o1Iwn4U2O
b41D5nPVPqUOM4g7Tj4Fsfnn+EMrmMrtpMpHEqDbPqVagxCPRR6KPDEtefGrxdQG
5EE/ccx9hXMErMkVYEthddd//YEWX4Gu5VlJbtVXEeAfdvnY5baBcU/pQM5ne/0e
r5IsQKqyihYVV7AJ46Du5BEmziAl7aItstAvEW4UM4FF9ePolRVX/TEsk+Zi2HUw
0kZ0c2zIu9VFTTnUM1EAaxkwWMzFHdNis+aUXwygL1mpYyP1lulHI5iaI4TF+3M/
Iwo2lvhnMKXeEQ0g3TYmrK23Ck1Xzw==
=D71x
-----END PGP SIGNATURE-----

--hY6z+GLUEWIXp/HH--
