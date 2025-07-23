Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481BAC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 12:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD20810E0C4;
	Wed, 23 Jul 2025 12:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/7oUOCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCC710E0C4
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753272624; x=1784808624;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kwwutwICSZVlzcYOMkQ5nj7xo9EqNCE28cU2aFTLwRs=;
 b=a/7oUOCvcdkJw3g6Zixn/vAAk5OdsvrsuH2AHLmZC+lxC6+natOJfbp2
 tc1ZPVnINaz5eS/Okt/zBRvZ+SlmrPGTvBG9Yg62z5FPgoYxj/Zw6JV6V
 W/EXtJaYhvjwfHGJOMcO8yS2OjgZv2fb0O0ZyfK+gMnjIgxcwgpyKzPaP
 dqSeGZ9c4oRYhyahW0ZB7tydZms+YROEqlpCudlXtqN4QfBJWqGxeLM8c
 psEeEcNYixi+6nBGEqxSsp9AUWW60afrZQZbAn6t+nLGUUQsakpTxU6nR
 KxORqPJSgVzqrDcfRvW61ykJ3uwtGZBSn33Xnf+t+yW66bcGSzky6HTrM g==;
X-CSE-ConnectionGUID: uL7oJkOOQrqez8i5NS8mRQ==
X-CSE-MsgGUID: kqrNDe1VSBe4YBVGM94vVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66249617"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66249617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:10:24 -0700
X-CSE-ConnectionGUID: e7SYRWGoRMCVqLesKMmXOw==
X-CSE-MsgGUID: ReZIUv2pTGuU7FPsJnK2YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159508773"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.245.128])
 ([10.245.245.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:10:24 -0700
Message-ID: <2d8a89feb294cb98107bcf55ac23dd329dacbebc.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/5] drm/pagemap: Use struct drm_pagemap_device_addr
 in mapping and copy functions
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 14:10:21 +0200
In-Reply-To: <aHnHhjpD06Wqz4W+@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-2-francois.dugast@intel.com>
 <aHnHhjpD06Wqz4W+@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-07-17 at 21:03 -0700, Matthew Brost wrote:
> On Thu, Jul 17, 2025 at 03:38:23PM +0200, Francois Dugast wrote:
> > This struct embeds more information than just the DMA address. This
> > will help
> > later to support folio orders greater than zero. At this point,
> > there is no
> > functional change as the only struct member used is addr.
> >=20
>=20
> This patch alone will break the build. You'll need to combine it with
> the next patch to avoid build breakage.
>=20
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c | 58 +++++++++++++++++-------------=
-
> > ----
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++---
> > =C2=A02 files changed, 33 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 1da55322af12..0ed66aaade14 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -202,7 +202,7 @@ static void drm_pagemap_get_devmem_page(struct
> > page *page,
> > =C2=A0/**
> > =C2=A0 * drm_pagemap_migrate_map_pages() - Map migration pages for GPU
> > SVM migration
> > =C2=A0 * @dev: The device for which the pages are being mapped
> > - * @dma_addr: Array to store DMA addresses corresponding to mapped
> > pages
> > + * @device_addr: Array to store DMA information corresponding to
> > mapped pages
> > =C2=A0 * @migrate_pfn: Array of migrate page frame numbers to map
> > =C2=A0 * @npages: Number of pages to map
> > =C2=A0 * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > @@ -215,7 +215,7 @@ static void drm_pagemap_get_devmem_page(struct
> > page *page,
> > =C2=A0 * Returns: 0 on success, -EFAULT if an error occurs during
> > mapping.
> > =C2=A0 */
> > =C2=A0static int drm_pagemap_migrate_map_pages(struct device *dev,
> > -					 dma_addr_t *dma_addr,
> > +					 struct
> > drm_pagemap_device_addr *device_addr,
>=20
> I like the change to drm_pagemap_device_addr=E2=80=94I think it fits with=
 the
> patch=E2=80=94but it's not actually a device address. It's a DMA mapping =
of
> CPU
> memory. Originally, drm_pagemap_device_addr was intended to represent
> a
> device memory address shared between devices. That said, I think it
> still works for our purpose here.
>=20
> So, I suggest we rename it:
> s/drm_pagemap_device_addr/drm_pagemap_addr
> And for the variable:
> s/device_addr/pagemap_addr

IIRC regardless of referencing system pages or device pages, both are
actually dma mappings.

So would drm_pagemap_dma_addr be a better fit? FWIW I'm OK with both.

Thanks,
Thomas

