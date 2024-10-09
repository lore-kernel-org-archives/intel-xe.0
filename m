Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25AACED619
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 07:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC810E668;
	Wed,  9 Oct 2024 07:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBPmIUji";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583AB10E668
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728459412; x=1759995412;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=B7uMsGYoqMewZIJoeDrYELC/8K+H8VQzZASufrWOr9w=;
 b=ZBPmIUjisF26Fi6IOjEPFawl0ab30hfa8SR6mLd22IcS4cy2zkvAOULE
 bGbNt3syxWrJhm+SLDm9SdjK0aNIvf1koZ3L6ljcK/net5PU5C0Id6vwG
 ot8H/nygQNeoy16YgAGXM1vbEXYpUCCUB89Jm0j9vWusQ2acfuYEPV8Us
 tnCLwLRDwbALFWnmpz/qZBX5vkLSSAIA4uQDZNGU2qnBqkGXENH0TTFUJ
 lsyngD3S6Ff774EUG3fU9kODjFeoxj5wGX9MrIFHahhBxSYp8JcSmoM6M
 wBNRFC1YMvh+DpSTWzwWb1xsP44d8Rph5d9Q+z9WRXvv7kFWBhF+lpDN4 A==;
X-CSE-ConnectionGUID: Q8sg3yc/QOWoEYdqI6cNaQ==
X-CSE-MsgGUID: vpHl9pVzRr2GyM26GF9Xdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27621053"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27621053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 00:36:52 -0700
X-CSE-ConnectionGUID: OCRwz6KHQp6r/9BTdiO64w==
X-CSE-MsgGUID: SNfYIr3ET+Oc7g3AWvxBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="99484772"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 00:36:51 -0700
Message-ID: <824201591dfbd8fd2f9595720156121478b3a4b0.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Drop xe_mark_range_accessed in HMM layer
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 09:36:49 +0200
In-Reply-To: <20240909182128.585364-1-matthew.brost@intel.com>
References: <20240909182128.585364-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Mon, 2024-09-09 at 11:21 -0700, Matthew Brost wrote:
> Not needed as hmm_range_fault does this and also as pages returned
> from
> hmm_range_fault could move while mmap lock is dropped and not not
> holding notifier lock. Page corruption showed up in similar code
> paths
> in SVM work.
>=20
> Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I wonder whether you can add something like "Write-enabled
hmm_range_fault() always ensures CPU ptes are marked dirty for the page
."

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_hmm.c | 25 -------------------------
> =C2=A01 file changed, 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c
> b/drivers/gpu/drm/xe/xe_hmm.c
> index 2c32dc46f7d4..dde80a66c9aa 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -19,30 +19,6 @@ static u64 xe_npages_in_range(unsigned long start,
> unsigned long end)
> =C2=A0	return (end - start) >> PAGE_SHIFT;
> =C2=A0}
> =C2=A0
> -/*
> - * xe_mark_range_accessed() - mark a range is accessed, so core mm
> - * have such information for memory eviction or write back to
> - * hard disk
> - *
> - * @range: the range to mark
> - * @write: if write to this range, we mark pages in this range
> - * as dirty
> - */
> -static void xe_mark_range_accessed(struct hmm_range *range, bool
> write)
> -{
> -	struct page *page;
> -	u64 i, npages;
> -
> -	npages =3D xe_npages_in_range(range->start, range->end);
> -	for (i =3D 0; i < npages; i++) {
> -		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> -		if (write)
> -			set_page_dirty_lock(page);
> -
> -		mark_page_accessed(page);
> -	}
> -}
> -
> =C2=A0/*
> =C2=A0 * xe_build_sg() - build a scatter gather table for all the physica=
l
> pages/pfn
> =C2=A0 * in a hmm_range. dma-map pages if necessary. dma-address is save
> in sg table
> @@ -242,7 +218,6 @@ int xe_hmm_userptr_populate_range(struct
> xe_userptr_vma *uvma,
> =C2=A0	if (ret)
> =C2=A0		goto free_pfns;
> =C2=A0
> -	xe_mark_range_accessed(&hmm_range, write);
> =C2=A0	userptr->sg =3D &userptr->sgt;
> =C2=A0	userptr->notifier_seq =3D hmm_range.notifier_seq;
> =C2=A0

