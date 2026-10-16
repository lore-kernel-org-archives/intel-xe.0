Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6FCCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 09:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788910E29E;
	Fri, 16 Oct 2026 09:33:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0783011271C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792143178; x=1823679178;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q36NA1rp5RySfBiXz2Wbfr49xbW8qK4ikeNf7CAO4Ws=;
 b=XyqR8XykcAIlLsuJHKGmndYim/ws8DDOQEu76ryEy4Gay4OhdxPOQJuV
 grxofbWsBUnZK9e3geqqd3xetChnWWnq8s7fjztI+3DFO5FwFsQQr493/
 9lu8Ai3lhIc1rcMYVJO/H4aTeRma8XU/5VZpW52LRGfb8wFzOFh+Q3lEQ
 Gj12Qh4ed2JNWARTZV0Ql3RzGY/LNPsxUkUrWZkN/7Nco/aKMYzP/UbQT
 ECKSEAkfmTuFa+WYdmscad3uWAEz4/+f2afNnnQ/P3zSdXy0BMog0QXi+
 YfLNDezDABOwprUmaoFAjzLFw91+GYAT3SxEK9Ms76jscCWNiB7+j/Aad w==;
X-CSE-ConnectionGUID: xfeY8/x1RG+k6r5nWqFJ6g==
X-CSE-MsgGUID: vxWzjPyzSsWAXiBHyCF9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="827388"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="827388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:32:57 -0700
X-CSE-ConnectionGUID: v9VM98VOSv2SmxRj6oCEZA==
X-CSE-MsgGUID: FjjzlL+ySU6In3GXzWcXZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2323611"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:32:56 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only] drm/xe: Isolate permanently wedged devices
Date: Fri, 16 Oct 2026 15:02:37 +0530
Message-ID: <20261016093237.340525-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DO NOT REVIEW

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c               |  17 ++-
 drivers/gpu/drm/xe/display/xe_display.c |  39 ++++-
 drivers/gpu/drm/xe/xe_bo.c              |  72 ++++++++-
 drivers/gpu/drm/xe/xe_bo.h              |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h        |   4 +
 drivers/gpu/drm/xe/xe_device.c          | 185 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h          |  41 ++++++
 drivers/gpu/drm/xe/xe_device_types.h    |  25 ++++
 drivers/gpu/drm/xe/xe_ggtt.c            |  26 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c          |  24 ++-
 drivers/gpu/drm/xe/xe_guc_pc.c          |  10 +-
 drivers/gpu/drm/xe/xe_guc_rc.c          |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  22 ++-
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c   |  36 +++--
 drivers/gpu/drm/xe/xe_irq.c             |  29 +++-
 drivers/gpu/drm/xe/xe_pagefault.c       |  15 +-
 drivers/gpu/drm/xe/xe_pci.c             |  51 ++++++-
 drivers/gpu/drm/xe/xe_pci_error.c       |  25 ++--
 drivers/gpu/drm/xe/xe_pm.c              |  12 ++
 drivers/gpu/drm/xe/xe_sriov_pf.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c             |  26 +++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c    |   4 +
 drivers/gpu/drm/xe/xe_vm.c              |  21 +--
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  12 +-
 include/drm/drm_drv.h                   |   1 +
 25 files changed, 592 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 0cdc606af..0f25103e9 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -476,6 +476,21 @@ void drm_dev_exit(int idx)
 }
 EXPORT_SYMBOL(drm_dev_exit);
 
+/**
+ * drm_dev_srcu_synchronize - Drain device SRCU readers
+ * @dev: DRM device whose state change is being synchronized
+ *
+ * Wait for existing drm_dev_enter() users to finish.
+ *
+ * The SRCU domain is shared by all DRM devices. Readers for other DRM
+ * devices may also delay this function.
+ */
+void drm_dev_srcu_synchronize(struct drm_device *dev)
+{
+	synchronize_srcu(&drm_unplug_srcu);
+}
+EXPORT_SYMBOL(drm_dev_srcu_synchronize);
+
 /*
  * Mark the device as unplugged and wait for any in-flight drm_dev_enter()
  * critical sections to complete.
@@ -489,7 +504,7 @@ static void drm_dev_synchronize_unplug(struct drm_device *dev)
 	 * finished.
 	 */
 	dev->unplugged = true;
-	synchronize_srcu(&drm_unplug_srcu);
+	drm_dev_srcu_synchronize(dev);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 506f26e9c..e0b573e50 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_display.h"
+#include "xe_device.h"
 #include "regs/xe_irq_regs.h"
 
 #include <linux/acpi.h>
@@ -141,30 +142,48 @@ int xe_display_init(struct xe_device *xe)
 void xe_display_register(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
+	int io_idx;
 
 	if (!xe->info.probe_display)
 		return;
 
+	if (xe_device_io_get(xe, &io_idx))
+		return;
+
+	if (xe->display_registered)
+		goto out;
+
 	intel_display_driver_register(display);
 	intel_display_driver_runtime_pm_enable(display);
+
+	xe->display_registered = true;
+
+out:
+	xe_device_io_put(io_idx);
 }
 
 void xe_display_unregister(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered)
 		return;
 
-	intel_display_driver_runtime_pm_disable(display);
+	if (!xe->display_shutdown && !xe->display_pm_suspended)
+		intel_display_driver_runtime_pm_disable(display);
+
 	intel_display_driver_unregister(display);
+
+	xe->display_registered = false;
 }
 
 void xe_display_shutdown(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    xe->display_pm_suspended)
 		return;
 
 	intel_display_driver_shutdown(display);
@@ -172,6 +191,8 @@ void xe_display_shutdown(struct xe_device *xe)
 	intel_opregion_suspend(display, PCI_D3cold);
 
 	intel_dmc_suspend(display);
