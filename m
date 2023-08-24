Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5E4C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 17:39:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2482710E052;
	Thu, 24 Aug 2023 17:39:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B20410E052
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692898779; x=1724434779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZLi2pdPLp66cCrIw2DfgEW5+tmjTz+AjX8PPyxRvsDQ=;
 b=dbdfcCksgHeKUNXh2ll4oDd7r9qmJxEEu9oicwFW8y2DUJsQ8xqYSqSv
 rZQVTgSY+dfF9gKRWqZcxH08jX9yepQu+n4xQ5LKjyGO5IzSStc5uy/cL
 dXN1jeP2wY2Vy2SzHCtUqwAmPquU2BVEh7uHHudRcGSX0FK1/jI0gLhsv
 j3st8V3iepD1btGw2JJIXVXquwx7v8tm/swuDPBRobTStFHZpPP8XyHzx
 xB9IGt3fHtNgq0kalE+l6bB38sI/EDbAPNcPJ8HXUdKlXoMOCgsN45m7K
 B4dXRoUMdLUbLnoKAngJxTv85z6iucEnrUqPS/9b+p8/6or1+YtfahO+q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440865186"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="440865186"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 10:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="730739848"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="730739848"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 10:39:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 24 Aug 2023 23:16:18 +0530
Message-Id: <20230824174618.1560317-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 53 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  2 ++
 drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
 drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
 5 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ab682d61e3c..4192bfcd8013 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -776,6 +776,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
+	/*
+	* TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
+	* so if we moved from VRAM make sure to unlink this from the userfault
+	* tracking.
+	*/
+	if (mem_type_is_vram(old_mem_type)) {
+		spin_lock(&xe->mem_access.vram_userfault_lock);
+		if (!list_empty(&bo->vram_userfault_link))
+			list_del_init(&bo->vram_userfault_link);
+		spin_unlock(&xe->mem_access.vram_userfault_lock);
+	}
+
 	xe_device_mem_access_put(xe);
 	trace_printk("new_mem->mem_type=%d\n", new_mem->mem_type);
 
@@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
+	struct xe_bo *bo = ttm_to_xe_bo(tbo);
+	struct xe_device *xe = to_xe_device(ddev);
 	vm_fault_t ret;
 	int idx, r = 0;
 
@@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (ret)
 		return ret;
 
-	if (drm_dev_enter(ddev, &idx)) {
-		struct xe_bo *bo = ttm_to_xe_bo(tbo);
+	if (tbo->resource->bus.is_iomem)
+		xe_device_mem_access_get(xe);
 
+	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
 		if (should_migrate_to_system(bo)) {
@@ -1127,10 +1142,25 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
+
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
+		goto out_rpm;
+	/*
+	 * ttm_bo_vm_reserve() already has dma_resv_lock.
+	 * vram_userfault_count is protected by dma_resv lock and rpm wakeref.
+	 */
+	if (ret == VM_FAULT_NOPAGE && xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count) {
+		bo->vram_userfault_count = 1;
+		spin_lock(&xe->mem_access.vram_userfault_lock);
+		list_add(&bo->vram_userfault_link, &xe->mem_access.vram_userfault_list);
+		spin_unlock(&xe->mem_access.vram_userfault_lock);
 
+		XE_WARN_ON(!tbo->resource->bus.is_iomem);
+	}
 	dma_resv_unlock(tbo->base.resv);
+out_rpm:
+	if(tbo->resource->bus.is_iomem && xe_device_mem_access_ongoing(xe))
+		xe_device_mem_access_put(xe);
 	return ret;
 }
 
@@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	return err;
 }
 
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	struct ttm_device *bdev = tbo->bdev;
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
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..6b86f326c700 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index f6ee920303af..cdca91a378c4 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -68,6 +68,12 @@ struct xe_bo {
 	struct llist_node freed;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
+	/**
+	 * Whether the object is currently in fake offset mmap backed by vram.
+	 */
+	unsigned int vram_userfault_count;
+	struct list_head vram_userfault_link;
+
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 750e1f0d3339..c345fb483af1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -328,6 +328,26 @@ struct xe_device {
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
 
 	/** @d3cold: Encapsulate d3cold related stuff */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 0f06d8304e17..51cde1db930e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_init(xe);
+	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
+	spin_lock_init(&xe->mem_access.vram_userfault_lock);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
@@ -205,6 +207,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
+	struct xe_bo *bo, *on;
 	struct xe_gt *gt;
 	u8 id;
 	int err = 0;
@@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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

