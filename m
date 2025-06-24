Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28132C77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 15:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D747910E5E7;
	Tue, 24 Jun 2025 15:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c23t4h0d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E510E5E7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 15:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750780352; x=1782316352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N8lwvlBGjq3r/TeZ9rqJClvrZWr1nZ4oK4KohLScAUU=;
 b=c23t4h0dEnmaA9Jm/uGVvnnXd7uTHh+tlzF2X/uwHrJL8ZGJE014n9fU
 x2bFQStaBacACjiNRv5C1eeKtGVkT/HTaMelT2sdBXLj8eibdUg0msGVt
 XpqtDqBMwmoS+LhbxZ73rH4LGHGWrmpQ02DS4DdcZuEJF+0JIJfROOaXi
 OxpV+X0YaUe8kTXeen3mHTcpOXdR6h4sSCwJW6MDRRvOLFyRFgAFWk/sb
 DFUZLZbmdj8kee/MhRFxHq9zW/1f+Qyrc7VwcsMi/M1hUEJLpy4zeNzkR
 fclhphe/Hfgo17DDYnekapx5oiFmvBaHrTJrFTnyRjdQyxzsNhHMxTSr2 A==;
X-CSE-ConnectionGUID: iNsWXE8cQAKCZFVvhZC0Lg==
X-CSE-MsgGUID: AYVakzxPR1mXl2a0UGIAtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55655221"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="55655221"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:52:32 -0700
X-CSE-ConnectionGUID: kTI+YKFDR7eHbNoaNjCwUw==
X-CSE-MsgGUID: dtsmIRyES8mygyF/2c10mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="156239510"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.168.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:52:29 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, konstantin.sinyuk@intel.com,
 yaron.avizrat@intel.com, moti.haimovski@intel.com, didi.freiman@intel.com,
 tejas.upadhyay@intel.com, matthew.auld@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com
Subject: [PATCH v3] drm/xe: Support for mmap-ing mmio regions
Date: Tue, 24 Jun 2025 18:52:21 +0300
Message-Id: <20250624155221.208338-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
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

Allow the driver to expose hardware register spaces to userspace
through GEM objects with fake mmap offsets. This can be useful
for userspace-firmware communication, debugging, etc.

v2: Minor doc fix (CI)
v3: Enforce MAP_SHARED (Tejas)
    Add fault handler with dummy page (Tejas, Matt Auld)
    Store physical address instead of xe_mmio in the GEM object (MattB)

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  14 ++
 drivers/gpu/drm/xe/xe_mmio.c         | 210 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h         |   4 +
 3 files changed, 228 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..22a567c5f0de 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
@@ -162,6 +163,19 @@ struct xe_mmio {
 	u32 adj_offset;
 };
 