+
+	xe->display_shutdown = true;
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
@@ -242,7 +263,9 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	struct intel_display *display = xe->display;
 	bool s2idle = suspend_to_idle();
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    xe->display_pm_suspended)
 		return;
 
 	intel_display_driver_pm_suspend(display);
@@ -250,6 +273,8 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 
 	intel_dmc_suspend(display);
+
+	xe->display_pm_suspended = true;
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
@@ -277,7 +302,9 @@ void xe_display_pm_resume(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
-	if (!xe->info.probe_display)
+	if (!xe->info.probe_display || !xe->display_registered ||
+	    xe->display_shutdown ||
+	    !xe->display_pm_suspended)
 		return;
 
 	intel_dmc_resume(display);
@@ -288,6 +315,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_display_driver_init_hw(display);
 
 	intel_display_driver_pm_resume(display);
+
+	xe->display_pm_suspended = false;
 }
 
 static void xe_display_enable_d3cold(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 12e523c61..c92382ff5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1994,6 +1994,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		list_del(&bo->vram_userfault_link);
 	mutex_unlock(&xe->mem_access.vram_userfault.lock);
 
+	if (bo->wedged_dummy_page)
+		__free_page(bo->wedged_dummy_page);
+
 	kfree(bo);
 }
 
@@ -2189,6 +2192,32 @@ static vm_fault_t xe_bo_cpu_fault_fastpath(struct vm_fault *vmf, struct xe_devic
 	return ret;
 }
 
+static vm_fault_t xe_bo_vm_dummy_page(struct vm_fault *vmf, struct xe_bo *bo)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct page *page, *old;
+	pgprot_t prot = vm_get_page_prot(vma->vm_flags);
+	unsigned long pfn;
+
+	page = READ_ONCE(bo->wedged_dummy_page);
+	if (!page) {
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			return VM_FAULT_OOM;
+
+		old = cmpxchg(&bo->wedged_dummy_page, NULL, page);
+		if (old) {
+			__free_page(page);
+			page = old;
+		}
+	}
+
+	pfn = page_to_pfn(page);
+
+	/* Map other addresses on demand instead of walking the whole VMA. */
+	return vmf_insert_pfn_prot(vma, vmf->address, pfn, prot);
+}
+
 static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -2201,10 +2230,10 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	struct drm_exec exec;
 	vm_fault_t ret;
 	int err = 0;
-	int idx;
+	int io_idx;
 
-	if (xe_device_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
-		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+	if (xe_device_io_get(xe, &io_idx))
+		return xe_bo_vm_dummy_page(vmf, bo);
 
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
 	if (ret != VM_FAULT_RETRY)
@@ -2290,7 +2319,7 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	if (retry_after_wait)
 		xe_bo_put(bo);
 out:
-	drm_dev_exit(idx);
+	xe_device_io_put(io_idx);
 
 	return ret;
 }
@@ -2301,9 +2330,18 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
+	int idx, ret;
+
+	ret = xe_device_io_get(xe, &idx);
+	if (ret)
+		return ret == -ECANCELED && xe_device_wedged(xe) ? -EIO : ret;
+
+	xe_pm_runtime_get(xe);
+	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_pm_runtime_put(xe);
 
-	guard(xe_pm_runtime)(xe);
-	return ttm_bo_vm_access(vma, addr, buf, len, write);
+	xe_device_io_put(idx);
+	return ret;
 }
 
 /**
@@ -2494,6 +2532,8 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 			return bo;
 	}
 
+	bo->wedged_dummy_page = NULL;
+
 	bo->ccs_cleared = false;
 	bo->tile = tile;
 	bo->flags = flags;
@@ -4204,6 +4244,26 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
 	list_del_init(&bo->vram_userfault_link);
 }
 
+/**
+ * xe_bo_wedged_invalidate_mmaps - Invalidate CPU mappings backed by VRAM
+ * @xe: xe device instance
+ *
+ * The caller must drain the common device I/O gate before calling this
+ * function. Remove all tracked VRAM mappings so later faults map the
+ * per-BO dummy page.
+ */
+void xe_bo_wedged_invalidate_mmaps(struct xe_device *xe)
+{
+	struct xe_bo *bo, *next;
+
+	mutex_lock(&xe->mem_access.vram_userfault.lock);
+	list_for_each_entry_safe(bo, next,
+				 &xe->mem_access.vram_userfault.list,
+				 vram_userfault_link)
+		xe_bo_runtime_pm_release_mmap_offset(bo);
+	mutex_unlock(&xe->mem_access.vram_userfault.lock);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_bo.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9..3bd198668 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -453,6 +453,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file);
 void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
+void xe_bo_wedged_invalidate_mmaps(struct xe_device *xe);
 
 int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_device *dev,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8ec4a01a0..80aeb4e31 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -21,6 +21,7 @@ struct xe_device;
 struct xe_mem_pool_node;
 struct xe_vm;
 struct xe_exec_queue;
+struct page;
 
 #define XE_BO_MAX_PLACEMENTS	3
 
