Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C47F4644B
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 10:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22710E394;
	Mon, 16 Mar 2026 10:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kr7PdqmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14F10E394
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773658755; x=1805194755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r3iIREqSBSgpbKpQfWaTaivzADhH/g7ZwVqQFICbavU=;
 b=Kr7PdqmZ+3BOiUwvdluIpYMwmyjZxC6FQ9BghpGbx2LtlSPhxbIbFaaZ
 pblZZYs/sAgts8D3xTi2K0NXUsHQyfk1CDFeEOI1FVIOdHJjy7sP5qb3Z
 4AxCF8wWnMLSa7fTB5NckRoAgu8UyNRHae9lbyXELaN1cyrsRuSP6Xo14
 ES9hbdOdH+KzVAT5SWSaqzOHr7AJXLdDabu012mzbYwP/ifgWgfF4ffUh
 DyGlVF9iFXRstRIRad9L8BFkPACsmFV7THYCTjfpw4zq5sifyNgWR823C
 MKC6149FwDpG4W+nBs10f7iJpEXSC7T1vzEDUoAkegEgQqqtYaSk3ft7i g==;
X-CSE-ConnectionGUID: FCGr5lNISrer3u/toGxUvQ==
X-CSE-MsgGUID: s9FngsAcTQiI1tJOLG+EXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85751999"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85751999"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 03:59:15 -0700
X-CSE-ConnectionGUID: xXejHu9nRbyqIvFv9F9IiQ==
X-CSE-MsgGUID: spqpExqZTAK0RvDj9Gm8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252396932"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.246])
 ([10.245.244.246])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 03:59:12 -0700
Message-ID: <4b32f17a-811e-453e-ac0a-e5fae77fea6a@intel.com>
Date: Mon, 16 Mar 2026 10:59:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/uapi: Reject coh_none PAT index for CPU
 cached memory in madvise
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260316072257.255372-1-jia.yao@intel.com>
 <20260316072257.255372-2-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260316072257.255372-2-jia.yao@intel.com>
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

On 16/03/2026 07:22, Jia Yao wrote:
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
> v5
> - Remove kmem leak because it has been merged by other patch
> 
> Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
> Cc: stable@vger.kernel.org # v6.18
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Mathew Alwin <alwin.mathew@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 46 +++++++++++++++++++++++++++++-
>   1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 869db304d96d..5d0acaad924c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -365,6 +365,43 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
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
> @@ -455,6 +492,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
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
> @@ -500,7 +545,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>   		drm_exec_fini(&exec);
>   free_vmas:
>   	kfree(madvise_range.vmas);
> -	madvise_range.vmas = NULL;

Do we really need this change?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   madv_fini:
>   	xe_madvise_details_fini(&details);
>   unlock_vm:

