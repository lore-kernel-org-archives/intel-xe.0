Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F67BC83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6793210E561;
	Tue, 15 Jul 2025 08:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6FD3oMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A29310E561
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752568671; x=1784104671;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zerMKEJITnitluzFnqkB+9xMo6H2glUBVoqEzTdNKc0=;
 b=K6FD3oMXCpis+reksZEqWRyz827G2fqb3hGgkx9MehOZxeOT93SX9Xiz
 bkj4LVJic2Cl6l9ncXjiWDpDYpXyA3iVrWX3SbKiLVx4CaBn7cJiPfMey
 YQv/pUFQ5azhMf8rkRP+18V28sYMkSxcxkI5DqW5YYqY7PU+WxECQqDgi
 B4ScJMcmgVsIF8BJPVihXonCftojvRhQ7OvCS9BbtSeqscHefUG3SjfNV
 Of5uIUKWVMdR0P/rbNvFFUIx19ufbmrWMBWrZjMVEUyrg3rnhgBiCEcmN
 4gFq8YZk8Iz+YaYeq8Dxmw8SumvcziebYNpF7LbAUkqWyzqWvhgmWSBQc A==;
X-CSE-ConnectionGUID: ed6Q4wJ2QJ27WtxsxoY0zg==
X-CSE-MsgGUID: ZCsy1CZdQOWkek0kjrFyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54650302"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54650302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:37:50 -0700
X-CSE-ConnectionGUID: 9kypFIn5RnGvxJTuOJAOsA==
X-CSE-MsgGUID: c+rdHBQjTsOWp8AFm6BnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="180867440"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 01:37:48 -0700
Message-ID: <0068e1bf-de5e-475f-9e4c-e4d358ea180a@intel.com>
Date: Tue, 15 Jul 2025 09:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Update xe_migrate_vram to support compression
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250714173342.2997396-3-matthew.brost@intel.com>
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

On 14/07/2025 18:33, Matthew Brost wrote:
> While SVM does not currently support compression, other users of
> xe_migrate_vram (e.g., devcoredump) expect the data to be read back
> uncompressed. Update xe_migrate_vram to support compressed data.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ba1cff2e4cda..936daa2b363d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1613,7 +1613,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   					 unsigned long len,
>   					 unsigned long sram_offset,
>   					 dma_addr_t *sram_addr, u64 vram_addr,
> -					 const enum xe_migrate_copy_dir dir)
> +					 const enum xe_migrate_copy_dir dir,
> +					 bool needs_ccs_emit)
>   {
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -1623,10 +1624,12 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   	u64 src_L0_ofs, dst_L0_ofs;
>   	struct xe_sched_job *job;
>   	struct xe_bb *bb;
> -	u32 update_idx, pt_slot = 0;
> +	u32 update_idx, pt_slot = 0, flush_flags = 0;
>   	unsigned long npages = DIV_ROUND_UP(len + sram_offset, PAGE_SIZE);
>   	unsigned int pitch = len >= PAGE_SIZE && !(len & ~PAGE_MASK) ?
>   		PAGE_SIZE : 4;
> +	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> +		GRAPHICS_VER(xe) >= 20 && dir == XE_MIGRATE_COPY_TO_SRAM;
>   	int err;
>   
>   	if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> @@ -1637,6 +1640,8 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   
>   	batch_size += pte_update_cmd_size(len);
>   	batch_size += EMIT_COPY_DW;
> +	if (needs_ccs_emit)
> +		batch_size += EMIT_COPY_CCS_DW;
>   
>   	bb = xe_bb_new(gt, batch_size, use_usm_batch);
>   	if (IS_ERR(bb)) {
> @@ -1652,7 +1657,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
>   
>   	} else {
> -		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
> +		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, use_comp_pat);
>   		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) + sram_offset;
>   	}
>   
> @@ -1661,6 +1666,17 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   
>   	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len, pitch);
>   
> +	if (needs_ccs_emit) {
> +		if (dir == XE_MIGRATE_COPY_TO_VRAM)
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +							  false, dst_L0_ofs,
> +							  true, len, 0, true);
> +		else
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +							  true, dst_L0_ofs,
> +							  false, len, 0, true);
> +	}

I think we can drop this and anything related to needs_ccs_emit.  In 
theory we should only need the use_comp_pat change. IIUC this path is 
VRAM only, and only xe2+ can be decompressed in the KMD (dg2 is no-go), 
and for that we don't manage the raw CCS state.

> +
>   	job = xe_bb_create_migration_job(m->q, bb,
>   					 xe_migrate_batch_base(m, use_usm_batch),
>   					 update_idx);
> @@ -1669,7 +1685,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   		goto err;
>   	}
>   
> -	xe_sched_job_add_migrate_flush(job, 0);
> +	xe_sched_job_add_migrate_flush(job, flush_flags);
>   
>   	mutex_lock(&m->job_mutex);
>   	xe_sched_job_arm(job);
> @@ -1708,7 +1724,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   				     u64 dst_addr)
>   {
>   	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> -			       XE_MIGRATE_COPY_TO_VRAM);
> +			       XE_MIGRATE_COPY_TO_VRAM, false);
>   }
>   
>   /**
> @@ -1729,7 +1745,7 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>   				       dma_addr_t *dst_addr)
>   {
>   	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
> -			       XE_MIGRATE_COPY_TO_SRAM);
> +			       XE_MIGRATE_COPY_TO_SRAM, false);
>   }
>   
>   static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> @@ -1890,7 +1906,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   					  dma_addr + current_page,
>   					  vram_addr, write ?
>   					  XE_MIGRATE_COPY_TO_VRAM :
> -					  XE_MIGRATE_COPY_TO_SRAM);
> +					  XE_MIGRATE_COPY_TO_SRAM,
> +					  xe_bo_needs_ccs_pages(bo));
>   		if (IS_ERR(__fence)) {
>   			if (fence)
>   				dma_fence_wait(fence, false);