@@ -112,6 +113,9 @@ struct xe_bo {
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 	struct list_head vram_userfault_link;
 
+	/** @wedged_dummy_page: Zeroed page used for faults after device wedge */
+	struct page *wedged_dummy_page;
+
 	/**
 	 * @min_align: minimum alignment needed for this BO if different
 	 * from default
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4caf86be8..d6f5d5fb4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -85,6 +85,8 @@
 #include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
+static void xe_device_wedged_work(struct work_struct *work);
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -232,20 +234,43 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
+static bool xe_drm_ioctl_is_wait(unsigned int cmd)
+{
+	switch (DRM_IOCTL_NR(cmd)) {
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_WAIT):
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT):
+	case DRM_IOCTL_NR(DRM_IOCTL_SYNCOBJ_TRANSFER):
+	case DRM_IOCTL_NR(DRM_IOCTL_XE_WAIT_USER_FENCE):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = file->private_data;
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	int io_idx;
 	long ret;
 
-	if (xe_device_wedged(xe))
-		return -ECANCELED;
+	ret = xe_device_io_get(xe, &io_idx);
+	if (ret)
+		return ret;
 
-	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
-	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	/* These waits must not hold up device I/O draining. */
+	if (xe_drm_ioctl_is_wait(cmd)) {
+		xe_device_io_put(io_idx);
+		return drm_ioctl(file, cmd, arg);
+	}
+
+	scoped_cond_guard(xe_pm_runtime_ioctl,
+			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
+			  xe) {
 		ret = drm_ioctl(file, cmd, arg);
+	}
 
+	xe_device_io_put(io_idx);
 	return ret;
 }
 
@@ -254,16 +279,26 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 {
 	struct drm_file *file_priv = file->private_data;
 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
+	int io_idx;
 	long ret;
 
-	if (xe_device_wedged(xe))
-		return -ECANCELED;
+	ret = xe_device_io_get(xe, &io_idx);
+	if (ret)
+		return ret;
+
+	/* These waits must not hold up device I/O draining. */
+	if (xe_drm_ioctl_is_wait(cmd)) {
+		xe_device_io_put(io_idx);
+		return drm_compat_ioctl(file, cmd, arg);
+	}
 
-	ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
-	ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
-	if (ret >= 0)
+	scoped_cond_guard(xe_pm_runtime_ioctl,
+			  ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &scope),
+			  xe) {
 		ret = drm_compat_ioctl(file, cmd, arg);
+	}
 
+	xe_device_io_put(io_idx);
 	return ret;
 }
 #else
@@ -439,6 +474,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 }
 ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 
+void xe_device_io_drain(struct xe_device *xe)
+{
+	drm_dev_srcu_synchronize(&xe->drm);
+}
+
 static void xe_device_parse_modparam(struct xe_device *xe)
 {
 	xe->atomic_svm_timeslice_ms = 5;
@@ -460,6 +500,10 @@ int xe_device_init_early(struct xe_device *xe)
 {
 	int err;
 
+	INIT_WORK(&xe->wedged.work, xe_device_wedged_work);
+	init_completion(&xe->wedged.prepared);
+	xe->wedged.reported_method = ~0UL;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager,
@@ -886,6 +930,77 @@ static void xe_uid_probe(struct xe_device *xe)
 		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
 }
 
+/*
+ * Isolate a permanently wedged device.
+ *
+ * May sleep and must be called from process context.
+ */
+static void xe_device_wedged_isolate(struct xe_device *xe)
+{
+	/*
+	 * Wait until xe_device_declare_wedged() has finished scanning GT
+	 * submission state before isolating the device.
+	 */
+	wait_for_completion(&xe->wedged.prepared);
+
+	if (xe->wedged.isolated)
+		return;
+
+	/*
+	 * GT wedging has signalled pending fences. Drain existing hardware
+	 * users before isolation starts.
+	 */
+	xe_device_io_drain(xe);
+
+	/* Shut down display hardware before stopping device access. */
+	xe_display_shutdown(xe);
+	xe_display_unregister(xe);
+
+	/* Stop interrupt and DMA activity before changing mappings. */
+	xe_irq_suspend(xe);
+	pci_clear_master(to_pci_dev(xe->drm.dev));
+
+	xe_bo_wedged_invalidate_mmaps(xe);
+
+	xe->wedged.isolated = true;
+}
+
+static void xe_device_wedged_work(struct work_struct *work)
+{
+	struct xe_device *xe =
+			container_of(work, struct xe_device, wedged.work);
+	unsigned long method;
+	int err;
+
+	xe_device_wedged_isolate(xe);
+
+	/* Report at most one recovery method per worker invocation. */
+	method = READ_ONCE(xe->wedged.method);
+	if (method != READ_ONCE(xe->wedged.reported_method)) {
+		err = drm_dev_wedged_event(&xe->drm, method, NULL);
+		if (!err)
+			WRITE_ONCE(xe->wedged.reported_method, method);
+	}
+
+	/*
+	 * Queue another pass if the method changed while the event was sent.
+	 * This preserves the update without keeping this worker in a loop.
+	 */
+	if (!atomic_read(&xe->wedged.stopping) &&
+	    READ_ONCE(xe->wedged.method) != method)
+		queue_work(xe->unordered_wq, &xe->wedged.work);
+}
+
+static void xe_device_wedged_disable(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (atomic_xchg(&xe->wedged.stopping, 1))
+		return;
+
+	disable_work_sync(&xe->wedged.work);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1006,10 +1121,18 @@ int xe_device_probe(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
-		if (err)
+		if (err) {
+			xe_device_wedged_disable(xe);
 			return err;
+		}
 	}
 
+	/* Stop wedge work before GT and IRQ devres cleanup. */
+	err = devm_add_action_or_reset(xe->drm.dev,
+				       xe_device_wedged_disable, xe);
+	if (err)
+		return err;
+
 	err = xe_vram_memtest(xe);
 	if (err)
 		return err;
@@ -1117,6 +1240,7 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_unregister_display:
+	xe_device_wedged_disable(xe);
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
 
@@ -1125,10 +1249,13 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_device_wedged_disable(xe);
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
 
+	wake_up_all(&xe->ufence_wq);
+
 	xe_bo_pci_dev_remove_all(xe);
 }
 
@@ -1139,6 +1266,7 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
+	xe_device_wedged_disable(xe);
 	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
@@ -1391,7 +1519,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 {
-	xe->wedged.method = method;
+	WRITE_ONCE(xe->wedged.method, method);
 }
 
 #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
@@ -1418,6 +1546,7 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 void xe_device_declare_wedged(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	bool first;
 	u8 id;
 
 	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
@@ -1425,21 +1554,18 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	first = !atomic_xchg(&xe->wedged.flag, 1);
+	if (first) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
+		wake_up_all(&xe->ufence_wq);
 
 		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
 		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
 			    "For recovery procedure, refer to %s\n"
 			    "Please file a _new_ bug report at %s\n",
 			    WEDGED_URL, XE_BUG_URL);
-	}
-
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
 		/*
 		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
 		 * hangs, so wedge the device with 'none' recovery method and have
@@ -1447,14 +1573,25 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		 */
 		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-		/* If no wedge recovery method is set, use default */
-		else if (!xe->wedged.method)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-						    DRM_WEDGE_RECOVERY_BUS_RESET);
 
-		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+		/* Prepare GTs only on the first wedge declaration. */
+		for_each_gt(gt, xe, id)
+			xe_gt_declare_wedged(gt);
 	}
+
+	/* Set the default only if no recovery method was selected. */
+	cmpxchg(&xe->wedged.method, 0UL,
+		DRM_WEDGE_RECOVERY_REBIND |
+		DRM_WEDGE_RECOVERY_BUS_RESET);
+
+	if (!atomic_read(&xe->wedged.stopping) &&
+	    (first ||
+	     READ_ONCE(xe->wedged.method) !=
+	     READ_ONCE(xe->wedged.reported_method)))
+		queue_work(xe->unordered_wq, &xe->wedged.work);
+
+	if (first)
+		complete_all(&xe->wedged.prepared);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 83d6dafab..ac70db479 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -6,6 +6,7 @@
 #ifndef _XE_DEVICE_H_
 #define _XE_DEVICE_H_
 
+#include <drm/drm_drv.h>
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
@@ -212,6 +213,46 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+/*
+ * Return true when device access must be blocked either permanently because
+ * the device is wedged or temporarily while PCI error recovery is running.
+ *
+ * Do not use this helper for one-way wedged-device decisions such as DMA
+ * isolation, IRQ resume suppression or recovery-method reporting.
+ */
+static inline bool xe_device_io_blocked(struct xe_device *xe)
+{
+	return xe_device_wedged(xe) || xe_device_is_in_reset(xe);
+}
+
+/**
+ * xe_device_io_get - Enter a device access critical section
+ * @xe: Xe device
+ * @idx: SRCU index returned on success
+ *
+ * Return: 0 on success, -ENODEV after unplug, or -ECANCELED when
+ * device I/O is blocked.
+ */
+static inline int xe_device_io_get(struct xe_device *xe, int *idx)
+{
+	if (!drm_dev_enter(&xe->drm, idx))
+		return -ENODEV;
+
+	if (xe_device_io_blocked(xe)) {
+		drm_dev_exit(*idx);
+		return -ECANCELED;
+	}
+
+	return 0;
+}
+
+static inline void xe_device_io_put(int idx)
+{
+	drm_dev_exit(idx);
+}
+
+void xe_device_io_drain(struct xe_device *xe);
+
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static inline bool xe_debug_page_size_supported(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d267fb4e4..c747e31d7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_DEVICE_TYPES_H_
 #define _XE_DEVICE_TYPES_H_
 
+#include <linux/completion.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 
 #include <drm/drm_device.h>
@@ -112,6 +114,14 @@ struct xe_device {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	/** @display: display device data, must be placed after drm device member */
 	struct intel_display *display;
+	/** @display_registered: Display userspace interfaces are registered */
+	bool display_registered;
+	/**
+	 * @display_pm_suspended: Display was suspended by system PM
+	 */
+	bool display_pm_suspended;
+	/** @display_shutdown: Display hardware shutdown has completed */
+	bool display_shutdown;
 #endif
 
 	/** @devcoredump: device coredump */
@@ -279,6 +289,9 @@ struct xe_device {
 		/** @irq.lock: lock for processing irq's on this device */
 		spinlock_t lock;
 
+		/** @irq.state_lock: Protects suspend and resume IRQ state updates */
+		struct mutex state_lock;
+
 		/** @irq.enabled: interrupts enabled on this device */
 		atomic_t enabled;
 
@@ -482,6 +495,8 @@ struct xe_device {
 
 	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
 	struct notifier_block pm_notifier;
+	/** @pm_notifier_active: PM notifier prepare work was performed */
+	bool pm_notifier_active;
 	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
 	struct completion pm_block;
 	/** @rebind_resume_list: List of wq items to kick on resume. */
@@ -561,6 +576,16 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.work: Runs sleepable wedge handling */
+		struct work_struct work;
+		/** @wedged.stopping: Blocks worker requeue and repeated disable */
+		atomic_t stopping;
+		/** @wedged.prepared: First wedge declaration finished and work was queued */
+		struct completion prepared;
+		/** @wedged.reported_method: Last recovery method reported to userspace */
+		unsigned long reported_method;
+		/** @wedged.isolated: Terminal device isolation has completed */
+		bool isolated;
 	} wedged;
 
 	/** @devres_group: devres group */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 9ef2ce743..5a17cfe8f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -20,6 +20,7 @@
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
@@ -475,13 +476,13 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-static void ggtt_node_remove(struct xe_ggtt_node *node)
+static void __ggtt_node_remove(struct xe_ggtt_node *node, bool clear_hw)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
 	bool bound;
 
 	mutex_lock(&ggtt->lock);
-	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
+	bound = clear_hw && (ggtt->flags & XE_GGTT_FLAGS_ONLINE);
 	if (bound)
 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
@@ -496,6 +497,27 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	ggtt_node_fini(node);
 }
 
+static void ggtt_node_remove(struct xe_ggtt_node *node)
+{
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+	int idx;
+
+	/*
+	 * GGTT updates write page table entries through the BAR and request a
+	 * TLB invalidation. Skip them after unplug, where the BAR is gone.
+	 * Keep them during PCI error recovery so a recovered device does not
+	 * inherit stale GGTT entries.
+	 */
+	if (!drm_dev_enter(&xe->drm, &idx)) {
+		__ggtt_node_remove(node, false);
+		return;
+	}
+
+	__ggtt_node_remove(node, !xe_device_wedged(xe));
+
+	drm_dev_exit(idx);
+}
+
 static void ggtt_node_remove_work_func(struct work_struct *work)
 {
 	struct xe_ggtt_node *node = container_of(work, typeof(*node),
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8c98dd804..8b99763b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1049,11 +1049,20 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return -EPIPE;
 }
 
+static int guc_ct_cancel_errno(struct xe_guc_ct *ct)
+{
+	/* AER is temporary. Only a permanent wedge is terminal. */
+	return xe_device_wedged(ct_to_xe(ct)) ?
+		-ENOTRECOVERABLE : -ECANCELED;
+}
+
 static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence, bool defer_flush)
 {
 	struct xe_gt *gt = ct_to_gt(ct);
+	bool io_held = false;
+	int io_idx;
 	u16 seqno;
 	int ret;
 
@@ -1064,11 +1073,13 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
-	if (xe_device_wedged(ct_to_xe(ct))) {
-		ret = -ENOTRECOVERABLE;
+	if (xe_device_io_get(ct_to_xe(ct), &io_idx)) {
+		ret = guc_ct_cancel_errno(ct);
 		goto out;
 	}
 
+	io_held = true;
+
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
 		ret = -EPIPE;
 		goto out;
@@ -1125,6 +1136,9 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 	if (g2h_len)
 		spin_unlock_irq(&ct->fast_lock);
 out:
+	if (io_held)
+		xe_device_io_put(io_idx);
+
 	return ret;
 }
 
@@ -1489,7 +1503,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		if (g2h_fence.cancel) {
 			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
-			ret = xe_device_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
+			ret = guc_ct_cancel_errno(ct);
 			goto unlock;
 		}
 		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
@@ -1828,8 +1842,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
 	lockdep_assert_held(&ct->fast_lock);
 
-	if (xe_device_wedged(xe))
-		return -ENOTRECOVERABLE;
+	if (xe_device_io_blocked(xe))
+		return guc_ct_cancel_errno(ct);
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
 		return -ENODEV;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e0105222a..a731ae8d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -188,7 +188,7 @@ static int pc_action_reset(struct xe_guc_pc *pc)
 	int ret;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_device_io_blocked(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC reset failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -212,7 +212,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_device_io_blocked(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC query task state failed: %pe\n",
 			  ERR_PTR(ret));
 
@@ -235,7 +235,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_device_io_blocked(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC set param[%u]=%u failed: %pe\n",
 			  id, value, ERR_PTR(ret));
 
@@ -257,7 +257,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
+	if (ret && !(xe_device_io_blocked(pc_to_xe(pc)) && ret == -ECANCELED))
 		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
 			  ERR_PTR(ret));
 
@@ -1357,7 +1357,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe_device_wedged(xe))
+	if (xe_device_io_blocked(xe))
 		return;
 
 	xe_guc_pc_stop(pc);
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
index 99fa127b2..eb5ec443f 100644
--- a/drivers/gpu/drm/xe/xe_guc_rc.c
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -40,7 +40,7 @@ static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
 	int ret;
 
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
+	if (ret && !(xe_device_io_blocked(guc_to_xe(guc)) && ret == -ECANCELED))
 		xe_gt_err(guc_to_gt(guc),
 			  "GuC RC setup %s(%u) failed (%pe)\n",
 			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
@@ -73,7 +73,7 @@ static void xe_guc_rc_fini_hw(void *arg)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
 
-	if (xe_device_wedged(xe))
+	if (xe_device_io_blocked(xe))
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e0a3ce601..fa8f3ede7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1663,10 +1663,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Killed queues must not newly wedge the device, but preserve an
 	 * already-wedged state to avoid warning on teardown timeouts.
 	 */
-	if (!exec_queue_killed(q))
+	wedged = xe_device_wedged(xe);
+	if (!wedged && !exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
-	else
-		wedged = xe_device_wedged(xe);
 
 	/*
 	 * Only tag as GPU hang if this is the original timeout, not a
@@ -2180,6 +2179,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	q->entity = &ge->entity;
 
 	mutex_lock(&guc->submission_state.lock);
+	if (xe_device_wedged(guc_to_xe(guc))) {
+		mutex_unlock(&guc->submission_state.lock);
+		err = -ECANCELED;
+		goto err_entity;
+	}
+
 	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
 	publish_guc_id(guc, q);
@@ -2207,6 +2212,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	return 0;
 
+err_entity:
+	q->entity = NULL;
+	xe_sched_entity_fini(&ge->entity);
 err_sched:
 	xe_sched_fini(&ge->sched);
 err_release_id:
@@ -2551,7 +2559,7 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
 						       WAIT_COND, HZ * 5);
 	}
 
-	if (!blocking && vf_recovery(guc) && !xe_device_wedged(xe))
+	if (!blocking && vf_recovery(guc) && !xe_device_io_blocked(xe))
 		return -EAGAIN;
 
 	if (!ret)
@@ -2811,7 +2819,11 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
-	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
+	/*
+	 * AER sets in_reset before declaring the GT wedged, which wakes this
+	 * waitqueue.
+	 */
+	wait_event(guc->ct.wq, xe_device_io_blocked(guc_to_xe(guc)) ||
 		   !xe_guc_read_stopped(guc));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index 111fef781..6150e2e8a 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -34,6 +34,9 @@ static int send_tlb_inval(struct xe_guc *guc, const u32 *action, int len)
 
 	xe_gt_assert(gt, action[1]);	/* Seqno */
 
+	if (xe_device_io_blocked(guc_to_xe(guc)))
+		return -ECANCELED;
+
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
 	return xe_guc_ct_send(&guc->ct, action, len,
 			      G2H_LEN_DW_TLB_INVALIDATE, 1);
@@ -63,6 +66,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = guc_to_xe(guc);
+	int io_idx;
 
 	/*
 	 * Returning -ECANCELED in this function is squashed at the caller and
@@ -77,22 +81,28 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		};
 
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
-		struct xe_mmio *mmio = &gt->mmio;
-
-		if (IS_SRIOV_VF(xe))
+	} else if (xe_device_uc_enabled(xe)) {
+		if (xe_device_io_get(xe, &io_idx))
 			return -ECANCELED;
 
-		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
-		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
-					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
-					PVC_GUC_TLB_INV_DESC0_VALID);
-		} else {
-			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
-					GUC_TLB_INV_CR_INVALIDATE);
+		if (!IS_SRIOV_VF(xe)) {
+			struct xe_mmio *mmio = &gt->mmio;
+
+			CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt),
+						    XE_FW_GT);
+			if (xe->info.platform == XE_PVC ||
+			    GRAPHICS_VER(xe) >= 20) {
+				xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
+						PVC_GUC_TLB_INV_DESC1_INVALIDATE);
+				xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
+						PVC_GUC_TLB_INV_DESC0_VALID);
+			} else {
+				xe_mmio_write32(mmio, GUC_TLB_INV_CR,
+						GUC_TLB_INV_CR_INVALIDATE);
+			}
 		}
+
+		xe_device_io_put(io_idx);
 	}
 
 	return -ECANCELED;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b394c8edf..9bacf0989 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -786,10 +786,8 @@ static void irq_uninstall(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (!atomic_xchg(&xe->irq.enabled, 0))
-		return;
-
-	xe_irq_reset(xe);
+	if (atomic_xchg(&xe->irq.enabled, 0))
+		xe_irq_reset(xe);
 
 	if (xe_device_has_msix(xe))
 		xe_irq_msix_free(xe);
@@ -799,8 +797,14 @@ static void irq_uninstall(void *arg)
 
 int xe_irq_init(struct xe_device *xe)
 {
+	int err;
+
 	spin_lock_init(&xe->irq.lock);
 
+	err = drmm_mutex_init(&xe->drm, &xe->irq.state_lock);
+	if (err)
+		return err;
+
 	return xe_irq_msix_init(xe);
 }
 
@@ -845,6 +849,8 @@ static void xe_irq_msi_synchronize_irq(struct xe_device *xe)
 
 void xe_irq_suspend(struct xe_device *xe)
 {
+	mutex_lock(&xe->irq.state_lock);
+
 	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
 
 	/* flush irqs */
@@ -853,6 +859,8 @@ void xe_irq_suspend(struct xe_device *xe)
 	else
 		xe_irq_msi_synchronize_irq(xe);
 	xe_irq_reset(xe); /* turn irqs off */
+
+	mutex_unlock(&xe->irq.state_lock);
 }
 
 void xe_irq_resume(struct xe_device *xe)
@@ -860,10 +868,14 @@ void xe_irq_resume(struct xe_device *xe)
 	struct xe_gt *gt;
 	int id;
 
+	mutex_lock(&xe->irq.state_lock);
+
+	if (xe_device_wedged(xe))
+		goto out_unlock;
+
 	/*
-	 * lock not needed:
-	 * 1. no irq will arrive before the postinstall
-	 * 2. display is not yet resumed
+	 * irq.lock is not needed because no IRQ can arrive before
+	 * postinstall and the display has not been resumed yet.
 	 */
 	atomic_set(&xe->irq.enabled, 1);
 	xe_irq_reset(xe);
@@ -871,6 +883,9 @@ void xe_irq_resume(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
+
+out_unlock:
+	mutex_unlock(&xe->irq.state_lock);
 }
 
 /* MSI-X related definitions and functions below. */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c8..c94586886 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -270,6 +270,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
+	int io_idx;
 	int err;
 	bool atomic;
 	u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
@@ -278,13 +279,17 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err)
+		return err;
+
 	vm = xe_pagefault_asid_to_vm(pf, asid);
 	if (IS_ERR(vm)) {
 		err = PTR_ERR(vm);
 		trace_xe_pagefault_fail(xe, NULL, NULL, asid,
 					xe_pagefault_addr(pf),
 					xe_pagefault_get_error(pf), err);
-		return err;
+		goto out_io;
 	}
 
 	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
@@ -328,6 +333,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	up_read(&vm->lock);
 	xe_vm_put(vm);
 
+out_io:
+	xe_device_io_put(io_idx);
 	return err;
 }
 
@@ -517,6 +524,12 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 		    XE_PAGEFAULT_ALLOC_STATE_QUEUED)
 			continue;
 
