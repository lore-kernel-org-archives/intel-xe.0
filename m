Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C1C5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFFB10E816;
	Mon, 10 Aug 2026 12:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kfz33SqO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DBB10E809
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 12:21:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 53EFC402B7;
 Mon, 10 Aug 2026 12:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF7C1F000E9;
 Mon, 10 Aug 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786364490;
 bh=IxI/vt2/f/d3YphvP4EGKxd1bbv8IgLn9lJqpFOfxpo=;
 h=Date:From:To:Cc:Subject;
 b=kfz33SqOrd14HbpuO32yTGa573tadl4oKRqbcQ+Xdgh24RAZOnVFeZ4Oc/G01YGUb
 c9a9lD1Qj/dmbYn2Y/eSNjFNQK2l964KG75ssYqbAeiin1k5Zpn0EviQW+SCxQG0yH
 icxNG9XZK9r4zGLX80JKbnVzIWDqxXxU/8lyawYJ3A5Y0u1GTdurvtR9ojPIeBk3OV
 eSvSf/r0PV6H+uxHBJfzL+6FiSGG7So+iMSVUVRJK+4x9/KioD7F48d0l0rlQc81iO
 3nR39eE+rqOBSaS7Md4M4f6K4OguC4DuhUAg5V7ZRP8U8CX/LPkbly/j8F6UOU3ozv
 lyEItUvEJLLoA==
Date: Mon, 10 Aug 2026 13:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm-xe tree
Message-ID: <annCRqegoQ9PBClJ@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lU089JkQTfLxtWQT"
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


--lU089JkQTfLxtWQT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--lU089JkQTfLxtWQT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp5wkUACgkQJNaLcl1U
h9C2MQf/eVfCccz2uaGeuQ4KeJkF2L2CP7dkkd8xKWF0oLevELx0TCWmdd0CZJwa
pEDZXLi614ubFk0L6KJshfJXqYPBLpSBNgAiHntjiCsaF8T8f6j2PNo4Pa5DabRy
JeHQtusr/3SkruAFYKaDeCw5wJzc6erXnLDPE42hOoURCWRW/JEi6qWvThV2LVaJ
pY/bOBzdub/de/hxL29X3HsJ4vrEkWYGiJL9ZojzlVLKZgWYMc4q0z9CmZ7DKtmB
MPcNVHSEH1RGhJdNjRUIKcCf0qP+LXSdQ/Ga43l+uzEYmnKsOMMBuluWnXCESUkN
CtqUb04Jbnm+aMnIeGCH6adeBSr8ZQ==
=qa5E
-----END PGP SIGNATURE-----

--lU089JkQTfLxtWQT--
