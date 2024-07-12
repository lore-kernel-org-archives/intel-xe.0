Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B575C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 12:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0264610E0B7;
	Fri, 12 Jul 2024 12:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdzru95n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C0810E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 12:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720789018; x=1752325018;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=6WGceDsHqmYhdZ3MGGubhI4K2kXYbfIaXIsYmV8n7ew=;
 b=mdzru95nOuyz631U/L9M12yWHB5lzBGvuQFlQCVr+kaZQTi7zePK/lkF
 27WQpJqQ97ecxGW0UVWbohSO1wT5f4WsqCCctuobD2bFMgd55DXgmIXvv
 2e2exUxw+92YVgY0NoFrISMiZwn+/UsPuh5Dy9Uwx8dzwGvL9PopbzWRF
 6UWhYDWH1GghrXRbAiqTkkIJo181yz5u8++i1p75QhvxMVYG1rRaiVW4z
 VZEH+a8z5l9IlKwfVikJ6E3F1FbeEJSn351htX7DyXCxfvkPvGI6FEyqK
 GdcNJHmFDQP3ZwI/WB2UjPusbHVhUS7IGkP0FIf1co2HN9wuIw8e4qtDB g==;
X-CSE-ConnectionGUID: YUyemLtESv6czGpTzaP3Tw==
X-CSE-MsgGUID: CM80ZB90SP6pLKaSm+lowA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17845563"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208,217";a="17845563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:56:58 -0700
X-CSE-ConnectionGUID: 9/+/sdttTUqce6LqyssP6w==
X-CSE-MsgGUID: SvkkwnxBTwer9HKA6jVTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208,217";a="49007409"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:56:56 -0700
Content-Type: multipart/alternative;
 boundary="------------176Hl0Mz90o00c5XaKFcGFBX"
Message-ID: <6bd7da87-542f-4e80-af49-ea33febd7dca@linux.intel.com>
Date: Fri, 12 Jul 2024 14:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/migrate: Add kunit to test clear functionality
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
 <0d8edcaf5418dfcb5ee3088e07ae2c04c2749e61.1720766122.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <0d8edcaf5418dfcb5ee3088e07ae2c04c2749e61.1720766122.git.akshata.jahagirdar@intel.com>
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

This is a multi-part message in MIME format.
--------------176Hl0Mz90o00c5XaKFcGFBX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/12/2024 8:39 AM, Akshata Jahagirdar wrote:
> From: "Jahagirdar, Akshata"<akshata.jahagirdar@intel.com>
>
> This test verifies if the main and ccs data are cleared during bo creation.
> The motivation to use Kunit instead of IGT is that, although we can verify
> whether the data is zero following bo creation,
> we cannot confirm whether the zero value after bo creation is the result of
> our clear function or simply because the initial data present was zero.
>
> Signed-off-by: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
> Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 272 +++++++++++++++++++++
>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>   3 files changed, 274 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 962f6438e219..0c9a30dac46d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -359,3 +359,275 @@ void xe_migrate_sanity_kunit(struct kunit *test)
>   	xe_call_for_each_device(migrate_test_run_device);
>   }
>   EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
> +
> +static struct dma_fence *blt_copy(struct xe_tile *tile,
> +				  struct xe_bo *src_bo, struct xe_bo *dst_bo,
> +				  bool copy_only_ccs, const char *str, struct kunit *test)
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
> +							  src_is_vram, dst_L0_ofs,
> +							  dst_is_vram, src_L0, dst_L0_ofs,
> +							  copy_only_ccs);
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
> +		mutex_lock(&m->job_mutex);
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
> +		       struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct kunit *test)
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


Missing dma_fence_put(). With that

Acked-by: Nirmoy Das <nirmoy.das@intel.com>

