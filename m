Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB18CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 14:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9484710FE9D;
	Wed,  3 Jun 2026 14:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n1femxNC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9E10FE9D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 14:02:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D8CD0436D7;
 Wed,  3 Jun 2026 14:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4027C1F00893;
 Wed,  3 Jun 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780495332;
 bh=NLqQEYnsOy1KTZkdSHxa76IzyFDIn4JMbrFbDWuxQ1w=;
 h=Date:From:To:Cc:Subject;
 b=n1femxNCN+p2DxVWHE1foDRO8lGad8Dr3dN8KjYQomZu0oCjZtNeXcTcvRt0hY3vv
 KdqQOHKCjaj7IO3RdEnAOwrDmRI3MtG5b+x1YpvojUakG601guB119JH/sIA6DGIvy
 wH0Pr7WJhTt4kbgUBJKTNhye5FvNzPkdwaYHjwH9j5eOQDnQ1TC3BKNemsHibVx/Tm
 DMSpyxLbAzoOH3kfQsEYHyTaYYnil/RackKnoiqC8vWEsCix8+YtUf7rKO/enij++K
 4xrUBZKj87/cRuX04n1AQsgKgxKX2DF+RoAEhA9RtKg4aGu1vmwlplLAxNSxH1TqLs
 ycqw4TJfs4aaQ==
Date: Wed, 3 Jun 2026 15:02:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Violet Monti <violet.monti@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <aiAz4DmtngY0r6Cx@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X0VTc4FdUhzyzYWn"
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


--X0VTc4FdUhzyzYWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-xe tree, today's linux-next build (x86_64
allmodconfig) failed.  Unfortunately I fat fingered things and deleted
the logs, assuming the issue remains I'll report proprely tomorrow.  I'm
fairly sure the issue was due to:

  5ff004fdc7377 (drm/xe/rtp: Add struct types for RTP tables)

with some of the fields in rtp_to_sr_cases[] haiving non-const values.
Sorry about the lack of clarity here.

I have merged the version from next-20260602 instead.

--X0VTc4FdUhzyzYWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogM98ACgkQJNaLcl1U
h9Dhjgf8Df7AekcOql2wtT1oSszq+Sjcrb6PDIy1uaIrvRt2FG0wbWiWh9gfwpXA
8MVnoc8+/Yh+PFtos9w2HQkm7MvK/pDHGuqle1g2OvwXpBfDrtKJdZsoIedpn1KP
bvMLTHkePq3kKeXOichARvn+EACMdIczLWRzRUv5xCh6hh9VcBy1I5jHwW8kscB3
sdxZqASDZWnEKZ5lmY5WaSB91wASZSB7YkDUlOJ1TojfQ79DWrKa5L5e2Cc/4BFa
8zJgwrxS+m5JHRbqN7tpG3RnQtv+QLOvQf/hScumLqZlcvtV9VR1zJr6cW5NoVzw
gf3uOtqkZTIagid0/8DEw3Z3VfFSZQ==
=t84i
-----END PGP SIGNATURE-----

--X0VTc4FdUhzyzYWn--
