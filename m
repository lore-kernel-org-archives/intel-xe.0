Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D947CC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C1E10E401;
	Tue,  9 Jan 2024 11:41:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484F210E401
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704800499; x=1736336499;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/8smawMCFVWrH1qMDE3XihLv0RQAojv1ascPT+0V5Dc=;
 b=R14o9A+r/HYgIV9noCNvCpGqom/pmNQFtJgnIXGfOYE5FHIuJgAu3tDg
 PE1ZuFz/eMos45WBwWpFFjohRzJNzCi3RcSYtOVvbL4ZcmBcsVgyIfY8Q
 YVAxVhtSJ5IdxMphkgtOnDUS9OXtmvk65mGtYbuO1Zg9WpxYIwRyYulrn
 AhJ9fGIfLyPrpWBGvDHwASzNKCUTJHFEdoS7MkgEDA9DUuy2l1hEiei4U
 UxwjKt/EaeOMNqUVrl3U5szAmU8JLDVT1wK/NRaI6jSmmCKj6SG1QSn+6
 J1A5O15PPAvR5qemqX7jPzgD7ehYbXbwh9cM81E80yVzKbbqd3ppqpzyB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="484348981"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="484348981"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="954990807"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="954990807"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:41:37 -0800
Message-ID: <5b532ac1-65bf-4ef1-9a1a-f4f328b576d1@intel.com>
Date: Tue, 9 Jan 2024 11:41:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 20/20] drm/xe: Mega Kill of mem_access
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-21-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-21-rodrigo.vivi@intel.com>
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> All of these remaining cases should already be protected
> by the outer bound calls of runtime_pm
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 +--
>   drivers/gpu/drm/xe/tests/xe_bo.c       |  8 ----
>   drivers/gpu/drm/xe/tests/xe_mocs.c     |  4 --
>   drivers/gpu/drm/xe/xe_bo.c             |  5 ---
>   drivers/gpu/drm/xe/xe_device.c         | 59 --------------------------
>   drivers/gpu/drm/xe/xe_device.h         |  7 ---
>   drivers/gpu/drm/xe/xe_device_types.h   |  9 ----
>   drivers/gpu/drm/xe/xe_ggtt.c           |  6 ---
>   drivers/gpu/drm/xe/xe_gsc.c            |  3 --
>   drivers/gpu/drm/xe/xe_gt.c             | 17 --------
>   drivers/gpu/drm/xe/xe_huc_debugfs.c    |  2 -
>   drivers/gpu/drm/xe/xe_pat.c            | 10 -----
>   drivers/gpu/drm/xe/xe_pm.c             | 27 ------------
>   drivers/gpu/drm/xe/xe_query.c          |  4 --
>   drivers/gpu/drm/xe/xe_tile.c           | 10 ++---
>   drivers/gpu/drm/xe/xe_vm.c             |  7 ---
>   16 files changed, 5 insertions(+), 180 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 722c84a566073..077294ec50ece 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -190,10 +190,9 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>   	/* TODO: Consider sharing framebuffer mapping?
>   	 * embed i915_vma inside intel_framebuffer
>   	 */
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
>   	ret = mutex_lock_interruptible(&ggtt->lock);
>   	if (ret)
> -		goto out;
> +		return ret;
>   
>   	align = XE_PAGE_SIZE;
>   	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> @@ -241,8 +240,6 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>   	xe_ggtt_invalidate(ggtt);
>   out_unlock:
>   	mutex_unlock(&ggtt->lock);
> -out:
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>   	return ret;
>   }
>   
> @@ -381,4 +378,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
>   void intel_dpt_destroy(struct i915_address_space *vm)
>   {
>   	return;
> -}
> \ No newline at end of file
> +}
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 412b2e7ce40cb..97b10e597f0ad 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -164,8 +164,6 @@ static int ccs_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> -	xe_device_mem_access_get(xe);
> -
>   	for_each_tile(tile, xe, id) {
>   		/* For igfx run only for primary tile */
>   		if (!IS_DGFX(xe) && id > 0)
> @@ -173,8 +171,6 @@ static int ccs_test_run_device(struct xe_device *xe)
>   		ccs_test_run_tile(xe, tile, test);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> -
>   	return 0;
>   }
>   
> @@ -336,13 +332,9 @@ static int evict_test_run_device(struct xe_device *xe)
>   		return 0;
>   	}
>   
> -	xe_device_mem_access_get(xe);
> -
>   	for_each_tile(tile, xe, id)
>   		evict_test_run_tile(xe, tile, test);
>   
> -	xe_device_mem_access_put(xe);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 7dd34f94e8094..a12e7e2bb5861 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -45,7 +45,6 @@ static void read_l3cc_table(struct xe_gt *gt,
>   
>   	struct kunit *test = xe_cur_kunit();
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>   	mocs_dbg(&gt_to_xe(gt)->drm, "L3CC entries:%d\n", info->n_entries);
> @@ -65,7 +64,6 @@ static void read_l3cc_table(struct xe_gt *gt,
>   				   XELP_LNCFCMOCS(i).addr);
>   	}
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   }
>   
>   static void read_mocs_table(struct xe_gt *gt,
> @@ -80,7 +78,6 @@ static void read_mocs_table(struct xe_gt *gt,
>   
>   	struct kunit *test = xe_cur_kunit();
>   
> -	xe_device_mem_access_get(gt_to_xe(gt));
>   	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>   	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> @@ -100,7 +97,6 @@ static void read_mocs_table(struct xe_gt *gt,
>   				   XELP_GLOBAL_MOCS(i).addr);
>   	}
>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>   }
>   
>   static int mocs_kernel_test_run_device(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e4a3b1f6b938..056c65c2675d8 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -715,7 +715,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	xe_assert(xe, migrate);
>   
>   	trace_xe_bo_move(bo);
> -	xe_device_mem_access_get(xe);
>   
>   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>   		/*
> @@ -739,7 +738,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   
>   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>   					ret = -EINVAL;
> -					xe_device_mem_access_put(xe);
>   					goto out;
>   				}
>   
> @@ -757,7 +755,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						new_mem, handle_system_ccs);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
> -			xe_device_mem_access_put(xe);
>   			goto out;
>   		}
>   		if (!move_lacks_source) {
> @@ -782,8 +779,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		dma_fence_put(fence);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> -
>   out:
>   	return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c1c19264a58b4..cb08a4369bb9e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -44,12 +44,6 @@
>   #include "xe_wait_user_fence.h"
>   #include "xe_hwmon.h"
>   
> -#ifdef CONFIG_LOCKDEP
> -struct lockdep_map xe_device_mem_access_lockdep_map = {
> -	.name = "xe_device_mem_access_lockdep_map"
> -};
> -#endif

Did you mean to drop this? IMO we should for sure keep the lockdep 
annotations. Otherwise it is going to be really hard to validate the 
locking design and have reasonable confidence that we don't have 
deadlocks lurking, or as new users come along sprinkling rpm get in the 
wrong place.
