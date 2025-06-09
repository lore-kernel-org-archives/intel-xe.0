Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6B8C61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 09:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8C10E09B;
	Mon,  9 Jun 2025 09:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUrVk8fW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721710E0DB
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749460861; x=1780996861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z9z1NW5usFrGyd54IZqY7vZWFqLDGqN7r9D276Q+XIU=;
 b=gUrVk8fWk2+8B3yjlA46hsQwnGNl5PE7DF4QjvW2wvZAGdOWi/PM8pkf
 S1zM9vePr1UR2tEEwRf9FLpSg1N1yis0fyv/ExTRlu4KOkqp7DIw0UEzo
 7WtgylVs/z0M9/oVAZDEFoqpxU9mUDDxyvQA32ZIq+b6SxFZ5xVXnXmt4
 /NR44jhAJBDIBONeZJpFrDStcuNcBDAOcOKMjCUUR/IfaW81A9G3uhqnD
 xE6S36YIZrDTciMtQt92H9cKM6JMsmluNFRZgtuXFe1biG12/6ugTtxIV
 yP2CX5CrSlR/1Px+VbURfhQD6gzv0XpHDL8Q32iWunlB6h7EWQsCOwjqc Q==;
X-CSE-ConnectionGUID: VThOrQyTSz6MQWZrlIdvVQ==
X-CSE-MsgGUID: qcGhNVHHQ3+Vk0b0sUTaGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51390296"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51390296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 02:20:59 -0700
X-CSE-ConnectionGUID: 02b+WkNaTva9lXpApg1oEA==
X-CSE-MsgGUID: eivz5pP7RVK4tHxay6JY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="150275317"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.146.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 02:20:56 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, konstantin.sinyuk@intel.com,
 yaron.avizrat@intel.com, moti.haimovski@intel.com, didi.freiman@intel.com
Subject: [PATCH] drm/xe: Support for mmap-ing mmio regions
Date: Mon,  9 Jun 2025 12:20:47 +0300
Message-Id: <20250609092047.7668-1-ilia.levi@intel.com>
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

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  14 +++
 drivers/gpu/drm/xe/xe_mmio.c         | 142 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h         |   4 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ac27389ccb8b..78542de0d48d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
@@ -161,6 +162,19 @@ struct xe_mmio {
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
+	/** @mmio: The MMIO region to expose */
+	struct xe_mmio mmio;
+};
+
 /**
  * struct xe_tile - hardware tile structure
  *
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..f08cd8fc6945 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -408,3 +408,145 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
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
+
+static const struct vm_operations_struct vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
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
+ * @drm_file: DRM file descriptor
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
+	int err;
+
+	if ((xe_mmio_phys_addr(mmio) % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
+		return ERR_PTR(-EINVAL);
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	base = &obj->base;
+	base->funcs = &xe_mmio_gem_funcs;
+	obj->mmio = *mmio;
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
+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
+	struct xe_mmio *mmio = &obj->mmio;
+
+	if (vma->vm_end - vma->vm_start != base->size)
+		return -EINVAL;
+
+	/*
+	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
+	 * whole buffer from the start.
+	 */
+	vma->vm_pgoff = 0;
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+
+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
+		     VM_DONTCOPY | VM_NORESERVE);
+
+	return remap_pfn_range(vma, vma->vm_start, xe_mmio_phys_addr(mmio) >> PAGE_SHIFT,
+			       base->size, vma->vm_page_prot);
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

