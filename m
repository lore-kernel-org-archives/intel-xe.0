Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAD9C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFA010E482;
	Mon, 14 Jul 2025 12:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3bGgkLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C247410E482
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752496028; x=1784032028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y5jtvDim03fU5fV798HPvqpPWvBZxFVtRyx8/rooNIw=;
 b=S3bGgkLMsjc30aGIHP1YzxJDrEykkFShvSulDUYi7B7cyNdBy2cWJorb
 SHwQ9wTDBCCOLOrTpzZnpen1Cn724jCZ4vie9YsklLWT8Xjn3DN/T1QFH
 Qs1cpGnHCfYFT3l8u7guJfSUazcf44C3K5kTK5QrEBxkrYpW69+VU06FL
 DU66+tYqAPdbQWqmIlTC1NuztO/Hsm0DQ2cyo0XiIy0IZCN/IPDNiqH8y
 bX1tzkdMW7AxfLyGEwsQsTyWD1PsJeoE4wofrB9AilkDqzS7BrGlBC4hz
 N6PmuiJxll0j0eWZuKxNvXGe+PqEjoHQXIa/mrmYb5pu2QJnUzBJI27mm Q==;
X-CSE-ConnectionGUID: 4m2M3cGwQWyDTIbyRe+fXw==
X-CSE-MsgGUID: 7tz4TF1hSt2jKZBgoU+p6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66131844"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66131844"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 05:27:08 -0700
X-CSE-ConnectionGUID: NasdINqfSbSC5m1qACaORw==
X-CSE-MsgGUID: 1ho75lWgSf6onc7r84FFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161225848"
Received: from unknown (HELO ilevi-mobl.intel.com) ([10.13.220.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 05:27:05 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, konstantin.sinyuk@intel.com,
 yaron.avizrat@intel.com, moti.haimovski@intel.com, didi.freiman@intel.com,
 tejas.upadhyay@intel.com, matthew.auld@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com
Subject: [PATCH v4] drm/xe: Support for mmap-ing mmio regions
Date: Mon, 14 Jul 2025 15:26:58 +0300
Message-Id: <20250714122658.1803-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
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

Allow the driver to expose hardware register spaces to userspace
through GEM objects with fake mmap offsets. This can be useful
for userspace-firmware communication, debugging, etc.

v2: Minor doc fix (CI)
v3: Enforce MAP_SHARED (Tejas)
    Add fault handler with dummy page (Tejas, Matt Auld)
    Store physical address instead of xe_mmio in the GEM object (MattB)
v4: Separate xe_mmio_gem from xe_mmio and make it private (MattB)

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_mmio_gem.c | 226 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio_gem.h |  20 +++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.c
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4bda20f586ed..382aadd4e816 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -85,6 +85,7 @@ xe-y += xe_bb.o \
 	xe_lrc.o \
 	xe_migrate.o \
 	xe_mmio.o \
+	xe_mmio_gem.o \
 	xe_mocs.o \
 	xe_module.o \
 	xe_nvm.o \
diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
new file mode 100644
index 000000000000..9a97c4387e4f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_mmio_gem.h"
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
+
+#include "xe_device_types.h"
+
+/**
+ * DOC: Exposing MMIO regions to userspace
+ *
+ * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
+ *
+ * This can be done as follows:
+ * 1. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
+ * 2. Use xe_mmio_gem_mmap_offset() on the created GEM object to retrieve the fake offset.
+ * 3. Provide the fake offset to userspace.
+ * 4. Userspace can call mmap with the fake offset. The length provided to mmap
+ *    must match the size of the GEM object.
+ * 5. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
+ *
+ * NOTE: The exposed MMIO region must be page-aligned with regards to its BAR offset and size.
+ *
+ * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
+ * Make sure not to expose any sensitive registers.
+ */
+
+static void xe_mmio_gem_free(struct drm_gem_object *);
+static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
+
+struct xe_mmio_gem {
+	struct drm_gem_object base;
+	phys_addr_t phys_addr;
+};
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
+/**
+ * xe_mmio_gem_create - Expose an MMIO region to userspace
+ * @xe: The xe device
+ * @file: DRM file descriptor
+ * @phys_addr: Start of the exposed MMIO region
+ * @size: The size of the exposed MMIO region
+ *
+ * This function creates a GEM object that exposes an MMIO region with an mmap-able
+ * fake offset.
+ *
+ * See: "Exposing MMIO regions to userspace"
+ */
+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
+				       phys_addr_t phys_addr, size_t size)
+{
+	struct xe_mmio_gem *obj;
+	struct drm_gem_object *base;
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
+/**
+ * xe_mmio_gem_mmap_offset - Return the mmap-able fake offset
+ * @gem: the GEM object created with xe_mmio_gem_create()
+ *
+ * This function returns the mmap-able fake offset allocated during
+ * xe_mmio_gem_create().
+ *
+ * See: "Exposing MMIO regions to userspace"
+ */
+u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem)
+{
+	return drm_vma_node_offset_addr(&gem->base.vma_node);
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
+ * xe_mmio_gem_destroy - Destroy the GEM object that exposes an MMIO region
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
diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.h b/drivers/gpu/drm/xe/xe_mmio_gem.h
new file mode 100644
index 000000000000..4b76d5586ebb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mmio_gem.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_MMIO_GEM_H_
+#define _XE_MMIO_GEM_H_
+
+#include <linux/types.h>
+
+struct drm_file;
+struct xe_device;
+struct xe_mmio_gem;
+
+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
+				       phys_addr_t phys_addr, size_t size);
+u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);
+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
+
+#endif /* _XE_MMIO_GEM_H_ */
-- 
2.43.0

