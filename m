Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE850EB48E6
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 08:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2DC10E6F8;
	Thu, 12 Feb 2026 08:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nOS+9fmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7629410E6F8;
 Thu, 12 Feb 2026 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770886368; x=1802422368;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NqbK9AJa/Wxu/mSk+QPCbSAHGW0QQJLkSOUt9xiDgLw=;
 b=nOS+9fmjV3vRr/abzkR43P49e026gLkbg+tcMhZedXnyLXGt12saPFIe
 SrC4K+p0tJOXktsiR/c42INM1TGw5LtZeBedMZ5vREta6TGAObGwC5M0o
 kuun1EPjIZTKvAFKWZpjpmoGBaDgwta9q2m594aPiFYOSJaAnDnwGnxSn
 ZtZ1rwwhwg1yUTTsTnx6YA0K4bAFhmfMljO6S2OeKZnbF7IhX3BsSglMi
 bwUz7oYEncX5Sn/alB1JrbFr9PgHLXmkDvpWw5FtoLDn64ZTmxjgMADAG
 MXud4qCbXwLLF2cJ5dKhcFCvTc7xZ+8uW6oo+TP16Fwcz5Oi70ZsEQE7u Q==;
X-CSE-ConnectionGUID: zptnMl+TRTC+9MC6fVdzGQ==
X-CSE-MsgGUID: 8Csi8IXhR9i8dVEk3wEI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72238079"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72238079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:52:47 -0800
X-CSE-ConnectionGUID: Or/IkaulSwe++x5wKKy2iA==
X-CSE-MsgGUID: wrtzGgAjRh2Jtc4ZZI7BmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211370272"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.128])
 ([10.245.245.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:52:45 -0800
Message-ID: <cce7d407e4749023271d39653cb7cef78e1a60a3.camel@linux.intel.com>
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: intel-xe@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>, 
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>,  Jason Gunthorpe	 <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Matthew Brost	 <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, 	linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date: Thu, 12 Feb 2026 09:52:43 +0100
In-Reply-To: <20260209173446.b76547c4028132f71de1b8eb@linux-foundation.org>
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
 <89cb1d4744789702cd80dba8eb40dd50bf053b4e.camel@linux.intel.com>
 <20260209173446.b76547c4028132f71de1b8eb@linux-foundation.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

On Mon, 2026-02-09 at 17:34 -0800, Andrew Morton wrote:
> On Mon, 09 Feb 2026 15:47:38 +0100 Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
>=20
> > @Alistair, any chance of an R-B for the below version?
>=20
> Yes please.
>=20
> > @Andrew, will this go through the -mm tree or alternaltively an ack
> > for
> > merging through drm-xe-fixes?
>=20
> Either works.=C2=A0 I'll grab a copy.=C2=A0 It you want to take this via =
drm
> then
> I'll drop the mm.git copy once the drm tree's version appears in
> linux-next.
>=20
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
>=20
> >=20

The drm tree's version now appears in linux-next as

a69d1ab971a624c6f112cea61536569d579c3215

Thanks,
Thomas

