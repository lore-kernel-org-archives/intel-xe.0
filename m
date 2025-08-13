Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C94C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 16:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89F10E790;
	Wed, 13 Aug 2025 16:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDXgZ9eC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E624E10E78A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755103343; x=1786639343;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GbNhHbxR6mk2nNGqUefzQkKOioNlUpf0i7t8LUV2huE=;
 b=ZDXgZ9eCMhGu4B10xv1ESV7qYNt+tcfEr4P+XMwxCS+l1rFYi/k1qMSF
 CDQB9vnX9AualDxTCt0m9h4UyjPvPNnWrv4Re6gI6DsJb3d/jlUe4+un6
 /HZwCTw+Tk99j2vy4FBZeyWCx1kFEisL2P7vn6XT6U9rVh7turiKPVulz
 Ajf72Ia+s+htKTwGQlOaanYb50ezRVFZFuztXz5aoqkzs3Ch8IvQUUmCB
 +Mx1KkY8M4V+kgWYrHodjaKbfidBGpgx51YACbvNtwYUNvlaJpKXOD1SH
 aHYV2yfiLUmeeyq182Z/jlk05NfpAZh23vzkglx60Hlk5VZuUS27aL/uh g==;
X-CSE-ConnectionGUID: qnDehoMgT3CPM55LkDM92Q==
X-CSE-MsgGUID: m5RuvNAwQmmV78Fhr8AshQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57483283"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57483283"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:42:22 -0700
X-CSE-ConnectionGUID: 6SNy2VRCSWqKRdy5cM8y4Q==
X-CSE-MsgGUID: 1cRHJDPLSIm7bU6pxGfamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171847706"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.238])
 ([10.245.245.238])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:42:21 -0700
Message-ID: <81fb8dd4-2626-45df-bccf-9d78bcefacda@intel.com>
Date: Wed, 13 Aug 2025 17:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/xe: Force user context allocations in user VRAM
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
 <20250718081752.630122-4-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250718081752.630122-4-piotr.piorkowski@intel.com>
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

On 18/07/2025 09:17, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> In general, kernel structures should be allocated in the kernel-dedicated
> VRAM region. However, userspace context data - while used by the kernel -
> does not need to reside there.
> Let's force the allocation of such data in the general-purpose VRAM region
> accessible to userspace.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 7 +++++--
>   drivers/gpu/drm/xe/xe_lrc.c        | 3 +++
>   drivers/gpu/drm/xe/xe_lrc.h        | 5 +++--
>   drivers/gpu/drm/xe/xe_pt.c         | 2 +-
>   4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 8991b4aed440..abd29191186e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -112,7 +112,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   	return q;
>   }
>   
> -static int __xe_exec_queue_init(struct xe_exec_queue *q)
> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   {
>   	int i, err;
>   	u32 flags = 0;
> @@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   			flags |= XE_LRC_CREATE_RUNALONE;
>   	}
>   
> +	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
> +		flags |= XE_LRC_CREATE_USER_CTX;
> +
>   	for (i = 0; i < q->width; ++i) {
>   		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>   		if (IS_ERR(q->lrc[i])) {
> @@ -167,7 +170,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (IS_ERR(q))
>   		return q;
>   
> -	err = __xe_exec_queue_init(q);
> +	err = __xe_exec_queue_init(q, flags);
>   	if (err)
>   		goto err_post_alloc;
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 6d38411bdeba..ed53f8e2448b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1203,6 +1203,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   	if (vm && vm->xef) /* userspace */
>   		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
>   
> +	if (init_flags & XE_LRC_CREATE_USER_CTX)
> +		bo_flags |= XE_BO_FLAG_FORCE_USER_VRAM;

We can't use the xef check above?

> +
>   	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
>   				       ttm_bo_type_kernel,
>   				       bo_flags);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index b6c8053c581b..57f661aa9b1c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -42,8 +42,9 @@ struct xe_lrc_snapshot {
>   #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>   #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>   
> -#define XE_LRC_CREATE_RUNALONE 0x1
> -#define XE_LRC_CREATE_PXP 0x2
> +#define XE_LRC_CREATE_RUNALONE		BIT(0)
> +#define XE_LRC_CREATE_PXP		BIT(1)
> +#define XE_LRC_CREATE_USER_CTX		BIT(2)
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     u32 ring_size, u16 msix_vec, u32 flags);
>   void xe_lrc_destroy(struct kref *ref);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c8e63bd23300..a6c5f810c815 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -120,7 +120,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
>   		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
>   	if (vm->xef) /* userspace */
> -		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
> +		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE | XE_BO_FLAG_FORCE_USER_VRAM;
>   
>   	pt->level = level;
>   	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,

