Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B49C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 18:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9AC10E043;
	Wed, 20 Dec 2023 18:39:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BFE10E043
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 18:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703097550; x=1734633550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQpEGv+NN6TcPSv7dPyy/G77NuV35wU0hKt08Fx1Rmk=;
 b=dHq1Xv1T6riSbg1VF6z04HkNTIss8o8Ok+CNBSb6LQbhndPnCl1XUj0r
 88U1pmS2BuyprOgsONICsDEC1h6JO2K6sPl+rEFydMs0B7XSRBm/fSzTC
 tASoQ14AM4BGTHADR+R0vy4d8/fjqPqXH6BCf/8Gk1O5unQUOjlMB8E15
 ZGsIXpIhsvgfZqgCtD0EzTvqTSVWBSA94HHLqhNhcd/uKldBgcBuKNwYJ
 t67S7iMP30Bt9ecICjmw57mgowXvSAnN+V+Rcc9h8PmVqVR2ejKpV0h+h
 cUpRJvdo1MVQZK4QcJFDUyLetGp5H5i8kJTrpGtTkGcqDlVxUhdDzlbSu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17410710"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="17410710"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 10:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810693347"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="810693347"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 10:39:04 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/dgfx: Release mmap mappings on rpm suspend
Date: Thu, 21 Dec 2023 00:20:28 +0530
Message-Id: <20231220185028.218622-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@intel.com, matthew.auld@intel.com, rodrigo.vivi@intel.com
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
v3:
  - Delete bo userfault link during bo destroy
  - Upon bo move (vram-smem), do bo userfault link deletion in
    xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
  - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 65 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_types.h     |  5 +++
 drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++
 drivers/gpu/drm/xe/xe_pm.c           |  7 +++
 5 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..2ab933f50192 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -586,6 +586,8 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 {
 	struct ttm_buffer_object *ttm_bo = &bo->ttm;
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct ttm_resource *old_mem = ttm_bo->resource;
+	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	int ret;
 
 	/*
@@ -597,6 +599,7 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 		return -EINVAL;
 
 	xe_bo_vunmap(bo);
+
 	ret = xe_bo_trigger_rebind(xe, bo, ctx);
 	if (ret)
 		return ret;
@@ -605,6 +608,18 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	if (ttm_bo->base.dma_buf && !ttm_bo->base.import_attach)
 		dma_buf_move_notify(ttm_bo->base.dma_buf);
 
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
 	return 0;
 }
 
@@ -1063,6 +1078,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
 
+	spin_lock(&xe->mem_access.vram_userfault_lock);
+	if (!list_empty(&bo->vram_userfault_link))
+		list_del(&bo->vram_userfault_link);
+	spin_unlock(&xe->mem_access.vram_userfault_lock);
+
 	kfree(bo);
 }
 
@@ -1110,6 +1130,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
+	struct xe_bo *bo = NULL;
+	struct xe_device *xe = to_xe_device(ddev);
 	vm_fault_t ret;
 	int idx, r = 0;
 
@@ -1118,7 +1140,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		return ret;
 
 	if (drm_dev_enter(ddev, &idx)) {
-		struct xe_bo *bo = ttm_to_xe_bo(tbo);
+		bo = ttm_to_xe_bo(tbo);
 
 		trace_xe_bo_cpu_fault(bo);
 
@@ -1137,10 +1159,31 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
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
 
@@ -1254,6 +1297,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
 #endif
+	INIT_LIST_HEAD(&bo->vram_userfault_link);
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
@@ -2264,6 +2308,25 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	return err;
 }
 
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	struct ttm_device *bdev = tbo->bdev;
+	struct xe_device *xe = ttm_to_xe_device(bdev);
+
+	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
+
+	/*
+	 * Other callers xe_ttm_bo_destroy and xe_bo_move_notify also checks and
+	 * deletes vram_user_fault_link so grabbing spinlock here.
+	 */
+	XE_WARN_ON(!bo->vram_userfault_count);
+	spin_lock(&xe->mem_access.vram_userfault_lock);
+	list_del(&bo->vram_userfault_link);
+	bo->vram_userfault_count = 0;
+	spin_unlock(&xe->mem_access.vram_userfault_lock);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 97b32528c600..350cc73cadf8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -249,6 +249,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
 		      struct drm_mode_create_dumb *args);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 64c2249a4e40..910b35c05acd 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -88,6 +88,11 @@ struct xe_bo {
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
index 71f23ac365e6..6890d21f7a4c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -385,6 +385,26 @@ struct xe_device {
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