+		if (xe_device_io_blocked(xe)) {
+			lpf->consumer.alloc_state =
+				XE_PAGEFAULT_ALLOC_STATE_FREE;
+			continue;
+		}
+
 		if (xe_pagefault_try_chain(pf_queue, lpf))
 			continue;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e66a81b1c..1ca3e1f9b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1332,19 +1332,38 @@ static int xe_pci_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int io_idx;
 	int err;
 
 	if (xe_survivability_mode_is_boot_enabled(xe))
 		return -EBUSY;
 
-	err = xe_pm_suspend(xe);
-	if (err)
-		return err;
+	/*
+	 * Wait until wedge work is queued, then wait for isolation to
+	 * finish before skipping driver-level suspend.
+	 */
+	err = xe_device_io_get(xe, &io_idx);
+	if (err) {
+		if (!xe_device_wedged(xe))
+			return err;
+
+		wait_for_completion(&xe->wedged.prepared);
+		flush_work(&xe->wedged.work);
+	} else {
+		err = xe_pm_suspend(xe);
+		xe_device_io_put(io_idx);
+
+		if (xe_device_wedged(xe)) {
+			wait_for_completion(&xe->wedged.prepared);
+			flush_work(&xe->wedged.work);
+		} else if (err) {
+			return err;
+		}
+	}
 
 	/*
-	 * Enabling D3Cold is needed for S2Idle/S0ix.
-	 * It is save to allow here since xe_pm_suspend has evicted
-	 * the local memory and the direct complete optimization is disabled.
+	 * Keep PCI suspend common to both paths so resume performs
+	 * matching PCI enable and D3Cold operations.
 	 */
 	d3cold_toggle(pdev, D3COLD_ENABLE);
 
