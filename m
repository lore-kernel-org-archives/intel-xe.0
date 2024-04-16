Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19880C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 14:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C718410E685;
	Tue, 16 Apr 2024 14:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L060ez2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D061E10F054
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713278012; x=1744814012;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=IJ1wGicO7ZtadVdm3iuEnnqVtQ4LZQkpUSplbbWFQLM=;
 b=L060ez2PJOv6GVO0wYo7fi6Vm6XStqCWaw211ckkg8KrzBcNN9I/8TxP
 EUQXuRHqA6+vnK2W3lwrjF3WMb609VggLhe07+qVP5hmqcpOG/mvoEy82
 vlc7c4xR9WKzDQ7EPYb6KoGylfgTEJZ/YJPWcFKRfkRCncBq/3aYllII+
 HZAa1QJEmmyRrU81g2DjWBVtaf3vi1xwdfC4GREX8iUXNOcYqfdj+ixuM
 b/LVTEPvBP7KuflE4/6oN6l7iVLzLCklBY9jXvDfaS5LAev3UPHI5pPE4
 VZSa4wcCmpt4R9Mb6KCoifowxff8CgplwyXaABB9bS+9Ccg9VLU+IL7Kj w==;
X-CSE-ConnectionGUID: bblm+6GQSdyaArP6987+yQ==
X-CSE-MsgGUID: QzJlcYwsSumC3G7v0yCg/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11666233"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="11666233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:33:31 -0700
X-CSE-ConnectionGUID: B0jDtyhqTGKl1zxUv0pLaw==
X-CSE-MsgGUID: Qgvs+tNNQ8eP8nlTNhNrVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22873859"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.221])
 ([10.94.250.221])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:33:29 -0700
Message-ID: <cea6d4cc-fb44-46c8-a790-4d1e590b7745@linux.intel.com>
Date: Tue, 16 Apr 2024 16:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-3-nirmoy.das@intel.com>
Content-Language: en-US
Cc: lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240415145214.25641-3-nirmoy.das@intel.com>
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


On 4/15/2024 4:52 PM, Nirmoy Das wrote:
> Currently decision to set PTE_AE is spread between xe_pt
> and xe_vm files and there is no reason to be keep it that
> way. Consolidate the logic for better maintainability.
>
> Atomics is not expected on userptr memory so this patch
> also making sure PTE_AE is only applied when a buffer object
> exist.

Synced with Lionel on this and the expectation is not correct for mesa. KMD

have to allow device atomics if UMD ask for it using the VM bind flag on 
userptr buffers too. I will correct this patch.


Regards,

Nirmoy

>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 4 +---
>   drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>   2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..7dc13a8bb44f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -597,7 +597,6 @@ static int
>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>   {
> -	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_bo *bo = xe_vma_bo(vma);
>   	bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>   		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> @@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>   	int ret;
>   
> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>   		xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>   
>   	if (is_devmem) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2dbba55e7785..b1dcaa35b6cc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -806,9 +806,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	for_each_tile(tile, vm->xe, id)
>   		vma->tile_mask |= 0x1 << id;
>   
> -	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
> -		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> -
>   	vma->pat_index = pat_index;
>   
>   	if (bo) {
> @@ -816,6 +813,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   
>   		xe_bo_assert_held(bo);
>   
> +		if (vm->xe->info.has_atomic_enable_pte_bit &&
> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
> +			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> +
>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>   		if (IS_ERR(vm_bo)) {
>   			xe_vma_free(vma);
