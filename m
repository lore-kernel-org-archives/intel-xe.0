Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C0FCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 15:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569F10EC9F;
	Fri, 12 Sep 2025 15:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGp5TBUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC77A10EC9F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757691468; x=1789227468;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mUtqJ4O7V1/LBAN1p0Cu1s/yNLmbnvYv/3BOpDMXWJQ=;
 b=VGp5TBUUTilyeohjReA0wrr/F2+P0VGvkpBuQIDqlnkEb6AIvXREd44S
 wLTIS1CwwvN01ePsYL2qReMB0rkqdyvZo/pZGh5vOkEzgWFc+inD1/9ug
 LBFfLbcvlBQRt7BwTrIfwsv2mA5sIUOenZmVP3XxxhvLajbpesWXgk1ON
 4y4MplKBdOCfFF4vWTVep9Y7GlwMIBm1XXT1t3ylpJymFLFKY+WPBKm3R
 tFvC32vBHcSP07D/HBaxsB5A9fhVhu+bTux9alMgPp62VqBaU9+T0r+r8
 qM9lK4GErEwJx/ZigktJz+NCMYITThAHYZ6Ok/vKHkqtQ/Zj2o10l27mp Q==;
X-CSE-ConnectionGUID: GCSrPyOPQPCoYocrtyM1Ng==
X-CSE-MsgGUID: NYP2BFgvS/Svt9sR1Ar/0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="71467198"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="71467198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:37:48 -0700
X-CSE-ConnectionGUID: zaEFV2z2R7SAfQ8qpsXSCw==
X-CSE-MsgGUID: qppKasi4SJyyTK3mxRgpTA==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.134])
 ([10.245.244.134])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:37:47 -0700
Message-ID: <92d7142e-0700-4fa7-aac9-da1058b3f98b@intel.com>
Date: Fri, 12 Sep 2025 16:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe: Force user context allocations in user VRAM
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
 <20250910143736.792426-4-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250910143736.792426-4-piotr.piorkowski@intel.com>
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

On 10/09/2025 15:37, Piórkowski, Piotr wrote:
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
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
>   drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
>   drivers/gpu/drm/xe/xe_lrc.h        | 6 ++++--
>   drivers/gpu/drm/xe/xe_pt.c         | 2 +-
>   4 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 063c89d981e5..9a8fa3ed5d09 100644
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
> @@ -215,7 +218,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (IS_ERR(q))
>   		return q;
>   
> -	err = __xe_exec_queue_init(q);
> +	err = __xe_exec_queue_init(q, flags);
>   	if (err)
>   		goto err_post_alloc;
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 6d52e0eb97f5..423b0a1cde99 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1340,6 +1340,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	if (vm && vm->xef) /* userspace */
>   		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>   
> +	if (init_flags & XE_LRC_CREATE_USER_CTX)
> +		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;

Should this be folded into the vm && vm->xef check above? Seem like we 
would also want LATE_RESTORE in such cases? Could be a separate change 
since it's a behviour change, but looks to be an improvement by itself?

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
> index 01eea8eb1779..1b9c497f30e1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -123,7 +123,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>   		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
>   	if (vm->xef) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
>   
>   	pt->level = level;
>   

