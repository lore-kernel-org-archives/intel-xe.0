Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66387C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490610E08A;
	Tue, 28 Nov 2023 15:32:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706710E08A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701185567; x=1732721567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ev320OhmyZ9C+iuNYyxZaBoXP8hKTa8GkeL+JZjp6hY=;
 b=n4GBIh+qupjZIezyrkoDXT1+WteHHXmKze0M0yQq5rnoY9ORkZVOFXdl
 0oHUrFwsyfOH8VJx+SC4FI8ulwVmoelh5HKfh4T/nOHg83r4DU4CHTS+y
 jQumv92We9qYlhcRJ5Rjkn/bNojVMTATdhmcibEgcfE3/PYrQbzqpK7/Z
 udbxPt5Pa0JHUNrL/ilMQF7wf3jRqPVPavjPVpZoQiXsRHLEDRAe2gFl+
 TTMkrgPZ4mO88NOvKI4W8KLFRl9QIIZU/hpmnpXw0k2a7IRdK2tFI0Y22
 LkH/RT7XyRQ7XUcgjZhYOlG3ycw4cn/3WYs2I9nuoueft7Aimwn1OhUKn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390095792"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="390095792"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="16972321"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:32:45 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 21:11:18 +0530
Message-Id: <20231128154118.2915150-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/dgfx: Release mmap mappings on rpm
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

v2:
  - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
  - Avoid iomem check before bo migration check as bo can migrate
    to system memory (Matthew Auld)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 53 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  2 ++
 drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
 drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
 5 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c5aa01c0861c..03e699e3383f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -784,6 +784,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		dma_fence_put(fence);
 	}
 
+	/*
+	 * TTM has already nuked the mmap for us (see ttm_bo_unmap_virtual),
+	 * so if we moved from VRAM make sure to unlink this from the userfault
+	 * tracking.
+	 */
+	if (mem_type_is_vram(old_mem_type)) {
+		spin_lock(&xe->mem_access.vram_userfault_lock);
+		if (!list_empty(&bo->vram_userfault_link))
+			list_del_init(&bo->vram_userfault_link);
+		spin_unlock(&xe->mem_access.vram_userfault_lock);
+	}
+
 	xe_device_mem_access_put(xe);
 
 out:
@@ -1112,6 +1124,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
+	struct xe_bo *bo = NULL;
+	struct xe_device *xe = to_xe_device(ddev);
 	vm_fault_t ret;
 	int idx, r = 0;
 
@@ -1120,7 +1134,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		return ret;
 
 	if (drm_dev_enter(ddev, &idx)) {
-		struct xe_bo *bo = ttm_to_xe_bo(tbo);
+		bo = ttm_to_xe_bo(tbo);
 
 		trace_xe_bo_cpu_fault(bo);
 
@@ -1139,10 +1153,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
+	if (ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {
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
 
@@ -2168,6 +2203,22 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9f373f6d25f2..c9f52e3f6b97 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -229,6 +229,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 4bff60996168..032773bb097d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -79,6 +79,12 @@ struct xe_bo {
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
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2712905c7a91..046085af4c56 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -359,6 +359,26 @@ struct xe_device {
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
index e31a91cf311c..e2bda8bc75bf 100644
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

