Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EFEC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 12:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D3110E1C8;
	Fri, 26 May 2023 12:35:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914EE10E1C8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685104516; x=1716640516;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wWCTeqrGebytzas7IJYAuk8XrfJBI0YxNmUsWUz5v48=;
 b=T5Sgo1nsFEI2pRezRGpoPRIsr9KxfexqeBSPWC5v5aeVMbXQfw9jTWYA
 A3FFCVgsk0TnJp2TMRE4zEjGfCi/Ytrpf6ZHyj59Mji0e4kSiLRN194RX
 zB34M1H76w5XJqPkKV1IlXn3Z9bM2rbZwLCZtcj9G3mf1C8YX+qD0cUjB
 xtHHce5gbUG2SXdGpk2hCoiRic9lh3/vbSiYf5tb+FjuEY0BvBDA0+UQH
 Pn76mCdZjWhZr3o80Ht9GG7WYVFN0xtOqIzrsBywwGaHHvY7MIjYOciGV
 lwG+tcx9Fwv6svQWLkjs9CjX1goGqk4RjcOr3vJJTqrjE2te8l6pyTDN9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440545814"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="440545814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="708392352"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="708392352"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:35:15 -0700
Message-ID: <b6be6ecf-5737-0f2a-2e7b-7737ef52af50@linux.intel.com>
Date: Fri, 26 May 2023 14:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-5-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230526121101.1619278-5-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Prevent evicting for page tables
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


On 5/26/23 14:11, Maarten Lankhorst wrote:
> When creating page tables from xe_exec_ioctl, we may end up freeing
> memory we just validated. To be certain this does not happen, do not
> allow the current reservation to be evicted from the ioctl.
>
> Callchain:
> [  109.008522]  xe_bo_move_notify+0x5c/0xf0 [xe]
> [  109.008548]  xe_bo_move+0x90/0x510 [xe]
> [  109.008573]  ttm_bo_handle_move_mem+0xb7/0x170 [ttm]
> [  109.008581]  ttm_bo_swapout+0x15e/0x360 [ttm]
> [  109.008586]  ttm_device_swapout+0xc2/0x110 [ttm]
> [  109.008592]  ttm_global_swapout+0x47/0xc0 [ttm]
> [  109.008598]  ttm_tt_populate+0x7a/0x130 [ttm]
> [  109.008603]  ttm_bo_handle_move_mem+0x160/0x170 [ttm]
> [  109.008609]  ttm_bo_validate+0xe5/0x1d0 [ttm]
> [  109.008614]  ttm_bo_init_reserved+0xac/0x190 [ttm]
> [  109.008620]  __xe_bo_create_locked+0x153/0x260 [xe]
> [  109.008645]  xe_bo_create_locked_range+0x77/0x360 [xe]
> [  109.008671]  xe_bo_create_pin_map_at+0x33/0x1f0 [xe]
> [  109.008695]  xe_bo_create_pin_map+0x11/0x20 [xe]
> [  109.008721]  xe_pt_create+0x69/0xf0 [xe]
> [  109.008749]  xe_pt_stage_bind_entry+0x208/0x430 [xe]
> [  109.008776]  xe_pt_walk_range+0xe9/0x2a0 [xe]
> [  109.008802]  xe_pt_walk_range+0x223/0x2a0 [xe]
> [  109.008828]  xe_pt_walk_range+0x223/0x2a0 [xe]
> [  109.008853]  __xe_pt_bind_vma+0x28d/0xbd0 [xe]
> [  109.008878]  xe_vm_bind_vma+0xc7/0x2f0 [xe]
> [  109.008904]  xe_vm_rebind+0x72/0x160 [xe]
> [  109.008930]  xe_exec_ioctl+0x22b/0xa70 [xe]
> [  109.008955]  drm_ioctl_kernel+0xb9/0x150 [drm]
> [  109.008972]  drm_ioctl+0x210/0x430 [drm]
> [  109.008988]  __x64_sys_ioctl+0x85/0xb0
> [  109.008990]  do_syscall_64+0x38/0x90
> [  109.008991]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> Original warning:
> [ 5613.149126] WARNING: CPU: 3 PID: 45883 at drivers/gpu/drm/xe/xe_vm.c:504 xe_vm_unlock_dma_resv+0x43/0x50 [xe]
> ...
> [ 5613.226398] RIP: 0010:xe_vm_unlock_dma_resv+0x43/0x50 [xe]
> [ 5613.316098] Call Trace:
> [ 5613.318595]  <TASK>
> [ 5613.320743]  xe_exec_ioctl+0x383/0x8a0 [xe]
> [ 5613.325278]  ? __is_insn_slot_addr+0x8e/0x110
> [ 5613.329719]  ? __is_insn_slot_addr+0x8e/0x110
> [ 5613.334116]  ? kernel_text_address+0x75/0xf0
> [ 5613.338429]  ? __pfx_stack_trace_consume_entry+0x10/0x10
> [ 5613.343778]  ? __kernel_text_address+0x9/0x40
> [ 5613.348181]  ? unwind_get_return_address+0x1a/0x30
> [ 5613.353013]  ? __pfx_stack_trace_consume_entry+0x10/0x10
> [ 5613.358362]  ? arch_stack_walk+0x99/0xf0
> [ 5613.362329]  ? rcu_read_lock_sched_held+0xb/0x70
> [ 5613.366996]  ? lock_acquire+0x287/0x2f0
> [ 5613.370873]  ? rcu_read_lock_sched_held+0xb/0x70
> [ 5613.375530]  ? rcu_read_lock_sched_held+0xb/0x70
> [ 5613.380181]  ? lock_release+0x225/0x2e0
> [ 5613.384059]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [ 5613.389092]  drm_ioctl_kernel+0xc0/0x170
> [ 5613.393068]  drm_ioctl+0x1b7/0x490
> [ 5613.396519]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [ 5613.401547]  ? lock_release+0x225/0x2e0
> [ 5613.405432]  __x64_sys_ioctl+0x8a/0xb0
> [ 5613.409232]  do_syscall_64+0x37/0x90
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239

