Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C538C282D2
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 15:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15710E5BC;
	Tue,  4 Mar 2025 15:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJJosvLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CF910E5BC
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Mar 2025 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741101418; x=1772637418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e+EDuWpe8F3othuuOXQKmcHBI2XgSroTZG5IyXoJbSk=;
 b=aJJosvLBL3/FMT/WiyswGheZ129nLUE9kIPiGr71vi21HY8iubn6TW+P
 ntdpawoajrfeO3HvMPgaBmihn7Oh2IO1517j38UqNP1kw76EYyAo32tgb
 Qn1jcEXN3xi9SsK3tgmeXYAkp5Ngcs7VbBJSitDbz9HYUfPYSQzd96t1v
 8nXEecaulVeDMM1DYdam5lKW36vaUowbA5hTVWB/fw+OsPDPp4ZysZAhi
 boYj4hxWB7n2rnuhLbxNumucJVfg9uN6GQnlnLWf/Tg8hbR17rRx1clf4
 pFBGL+0REKFCB1HSVbJvKxEdxEDOBCIN9KbDaSP2CwEAyM/+nSxJ2snKr w==;
X-CSE-ConnectionGUID: EftNoqA1QseQjAx0Q8F4PQ==
X-CSE-MsgGUID: 2XtMFXKES5mUtKBi2AOZlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41272400"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41272400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:16:58 -0800
X-CSE-ConnectionGUID: ZW4lBEN8SwSYh39lE9N6GQ==
X-CSE-MsgGUID: 3NNr9fKiR/CWMYkUnQ93eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123523883"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.188])
 ([10.245.245.188])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:16:57 -0800
Message-ID: <35919cb7-6404-4e70-947a-093a64e4c433@intel.com>
Date: Tue, 4 Mar 2025 15:16:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/hmm: Style- and include fixes
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>, stable@vger.kernel.org
References: <20250304113758.67889-1-thomas.hellstrom@linux.intel.com>
 <20250304113758.67889-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250304113758.67889-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 04/03/2025 11:37, Thomas Hellström wrote:
> Add proper #ifndef around the xe_hmm.h header, proper spacing
> and since the documentation mostly follows kerneldoc format,
> make it kerneldoc. Also prepare for upcoming -stable fixes.
> 
> Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_hmm.c | 9 +++------
>   drivers/gpu/drm/xe/xe_hmm.h | 5 +++++
>   2 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> index 089834467880..c56738fa713b 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -19,11 +19,10 @@ static u64 xe_npages_in_range(unsigned long start, unsigned long end)
>   	return (end - start) >> PAGE_SHIFT;
>   }
>   
> -/*
> +/**
>    * xe_mark_range_accessed() - mark a range is accessed, so core mm
>    * have such information for memory eviction or write back to
>    * hard disk
> - *
>    * @range: the range to mark
>    * @write: if write to this range, we mark pages in this range
>    * as dirty
> @@ -43,11 +42,10 @@ static void xe_mark_range_accessed(struct hmm_range *range, bool write)
>   	}
>   }
>   
> -/*
> +/**
>    * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
>    * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
>    * and will be used to program GPU page table later.
> - *
>    * @xe: the xe device who will access the dma-address in sg table
>    * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
>    * has the pfn numbers of pages that back up this hmm address range.
> @@ -112,9 +110,8 @@ static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
>   	return ret;
>   }
>   
> -/*
> +/**
>    * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> - *
>    * @uvma: the userptr vma which hold the scatter gather table
>    *
>    * With function xe_userptr_populate_range, we allocate storage of
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> index 909dc2bdcd97..9602cb7d976d 100644
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -3,9 +3,14 @@
>    * Copyright © 2024 Intel Corporation
>    */
>   
> +#ifndef _XE_HMM_H_
> +#define _XE_HMM_H_
> +
>   #include <linux/types.h>
>   
>   struct xe_userptr_vma;
>   
>   int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> +
>   void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> +#endif

