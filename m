Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC0BE8784A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 16:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6881710E114;
	Tue,  3 Feb 2026 16:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7DpuRpn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B8B10E114
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 16:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770136732; x=1801672732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=N0sc4DRcHW6ct40Fv+a+bdKZNgj/NJ22Xjrwph2Uw6Q=;
 b=a7DpuRpnZSNfpC9Z4BUp0+GupnNKLomsm3ip3rEYALWIGo/HZ1nARVu6
 vWakb4adrIZNnYTUykzMoN8E3a0iw57u+/QCU93ZQc7JU7K3LggG/Rcf7
 3SfJ+bM6Hy6YSEOQCHNAMIe1qL0R+2MYYFL1Vo8RIi2p0lVhuNfHD939u
 jALfuMWxoMbSA6rsVfyPqPUP/5sZows+91YsYaVnJSNtC9lXNgp5BCKBa
 97GAXY7rHwdawmDS2hi6fWxTl1kRB5xzVqPO+jPVSqK9+PqfKfEMXouDh
 n/SeUyrUdyUxkpkVdZgj7Npf8ZvSuGbPnfGLVxbUIwGXiJnndLpNGGyao g==;
X-CSE-ConnectionGUID: QU16CSnBSdm6E4Pm7Lam+Q==
X-CSE-MsgGUID: DY6nF5J2Q1iRX82WpYRk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82423447"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="82423447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:38:52 -0800
X-CSE-ConnectionGUID: n0WFGXkNR66WT7GG2fp+VA==
X-CSE-MsgGUID: g2Ys+PLnQK2SKZOaqLljMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="240577683"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.245.92])
 ([10.245.245.92])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 08:38:50 -0800
Message-ID: <582ecdea-b2a9-4ece-8cb0-854e9a2fa540@intel.com>
Date: Tue, 3 Feb 2026 16:38:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/uapi: Reject coh_none PAT index for CPU cached
 memory in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260203154846.1113521-1-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260203154846.1113521-1-jia.yao@intel.com>
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

On 03/02/2026 15:48, Jia Yao wrote:
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
> v3(Matthew Auld)
> - Should be drm/xe/uapi
> - More Cc
> 
> v4(Shuicheng Lin)
> - Fix kmem leak issues by the way
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Cc: stable@vger.kernel.org # v6.18
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Mathew Alwin <alwin.mathew@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Unless I'm blind, it looks like there is some missing validation on the 
pat_index coming from userspace also, where we can trigger OOB kernel 
read when calling get_coh_mode(), if malicious user gives you a bogus 
too large index. I think we need to fix that also, maybe as a seperate 
patch in this series or just send as seperate fix and get it landed ASAP?

> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 55 +++++++++++++++++++++++++++---
>   1 file changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..bf41fe75a336 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -74,7 +74,7 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
>   		}
>   
>   		madvise_range->vmas[madvise_range->num_vmas] = vma;
> -		(madvise_range->num_vmas)++;
> +		madvise_range->num_vmas++;
>   	}
>   
>   	if (!madvise_range->num_vmas)
> @@ -352,6 +352,43 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
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
> +		} else if (XE_IOCTL_DBG(xe, xe_vma_is_cpu_addr_mirror(vma) ||
> +					    xe_vma_is_userptr(vma)))
> +			/* System memory (userptr/SVM) is always CPU cached */
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>   				   int num_vmas, u32 atomic_val)
>   {
> @@ -388,12 +425,12 @@ static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>   	return true;
>   }
>   /**
> - * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * xe_vm_madvise_ioctl - Handle madvise ioctl for a VM
>    * @dev: DRM device pointer
>    * @data: Pointer to ioctl data (drm_xe_madvise*)
>    * @file: DRM file pointer
>    *
> - * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * Handles the madvise ioctl to provide memory advice for vma's within
>    * input range.
>    *
>    * Return: 0 on success or a negative error code on failure.
> @@ -442,13 +479,21 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
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
>   						    madvise_range.num_vmas,
>   						    args->atomic.val)) {
>   				err = -EINVAL;
> -				goto madv_fini;
> +				goto free_vmas;
>   			}
>   		}
>   
> @@ -485,8 +530,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   err_fini:
>   	if (madvise_range.has_bo_vmas)
>   		drm_exec_fini(&exec);
> +free_vmas:
>   	kfree(madvise_range.vmas);
> -	madvise_range.vmas = NULL;
>   madv_fini:
>   	xe_madvise_details_fini(&details);
>   unlock_vm:

