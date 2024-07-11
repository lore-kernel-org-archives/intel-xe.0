Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50A0C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 14:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EC10E2EE;
	Thu, 11 Jul 2024 14:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QA06OfTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7266210E2EE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 14:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720708041; x=1752244041;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Pzwnat+M+29ug4+io5Pu5z+dW1NeRyiaIT7X2lnJxzA=;
 b=QA06OfTd3LFyVo3eFKezR8A7F8g99Rv6MkNDbgy3XciPZw7OW9leUHMy
 fiVayXkqNvUvCIRm1szSO7GLOEvPBxoMojIUD96dDDl6ZbbYcdj+SMM+y
 joHV0lbny/xLG7iHuKcc4IFZbYKTWnTos9L54kZnYd8WmzhBK5RSFJV3p
 +23IGeJ0+wDD6gAFsCUwD0kfO22sYV7S67VjA4JszCumSUw+Y4qDd1a+d
 Isg8Q2gEs++9Ztl2BLf9eZ70b4EVbtbcYpNRa+Y8MyYeagPxq6jCkquks
 O4+uvXr0x0rlTojV1QxX+RqheJ1R4bK6vEenhUoQ408wLwYSqCGPYFrXe g==;
X-CSE-ConnectionGUID: BlU7PmuTT4+WQDczCy3iCA==
X-CSE-MsgGUID: /lzbBHu6RDqzJqdRtEgNoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18200624"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18200624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 07:27:21 -0700
X-CSE-ConnectionGUID: Poc+SuYSRDCJtPPO/Uw5Vw==
X-CSE-MsgGUID: V9OHz2oPQXOStMOPpd3I1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48641746"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.34])
 ([10.245.245.34])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 07:27:19 -0700
Message-ID: <c58509fa-aca4-47c7-b1a7-1ae2137ce932@intel.com>
Date: Thu, 11 Jul 2024 15:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/migrate: Add kunit to test clear functionality
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, himal.prasad.ghimiray@intel.com,
 lucas.demarchi@intel.com
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <5ab88aebf91c7f7f35fd3a0d4601df80fde9f03d.1720689220.git.akshata.jahagirdar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <5ab88aebf91c7f7f35fd3a0d4601df80fde9f03d.1720689220.git.akshata.jahagirdar@intel.com>
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

On 11/07/2024 10:18, Akshata Jahagirdar wrote:
> This test verifies if the main and ccs data are cleared during bo creation.
> The motivation to use Kunit instead of IGT is that, although we can verify
> whether the data is zero following bo creation,
> we cannot confirm whether the zero value after bo creation is the result of
> our clear function or simply because the initial data present there was zero.

One idea might be to pre-fill and release some amount of vram at the 
start of the test. Then maybe spawn a number threads each allocating a 
bit of vram (also various sizes) in a loop, each time dirtying the pages 
and ccs before releasing it. There should be some amount of page re-use 
to catch issues, plus is a lot more nasty with multiple threads and 
varying sizes. Such a test can also be useful for lnl, just that we use 
system memory instead of vram. Or maybe we already have something like that?

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 271 +++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>   3 files changed, 273 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 962f6438e219..6538c0e6b57e 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -359,3 +359,274 @@ void xe_migrate_sanity_kunit(struct kunit *test)
>   	xe_call_for_each_device(migrate_test_run_device);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
> +
> +static struct dma_fence *blt_copy(struct xe_tile *tile,
> +				struct xe_bo *src_bo, struct xe_bo *dst_bo,
> +				bool copy_only_ccs, const char *str, struct kunit *test)
> +{
> +	struct xe_gt *gt = tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct dma_fence *fence = NULL;
> +	u64 size = src_bo->size;
> +	struct xe_res_cursor src_it, dst_it;
> +	struct ttm_resource *src = src_bo->ttm.resource, *dst = dst_bo->ttm.resource;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	u32 src_L0_pt, dst_L0_pt;
> +	u64 src_L0, dst_L0;
> +	int err;
> +	bool src_is_vram = mem_type_is_vram(src->mem_type);
> +	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> +
> +	if (!src_is_vram)
> +		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +	else
> +		xe_res_first(src, 0, size, &src_it);
> +
> +	if (!dst_is_vram)
> +		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &dst_it);
> +	else
> +		xe_res_first(dst, 0, size, &dst_it);
> +
> +	while (size) {
> +		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
> +		struct xe_sched_job *job;
> +		struct xe_bb *bb;
> +		u32 flush_flags = 0;
> +		u32 update_idx;
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
> +
> +		src_L0 = min(src_L0, dst_L0);
> +
> +		batch_size += pte_update_size(m, src_is_vram, src_is_vram, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		batch_size += pte_update_size(m, dst_is_vram, dst_is_vram, dst, &dst_it, &src_L0,
> +					      &dst_L0_ofs, &dst_L0_pt, 0,
> +					      avail_pts, avail_pts);
> +
> +		/* Add copy commands size here */
> +		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +			((xe_device_has_flat_ccs(xe) && copy_only_ccs) ? EMIT_COPY_CCS_DW : 0);
> +
> +		bb = xe_bb_new(gt, batch_size, xe->info.has_usm);
> +		if (IS_ERR(bb)) {
> +			err = PTR_ERR(bb);
> +			goto err_sync;
> +		}
> +
> +		if (src_is_vram)
> +			xe_res_next(&src_it, src_L0);
> +		else
> +			emit_pte(m, bb, src_L0_pt, src_is_vram, false,
> +				 &src_it, src_L0, src);
> +
> +		if (dst_is_vram)
> +			xe_res_next(&dst_it, src_L0);
> +		else
> +			emit_pte(m, bb, dst_L0_pt, dst_is_vram, false,
> +				 &dst_it, src_L0, dst);
> +
> +		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> +		update_idx = bb->len;
> +		if (!copy_only_ccs)
> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
> +
> +		if (copy_only_ccs)
> +			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +					src_is_vram, dst_L0_ofs,
> +					dst_is_vram, src_L0, dst_L0_ofs, copy_only_ccs);
> +
> +		mutex_lock(&m->job_mutex);

This is not allowed anymore it seems. CI is also complaing about this. 
See: 50e52592fbe791d96ec2cb431d158cc6bc495be5

Not sure what else has changed.

> +
> +		job = xe_bb_create_migration_job(m->q, bb,
> +						 xe_migrate_batch_base(m, xe->info.has_usm),
> +						 update_idx);
> +		if (IS_ERR(job)) {
> +			err = PTR_ERR(job);
> +			goto err;
> +		}
> +
> +		xe_sched_job_add_migrate_flush(job, flush_flags);
> +
> +		xe_sched_job_arm(job);
> +		dma_fence_put(fence);
> +		fence = dma_fence_get(&job->drm.s_fence->finished);
> +		xe_sched_job_push(job);
> +
> +		dma_fence_put(m->fence);
> +		m->fence = dma_fence_get(fence);
> +
> +		mutex_unlock(&m->job_mutex);
> +
> +		xe_bb_free(bb, fence);
> +		size -= src_L0;
> +		continue;
> +
> +err:
> +		mutex_unlock(&m->job_mutex);
> +		xe_bb_free(bb, NULL);
> +
> +err_sync:
> +		if (fence) {
> +			dma_fence_wait(fence, false);
> +			dma_fence_put(fence);
> +		}
> +		return ERR_PTR(err);
> +	}
> +
> +	return fence;
> +}
> +
> +static void test_clear(struct xe_device *xe, struct xe_tile *tile,
> +			struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct kunit *test)
> +{
> +	struct dma_fence *fence;
> +	u64 expected, retval;
> +
> +	expected = 0xd0d0d0d0d0d0d0d0;
> +	xe_map_memset(xe, &sys_bo->vmap, 0, 0xd0, sys_bo->size);
> +
> +	fence = blt_copy(tile, sys_bo, vram_bo, false, "Blit copy from sysmem to vram", test);
> +	if (!sanity_fence_failed(xe, fence, "Blit copy from sysmem to vram", test)) {
> +		retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
> +		if (retval == expected)
> +			KUNIT_FAIL(test, "Sanity check failed: VRAM must have compressed value\n");
> +	}
> +	dma_fence_put(fence);
> +
> +	fence = blt_copy(tile, vram_bo, sys_bo, false, "Blit copy from vram to sysmem", test);
> +	if (!sanity_fence_failed(xe, fence, "Blit copy from vram to sysmem", test)) {
> +		retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
> +		check(retval, expected, "Decompressed value must be equal to initial value", test);
> +		retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
> +		check(retval, expected, "Decompressed value must be equal to initial value", test);
> +	}
> +	dma_fence_put(fence);
> +
> +	kunit_info(test, "Clear vram buffer object\n");
> +	expected = 0x0000000000000000;
> +	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
> +
> +	fence = blt_copy(tile, vram_bo, sys_bo,
> +				false, "Blit copy from vram to sysmem", test);
> +	if (!sanity_fence_failed(xe, fence, "Clear main buffer data", test)) {
> +		retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
> +		check(retval, expected, "Clear main buffer first value", test);
> +		retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
> +		check(retval, expected, "Clear main buffer last value", test);
> +	}
> +	dma_fence_put(fence);
> +
> +	fence = blt_copy(tile, vram_bo, sys_bo,
> +			true, "Blit surf copy from vram to sysmem", test);
> +	if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
> +		retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
> +		check(retval, expected, "Clear ccs data first value", test);
> +		retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
> +		check(retval, expected, "Clear ccs data last value", test);
> +	}
> +	dma_fence_put(fence);
> +}
> +
> +static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
> +{
> +	struct xe_bo *sys_bo, *vram_bo;
> +	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +	long ret;
> +
> +	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
> +			ttm_bo_type_device, XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +
> +	if (IS_ERR(sys_bo)) {
> +		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> +			   PTR_ERR(sys_bo));
> +		return;
> +	}
> +
> +	xe_bo_lock(sys_bo, false);
> +	ret = xe_bo_validate(sys_bo, NULL, false);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
> +		goto out_unlock;