> +
> +	fence = blt_copy(tile, vram_bo, sys_bo,
> +			 false, "Blit copy from vram to sysmem", test);
> +	if (!sanity_fence_failed(xe, fence, "Clear main buffer data", test)) {
> +		retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
> +		check(retval, expected, "Clear main buffer first value", test);
> +		retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
> +		check(retval, expected, "Clear main buffer last value", test);
> +	}
> +	dma_fence_put(fence);
> +
> +	fence = blt_copy(tile, vram_bo, sys_bo,
> +			 true, "Blit surf copy from vram to sysmem", test);
> +	if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
> +		retval = xe_map_rd(xe, &sys_bo->vmap, 0, u64);
> +		check(retval, expected, "Clear ccs data first value", test);
> +		retval = xe_map_rd(xe, &sys_bo->vmap, sys_bo->size - 8, u64);
> +		check(retval, expected, "Clear ccs data last value", test);
> +	}
> +	dma_fence_put(fence);
> +}
> +
> +static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
> +				       struct kunit *test)
> +{
> +	struct xe_bo *sys_bo, *vram_bo;
> +	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> +	long ret;
> +
> +	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +				   DRM_XE_GEM_CPU_CACHING_WC, ttm_bo_type_device,
> +				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
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
> +		goto out_put;
> +	}
> +
> +	ret = xe_bo_vmap(sys_bo);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
> +		goto out_put;
> +	}
> +	xe_bo_unlock(sys_bo);
> +
> +	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
> +				    ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	if (IS_ERR(vram_bo)) {
> +		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> +			   PTR_ERR(vram_bo));
> +		return;
> +	}
> +
> +	xe_bo_lock(vram_bo, false);
> +	ret = xe_bo_validate(vram_bo, NULL, false);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> +		goto out_put;
> +	}
> +
> +	ret = xe_bo_vmap(vram_bo);
> +	if (ret) {
> +		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
> +		goto out_put;
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
> +out_put:
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
--------------176Hl0Mz90o00c5XaKFcGFBX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/12/2024 8:39 AM, Akshata
      Jahagirdar wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:0d8edcaf5418dfcb5ee3088e07ae2c04c2749e61.1720766122.git.akshata.jahagirdar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: "Jahagirdar, Akshata" <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>

This test verifies if the main and ccs data are cleared during bo creation.
The motivation to use Kunit instead of IGT is that, although we can verify
whether the data is zero following bo creation,
we cannot confirm whether the zero value after bo creation is the result of
our clear function or simply because the initial data present was zero.

Signed-off-by: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>
Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c      | 272 +++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
 drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
 3 files changed, 274 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 962f6438e219..0c9a30dac46d 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -359,3 +359,275 @@ void xe_migrate_sanity_kunit(struct kunit *test)
 	xe_call_for_each_device(migrate_test_run_device);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_migrate_sanity_kunit);
+
+static struct dma_fence *blt_copy(struct xe_tile *tile,
+				  struct xe_bo *src_bo, struct xe_bo *dst_bo,
+				  bool copy_only_ccs, const char *str, struct kunit *test)
+{
+	struct xe_gt *gt = tile-&gt;primary_gt;
+	struct xe_migrate *m = tile-&gt;migrate;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u64 size = src_bo-&gt;size;
+	struct xe_res_cursor src_it, dst_it;
+	struct ttm_resource *src = src_bo-&gt;ttm.resource, *dst = dst_bo-&gt;ttm.resource;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u32 src_L0_pt, dst_L0_pt;
+	u64 src_L0, dst_L0;
+	int err;
+	bool src_is_vram = mem_type_is_vram(src-&gt;mem_type);
+	bool dst_is_vram = mem_type_is_vram(dst-&gt;mem_type);
+
+	if (!src_is_vram)
+		xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &amp;src_it);
+	else
+		xe_res_first(src, 0, size, &amp;src_it);
+
+	if (!dst_is_vram)
+		xe_res_first_sg(xe_bo_sg(dst_bo), 0, size, &amp;dst_it);
+	else
+		xe_res_first(dst, 0, size, &amp;dst_it);
+
+	while (size) {
+		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
+		struct xe_sched_job *job;
+		struct xe_bb *bb;
+		u32 flush_flags = 0;
+		u32 update_idx;
+		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+
+		src_L0 = xe_migrate_res_sizes(m, &amp;src_it);
+		dst_L0 = xe_migrate_res_sizes(m, &amp;dst_it);
+
+		src_L0 = min(src_L0, dst_L0);
+
+		batch_size += pte_update_size(m, src_is_vram, src_is_vram, src, &amp;src_it, &amp;src_L0,
+					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
+					      avail_pts);
+
+		batch_size += pte_update_size(m, dst_is_vram, dst_is_vram, dst, &amp;dst_it, &amp;src_L0,
+					      &amp;dst_L0_ofs, &amp;dst_L0_pt, 0,
+					      avail_pts, avail_pts);
+
+		/* Add copy commands size here */
+		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
+			((xe_device_has_flat_ccs(xe) &amp;&amp; copy_only_ccs) ? EMIT_COPY_CCS_DW : 0);
+
+		bb = xe_bb_new(gt, batch_size, xe-&gt;info.has_usm);
+		if (IS_ERR(bb)) {
+			err = PTR_ERR(bb);
+			goto err_sync;
+		}
+
+		if (src_is_vram)
+			xe_res_next(&amp;src_it, src_L0);
+		else
+			emit_pte(m, bb, src_L0_pt, src_is_vram, false,
+				 &amp;src_it, src_L0, src);
+
+		if (dst_is_vram)
+			xe_res_next(&amp;dst_it, src_L0);
+		else
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, false,
+				 &amp;dst_it, src_L0, dst);
+
+		bb-&gt;cs[bb-&gt;len++] = MI_BATCH_BUFFER_END;
+		update_idx = bb-&gt;len;
+		if (!copy_only_ccs)
+			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
+
+		if (copy_only_ccs)
+			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
+							  src_is_vram, dst_L0_ofs,
+							  dst_is_vram, src_L0, dst_L0_ofs,
+							  copy_only_ccs);
+
+		job = xe_bb_create_migration_job(m-&gt;q, bb,
+						 xe_migrate_batch_base(m, xe-&gt;info.has_usm),
+						 update_idx);
+		if (IS_ERR(job)) {
+			err = PTR_ERR(job);
+			goto err;
+		}
+
+		xe_sched_job_add_migrate_flush(job, flush_flags);
+
+		mutex_lock(&amp;m-&gt;job_mutex);
+		xe_sched_job_arm(job);
+		dma_fence_put(fence);
+		fence = dma_fence_get(&amp;job-&gt;drm.s_fence-&gt;finished);
+		xe_sched_job_push(job);
+
+		dma_fence_put(m-&gt;fence);
+		m-&gt;fence = dma_fence_get(fence);
+
+		mutex_unlock(&amp;m-&gt;job_mutex);
+
+		xe_bb_free(bb, fence);
+		size -= src_L0;
+		continue;
+
+err:
+		xe_bb_free(bb, NULL);
+
+err_sync:
+		if (fence) {
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		}
+		return ERR_PTR(err);
+	}
+
+	return fence;
+}
+
+static void test_clear(struct xe_device *xe, struct xe_tile *tile,
+		       struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct kunit *test)
+{
+	struct dma_fence *fence;
+	u64 expected, retval;
+
+	expected = 0xd0d0d0d0d0d0d0d0;
+	xe_map_memset(xe, &amp;sys_bo-&gt;vmap, 0, 0xd0, sys_bo-&gt;size);
+
+	fence = blt_copy(tile, sys_bo, vram_bo, false, "Blit copy from sysmem to vram", test);
+	if (!sanity_fence_failed(xe, fence, "Blit copy from sysmem to vram", test)) {
+		retval = xe_map_rd(xe, &amp;vram_bo-&gt;vmap, 0, u64);
+		if (retval == expected)
+			KUNIT_FAIL(test, "Sanity check failed: VRAM must have compressed value\n");
+	}
+	dma_fence_put(fence);
+
+	fence = blt_copy(tile, vram_bo, sys_bo, false, "Blit copy from vram to sysmem", test);
+	if (!sanity_fence_failed(xe, fence, "Blit copy from vram to sysmem", test)) {
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, 0, u64);
+		check(retval, expected, "Decompressed value must be equal to initial value", test);
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, sys_bo-&gt;size - 8, u64);
+		check(retval, expected, "Decompressed value must be equal to initial value", test);
+	}
+	dma_fence_put(fence);
+
+	kunit_info(test, "Clear vram buffer object\n");
+	expected = 0x0000000000000000;
+	fence = xe_migrate_clear(tile-&gt;migrate, vram_bo, vram_bo-&gt;ttm.resource);</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Missing <span style="white-space: pre-wrap">dma_fence_put(). With that 
</span></p>
    <p><span style="white-space: pre-wrap">Acked-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</span></p>
    <blockquote type="cite"
cite="mid:0d8edcaf5418dfcb5ee3088e07ae2c04c2749e61.1720766122.git.akshata.jahagirdar@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+	fence = blt_copy(tile, vram_bo, sys_bo,
+			 false, "Blit copy from vram to sysmem", test);
+	if (!sanity_fence_failed(xe, fence, "Clear main buffer data", test)) {
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, 0, u64);
+		check(retval, expected, "Clear main buffer first value", test);
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, sys_bo-&gt;size - 8, u64);
+		check(retval, expected, "Clear main buffer last value", test);
+	}
+	dma_fence_put(fence);
+
+	fence = blt_copy(tile, vram_bo, sys_bo,
+			 true, "Blit surf copy from vram to sysmem", test);
+	if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, 0, u64);
+		check(retval, expected, "Clear ccs data first value", test);
+		retval = xe_map_rd(xe, &amp;sys_bo-&gt;vmap, sys_bo-&gt;size - 8, u64);
+		check(retval, expected, "Clear ccs data last value", test);
+	}
+	dma_fence_put(fence);
+}
+
+static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
+				       struct kunit *test)
+{
+	struct xe_bo *sys_bo, *vram_bo;
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	long ret;
+
+	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+				   DRM_XE_GEM_CPU_CACHING_WC, ttm_bo_type_device,
+				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+
+	if (IS_ERR(sys_bo)) {
+		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
+			   PTR_ERR(sys_bo));
+		return;
+	}
+
+	xe_bo_lock(sys_bo, false);
+	ret = xe_bo_validate(sys_bo, NULL, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
+		goto out_put;
+	}
+
+	ret = xe_bo_vmap(sys_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
+		goto out_put;
+	}
+	xe_bo_unlock(sys_bo);
+
+	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+				    ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	if (IS_ERR(vram_bo)) {
+		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
+			   PTR_ERR(vram_bo));
+		return;
+	}
+
+	xe_bo_lock(vram_bo, false);
+	ret = xe_bo_validate(vram_bo, NULL, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
+		goto out_put;
+	}
+
+	ret = xe_bo_vmap(vram_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
+		goto out_put;
+	}
+
+	test_clear(xe, tile, sys_bo, vram_bo, test);
+	xe_bo_unlock(vram_bo);
+
+	xe_bo_lock(vram_bo, false);
+	xe_bo_vunmap(vram_bo);
+	xe_bo_unlock(vram_bo);
+
+	xe_bo_lock(sys_bo, false);
+	xe_bo_vunmap(sys_bo);
+	xe_bo_unlock(sys_bo);
+out_put:
+	xe_bo_put(vram_bo);
+	xe_bo_put(sys_bo);
+}
+
+static int validate_ccs_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = xe_cur_kunit();
+	struct xe_tile *tile;
+	int id;
+
+	if (!xe_device_has_flat_ccs(xe)) {
+		kunit_info(test, "Skipping non-flat-ccs device.\n");
+		return 0;
+	}
+
+	if (!(GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; IS_DGFX(xe))) {
+		kunit_info(test, "Skipping non-xe2 discrete device %s.\n",
+			   dev_name(xe-&gt;drm.dev));
+		return 0;
+	}
+
+	xe_pm_runtime_get(xe);
+
+	for_each_tile(tile, xe, id)
+		validate_ccs_test_run_tile(xe, tile, test);
+
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+void xe_validate_ccs_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(validate_ccs_test_run_device);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_validate_ccs_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.c b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
index eb0d8963419c..49b9ef060ad3 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.c
@@ -9,6 +9,7 @@
 
 static struct kunit_case xe_migrate_tests[] = {
 	KUNIT_CASE(xe_migrate_sanity_kunit),
+	KUNIT_CASE(xe_validate_ccs_kunit),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate_test.h b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
index 7c645c66824f..dc0ecfdfad39 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_migrate_test.h
@@ -9,5 +9,6 @@
 struct kunit;
 
 void xe_migrate_sanity_kunit(struct kunit *test);
+void xe_validate_ccs_kunit(struct kunit *test);
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------176Hl0Mz90o00c5XaKFcGFBX--
