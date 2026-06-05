Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98364CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEF311A78B;
	Fri,  5 Jun 2026 11:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cjQ536E/";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8DB11A782
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:09:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 13DEA601DD;
 Fri,  5 Jun 2026 11:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1021F00893;
 Fri,  5 Jun 2026 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780657743;
 bh=yGHqOQY5kzrb5h96V7n84BKzpzqo4H15iFYx+IE3vHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cjQ536E/8N9YRquKXOV7QSWij2AKvUejJEgY04brxY1Y7+1sFaYf1Z0Zk0Hu3VAoz
 vmw5arHWnVIg+j1xrx3wDI+J9E+zR4lb9OnK0krTUvujRgs2uqTvwh+1R8HvuRq12R
 N28IUc4dp+d/TU+i7y2SJ/kR2Eqa2JdiDzxkfFtb7zczK4ULGlb4DKDkaaM3oNa3tW
 RFobiAa5/i9zk3LB4xBBysRH71k3APtKnRgxUHkeSe5zLomoRPvVekrwd15B9tzq1n
 +QOy3QP3Gv+vg2BXQFKhhuHmoDS2RYYVVv2/kMBHp9tgdT91Cg54wR/bGwg0NPQEDw
 G7DxCxuj0d8gg==
Date: Fri, 5 Jun 2026 12:08:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Violet Monti <violet.monti@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, llvm@lists.linux.dev
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <3e15fe90-74e2-4aaa-b280-c486c8773514@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
 <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
 <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="47culnYV5tZ3h9bn"
Content-Disposition: inline
In-Reply-To: <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>
X-Cookie: Error in operator: add beer
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


--47culnYV5tZ3h9bn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 07:23:40PM +0200, Thomas Hellstr=F6m wrote:

> So I merged drm-xe-next into next-20260603, and no build errors neither
> with gcc nor clang.

> AI says it's confident that the error report is from clang, based on
> -fmacro-backtrace-limit suggestion and the "2 errors generated."
> summary, and suggests this might be an older clang version limitation?

Bah, sorry - it is actually clang, I changed it to that to avoid some
issues with Rust getting disable due to interactions with sanitisers
when building GCC.  Apologies, I should have double checked or just
remembered.  This is clang 19 from Debian stable, our current minimum
supported clang is clang 17.  CCing in the clang people.

--47culnYV5tZ3h9bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoirkoACgkQJNaLcl1U
h9Auagf7BkNAJSUv367MDlG0YYTXNEyKWQJf8Lp8rX/+R9GM5UP6z2rXbERTHJve
rWX1oXa11ep9upgnYyERxQB0blhgJp8TSYu+u8UWBA9r+fWfeNovN4tBW7AsV1Ue
c/cFxN90+8uQ5lXFT3RazHmDmIShjbJihARiertyy2U1l0WlgBManfXMXydwJjSF
RUaCkmGl3Srx/YE4UbfexvlTn4zCzPj52VB3MM6YcB5wbPeOcWw4beAD1clj5S5l
0RSH/5Xcd2jv8tGzvSeh9cAHUJoMhRnDXDcZqJtAYkApDpIvRJUOElBJyYeW5uhR
o5CPSRr+A4l3Asq49JAYfen3VnLZoQ==
=jOFx
-----END PGP SIGNATURE-----

--47culnYV5tZ3h9bn--