vram_bo is not initialized here.

> +	}
> +
> +	ret = xe_bo_vmap(sys_bo);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
> +		goto out_unlock;
> +	}
> +	xe_bo_unlock(sys_bo);
> +
> +	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
> +			       ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	if (IS_ERR(vram_bo)) {
> +		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> +			   PTR_ERR(vram_bo));
> +		return;

Missing bo_put?

> +	}
> +
> +	xe_bo_lock(vram_bo, false);
> +	ret = xe_bo_validate(vram_bo, NULL, false);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> +		goto out_unlock;
> +	}
> +
> +	ret = xe_bo_vmap(vram_bo);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
> +		goto out_unlock;
> +	}
> +
> +	test_clear(xe, tile, sys_bo, vram_bo, test);
> +	xe_bo_unlock(vram_bo);
> +
> +	xe_bo_lock(vram_bo, false);
> +	xe_bo_vunmap(vram_bo);
> +	xe_bo_unlock(vram_bo);
> +
> +	xe_bo_lock(sys_bo, false);
> +	xe_bo_vunmap(sys_bo);
> +	xe_bo_unlock(sys_bo);
> +out_unlock:

There is no unlock here.

> +	xe_bo_put(vram_bo);
> +	xe_bo_put(sys_bo);
> +}
> +
> +static int validate_ccs_test_run_device(struct xe_device *xe)
> +{
> +	struct kunit *test = xe_cur_kunit();
> +	struct xe_tile *tile;
> +	int id;
> +
> +	if (!xe_device_has_flat_ccs(xe)) {
> +		kunit_info(test, "Skipping non-flat-ccs device.\n");
> +		return 0;
> +	}
> +
> +	if (!(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))) {
> +		kunit_info(test, "Skipping non-xe2 discrete device %s.\n",
> +			   dev_name(xe->drm.dev));
> +		return 0;
> +	}

So is there something else for xe2 igpu and ccs?

> +
> +	xe_pm_runtime_get(xe);
> +
> +	for_each_tile(tile, xe, id)
> +		validate_ccs_test_run_tile(xe, tile, test);
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +void xe_validate_ccs_kunit(struct kunit *test)
> +{
> +	xe_call_for_each_device(validate_ccs_test_run_device);
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_validate_ccs_kunit);
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> index eb0d8963419c..49b9ef060ad3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
> @@ -9,6 +9,7 @@
>   
>   static struct kunit_case xe_migrate_tests[] = {
>   	KUNIT_CASE(xe_migrate_sanity_kunit),
> +	KUNIT_CASE(xe_validate_ccs_kunit),
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> index 7c645c66824f..dc0ecfdfad39 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
> @@ -9,5 +9,6 @@
>   struct kunit;
>   
>   void xe_migrate_sanity_kunit(struct kunit *test);
> +void xe_validate_ccs_kunit(struct kunit *test);
>   
>   #endif
