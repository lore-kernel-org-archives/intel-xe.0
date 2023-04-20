Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F20C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 08:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1885A10EBF7;
	Thu, 20 Apr 2023 08:52:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3254010EBF7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681980742; x=1713516742;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=xyfPyvThriMZDbn0XfOwkU8BlxXW7B0Mwx1Ac54n3Ek=;
 b=BOj3542RFkFaLNMRMg8aUo7s05o7SCH/K6Waw0xJL/pZoSBFm/6pDy+R
 W+0MoavfhIFJexbJ4iGrwSSeOKt46JPiY0+w9ouxZoU8bytg9ePU3dzOL
 qUDlcI10U63yzxTzOgvkBTnFta+4XrnDPRt2dAT/CByWVzWfiPY7vp9BU
 dG9Ny3B1XODOUcW4lJhIGTL7f/kbj1LMQ7Jh9vFmsBWFWu3MnH8J4SZpj
 8M/4OsRyXthlqol6NxF57JZolWzSo3g7YlSPjHmVwrl8T4POtP/D9UiGD
 wfYchWHBknNLY/0t5nAjPylzGlUqGYil+dIwsuGSUlULDr9cZSTsnP3ox Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334504793"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="334504793"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691834676"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="691834676"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 01:52:19 -0700
Message-ID: <d18c10ec-bb41-f142-70dd-1788259f9045@linux.intel.com>
Date: Thu, 20 Apr 2023 10:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned
 size
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

+Maarten

Hi, Zbigniew, Mauro

On 4/13/23 08:56, Zbigniew Kempczyński wrote:
> From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>
> For xe bo creation we request passing size which matches system or
> vram minimum page alignment. This way we want to ensure userspace
> is aware of region constraints and not aligned allocations will be
> rejected returning EINVAL.

Personally, I think the alignment constraints is a property / 
restriction of the Xe GPU binding that should not interfere with bo 
creation / size that should instead reflect the size of the data we need 
to store. So the alignment constraints should apply only to the GPU VA 
space allocation. This would also make the semantics of importing 
dma-bufs of unaligned size straightforward.

Although admittedly I'm not fully up-to-date with the discussion 
preceding the choice to return -EINVAL if the bo size is not aligned to 
our GPU binding constraints. (Maarten, could you perhaps fill in?)

Thanks,

Thomas




>
> Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++++-------
>   include/uapi/drm/xe_drm.h  |  5 ++---
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..d3972c84bcce 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1090,6 +1090,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	};
>   	struct ttm_placement *placement;
>   	uint32_t alignment;
> +	size_t aligned_size;
>   	int err;
>   
>   	/* Only kernel objects should set GT */
> @@ -1098,22 +1099,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	if (XE_WARN_ON(!size))
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!bo) {
> -		bo = xe_bo_alloc();
> -		if (IS_ERR(bo))
> -			return bo;
> -	}
> -
>   	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
>   	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
>   	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> -		size = ALIGN(size, SZ_64K);
> +		aligned_size = ALIGN(size, SZ_64K);
> +		if (type != ttm_bo_type_device)
> +			size = ALIGN(size, SZ_64K);
>   		flags |= XE_BO_INTERNAL_64K;
>   		alignment = SZ_64K >> PAGE_SHIFT;
> +
>   	} else {
> +		aligned_size = ALIGN(size, SZ_4K);
> +		flags &= ~XE_BO_INTERNAL_64K;
>   		alignment = SZ_4K >> PAGE_SHIFT;
>   	}
>   
> +	if (type == ttm_bo_type_device && aligned_size != size)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!bo) {
> +		bo = xe_bo_alloc();
> +		if (IS_ERR(bo))
> +			return bo;
> +	}
> +
>   	bo->gt = gt;
>   	bo->size = size;
>   	bo->flags = flags;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0b80aae3ee8..d3e64af7eabb 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -259,9 +259,8 @@ struct drm_xe_gem_create {
>   	__u64 extensions;
>   
>   	/**
> -	 * @size: Requested size for the object
> -	 *
> -	 * The (page-aligned) allocated size for the object will be returned.
> +	 * @size: Size of the object to be created, must match region
> +	 * (system or vram) minimum alignment.
>   	 */
>   	__u64 size;
>   
