Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184CBC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 13:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFC310E704;
	Wed,  6 Dec 2023 13:25:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7AE10E704
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701869146; x=1733405146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mo4BlbRyriF/HFxHFbKH6of8sYtq0H99MAFGXVMEkwE=;
 b=Y4nzz042p7xVPUriWEph+P3NrPjdU6GsHGHzuo10iwFGUEM56z2aTk3m
 TsU39WwrIXO6Zs9uQ0B6V7qk340LbUeSAymm0Azu0x6ns52O3cem+pvws
 km0Amz882KjSRf58muaqwgTxO/E6/0KnHHcXeYYLuHCXRC2NvjYHtBcKv
 LUQtWu+9IiiVVeIUwST5R1/ey5TPm8/CnCD4/D55s5GsaNeLKG1S3zE9T
 nE27ccVevea0KJyT2kutLYSOwvrk2aWaT9PpN2OFjqfMGlOV0R63lRH5w
 H/TTtIRkixVBwjIMKFat74kZLFAJFs3oqByNlPSHZEX9pnnWB77MkYXHT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12773278"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="12773278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771303851"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="771303851"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 05:25:43 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 19:04:21 +0530
Message-Id: <20231206133421.3295163-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206133421.3295163-1-badal.nilawar@intel.com>
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
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
Cc: matthew.auld@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Release all mmap mappings for all vram objects which are associated
with userfault such that, while pcie function in D3hot, any access
to memory mappings will raise a userfault.

Upon userfault, in order to access memory mappings, if graphics
function is in D3 then runtime resume of dgpu will be triggered to
transition to D0.

Previous commit has blocked the rpm but let's make sure that rpm
does not get blocked for headed cards(client's parts).
Above pagefault approach will be  useful for headed cards to save the
power when display is off and there are active mmap mappings.

v2:
  - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
  - Avoid iomem check before bo migration check as bo can migrate
    to system memory (Matthew Auld)
v3:
  - Apply pagefault approach for headed cards.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 62 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |  5 +++
 drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++
 drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
 5 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5741948a2a51..419bc5c55aa7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -797,6 +797,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
+	/*
+	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
+	 * so if we moved from VRAM make sure to unlink this from the userfault
+	 * tracking.
+	 */
+	if (mem_type_is_vram(old_mem_type)) {
+		spin_lock(&xe->mem_access.vram_userfault_lock);
+		if (INTEL_DISPLAY_ENABLED(xe) && !list_empty(&bo->vram_userfault_link))
+			list_del_init(&bo->vram_userfault_link);
+		spin_unlock(&xe->mem_access.vram_userfault_lock);
+	}
+
 	xe_device_mem_access_put(xe);
 
 out:
@@ -1125,6 +1137,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
+	struct xe_bo *bo = NULL;
+	struct xe_device *xe = to_xe_device(ddev);
 	vm_fault_t ret;
 	int idx, r = 0;
 
@@ -1133,7 +1147,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		return ret;
 
 	if (drm_dev_enter(ddev, &idx)) {
-		struct xe_bo *bo = ttm_to_xe_bo(tbo);
+		bo = ttm_to_xe_bo(tbo);
 
 		trace_xe_bo_cpu_fault(bo);
 
@@ -1152,10 +1166,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
+
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
+	/*
+	 * ttm_bo_vm_reserve() already has dma_resv_lock.
+	 * vram_userfault_count is protected by dma_resv lock and rpm wakeref.
+	 */
+	if (INTEL_DISPLAY_ENABLED(xe) && ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {
+		if (tbo->resource->bus.is_iomem) {
+			dma_resv_assert_held(tbo->base.resv);
+
+			xe_device_mem_access_get(xe);
+
+			bo->vram_userfault_count = 1;
+
+			spin_lock(&xe->mem_access.vram_userfault_lock);
+			list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault_list);
+			spin_unlock(&xe->mem_access.vram_userfault_lock);
+
+			xe_device_mem_access_put(xe);
+		}
+	}
 
 	dma_resv_unlock(tbo->base.resv);
+
 	return ret;
 }
 
@@ -1167,7 +1202,7 @@ static void xe_ttm_bo_vm_close(struct vm_area_struct *vma)
 
 	ttm_bo_vm_close(vma);
 
-	if (tbo->resource->bus.is_iomem)
+	if (!INTEL_DISPLAY_ENABLED(xe) && tbo->resource->bus.is_iomem)
 		xe_device_mem_access_put(xe);
 }
 
@@ -1190,7 +1225,7 @@ int xe_drm_gem_ttm_mmap(struct drm_gem_object *gem,
 	if (ret < 0)
 		return ret;
 
-	if (tbo->resource->bus.is_iomem)
+	if (!INTEL_DISPLAY_ENABLED(xe) && tbo->resource->bus.is_iomem)
 		xe_device_mem_access_get(xe);
 
 	return 0;
@@ -2296,6 +2331,27 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	return err;
 }
 
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	struct ttm_device *bdev = tbo->bdev;
+	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+
+	if (!INTEL_DISPLAY_ENABLED(xe))
+		return;
+
+	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
+
+	/*
+	 * We have exclusive access here via runtime suspend. All other callers
+	 * must first grab the rpm wakeref.
+	 */
+	XE_WARN_ON(!bo->vram_userfault_count);
+	list_del(&bo->vram_userfault_link);
+	bo->vram_userfault_count = 0;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 098ccab7fa1e..fd9ec9fc9152 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -239,6 +239,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f71dbc518958..72c667dc664e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -84,6 +84,11 @@ struct xe_bo {
 	 * objects.
 	 */
 	u16 cpu_caching;
+	/**
+	 * Whether the object is currently in fake offset mmap backed by vram.
+	 */
+	unsigned int vram_userfault_count;
+	struct list_head vram_userfault_link;
 };
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9a212dbdb8a4..1aa303db80c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -363,6 +363,26 @@ struct xe_device {
 	struct {
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
+		/*
+		 *  Protects access to vram usefault list.
+		 *  It is required, if we are outside of the runtime suspend path,
+		 *  access to @vram_userfault_list requires always first grabbing the
+		 *  runtime pm, to ensure we can't race against runtime suspend.
+		 *  Once we have that we also need to grab @vram_userfault_lock,
+		 *  at which point we have exclusive access.
+		 *  The runtime suspend path is special since it doesn't really hold any locks,
+		 *  but instead has exclusive access by virtue of all other accesses requiring
+		 *  holding the runtime pm wakeref.
+		 */
+		spinlock_t vram_userfault_lock;
+
+		/*
+		 *  Keep list of userfaulted gem obj, which require to release their
+		 *  mmap mappings at runtime suspend path.
+		 */
+		struct list_head vram_userfault_list;
+
+		bool vram_userfault_ongoing;
 	} mem_access;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b429c2876a76..bc1cb081e6e5 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -181,6 +181,8 @@ void xe_pm_init(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_init(xe);
+	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
+	spin_lock_init(&xe->mem_access.vram_userfault_lock);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
@@ -214,6 +216,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
+	struct xe_bo *bo, *on;
 	struct xe_gt *gt;
 	u8 id;
 	int err = 0;
@@ -247,6 +250,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	lock_map_acquire(&xe_device_mem_access_lockdep_map);
 
+	list_for_each_entry_safe(bo, on,
+				 &xe->mem_access.vram_userfault_list, vram_userfault_link)
+		xe_bo_runtime_pm_release_mmap_offset(bo);
+
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
-- 
2.25.1

