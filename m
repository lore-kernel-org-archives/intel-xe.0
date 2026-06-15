Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEB5CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 14:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9B510E4C4;
	Mon, 15 Jun 2026 14:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fmQ9Jdrz";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D05610E4C4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 14:43:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 69874601E6;
 Mon, 15 Jun 2026 14:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3086A1F000E9;
 Mon, 15 Jun 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781534597;
 bh=WclIJvh9iTirHZ8t23WM5Nv6hBwBi0dnPBTiiUu1pLQ=;
 h=Date:From:To:Cc:Subject;
 b=fmQ9JdrzubBNb9QJtRCFIgG9ZNcaL73CwNBp328V8A/0WtAb1eI1vX1t33DC6QktV
 FzNPFXxdjJws4zAHWILVSNLJIGVTRXP6szc9cR2mZe+nYQZV3ti+yxfHwbaBN6qyXx
 NTB3Lxbp2Jkb3R3cR+6Hvwd9O9u3qNvE0ConDzgBBMkR8e9Kc3NCFeqIArqwOqps5K
 AespnTGZP4LsDY98dQE9cOTsHyulC7V9BJJepwtKckV1OOe57eteJPxTYG4qBvpxVX
 fzR4bkXEeFa3RXhfg4l5RhC3D0geoqs6OyY+0vuzVwp9P0e+uRf1sCmAlOxNmj6uzM
 9JL7xQYfFR6vQ==
Date: Mon, 15 Jun 2026 15:43:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm-xe tree
Message-ID: <ajAPgZMuxirYEfVk@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QYMHYfZ3srgNDvBG"
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


--QYMHYfZ3srgNDvBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b1107d085e7e8 (drm/xe: fix job timeout recovery for unstarted jobs and kernel queues)

--QYMHYfZ3srgNDvBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowD4EACgkQJNaLcl1U
h9BhTgf/ZslQC4JQ7eFwGIpOOMvdnPk5iYbCaM9QiVfKIR3vA2JtLw2JgVU3/0d6
IkqJzs1O9talU4THPaMQcDHZ94BhaIqDsIbQyfkQxxXqBWOiyC7RB2kjJ3zdzb5a
0YXHVTxx7GFk4z/I8C/CNHpb+2j0HA7irfHbHC+bDoTawg6jMo2Z3umPSK5BRSKr
5UGM+vOHA6oaNvXVQ5DDWLbGuf4nBVKpAabsCgZLMx+FgpJNLwzF++oPntjk4bV6
ApVga8SEVlZVzXZGfJgqlybLKusIhF8DmASyTS6e6cB1PwEgbJH1uti/9dBr/07B
wJu3t9n0giw7at1J2Z/3cRwpQPjo0w==
=/T4V
-----END PGP SIGNATURE-----

--QYMHYfZ3srgNDvBG--