@@ -1358,6 +1377,8 @@ static int xe_pci_suspend(struct device *dev)
 static int xe_pci_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int io_idx;
 	int err;
 
 	/* Give back the D3Cold decision to the runtime P M*/
@@ -1369,13 +1390,29 @@ static int xe_pci_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
+	/* Balance PCI suspend regardless of the current wedge state. */
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err) {
+		pci_clear_master(pdev);
+		return xe_device_wedged(xe) ? 0 : err;
+	}
+
 	pci_set_master(pdev);
 
-	err = xe_pm_resume(pdev_to_xe_device(pdev));
+	err = xe_pm_resume(xe);
+	xe_device_io_put(io_idx);
+
+	if (xe_device_wedged(xe)) {
+		wait_for_completion(&xe->wedged.prepared);
+		flush_work(&xe->wedged.work);
+		pci_clear_master(pdev);
+		return 0;
+	}
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671..3dfcef038 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -9,7 +9,6 @@
 #include "xe_gt.h"
 #include "xe_log.h"
 #include "xe_pci.h"
-#include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_survivability_mode.h"
@@ -20,19 +19,19 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	struct xe_gt *gt;
 	u8 id;
 
-	/*
-	 * Wedge the device to prevent userspace access but do not send the uevent.
-	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
-	 * pm reference to avoid underflow.
-	 */
-	if (!atomic_xchg(&xe->wedged.flag, 1))
-		xe_pm_runtime_get_noresume(xe);
-
+	/* Block device access until PCI error recovery completes. */
 	xe_device_set_in_reset(xe);
