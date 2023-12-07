Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD8C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7515D10E893;
	Thu,  7 Dec 2023 12:47:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4AD10E893
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953270; x=1733489270;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=i28df/J0QihFPaLk3jYjluAD2pnPHZIUALa8uRhzBGg=;
 b=BuQOQiWUnjitoHC06Qs/9Pq5L3dtl50I1b5PfL6DJTmtad0XMk89K5fr
 1r+kpLx6fwBG/I0ztUg5K7Wy5A161Fd5MNLOAW3trL4TNe40Dsa2SNfnh
 z87wEHz7fdx2ThqiDlbG4v/0p9rE1axLACQdg0uYZYT8p7fz9sbkwM9Ei
 ze/9rgmk4HRI+VlqdMYhbkZ30bfR1v8GXrJYlb4rF7vQc8F+qpJb6duQk
 IF40ITvaoEigFkZ0Na4T541jooyM9uCcGM9IEkggyBWkwnAh0tq/uJdjy
 NtpqgDiZghry8cDquB5CXpX1MQrVYKgEWB7M4WbaMkmyyYjmrWcY4g/mO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="397014991"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="397014991"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:47:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775391423"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775391423"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:47:48 -0800
Message-ID: <ea7ef5d1-c1bc-caac-6106-ab7a5b66d97f@linux.intel.com>
Date: Thu, 7 Dec 2023 13:47:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/9] drm/xe/xe2: Update emit_pte to use compression
 enabled PAT index
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-7-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231207091922.1224800-7-himal.prasad.ghimiray@intel.com>
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


On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
> For indirect accessed buffer use compression enabled PAT index.
>
> v2:
>   - Fix parameter name.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>   drivers/gpu/drm/xe/xe_migrate.c       | 20 ++++++++++++++------
>   2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 83d6a66ed369..f77477f7e9fa 100644
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
> index 98dca906a023..1bfb249680f4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -416,15 +416,23 @@ static u32 pte_update_size(struct xe_migrate *m,
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
> +		pat_index = is_comp_pte ? 12 : xe->pat.idx[XE_CACHE_NONE];

Please use a relevant define instead of  "12".

> +	else
> +		pat_index = xe->pat.idx[XE_CACHE_WB];
> +
>   	/*
>   	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
>   	 * we're only emitting VRAM PTEs during sanity tests, so when
> @@ -722,19 +730,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
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
> @@ -975,7 +983,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   
>   		/* Preemption is enabled again by the ring ops. */
>   		if (!clear_vram) {
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
>   				 bo);
>   		} else {
>   			xe_res_next(&src_it, clear_L0);
