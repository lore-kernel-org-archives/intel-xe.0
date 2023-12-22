Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464D3C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 08:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB9310E108;
	Fri, 22 Dec 2023 08:22:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A3510E108
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703233318; x=1734769318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QaDOVDFiYD2aFu2NBZW5xse2TVyuSD2ixAD0xvHaYbc=;
 b=dHdttpVYi77cW/ivAWLyQdfeBUV77NKzXHXi7Q/710OJDvkf8bCQD00X
 sJZOrRfxEB6KHBiNeL6ld/tupkYkZxRSiINaWR8OmmB+rgJKZyY0vZI8Y
 LlJ0Lu9wQfO0SiMOjf0JnW4RNS6w/CGLToIDyzsv8+508V+sFDXBrzD1V
 T2kDl4kKaYBXCXvH+H+nY2x0zqlPR1H0i4bVQ5RWvhQYiCpjn5IXrY6av
 sNX1iTtWAVy2YrecTz3cJF58LPDnS+P2VnAyzpepoqAaGZdnzFmzOISbl
 gi9M6GmT7IwV7n1txqTQ377R3tocoV3OBEIx2R/RGHp8rLTtxEB/Wofyz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="394983987"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="394983987"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 00:21:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="18968366"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 00:21:56 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4] drm/xe/dgfx: Release mmap mappings on rpm suspend
Date: Fri, 22 Dec 2023 14:03:20 +0530
Message-Id: <20231222083320.329979-1-badal.nilawar@intel.com>
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
Cc: thomas.hellstrom@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Release all mmap mappings for all vram objects which are associated
with userfault such that, while pcie function in D3hot, any access
to memory mappings will raise a userfault.

Upon userfault, in order to access memory mappings, if graphics
function is in D3 then runtime resume of dgpu will be triggered to
transition to D0.

v2:
  - Avoid iomem check before bo migration check as bo can migrate
    to system memory (Matthew Auld)
v3:
  - Delete bo userfault link during bo destroy
  - Upon bo move (vram-smem), do bo userfault link deletion in
    xe_bo_move_notify instead of xe_bo_move (Thomas Hellström)
  - Grab lock in rpm hook while deleting bo userfault link (Matthew Auld)
v4:
  - Add kernel doc and wrap vram_userfault related
    stuff in the structure (Matthew Auld)
  - Mem access get for rpm before taking dma reserve lock (Matthew Auld)
  - In suspend path apply lock for entire list op
    including list iteration (Matthew Auld)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 63 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_types.h     | 10 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++
 drivers/gpu/drm/xe/xe_pm.c           | 13 ++++++
 5 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8e4a3b1f6b93..cf06195469a5 100644
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
+		spin_lock(&xe->mem_access.vram_userfault.lock);
+		if (!list_empty(&bo->vram_userfault.link))
+			list_del_init(&bo->vram_userfault.link);
+		spin_unlock(&xe->mem_access.vram_userfault.lock);
+	}
+
 	return 0;
 }
 
@@ -1063,6 +1078,11 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
 
+	spin_lock(&xe->mem_access.vram_userfault.lock);
+	if (!list_empty(&bo->vram_userfault.link))
+		list_del(&bo->vram_userfault.link);
+	spin_unlock(&xe->mem_access.vram_userfault.lock);
+
 	kfree(bo);
 }
 
@@ -1110,16 +1130,20 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
 	struct drm_device *ddev = tbo->base.dev;
+	struct xe_device *xe = to_xe_device(ddev);
+	struct xe_bo *bo = ttm_to_xe_bo(tbo);
+	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
 	vm_fault_t ret;
 	int idx, r = 0;
 
+	if (needs_rpm)
+		xe_device_mem_access_get(xe);
+
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
-		return ret;
+		goto out;
 
 	if (drm_dev_enter(ddev, &idx)) {
-		struct xe_bo *bo = ttm_to_xe_bo(tbo);
-
 		trace_xe_bo_cpu_fault(bo);
 
 		if (should_migrate_to_system(bo)) {
@@ -1137,10 +1161,28 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
+
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
+		goto out;
+	/*
+	 * ttm_bo_vm_reserve() already has dma_resv_lock.
+	 * vram_userfault.count is protected by dma_resv lock and rpm wakeref.
+	 */
+	if (ret == VM_FAULT_NOPAGE && !bo->vram_userfault.count) {
+		if (tbo->resource->bus.is_iomem) {
+			bo->vram_userfault.count = 1;
+
+			spin_lock(&xe->mem_access.vram_userfault.lock);
+			list_add(&bo->vram_userfault.link, &xe->mem_access.vram_userfault.list);
+			spin_unlock(&xe->mem_access.vram_userfault.lock);
+		}
+	}
 
 	dma_resv_unlock(tbo->base.resv);
+out:
+	if (needs_rpm)
+		xe_device_mem_access_put(xe);
+
 	return ret;
 }
 
@@ -1254,6 +1296,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
 #endif
+	INIT_LIST_HEAD(&bo->vram_userfault.link);
 
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
@@ -2264,6 +2307,18 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	return err;
 }
 
+void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *tbo = &bo->ttm;
+	struct ttm_device *bdev = tbo->bdev;
+
+	drm_vma_node_unmap(&tbo->base.vma_node, bdev->dev_mapping);
+
+	XE_WARN_ON(!bo->vram_userfault.count);
+	list_del(&bo->vram_userfault.link);
+	bo->vram_userfault.count = 0;
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
index 64c2249a4e40..b4e44fab9cd2 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -88,6 +88,16 @@ struct xe_bo {
 	 * objects.
 	 */
 	u16 cpu_caching;
+
+	/**
+	 * @vram_userfault: Encapsulate vram_userfault related stuff
+	 */
+	struct {
+		/** @link: Link into @mem_access.vram_userfault.list */
+		struct list_head link;
+		/** @count: Whether bo is @mem_access.vram_userfault.list */
+		unsigned int count;
+	} vram_userfault;
 };
 
 #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 71f23ac365e6..02af1740f7d0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -385,6 +385,18 @@ struct xe_device {
 	struct {
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
+
+		/** @vram_userfault: Encapsulate vram_userfault related stuff */
+		struct {
+			/** @lock: Protects access to @vram_usefault.list */
+			spinlock_t lock;
+
+			/**
+			 *  @list: Keep list of userfaulted vram bo, which require to release their
+			 *  mmap mappings at runtime suspend path.
+			 */
+			struct list_head list;
+		} vram_userfault;
 	} mem_access;
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b429c2876a76..ad2287fabaa0 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -181,6 +181,8 @@ void xe_pm_init(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_init(xe);
+	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
+	spin_lock_init(&xe->mem_access.vram_userfault.lock);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
@@ -214,6 +216,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
 
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
+	struct xe_bo *bo, *on;
 	struct xe_gt *gt;
 	u8 id;
 	int err = 0;
@@ -247,6 +250,16 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	lock_map_acquire(&xe_device_mem_access_lockdep_map);
 
+	/*
+	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
+	 * also checks and delets bo entry from user fault list.
+	 */
+	spin_lock(&xe->mem_access.vram_userfault.lock);
+	list_for_each_entry_safe(bo, on,
+				 &xe->mem_access.vram_userfault.list, vram_userfault.link)
+		xe_bo_runtime_pm_release_mmap_offset(bo);
+	spin_unlock(&xe->mem_access.vram_userfault.lock);
+
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
-- 
2.25.1