+	wake_up_all(&xe->ufence_wq);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
+	/*
+	 * GT wedging signals pending fences. Existing hardware users can now
+	 * finish without blocking reset.
+	 */
+	xe_device_io_drain(xe);
+
 	pci_disable_device(pdev);
 }
 
@@ -116,7 +115,6 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	 * TODO: optimize by re-initializing only the hardware state and re-creating
 	 * kernel BOs.
 	 */
-	xe_device_clear_in_reset(xe);
 	pdev->driver->remove(pdev);
 	devres_release_group(&pdev->dev, xe->devres_group);
 
@@ -125,8 +123,8 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 
 	xe = pdev_to_xe_device(pdev);
 
-	/* Wedge the device to prevent I/O operations till the resume callback */
-	atomic_set(&xe->wedged.flag, 1);
+	/* Block the new instance until the resume callback. */
+	xe_device_set_in_reset(xe);
 
 	return PCI_ERS_RESULT_RECOVERED;
 }
@@ -137,7 +135,8 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 
 	xe_info(xe, "PCI error: resume\n");
 
-	atomic_set(&xe->wedged.flag, 0);
+	/* Resume I/O operations. */
+	xe_device_clear_in_reset(xe);
 }
 
 const struct pci_error_handlers xe_pci_error_handlers = {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4f1035ab1..f08d83224 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -459,10 +459,16 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 	{
 		struct xe_validation_ctx ctx;
+		int io_idx;
+
+		/* Do not start PM preparation while device I/O is blocked. */
+		if (xe_device_io_get(xe, &io_idx))
+			break;
 
 		reinit_completion(&xe->pm_block);
 		xe_pm_block_begin_signalling();
 		xe_pm_runtime_get(xe);
+		xe->pm_notifier_active = true;
 		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
 					     (struct xe_val_flags) {.exclusive = true});
 		err = xe_bo_evict_all_user(xe);
@@ -479,10 +485,16 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		 * allocations.
 		 */
 		xe_pm_block_end_signalling();
+		xe_device_io_put(io_idx);
 		break;
 	}
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		if (!xe->pm_notifier_active)
+			break;
+
+		xe->pm_notifier_active = false;
+
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 33bd754d1..568b7ed7c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -157,7 +157,7 @@ int xe_sriov_pf_wait_ready(struct xe_device *xe)
 	unsigned int id;
 	int err;
 
-	if (xe_device_wedged(xe))
+	if (xe_device_io_blocked(xe))
 		return -ECANCELED;
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 909a602d0..226dfa57c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,7 @@
 #include <drm/ttm/ttm_bo.h>
 
 #include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_log.h"
@@ -457,9 +458,15 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
+	int io_idx;
 
 	guard(rwsem_read)(&vm->lock);
+
+	if (xe_device_io_get(vm->xe, &io_idx))
+		return;
+
 	xe_svm_garbage_collector(vm);