Did you look at passing around the ttm_operation_ctx, or a 
"allow_res_evict" bool?
In any case would be good to have this fixed asap, so

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_bo.c | 2 +-
>   drivers/gpu/drm/xe/xe_bo.h | 7 ++++---
>   drivers/gpu/drm/xe/xe_pt.c | 3 ++-
>   3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0db9c05097d0..8735facb1cf9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1130,7 +1130,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>   
>   	if (resv) {
> -		ctx.allow_res_evict = true;
> +		ctx.allow_res_evict = !(flags & XE_BO_CREATE_NO_RESV_EVICT);
>   		ctx.resv = resv;
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a1c51cc0ac3c..dd27d8c7f3b0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -27,9 +27,10 @@
>   #define XE_BO_CREATE_GGTT_BIT		BIT(5)
>   #define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
>   #define XE_BO_CREATE_PINNED_BIT		BIT(7)
> -#define XE_BO_DEFER_BACKING		BIT(8)
> -#define XE_BO_SCANOUT_BIT		BIT(9)
> -#define XE_BO_FIXED_PLACEMENT_BIT	BIT(10)
> +#define XE_BO_CREATE_NO_RESV_EVICT	BIT(8)
> +#define XE_BO_DEFER_BACKING		BIT(9)
> +#define XE_BO_SCANOUT_BIT		BIT(10)
> +#define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
>   /* this one is trigger internally only */
>   #define XE_BO_INTERNAL_TEST		BIT(30)
>   #define XE_BO_INTERNAL_64K		BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f15282996c3b..30de6e902a8e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -219,7 +219,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
>   				  ttm_bo_type_kernel,
>   				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
>   				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
> -				  XE_BO_CREATE_PINNED_BIT);
> +				  XE_BO_CREATE_PINNED_BIT |
> +				  XE_BO_CREATE_NO_RESV_EVICT);
>   	if (IS_ERR(bo)) {
>   		err = PTR_ERR(bo);
>   		goto err_kfree;
