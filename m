Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CC9CD6E74
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 17:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DA311A1F8;
	Thu,  4 Jun 2026 17:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSVmYSXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F53211A1F8
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780593825; x=1812129825;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l5asS8SpSkQYf+YuhGCpSbcTaEHoBBdWcBH67W6W3fo=;
 b=BSVmYSXIILDbAFX8gYGyjXNDSxHymqsOcTB7lyxIkqYKA/fxXqrwyVo/
 rdw94U2x98vvi6bmzUGCN/LKv4czsDjw/P1bToCecHmGBfhFw3dZ2XrSW
 t7ZRVtXPaCGf6BqmIo38qG2K8SgozMMeIaCSNIlUtSPLPV8tksc12LKuE
 Zy6NLcosuAjPTd/zm361/zvg2lA5sIeNQfQAqHttLu8smkX9lka6K00Un
 PjndCMo0jMpS8BjXO+z6J1hqgYjNsKswHNqa5TzQZi+6pHvVrxTHJgoDh
 zay+F6hGk50nu94775pxb6goWbCOBHVhWYK7rm7PT0FSUD/SzpVA55hlo g==;
X-CSE-ConnectionGUID: 48slVVsoQP2Ggd7M4g0Rxg==
X-CSE-MsgGUID: U3KQxcSORkKgPkZcwMCc2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81333638"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81333638"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 10:23:45 -0700
X-CSE-ConnectionGUID: YW23+NPcTWm68cvRSmpMzg==
X-CSE-MsgGUID: nRc+5WOVQ86wCWJBmU+OIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="242114187"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.65])
 ([10.245.245.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 10:23:43 -0700
Message-ID: <8c4d38f10b1941687314bc43cc4de40097b84b78.camel@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>, Gustavo Sousa	
 <gustavo.sousa@intel.com>, Violet Monti <violet.monti@intel.com>, Matt
 Roper	 <matthew.d.roper@intel.com>, Linux Kernel Mailing List	
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List	
 <linux-next@vger.kernel.org>
Date: Thu, 04 Jun 2026 19:23:40 +0200
In-Reply-To: <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
 <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Thu, 2026-06-04 at 15:50 +0100, Mark Brown wrote:
> On Thu, Jun 04, 2026 at 04:43:17PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2026-06-04 at 15:35 +0100, Mark Brown wrote:
>=20
> > > /tmp/next/build/include/linux/compiler.h:200:84: note: expanded
> > > from
> > > macro '__BUILD_BUG_ON_ZERO_MSG'
> > > =C2=A0 200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> > > ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>=20
> > Funny, I see no build errors with drm-xe-next allmodconfig. What
> > compiler is being used? Any sha1 of the drm-xe-next top commit
> > you're
> > testing?
>=20
> This is after merging the tree into -next, that'd be on top of
> 09b893db4d9e68c2679e76624d420f438f8d3e98 for today (not published
> yet).
> It's possible it's some interaction with other trees (like the main
> drm
> tree) and works as a standalone thing, it wasn't obviously that from
> a
> quick investigation.=C2=A0 The toolchain is gcc from Debian stable.

So I merged drm-xe-next into next-20260603, and no build errors neither
with gcc nor clang.

AI says it's confident that the error report is from clang, based on
-fmacro-backtrace-limit suggestion and the "2 errors generated."
summary, and suggests this might be an older clang version limitation?

Thanks,
Thomas

