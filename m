Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230CCCAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 09:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E97D10E310;
	Fri, 26 Sep 2025 09:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZTBuFrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096E10E310
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 09:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758878470; x=1790414470;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cFR2kvzYK+P6dlQbgiR+bNBH+JnYbd+w9q0LErJeiYk=;
 b=CZTBuFrRhCeG+1OmBdaMkO90BWrfZkJ7ujHXXimrKqNuXlKrnGtIwq2N
 hbvv/lhX4faDjYZnUz8WRjxeethLgulEwtcB95o2tdIiH4wWi/HMcftWB
 hjodDlxaEb7tI81s/OU+juZE1CJed150xjkd8GW8nevf6hq/zTmZ/BsSc
 HaCWbHJ5GK/DQf5MX4VyiFf+8HQ0LnF2o28+L5BoGultokFVwNP3cn0u3
 R1vyTXHJqoGN1quz5BcpoE9buDj1REZKEvzt8UyVUwXE8pXU92uCqkJY9
 zoDV9N1xFlmiEVGVHH9G+hqSrvZAFrF5gbaxll9Od0Bk8wYLSO+eLSgdt g==;
X-CSE-ConnectionGUID: KMWouyduS3aGR8bIvVT83w==
X-CSE-MsgGUID: FKva/Bn0RNu2uS0WHgMHJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60417858"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="60417858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:21:10 -0700
X-CSE-ConnectionGUID: FSIEEW+hTzy1nbehKGieoA==
X-CSE-MsgGUID: tlbvsjh/SdWjY9FFjydsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181869835"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 02:21:09 -0700
Message-ID: <f6aba53c-e247-44e0-9258-97a4d1ac7394@intel.com>
Date: Fri, 26 Sep 2025 10:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/xe: Force user context allocations in user VRAM
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-4-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250922170707.1556781-4-piotr.piorkowski@intel.com>
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

On 22/09/2025 18:07, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> In general, kernel structures should be allocated in the kernel-dedicated
> VRAM region. However, userspace context data - while used by the kernel -
> does not need to reside there.
> Let's force the allocation of such data in the general-purpose VRAM region
> accessible to userspace.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
>   drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
>   drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
>   drivers/gpu/drm/xe/xe_pt.c         | 2 +-
>   4 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 37b2b93b73d6..9b1e70e20565 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -160,7 +160,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	return q;
>   }
>   
> -static int __xe_exec_queue_init(struct xe_exec_queue *q)
> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   {
>   	int i, err;
>   	u32 flags = 0;
> @@ -179,6 +179,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   			flags |= XE_LRC_CREATE_RUNALONE;
>   	}
>   
> +	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> +		flags |= XE_LRC_CREATE_USER_CTX;
> +
>   	for (i = 0; i < q->width; ++i) {
>   		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>   		if (IS_ERR(q->lrc[i])) {
> @@ -225,7 +228,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (IS_ERR(q))
>   		return q;
>   
> -	err = __xe_exec_queue_init(q);
> +	err = __xe_exec_queue_init(q, flags);
>   	if (err)
>   		goto err_post_alloc;
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 47e9df775072..c88e90175f59 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1415,6 +1415,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	if (vm && vm->xef) /* userspace */
>   		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>   
> +	if (init_flags & XE_LRC_CREATE_USER_CTX)
> +		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;
> +
>   	lrc->bo = xe_bo_create_pin_map_novm(xe, tile,
>   					    bo_size,
>   					    ttm_bo_type_kernel,
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 188565465779..21a3daab0154 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -44,8 +44,10 @@ struct xe_lrc_snapshot {
>   
>   #define LRC_WA_BB_SIZE SZ_4K
>   
> -#define XE_LRC_CREATE_RUNALONE 0x1
> -#define XE_LRC_CREATE_PXP 0x2
> +#define XE_LRC_CREATE_RUNALONE		BIT(0)
> +#define XE_LRC_CREATE_PXP		BIT(1)
> +#define XE_LRC_CREATE_USER_CTX		BIT(2)
> +
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     u32 ring_size, u16 msix_vec, u32 flags);
>   void xe_lrc_destroy(struct kref *ref);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a1c88f9a6c76..e39da95f3a05 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -122,7 +122,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>   		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
>   	if (vm->xef) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
>   
>   	pt->level = level;
>   

