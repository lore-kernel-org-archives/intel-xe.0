Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950D7D358F1
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 09:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A07B10E127;
	Thu, 29 Jan 2026 09:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQwhnDOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CD910E127
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769680713; x=1801216713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rZoux7GbRpkD6DEM3qkiGDz9QptztgLKxJHfXhla0hQ=;
 b=ZQwhnDOQHYk0c8bi0tdjhePUivfLehi84AgcOO0bz09QfIxiBd6zgywi
 CnazFf/IBbj1dFX1lHVryCYBZko6kbXfaeuVyS8Yr2S0VsBeiUeFrbT9x
 Hw02o+axYbTDvDfBI93bHoavgGvKUfQyY9BHfraIDbsKh8kiuXb2yXzUr
 7l6wEvZt39nAx2n4YbxEQ7nc63i6Iyan8xE0PSWfoGj4PbsBWzjzjKDhU
 yxP5QsjBI7PQ0dqsdJ57O4A9/TRMOEPnMDvVuuY094GnhMtb4idSIqTJk
 BTma1+uIVKfigtxUVAZZFXQ0MbjbhykGrV/9HAuHCK/KxfwrE6mJs0Y2t A==;
X-CSE-ConnectionGUID: MUZK+jpfSWCa0DeypsjUxw==
X-CSE-MsgGUID: hGlEoGA8RqS7o6TxEGhWRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74773623"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74773623"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:58:33 -0800
X-CSE-ConnectionGUID: aMLp3lqCR4yuMf+OJ/MSDw==
X-CSE-MsgGUID: rgMut3l+RR6eRDER52cFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208890407"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.152])
 ([10.245.245.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:58:32 -0800
Message-ID: <b401276b-36f1-46e6-953a-b9d3ab17e323@intel.com>
Date: Thu, 29 Jan 2026 09:58:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Reject coh_none PAT index for CPU cached
 memory in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260129055113.518798-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260129055113.518798-1-jia.yao@intel.com>
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

On 29/01/2026 05:51, Jia Yao wrote:
> Add validation in xe_vm_madvise_ioctl() to reject PAT indices with
> XE_COH_NONE coherency mode when applied to CPU cached memory.
> 
> Using coh_none with CPU cached buffers is a security issue. When the
> kernel clears pages before reallocation, the clear operation stays in
> CPU cache (dirty). GPU with coh_none can bypass CPU caches and read
> stale sensitive data directly from DRAM, potentially leaking data from
> previously freed pages of other processes.
> 
> This aligns with the existing validation in vm_bind path
> (xe_vm_bind_ioctl_validate_bo).
> 
> v2(Matthew brost)
> - Add fixes
> - Move one debug print to better place
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Cc: <stable@vger.kernel.org> # v6.18+

In the commit title we should maybe tag with "drm/xe/uapi:", since this 
is technically a uapi change and might be visible to UMD, AFAICT. With 
that we should also probably Cc: UMD folks so there are no suprises with 
this?

> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 47 ++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..50b82e821da7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -352,6 +352,44 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
>   	drm_pagemap_put(details->dpagemap);
>   }
>   
> +static bool check_pat_args_are_sane(struct xe_device *xe,
> +				    struct xe_vmas_in_madvise_range *madvise_range,
> +				    u16 pat_index)
> +{
> +	u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +	int i;
> +
> +	/*
> +	 * Using coh_none with CPU cached buffers is not allowed.
> +	 * Otherwise CPU page clearing can be bypassed, which is a
> +	 * security issue. GPU can directly access system memory and
> +	 * bypass CPU caches, potentially reading stale sensitive data
> +	 * from previously freed pages.
> +	 */
> +	if (coh_mode != XE_COH_NONE)
> +		return true;
> +
> +	for (i = 0; i < madvise_range->num_vmas; i++) {
> +		struct xe_vma *vma = madvise_range->vmas[i];
> +		struct xe_bo *bo = xe_vma_bo(vma);
> +
> +		if (bo) {
> +			/* BO with WB caching + COH_NONE is not allowed */
> +			if (XE_IOCTL_DBG(xe, bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
> +				return false;
> +			/* Imported dma-buf without caching info, assume cached */
> +			if (XE_IOCTL_DBG(xe, !bo->cpu_caching))
> +				return false;
> +		} else if (XE_IOCTL_DBG(xe, xe_vma_is_cpu_addr_mirror(vma)) ||
> +			   xe_vma_is_userptr(vma)) {
> +			/* System memory (userptr/SVM) is always CPU cached */
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>   				   int num_vmas, u32 atomic_val)
>   {
> @@ -442,6 +480,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   	if (err || !madvise_range.num_vmas)
>   		goto madv_fini;
>   
> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		if (!check_pat_args_are_sane(xe, &madvise_range,
> +					     args->pat_index.val)) {
> +			err = -EINVAL;
> +			goto free_vmas;
> +		}
> +	}
> +
>   	if (madvise_range.has_bo_vmas) {
>   		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
>   			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
> @@ -485,6 +531,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   err_fini:
>   	if (madvise_range.has_bo_vmas)
>   		drm_exec_fini(&exec);
> +free_vmas:
>   	kfree(madvise_range.vmas);
>   	madvise_range.vmas = NULL;
>   madv_fini:

