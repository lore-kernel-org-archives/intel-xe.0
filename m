Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2139E7716B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 13:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649CA10ED13;
	Wed,  4 Dec 2024 13:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BPaRFFLC";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFEA10ED13
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 13:36:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CED87A4162F;
 Wed,  4 Dec 2024 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1F2C4CED1;
 Wed,  4 Dec 2024 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733319367;
 bh=Si3lDv3dhTLBqjaTl3xWq8GImWdI03PuIq4p38ToNT4=;
 h=Date:From:To:Cc:Subject:From;
 b=BPaRFFLC9nC0ptHCnnys6W8rcY3m47kYdMvvaviSjq7r78xRvVeCvuUaGvbi4CscQ
 8bDeZArtBOgs4pKjXCiXLOsMn4g+fVW6cuLkqHle2RGKreQXFMdsiIrZi1xpQLQxNt
 ifaPHpIQOrUKlyPDlOa/zhWjAQxWComqaG0MFEwegmXi7z9TFL2w5zJTmvH1dRumd8
 sKniHKpeOqxqAkN8x/QUNPLPZ0PP0+dknOtuOahjMbg/i6xiKBMpASbL/ygcveM+pq
 LBHnZ0I0XkSR/EXQawF7GtTywE723Qz1kHRILEeOKSOHQx1EsLk+B89YTvEskU5mbU
 WCJsMRmZhiJ2g==
Date: Wed, 4 Dec 2024 13:36:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-xe tree
Message-ID: <Z1BawrcFMsj0ByLk@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kguu343zm9FQzSso"
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


--kguu343zm9FQzSso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the drm-xe tree, today's linux-next build (x86
allmodconfig) failed like this:

In file included from /tmp/next/build/include/linux/module.h:22,
                 from /tmp/next/build/include/linux/device/driver.h:21,
                 from /tmp/next/build/include/linux/device.h:32,
                 from /tmp/next/build/include/linux/auxiliary_bus.h:11,
                 from /tmp/next/build/include/linux/intel_vsec.h:5,
                 from /tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:7:
/tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:18: error: expected ',' or ';' before 'INTEL_VSEC'
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      |                  ^~~~~~~~~~
/tmp/next/build/include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_INFO'
   26 |                 = __MODULE_INFO_PREFIX __stringify(tag) "=" info
      |                                                             ^~~~
/tmp/next/build/include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/xe/xe_vsec.c:233:1: note: in expansion of macro 'MODULE_IMPORT_NS'
  233 | MODULE_IMPORT_NS(INTEL_VSEC);
      | ^~~~~~~~~~~~~~~~

You need to merge up cdd30ebb1b9f36159d66f088b61aee264e649d7a ("module:
Convert symbol namespace to string literal") from mainline and fix up
for the changes in MODULE_IMPORT_NS.  I'll apply a fixup for now.

--kguu343zm9FQzSso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdQWsEACgkQJNaLcl1U
h9BTkAf8CXjx264yuh1pv3bz3YKkorH5JtTv1rkbHODX66qAMdQzmRwNI+ph3WtD
GbooP/pPe9jKnpNRgZVeGdQ3iee7zdQsJBEFEfmYpwA3XJSczAOZ0q0M8hk+kRKQ
NnI8LOtg5ZTFDUvk7MRlJp033aneRljhiVhbpE+EjlyqYEl1cPFGqTR5/dA3H4gX
Xw2RuY+YrQVjuixw9pSiDS4OE7k91TyOeYa+f6SNLGEaBeU6zqAhkKLu70r+cTuR
vnO1+++a5wKELKollGZATD55BYy5U+b21eTAVbp2SCuiZcd/nZdWuvi8Pf8BuKyf
Dwo2y3m026nXs/gC/Czm5tTh7nFCyQ==
=8dLq
-----END PGP SIGNATURE-----

--kguu343zm9FQzSso--
