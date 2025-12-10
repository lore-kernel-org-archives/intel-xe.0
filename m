Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD0D2CE17
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 10:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD89910E0F1;
	Wed, 10 Dec 2025 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQW3dRpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9BB10E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765362324; x=1796898324;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uzV7tbuirrBX4N+DN+K4a7SAa6wnTg5ct6fgHKaTV1U=;
 b=cQW3dRpbwJgfzq4Ytgz03Qd78pFAs/zrGKAtZmTgtbz8MKCiP+eUHHXm
 iUa3K9BXM9H7c2fU801LZoDoAmJIckni6wcZ/Ud8wy1jjjtsd1OsdBtXo
 ZTukpv9h8humvwxA9gyx4I3P+F7d9xJteiL91lil0HvD0eAuDcs5bQwjt
 PII81qJtINpqJkYu5vFDQaQjOwr+V69xTSlUbBgp0osN7BBp7j60qHtA5
 XAeOLf8XYgWrWvWBdzmzlqkt5SVQ3uOkloEAdEt3LV+NwSXoQ03ZkRNQM
 6VFza+dbfpQtgl+wE3mu2rRlefyS7T/Qk6uM5Bz+l9UCXvt4xEMGOoZpb Q==;
X-CSE-ConnectionGUID: IcgCZh3LTY6gFU4y7Au3kQ==
X-CSE-MsgGUID: f0kUrBQsT8KtWflOyZiKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77947794"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77947794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:25:22 -0800
X-CSE-ConnectionGUID: j7x8DSWMSeWvSbuQ69wYDA==
X-CSE-MsgGUID: 2pq5dmUxRDqP9jGyg2YWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196230444"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.84])
 ([10.245.244.84])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:25:18 -0800
Message-ID: <7fa53fa2-61a5-44d4-b429-dfe40d7476ed@intel.com>
Date: Wed, 10 Dec 2025 10:25:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for
 contiguous allocations
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251209172919.2304341-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 09/12/2025 17:29, Sanjay Yadav wrote:
> The VRAM/stolen memory managers do not currently set
> DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
> this flag activates the buddy allocator's try_harder path, which helps
> handle fragmented memory scenarios.
> 
> This enables the __alloc_contig_try_harder fallback in the buddy
> allocator, allowing contiguous allocation requests to succeed even when
> memory is fragmented by combining allocations from both(RHS and LHS)
> sides of a large free block.
> 
> v2: (Matt B)
> - Remove redundant logic for rounding allocation size and trimming when
>    TTM_PL_FLAG_CONTIGUOUS is set, since drm_buddy now handles this when
>    DRM_BUDDY_CONTIGUOUS_ALLOCATION is enabled
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9f70802fce92..1a819b627afe 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
>   		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>   
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> +
>   	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> @@ -111,25 +114,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   		goto error_unlock;
>   	}
>   
> -	if (place->fpfn + (size >> PAGE_SHIFT) != lpfn &&
> -	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		size = roundup_pow_of_two(size);
> -		min_page_size = size;
> -
> -		lpfn = max_t(unsigned long, place->fpfn + (size >> PAGE_SHIFT), lpfn);
> -	}

lgtm. One thing to consider is whether this might now open us up to:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712

This is likely not an issue for VRAM but stolen can trigger this path 
and the region size there is pretty small and we heavily use CONTIG for 
at least fbc IIRC, so this could now be triggerable. I guess lets just 
wait and see what upstream CI says, but not 100% if something in the 
wild might hit it even if CI is clean (or perhaps something in 
internal). If we want to play it safe we could land this after fixing 
6712, but up to you (assuming upstream CI is at least happy).

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> -
>   	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>   				     (u64)lpfn << PAGE_SHIFT, size,
>   				     min_page_size, &vres->blocks, vres->flags);
>   	if (err)
>   		goto error_unlock;
>   
> -	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
> -			size = vres->base.size;
> -	}
> -
>   	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
>   		vres->used_visible_size = size;
>   	} else {