+/**
+ * struct xe_mmio_gem - GEM wrapper for xe_mmio
+ *
+ * A GEM object for exposing xe_mmio instance to userspace via mmap.
+ */
+struct xe_mmio_gem {
+	/** @base: GEM object base */
+	struct drm_gem_object base;
+
+	/** @phys_addr: The physical address of the exposed MMIO region */
+	phys_addr_t phys_addr;
+};
+
 /**
  * struct xe_tile - hardware tile structure
  *
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..3298ab0f1fb4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/pci.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -408,3 +409,212 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
 {
 	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
 }
+
+/**
+ * DOC: Exposing MMIO regions to userspace
+ *
+ * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
+ *
+ * This can be done as follows:
+ * 1. Define an xe_mmio instance that represents this portion.
+ * 2. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
+ * 3. Use drm_vma_node_offset_addr() on the created GEM object to retrieve the fake offset.
+ * 4. Provide the fake offset to userspace.
+ * 5. Userspace can call mmap with the fake offset. The length provided to mmap
+ *    must match the size of the xe_mmio instance.
+ * 6. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
+ *
+ * Limitations: The exposed xe_mmio must be page-aligned with regards to its BAR offset and size.
+ *
+ * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
+ * Make sure not to expose any sensitive registers.
+ */
+
+static void xe_mmio_gem_free(struct drm_gem_object *);
+static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
+
+static const struct vm_operations_struct vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+	.fault = xe_mmio_gem_vm_fault,
+};
+
+static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
+	.free = xe_mmio_gem_free,
+	.mmap = xe_mmio_gem_mmap,
+	.vm_ops = &vm_ops,
+};
+
+static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
+{
+	return container_of(obj, struct xe_mmio_gem, base);
+}
+
+static inline phys_addr_t xe_mmio_phys_addr(struct xe_mmio *mmio)
+{
+	struct xe_device *xe = tile_to_xe(mmio->tile);
+
+	/*
+	 * All MMIO instances are currently on PCI BAR 0, so we can do the trick below.
+	 * In the future we may want to store the physical address in struct xe_mmio.
+	 */
+	return pci_resource_start(to_pci_dev(xe->drm.dev), GTTMMADR_BAR) +
+		(uintptr_t)(mmio->regs - xe->mmio.regs);
+}
+
+/**
+ * xe_mmio_gem_create - Expose an MMIO region to userspace
+ * @mmio: xe_mmio instance
+ * @file: DRM file descriptor
+ *
+ * This function creates a GEM object with an mmap-able fake offset that wraps
+ * the provided xe_mmio instance.
+ *
+ * See: "Exposing MMIO regions to userspace"
+ */
+struct xe_mmio_gem *
+xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file)
+{
+	struct xe_device *xe = tile_to_xe(mmio->tile);
+	size_t size = mmio->regs_size;
+	struct xe_mmio_gem *obj;
+	struct drm_gem_object *base;
+	phys_addr_t phys_addr = xe_mmio_phys_addr(mmio);
+	int err;
+
+	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
+		return ERR_PTR(-EINVAL);
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	base = &obj->base;
+	base->funcs = &xe_mmio_gem_funcs;
+	obj->phys_addr = phys_addr;
+
+	drm_gem_private_object_init(&xe->drm, base, size);
+
+	err = drm_gem_create_mmap_offset(base);
+	if (err)
+		goto free_gem;
+
+	err = drm_vma_node_allow(&base->vma_node, file);
+	if (err)
+		goto free_gem;
+
+	return obj;
+
+free_gem:
+	xe_mmio_gem_free(base);
+	return ERR_PTR(err);
+}
+
+static void xe_mmio_gem_free(struct drm_gem_object *base)
+{
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
+
+	drm_gem_object_release(base);
+	kfree(obj);
+}
+
+/**
+ * xe_mmio_gem_destroy - Destroy the GEM object wrapping xe_mmio
+ * @gem: the GEM object to destroy
+ *
+ * This function releases resources associated with the GEM object created by
+ * xe_mmio_gem_create().
+ *
+ * See: "Exposing MMIO regions to userspace"
+ */
+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
+{
+	xe_mmio_gem_free(&gem->base);
+}
+
+static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
+{
+	if (vma->vm_end - vma->vm_start != base->size)
+		return -EINVAL;
+
+	if ((vma->vm_flags & VM_SHARED) == 0)
+		return -EINVAL;
+
+	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
+	vma->vm_pgoff = 0;
+	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+		     VM_DONTCOPY | VM_NORESERVE);
+
+	/* Defer actual mapping to the fault handler. */
+	return 0;
+}
+
+static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
+{
+	__free_page((struct page *)res);
+}
+
+static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
+{
+	struct drm_gem_object *base = vma->vm_private_data;
+	struct drm_device *dev = base->dev;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	struct page *page;
+	unsigned long pfn;
+	unsigned long i;
+
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
+		return VM_FAULT_OOM;
+
+	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
+		return VM_FAULT_OOM;
+
+	pfn = page_to_pfn(page);
+
+	/* Map the entire VMA to the same dummy page */
+	for (i = 0; i < base->size; i += PAGE_SIZE) {
+		unsigned long addr = vma->vm_start + i;
+
+		ret = vmf_insert_pfn(vma, addr, pfn);
+		if (ret & VM_FAULT_ERROR)
+			break;
+	}
+
+	return ret;
+}
+
+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	struct drm_gem_object *base = vma->vm_private_data;
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
+	struct drm_device *dev = base->dev;
+	vm_fault_t ret = VM_FAULT_NOPAGE;
+	unsigned long i;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx)) {
+		/*
+		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
+		 * This gives the userspace the option to recover instead of crashing.
+		 * It is assumed the userspace will receive the notification via some
+		 * other channel (e.g. drm uevent).
+		 */
+		return xe_mmio_gem_vm_fault_dummy_page(vma);
+	}
+
+	for (i = 0; i < base->size; i += PAGE_SIZE) {
+		unsigned long addr = vma->vm_start + i;
+		unsigned long phys_addr = obj->phys_addr + i;
+
+		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
+		if (ret & VM_FAULT_ERROR)
+			break;
+	}
+
+	drm_dev_exit(idx);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c151ba569003..2990bbcef24d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -8,6 +8,7 @@
 
 #include "xe_gt_types.h"
 
+struct drm_file;
 struct xe_device;
 struct xe_reg;
 
@@ -42,4 +43,7 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
 	return &xe->tiles[0].mmio;
 }
 
+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_mmio *mmio, struct drm_file *file);
+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
+
 #endif
-- 
2.43.0

