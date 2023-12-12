Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757DEC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 12:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6110E5CF;
	Tue, 12 Dec 2023 12:29:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606FD10E5F2
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702384140; x=1733920140;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J0BHLRoAVgQa/0Kj93QJ/ugACtKJL00vLHHC3zubQiM=;
 b=khIttN/zZo2h7ClpsOMNBGDVXRRYqgrcgZeZxo0VQWLoCfG7/QPPIvlX
 U4WeumnbYJlLdVpVgKeVNlmVknbdrZLLlILJeMdO0GJjzQ4bCaen6BPEI
 SMaCE87dJfm7IXpP2RtwLUw3whANMvtZH+i1v7wzdgJ6z+A2WWOpGlfsh
 8Bt+a8AtFDOur0OCHtrVpqxkMNfswqKglkd3M3GACfmnGAkyv6gGuYTcg
 +3mhC8jyZ1I9JHeqwLXAz3Zu8ASad9FlicQGa2Xwuw8TlNRP2NPcS+doj
 /tKjFiIlGMY6VN5PmfewdzEaBUpGciQAz1AdMMUPAeBualZ0m2eaa2/0W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8167378"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8167378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="807744892"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="807744892"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.140])
 ([10.249.254.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:28:53 -0800
Message-ID: <5460aee0-2dc5-77f8-5884-d71dbc1e032a@linux.intel.com>
Date: Tue, 12 Dec 2023 13:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 07/10] drm/xe/xe2: Update emit_pte to use compression
 enabled PAT index
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-8-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231211134356.1645973-8-himal.prasad.ghimiray@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/11/23 14:43, Himal Prasad Ghimiray wrote:
> For indirect accessed buffer use compression enabled PAT index.
>
> v2:
>   - Fix parameter name.
>
> v3:
>   - use a relevant define instead of fix number.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>   drivers/gpu/drm/xe/xe_migrate.c       | 21 +++++++++++++++------
>   drivers/gpu/drm/xe/xe_pat.c           |  1 +
>   drivers/gpu/drm/xe/xe_pt_types.h      |  1 +
>   4 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 47fcd6e6b777..d6c23441632a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -330,7 +330,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>   	else
>   		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>   
> -	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> +	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
>   		 &src_it, XE_PAGE_SIZE, pt);
>   
>   	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9698986eab06..1ecf2274c7ba 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -422,15 +422,24 @@ static u32 pte_update_size(struct xe_migrate *m,
>   
>   static void emit_pte(struct xe_migrate *m,
>   		     struct xe_bb *bb, u32 at_pt,
> -		     bool is_vram,
> +		     bool is_vram, bool is_comp_pte,
>   		     struct xe_res_cursor *cur,
>   		     u32 size, struct xe_bo *bo)
>   {
> -	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	struct xe_device *xe = tile_to_xe(m->tile);
> +
> +	u16 pat_index;
>   	u32 ptes;
>   	u64 ofs = at_pt * XE_PAGE_SIZE;
>   	u64 cur_ofs;
>   
> +	/* Indirect access needs compression enabled uncached PAT index */
> +	if (GRAPHICS_VERx100(xe) >= 2000)
> +		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
> +					  xe->pat.idx[XE_CACHE_NONE];
> +	else
> +		pat_index = xe->pat.idx[XE_CACHE_WB];
> +
>   	/*
>   	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>   	 * we're only emitting VRAM PTEs during sanity tests, so when
> @@ -717,19 +726,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		}
>   
>   		if (!src_is_vram)
> -			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
>   				 src_bo);
>   		else
>   			xe_res_next(&src_it, src_L0);
>   
>   		if (!dst_is_vram)
> -			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
>   				 dst_bo);
>   		else
>   			xe_res_next(&dst_it, src_L0);
>   
>   		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
> @@ -962,7 +971,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   
>   		/* Preemption is enabled again by the ring ops. */
>   		if (!clear_vram) {
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
>   				 bo);
>   		} else {
>   			xe_res_next(&src_it, clear_L0);
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 1892ff81086f..1ff6bc79e7d4 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -387,6 +387,7 @@ void xe_pat_init_early(struct xe_device *xe)
>   		xe->pat.idx[XE_CACHE_NONE] = 3;
>   		xe->pat.idx[XE_CACHE_WT] = 15;
>   		xe->pat.idx[XE_CACHE_WB] = 2;
> +		xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = 12; /*Applicable on xe2 and beyond */
>   	} else if (xe->info.platform == XE_METEORLAKE) {
>   		xe->pat.ops = &xelpg_pat_ops;
>   		xe->pat.table = xelpg_pat_table;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 82cbf1ef8e57..cee70cb0f014 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -18,6 +18,7 @@ enum xe_cache_level {
>   	XE_CACHE_NONE,
>   	XE_CACHE_WT,
>   	XE_CACHE_WB,
> +	XE_CACHE_NONE_COMPRESSION, /*UC + COH_NONE + COMPRESSION */
>   	__XE_CACHE_LEVEL_COUNT,
>   };
>   
