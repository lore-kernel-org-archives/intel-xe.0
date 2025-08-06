Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B403FC87FD1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6409A10E756;
	Wed,  6 Aug 2025 08:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drK6ZRO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5EB10E747
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754469394; x=1786005394;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kXLW/3rDyQqb6aqnAsu4EWner/3UYd7c2uw5XrooUoM=;
 b=drK6ZRO963XTdr69n5o6gaWtR6tpk/kq+LW8nGhyujjgtFhurYrb6BNe
 itzzxRhFvZMsjCsQcx40AA626DPHX0FfIidYZdQeRquRLQYxs3pi8nPjD
 FhXJ8GhTOnn9d6FMFGs+PUxiuda5OyA58NxjWBXv5EJW6p1FgJx1fBK+2
 VHXmQqel/7qKqtprZTHvE/XB9WdvY9Upafs75sf0IN61ebjKE11S8UvbZ
 KULs7FgEcthVLj/VDmv+lJ92EdO7/EPg0bfu2S0tgq3Q3FjdDQcFV4M1J
 NaadKtQsMorVj2AOJOwNQO3i2pMQHM4AYz28UOvj7cexSQyqKv4KmQt7D g==;
X-CSE-ConnectionGUID: 3FK30hO+QmOOmiMT142VBg==
X-CSE-MsgGUID: W/oSZWfhSHOk6hKY+JK3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56856990"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56856990"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:36:33 -0700
X-CSE-ConnectionGUID: gjAODJQqQNOz6Bp4ZDjq0w==
X-CSE-MsgGUID: jEJd0134SpCnaSlxZJt7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164250205"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.244.159])
 ([10.245.244.159])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:36:32 -0700
Message-ID: <116acf1fba0919d5eb954a94f43242112a11a646.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/6] drm/pagemap: Allocate folios when possible
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Wed, 06 Aug 2025 10:36:29 +0200
In-Reply-To: <20250805140028.599361-5-francois.dugast@intel.com>
References: <20250805140028.599361-1-francois.dugast@intel.com>
 <20250805140028.599361-5-francois.dugast@intel.com>
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

On Tue, 2025-08-05 at 15:59 +0200, Francois Dugast wrote:
> If the order is greater than zero, allocate a folio when populating
> the
> RAM PFNs instead of allocating individual pages one after the other.
> For
> example if 2MB folios are used instead of 4KB pages, this reduces the
> number of calls to the allocation API by 512.
>=20
> v2:
> - Use page order instead of extra argument (Matthew Brost)
> - Allocate with folio_alloc() (Matthew Brost)
> - Loop for mpages and free_pages based on order (Matthew Brost)
>=20
> v3:
> - Fix loops in drm_pagemap_migrate_populate_ram_pfn() (Matthew Brost)
>=20
> v4:
> - Use folio_trylock(), set local variable to NULL (Matthew Brost)
>=20
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/drm_pagemap.c | 54 ++++++++++++++++++++++++++------=
-
> --
> =C2=A01 file changed, 40 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_pagemap.c
> b/drivers/gpu/drm/drm_pagemap.c
> index 0312edb8d4a8..22c44807e3fe 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -460,54 +460,80 @@ static int
> drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> =C2=A0{
> =C2=A0	unsigned long i;
> =C2=A0
> -	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> -		struct page *page, *src_page;
> +	for (i =3D 0; i < npages;) {
> +		struct page *page =3D NULL, *src_page;
> +		struct folio *folio;
> +		unsigned int order =3D 0;
> =C2=A0
> =C2=A0		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +			goto next;
> =C2=A0
> =C2=A0		src_page =3D migrate_pfn_to_page(src_mpfn[i]);
> =C2=A0		if (!src_page)
> -			continue;
> +			goto next;
> =C2=A0
> =C2=A0		if (fault_page) {
> =C2=A0			if (src_page->zone_device_data !=3D
> =C2=A0			=C2=A0=C2=A0=C2=A0 fault_page->zone_device_data)
> -				continue;
> +				goto next;
> =C2=A0		}
> =C2=A0
> +		order =3D folio_order(page_folio(src_page));
> +
> +		/* TODO: Support fallback to single pages if THP
> allocation fails */
> =C2=A0		if (vas)
> -			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> addr);
> +			folio =3D vma_alloc_folio(GFP_HIGHUSER, order,
> vas, addr);
> =C2=A0		else
> -			page =3D alloc_page(GFP_HIGHUSER);
> +			folio =3D folio_alloc(GFP_HIGHUSER, order);
> =C2=A0
> -		if (!page)
> +		if (!folio)
> =C2=A0			goto free_pages;
> =C2=A0
> +		page =3D folio_page(folio, 0);
> =C2=A0		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> +
> +next:
> +		if (page)
> +			addr +=3D page_size(page);
> +		else
> +			addr +=3D PAGE_SIZE;
> +
> +		i +=3D NR_PAGES(order);
> =C2=A0	}
> =C2=A0
> -	for (i =3D 0; i < npages; ++i) {
> +	for (i =3D 0; i < npages;) {
> =C2=A0		struct page *page =3D migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order =3D 0;
> =C2=A0
> =C2=A0		if (!page)
> -			continue;
> +			goto next_lock;
> =C2=A0
> -		WARN_ON_ONCE(!trylock_page(page));
> -		++*mpages;
> +		WARN_ON_ONCE(!folio_trylock(page_folio(page)));
> +
> +		order =3D folio_order(page_folio(page));
> +		*mpages +=3D NR_PAGES(order);
> +
> +next_lock:
> +		i +=3D NR_PAGES(order);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> =C2=A0free_pages:
> -	for (i =3D 0; i < npages; ++i) {
> +	for (i =3D 0; i < npages;) {
> =C2=A0		struct page *page =3D migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order =3D 0;
> =C2=A0
> =C2=A0		if (!page)
> -			continue;
> +			goto next_put;
> =C2=A0
> =C2=A0		put_page(page);
> =C2=A0		mpfn[i] =3D 0;
> +
> +		order =3D folio_order(page_folio(page));
> +
> +next_put:
> +		i +=3D NR_PAGES(order);
> =C2=A0	}
> =C2=A0	return -ENOMEM;
> =C2=A0}

