Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C09C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0207A10F168;
	Thu, 23 Jul 2026 16:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VzZznVzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D3510F166
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823566; x=1816359566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=egrmGwLVGt6nZAzlFxzey77EYctJuveQw13clYHEyT8=;
 b=VzZznVztGpH2BWLZXs1ttepnyT/I2E4bTYYFinq+tAcJDgOczMRBcdDU
 ua+1SA6c2jLPqYRtJuoHvCDeKLYBbs7iiP+I1mIICpT+bGgbGqfQh5GMC
 DAi0fG/40kesV1Xa15QsKu4vWSwBLB00Xf7nSGTCt9Jlwg6WvXXCjxTew
 gIod7Lm4w9rWdGfHvWAIEvIUYS01mh3rd+s9wYDriax9aWlwoIjNuG7AR
 oUZIoE3bhrA4jkbWyGOK/JCvp+jDTRk7a5SkiKJtjSEyCAzeETcwU3ReR
 9hFj92PLpphZQ930tLBcE7G/JH4AGykVAM9iOlh3ilaCDLCX03ial37rJ w==;
X-CSE-ConnectionGUID: vpjXz9llQHS1C8wwYn9m1A==
X-CSE-MsgGUID: QxncwH7WTyWV5IIzpn70ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88022937"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="88022937"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:17 -0700
X-CSE-ConnectionGUID: eRUgOnsGSRCeCpdJ1THazA==
X-CSE-MsgGUID: EBDPftBZSlSWqhtNb6zW4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="255086074"
Received: from lharel-mobl.ger.corp.intel.com (HELO
 soc-PF64PT41.clients.intel.com) ([10.245.129.67])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:19:14 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, meny.yossefi@intel.com,
 shuicheng.lin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 7/7] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
Date: Thu, 23 Jul 2026 19:18:32 +0300
Message-ID: <20260723161832.137153-8-ilia.levi@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260723161832.137153-1-ilia.levi@intel.com>
References: <20260723161832.137153-1-ilia.levi@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

Convert the PCI barrier mmap over to use xe_mmio_gem, which is a good
match for this functionality. This has the following advantages:

 1) Removes a bunch of code.
 2) Replaces the fragile hard coded fake offset design.
 3) Adds the first user for xe_mmio_gem, which is preferred over nuking
    it.

There shouldn't be any big functional change here. From userspace pov,
they still query the fake offset like before, just that now it is no
longer hard coded in the KMD.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  24 +++++--
 drivers/gpu/drm/xe/xe_bo.h           |   1 -
 drivers/gpu/drm/xe/xe_device.c       | 102 +++------------------------
 drivers/gpu/drm/xe/xe_device_types.h |  12 ++++
 4 files changed, 39 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..16ddbdf7628f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -28,6 +28,7 @@
 #include "xe_ggtt.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
+#include "xe_mmio_gem.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
@@ -3503,18 +3504,31 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
+		struct xe_file *xef = file->driver_priv;
+
 		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe)))
 			return -EINVAL;
 
 		if (XE_IOCTL_DBG(xe, args->handle))
 			return -EINVAL;
 
-		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
-			return -EINVAL;
+		guard(mutex)(&xef->mmio_gem.lock);
+		if (!xef->mmio_gem.pci_barrier) {
+			phys_addr_t phys_addr;
+			int err;
+
+#define LAST_DB_PAGE_OFFSET 0x7ff000
+			phys_addr = pci_resource_start(to_pci_dev(dev->dev), 0) +
+				LAST_DB_PAGE_OFFSET;
+			xef->mmio_gem.pci_barrier = xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);
+			if (IS_ERR(xef->mmio_gem.pci_barrier)) {
+				err = PTR_ERR(xef->mmio_gem.pci_barrier);
+				xef->mmio_gem.pci_barrier = NULL;
+				return err;
+			}
+		}
 
-		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
-			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
-		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
+		args->offset = xe_mmio_gem_mmap_offset(xef->mmio_gem.pci_barrier);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7ae1d9ac0574..82a4666ca51e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -85,7 +85,6 @@
 
 #define XE_BO_PROPS_INVALID	(-1)
 
-#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
 
 /**
  * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..3c59fe347858 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -49,6 +49,7 @@
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
 #include "xe_mmio.h"
+#include "xe_mmio_gem.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
 #include "xe_oa.h"
@@ -110,6 +111,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+	mutex_init(&xef->mmio_gem.lock);
+
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
@@ -132,6 +135,8 @@ static void xe_file_destroy(struct kref *ref)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+	mutex_destroy(&xef->mmio_gem.lock);
+
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 	kfree(xef);
@@ -188,6 +193,9 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
 
+	if (xef->mmio_gem.pci_barrier)
+		xe_mmio_gem_destroy(xef->mmio_gem.pci_barrier, file);
+
 	xe_file_put(xef);
 }
 
@@ -257,95 +265,6 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
 #define xe_drm_compat_ioctl NULL
 #endif
 
-static void barrier_open(struct vm_area_struct *vma)
-{
-	drm_dev_get(vma->vm_private_data);
-}
-
-static void barrier_close(struct vm_area_struct *vma)
-{
-	drm_dev_put(vma->vm_private_data);
-}
-
-static void barrier_release_dummy_page(struct drm_device *dev, void *res)
-{
-	struct page *dummy_page = (struct page *)res;
-
-	__free_page(dummy_page);
-}
-
-static vm_fault_t barrier_fault(struct vm_fault *vmf)
-{
-	struct drm_device *dev = vmf->vma->vm_private_data;
-	struct vm_area_struct *vma = vmf->vma;
-	vm_fault_t ret = VM_FAULT_NOPAGE;
-	pgprot_t prot;
-	int idx;
-
-	prot = vm_get_page_prot(vma->vm_flags);
-
-	if (drm_dev_enter(dev, &idx)) {
-		unsigned long pfn;
-
-#define LAST_DB_PAGE_OFFSET 0x7ff001
-		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
-				LAST_DB_PAGE_OFFSET);
-		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
-					  pgprot_noncached(prot));
-		drm_dev_exit(idx);
-	} else {
-		struct page *page;
-
-		/* Allocate new dummy page to map all the VA range in this VMA to it*/
-		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-		if (!page)
-			return VM_FAULT_OOM;
-
-		/* Set the page to be freed using drmm release action */
-		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
-			return VM_FAULT_OOM;
-
-		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
-					  prot);
-	}
-
-	return ret;
-}
-
-static const struct vm_operations_struct vm_ops_barrier = {
-	.open = barrier_open,
-	.close = barrier_close,
-	.fault = barrier_fault,
-};
-
-static int xe_pci_barrier_mmap(struct file *filp,
-			       struct vm_area_struct *vma)
-{
-	struct drm_file *priv = filp->private_data;
-	struct drm_device *dev = priv->minor->dev;
-	struct xe_device *xe = to_xe_device(dev);
-
-	if (!IS_DGFX(xe))
-		return -EINVAL;
-
-	if (vma->vm_end - vma->vm_start > SZ_4K)
-		return -EINVAL;
-
-	if (is_cow_mapping(vma->vm_flags))
-		return -EINVAL;
-
-	if (vma->vm_flags & (VM_READ | VM_EXEC))
-		return -EINVAL;
-
-	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
-	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
-	vma->vm_ops = &vm_ops_barrier;
-	vma->vm_private_data = dev;
-	drm_dev_get(vma->vm_private_data);
-
-	return 0;
-}
-
 static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct drm_file *priv = filp->private_data;
@@ -354,11 +273,6 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
-	switch (vma->vm_pgoff) {
-	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
-		return xe_pci_barrier_mmap(filp, vma);
-	}
-
 	return drm_gem_mmap(filp, vma);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 860ad322237f..8da3ff47be83 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -38,6 +38,7 @@
 struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
+struct xe_mmio_gem;
 struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
@@ -642,6 +643,17 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+	/** @mmio_gem: MMIO GEM objects for this xe file */
+	struct {
+		/**
+		 * @mmio_gem.lock: Protects allocation and attach of MMIO GEM
+		 * objects (singleton).
+		 */
+		struct mutex lock;
+		/** @mmio_gem.pci_barrier: MMIO GEM object for PCI barrier mmap. */
+		struct xe_mmio_gem *pci_barrier;
+	} mmio_gem;
 };
 
 #endif
-- 
2.49.1