+	xe_device_io_put(io_idx);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -600,6 +607,8 @@ static int xe_svm_copy(struct page **pages,
 #define XE_VRAM_ADDR_INVALID	~0x0ull
 	u64 vram_addr = XE_VRAM_ADDR_INVALID;
 	int err = 0, pos = 0;
+	bool io_held = false;
+	int io_idx;
 	bool sram = dir == XE_SVM_COPY_TO_SRAM;
 	ktime_t start = xe_gt_stats_ktime_get();
 
@@ -630,6 +639,12 @@ static int xe_svm_copy(struct page **pages,
 			vr = xe_page_to_vr(spage);
 			gt = xe_migrate_exec_queue(vr->migrate)->gt;
 			xe = vr->xe;
+
+			err = xe_device_io_get(xe, &io_idx);
+			if (err)
+				goto err_out;
+
+			io_held = true;
 		}
 		XE_WARN_ON(spage && xe_page_to_vr(spage) != vr);
 
@@ -750,6 +765,9 @@ static int xe_svm_copy(struct page **pages,
 	if (pre_migrate_fence)
 		dma_fence_wait(pre_migrate_fence, false);
 
+	if (io_held)
+		xe_device_io_put(io_idx);
+
 	/*
 	 * XXX: We can't derive the GT here (or anywhere in this functions, but
 	 * compute always uses the primary GT so accumulate stats on the likely
@@ -1124,8 +1142,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct xe_bo *bo;
 	int err = 0, idx;
 
-	if (!drm_dev_enter(&xe->drm, &idx))
-		return -ENODEV;
+	err = xe_device_io_get(xe, &idx);
+	if (err)
+		return err;
 
 	xe_pm_runtime_get(xe);
 
@@ -1167,7 +1186,8 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 		xe_bo_put(bo);
 	}
 	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
+
+	xe_device_io_put(idx);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 36d47de8b..9d7c87c97 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -106,6 +106,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
+	struct xe_device *xe = ttm_to_xe_device(tbo->bdev);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
@@ -113,6 +114,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	unsigned long lpfn;
 	int err;
 
+	if (xe_device_wedged(xe))
+		return -ENODEV;
+
 	lpfn = place->lpfn;
 	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
 		lpfn = man->size >> PAGE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b98f2e56b..c003ba90f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -513,6 +513,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	int err = 0;
+	int io_idx;
 	long wait;
 	int __maybe_unused tries = 0;
 
@@ -546,6 +547,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock_outer;
 
+	if (xe_device_io_get(vm->xe, &io_idx)) {
+		xe_validation_ctx_fini(&ctx);
+		err = 0;
+		goto out_unlock_outer;
+	}
+
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
 
@@ -553,8 +560,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 		if (err || done) {
-			xe_validation_ctx_fini(&ctx);
-			goto out_unlock_outer;
+			goto out_unlock;
 		}
 	}
 
@@ -600,6 +606,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 out_unlock:
 	xe_validation_ctx_fini(&ctx);
+	xe_device_io_put(io_idx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1897,11 +1904,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 static void xe_vm_close(struct xe_vm *vm)
 {
 	struct xe_device *xe = vm->xe;
-	bool bound;
 	int idx;
 
-	bound = drm_dev_enter(&xe->drm, &idx);
-
 	down_write(&vm->lock);
 	xe_vm_lock(vm, false);
 
@@ -1920,13 +1924,15 @@ static void xe_vm_close(struct xe_vm *vm)
 				      DMA_RESV_USAGE_BOOKKEEP,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
-		if (bound) {
+		if (!xe_device_io_get(xe, &idx)) {
 			for_each_tile(tile, xe, id)
 				if (vm->pt_root[id])
 					xe_pt_clear(xe, vm->pt_root[id]);
 
 			for_each_gt(gt, xe, id)
 				xe_tlb_inval_vm(&gt->tlb_inval, vm);
+
+			xe_device_io_put(idx);
 		}
 	}
 
@@ -1935,9 +1941,6 @@ static void xe_vm_close(struct xe_vm *vm)
 
 	xe_vm_unlock(vm);
 	up_write(&vm->lock);
-
-	if (bound)
-		drm_dev_exit(idx);
 }
 
 void xe_vm_close_and_put(struct xe_vm *vm)
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index e241f3ec3..b5239c002 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -14,13 +14,19 @@
 #include "xe_macros.h"
 #include "xe_exec_queue.h"
 
-static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
+static int do_compare(struct xe_device *xe, u64 addr, u64 value, u64 mask, u16 op)
 {
 	u64 rvalue;
+	int io_idx;
 	int err;
 	bool passed;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err)
+		return err;
+
 	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
+	xe_device_io_put(io_idx);
 	if (err)
 		return -EFAULT;
 
@@ -136,7 +142,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 	add_wait_queue(&xe->ufence_wq, &w_wait);
 	for (;;) {
-		err = do_compare(addr, args->value, args->mask, args->op);
+		err = do_compare(xe, addr, args->value, args->mask, args->op);
 		if (err <= 0)
 			break;
 
@@ -155,7 +161,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 
 		if (!timeout) {
 			LNL_FLUSH_WORKQUEUE(xe->ordered_wq);
-			err = do_compare(addr, args->value, args->mask,
+			err = do_compare(xe, addr, args->value, args->mask,
 					 args->op);
 			if (err <= 0) {
 				drm_dbg(&xe->drm, "LNL_FLUSH_WORKQUEUE resolved ufence timeout\n");
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b23830494..27361fbad 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -482,6 +482,7 @@ void drm_dev_put(struct drm_device *dev);
 void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
+void drm_dev_srcu_synchronize(struct drm_device *dev);
 void drm_dev_unplug(struct drm_device *dev);
 int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
 			 struct drm_wedge_task_info *info);
-- 
2.43.0

