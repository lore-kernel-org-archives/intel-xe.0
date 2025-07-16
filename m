Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F92C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03E10E675;
	Wed, 16 Jul 2025 20:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFImHUUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3F10E67A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752699356; x=1784235356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEW6UnCzx8taH9iFQ06eDhGzYD5m3LKIPNjWs1Y/mnw=;
 b=BFImHUUusw4yTfHOxISg0lQbRc5wVEZKoalYT6BHoFOJHg/bbvBkCbVh
 +X9nOAOeTzURVJ76AZwJ9s433PqBLnNhXMZiQnxtcciawdBGrNQ+uYrPB
 MintZ5lnHQ5SdA10gsLyCGlL7xqrG25t+sCDloV6f1wYXXIKy4Lx/FdFP
 xlelr5gTX1QeQCsMvx1QupGdBchl1yqfFQh3g8mP8m0JTLOjLGk8sq5U3
 LcSyta6e2RICBWw5L73ZNJATezLe3Idap4CuPDylHIYFVdkyVRZ8gLiNQ
 kdkqKqC/V2aedl30dVA1bQJ5bqjGvdONKJrgTQV1zD5mWZQZfKoTfkvqG Q==;
X-CSE-ConnectionGUID: 28nXb+veQ2S0fZtQGS7wTQ==
X-CSE-MsgGUID: anoyL6x1QfWga9rbNnOLaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58770467"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58770467"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
X-CSE-ConnectionGUID: AiLrMSbwSju/D2xK3HoCmQ==
X-CSE-MsgGUID: QyHTmoWSRQq6EaKHOwHwqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157686079"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: [PATCH 2/4] drm/xe/psmi: Add debugfs interface for allocation of PSMI
 capture buffers
Date: Wed, 16 Jul 2025 13:55:45 -0700
Message-ID: <20250716-psmi-v1-2-674c13d7028e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716-psmi-v1-0-674c13d7028e@intel.com>
References: <20250716-psmi-v1-0-674c13d7028e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Requirement for PSMI capture is to have a physically contiguous buffer.
All the needed configuration is done by the userspace tool directly to
the GPU via mmio access.

This interface only support allocating from VRAM regions. For integrated
devices and allocating PSMI buffer in SYSTEM memory, the best practice
has been for userspace to allocate the buffer themselves using hugetlbfs.

Here we add the ability to allocate a region of physically contiguous
memory by writing to debugfs file (listed below). For multi-tile devices,
the capture tool requires ability to allocate a capture buffer per tile
(VRAM region) and so user can specify a region_mask. The tool then
can mmap the buffers via direct mmap of the PCIBAR via sysfs.

To support the capture tool, 3 new debugfs entries are added.
On read:
   psmi_capture_addr - physical address per VRAM region's capture buffer
   psmi_capture_region_mask - select which region(s) to allocate a buffer
   psmi_capture_size - size of current capture buffer

Writing psmi_capture_size will allocate new buffer of requested size per
region after freeing any current buffers.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Original-author: Brian Welty <brian.welty@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c      |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_device_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc.c          |   1 +
 drivers/gpu/drm/xe/xe_psmi.c         | 297 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_psmi.h         |  15 ++
 7 files changed, 327 insertions(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 07c71a29963d9..862b5ed016c25 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
+	xe_psmi.o \
 	xe_pt.o \
 	xe_pt_walk.o \
 	xe_pxp.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 129186f4193bd..cfaebb4ff0b96 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc_ads.h"
 #include "xe_pm.h"
+#include "xe_psmi.h"
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
@@ -315,6 +316,8 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	xe_pxp_debugfs_register(xe->pxp);
 
+	xe_psmi_debugfs_create(xe, root);
+
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
 
 	if (IS_SRIOV_PF(xe))
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 08f45777f797b..36bc58beacd05 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -54,6 +54,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_pmu.h"
+#include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_shrinker.h"
@@ -957,6 +958,8 @@ void xe_device_remove(struct xe_device *xe)
 	drm_dev_unplug(&xe->drm);
 
 	xe_bo_pci_dev_remove_all(xe);
+
+	xe_psmi_cleanup(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb6105523f233..6941cb965dde9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -572,6 +572,13 @@ struct xe_device {
 	atomic64_t global_total_pages;
 #endif
 
+	struct {
+		/** @psmi.capture_obj: PSMI buffer for VRAM0-1 and SMEM (future) */
+		struct xe_bo *capture_obj[XE_MAX_TILES_PER_DEVICE + 1];
+		/** @psmi.region_mask: Mask of valid memory regions */
+		u8 region_mask;
+	} psmi;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index a117300501247..4d11c3a66ad38 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -36,6 +36,7 @@
 #include "xe_guc_submit.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 #include "xe_sriov.h"
 #include "xe_uc.h"
diff --git a/drivers/gpu/drm/xe/xe_psmi.c b/drivers/gpu/drm/xe/xe_psmi.c
new file mode 100644
index 0000000000000..9d75ec30bfdee
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_psmi.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_module.h"
+#include "xe_psmi.h"
+
+/*
+ * PSMI capture support
+ *
+ * Requirement for PSMI capture is to have a physically contiguous buffer.  The
+ * PSMI tool owns doing all necessary configuration (MMIO register writes are
+ * done from user-space). However, KMD needs to provide the PSMI tool with the
+ * required physical address of the base of PSMI buffer.
+ *
+ * VRAM backed PSMI buffer:
+ * Buffer is allocated as GEM object and with XE_BO_CREATE_PINNED_BIT flag which
+ * creates a contiguous allocation. The physical address is returned from
+ * psmi_debugfs_capture_addr_show(). PSMI tool can mmap the buffer via the
+ * PCIBAR through sysfs.
+ *
+ * SYSTEM memory backed PSMI buffer:
+ * Interface here does not support allocating from SYSTEM memory region.  The
+ * PSMI tool to allocate memory themselves using hugetlbfs. In order to get the
+ * physical address, user-space can query /proc/[pid]/pagemap. As an
+ * alternative, CMA debugfs could also be used to allocate reserved CMA memory.
+ */
+
+static int psmi_resize_object(struct xe_device *, size_t);
+
+/*
+ * Returns an address for the capture tool to use to find start of capture
+ * buffer. Capture tool requires the capability to have a buffer allocated per
+ * each tile (VRAM region), thus we return an address for each region.
+ */
+static int psmi_debugfs_capture_addr_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe = m->private;
+	unsigned long id, region_mask;
+	struct xe_bo *bo;
+	u64 val;
+
+	region_mask = xe->psmi.region_mask;
+	for_each_set_bit(id, &region_mask,
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
+		if (id) {
+			/* VRAM region */
+			bo = xe->psmi.capture_obj[id];
+			if (!bo)
+				continue;
+			/* pinned, so don't need bo_lock */
+			val = __xe_bo_addr(bo, 0, PAGE_SIZE);
+		} else {
+			/* reserved for future SMEM support */
+			val = 0;
+		}
+		seq_printf(m, "%ld: 0x%llx\n", id, val);
+	}
+
+	return 0;
+}
+
+/*
+ * Return capture buffer size, using the size from first allocated object that
+ * is found. This works because all objects must be of the same size.
+ */
+static int psmi_debugfs_capture_size_get(void *data, u64 *val)
+{
+	unsigned long id, region_mask;
+	struct xe_device *xe = data;
+	struct xe_bo *bo;
+
+	region_mask = xe->psmi.region_mask;
+	for_each_set_bit(id, &region_mask,
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
+		if (id) {
+			bo = xe->psmi.capture_obj[id];
+			if (bo) {
+				*val = xe_bo_size(bo);
+				return 0;
+			}
+		}
+	}
+
+	/* no capture objects are allocated */
+	*val = 0;
+	return 0;
+}
+
+/*
+ * Set size of PSMI capture buffer. This triggers the allocation of capture
+ * buffer in each memory region as specified with prior write to
+ * psmi_capture_region_mask.
+ */
+static int psmi_debugfs_capture_size_set(void *data, u64 val)
+{
+	struct xe_device *xe = data;
+
+	if (!xe_modparam.enable_psmi)
+		return -ENODEV;
+
+	/* user must have specified at least one region */
+	if (!xe->psmi.region_mask)
+		return -EINVAL;
+
+	return psmi_resize_object(xe, val);
+}
+
+static int psmi_debugfs_capture_region_mask_get(void *data, u64 *val)
+{
+	struct xe_device *xe = data;
+
+	*val = xe->psmi.region_mask;
+	return 0;
+}
+
+/*
+ * Select VRAM regions for multi-tile devices, only allowed when buffer is not
+ * currently allocated.
+ */
+static int psmi_debugfs_capture_region_mask_set(void *data, u64 region_mask)
+{
+	struct xe_device *xe = data;
+	u64 size = 0;
+
+	if (!xe_modparam.enable_psmi)
+		return -ENODEV;
+
+	/* SMEM is not supported (see comments at top of file) */
+	if (region_mask & 0x1)
+		return -EOPNOTSUPP;
+
+	/* input bitmask should contain only valid TTM regions */
+	if (!region_mask || region_mask & ~xe->info.mem_region_mask)
+		return -EINVAL;
+
+	/* only allow setting mask if buffer is not yet allocated */
+	psmi_debugfs_capture_size_get(xe, &size);
+	if (size)
+		return -EBUSY;
+
+	xe->psmi.region_mask = region_mask;
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(psmi_debugfs_capture_addr);
+
+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_region_mask_fops,
+			 psmi_debugfs_capture_region_mask_get,
+			 psmi_debugfs_capture_region_mask_set,
+			 "0x%llx\n");
+
+DEFINE_DEBUGFS_ATTRIBUTE(psmi_debugfs_capture_size_fops,
+			 psmi_debugfs_capture_size_get,
+			 psmi_debugfs_capture_size_set,
+			 "%lld\n");
+
+void xe_psmi_debugfs_create(struct xe_device *xe, struct dentry *fs_root)
+{
+	debugfs_create_file("psmi_capture_addr",
+			    0400, fs_root, xe,
+			    &psmi_debugfs_capture_addr_fops);
+
+	debugfs_create_file("psmi_capture_region_mask",
+			    0600, fs_root, xe,
+			    &psmi_debugfs_capture_region_mask_fops);
+
+	debugfs_create_file("psmi_capture_size",
+			    0600, fs_root, xe,
+			    &psmi_debugfs_capture_size_fops);
+}
+
+/*
+ * Allocate GEM object for the PSMI capture buffer (in VRAM).
+ * @bo_size: size in bytes
+ */
+static struct xe_bo *
+psmi_alloc_object(struct xe_device *xe, unsigned int id, size_t bo_size)
+{
+	struct xe_bo *bo = NULL;
+	struct xe_tile *tile;
+	int err;
+
+	if (!id || !bo_size)
+		return NULL;
+	tile = &xe->tiles[id - 1];
+
+	/* VRAM: Allocate GEM object for the capture buffer */
+	bo = xe_bo_create_locked(xe, tile, NULL, bo_size,
+				 ttm_bo_type_kernel,
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				 XE_BO_FLAG_PINNED |
+				 XE_BO_FLAG_NEEDS_CPU_ACCESS);
+
+	if (!IS_ERR(bo)) {
+		/* Buffer written by HW, ensure stays resident */
+		err = xe_bo_pin(bo);
+		if (err)
+			bo = ERR_PTR(err);
+		xe_bo_unlock(bo);
+	}
+
+	return bo;
+}
+
+static void psmi_free_object(struct xe_bo *bo)
+{
+	xe_bo_lock(bo, NULL);
+	xe_bo_unpin(bo);
+	xe_bo_unlock(bo);
+	xe_bo_put(bo);
+}
+
+/*
+ * Free PSMI capture buffer objects.
+ */
+void xe_psmi_cleanup(struct xe_device *xe)
+{
+	unsigned long id, region_mask;
+	struct xe_bo *bo;
+
+	/*
+	 * For total guarantee that we free all objects, iterate over known
+	 * regions instead of using psmi.region_mask here.
+	 */
+	region_mask = xe->info.mem_region_mask;
+	for_each_set_bit(id, &region_mask,
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
+		if (id) {
+			bo = xe->psmi.capture_obj[id];
+			if (bo) {
+				psmi_free_object(bo);
+				xe->psmi.capture_obj[id] = NULL;
+			}
+		}
+	}
+}
+
+/*
+ * Allocate PSMI capture buffer objects (via debugfs set function), based on
+ * which regions the user has selected in region_mask.  @size: size in bytes
+ * (should be power of 2)
+ *
+ * Always release/free the current buffer objects before attempting to allocate
+ * new ones.  Size == 0 will free all current buffers.
+ *
+ * Note, we don't write any registers as the capture tool is already configuring
+ * all PSMI registers itself via mmio space.
+ */
+static int psmi_resize_object(struct xe_device *xe, size_t size)
+{
+	unsigned long id, region_mask = xe->psmi.region_mask;
+	struct xe_bo *bo = NULL;
+	int err = 0;
+
+	/*
+	 * Buddy allocator anyway will roundup to next power of 2,
+	 * so rather than waste unused pages, require user to ask for
+	 * power of 2 sized PSMI buffers.
+	 */
+	if (size && !is_power_of_2(size))
+		return -EINVAL;
+
+	/* if resizing, free currently allocated buffers first */
+	xe_psmi_cleanup(xe);
+
+	/* can set size to 0, in which case, now done */
+	if (!size)
+		return 0;
+
+	for_each_set_bit(id, &region_mask,
+			 ARRAY_SIZE(xe->psmi.capture_obj)) {
+		if (id) {
+			/* VRAM: allocate with BO */
+			bo = psmi_alloc_object(xe, id, size);
+			if (IS_ERR(bo)) {
+				err = PTR_ERR(bo);
+				break;
+			}
+			xe->psmi.capture_obj[id] = bo;
+		}
+
+		drm_info(&xe->drm,
+			 "PSMI capture size requested: %zu bytes, allocated: %lu:%zu\n",
+			 size, id, bo ? xe_bo_size(bo) : 0);
+	}
+
+	/* on error, reverse what was allocated */
+	if (err)
+		xe_psmi_cleanup(xe);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_psmi.h b/drivers/gpu/drm/xe/xe_psmi.h
new file mode 100644
index 0000000000000..66dd5dc40feb4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_psmi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PSMI_H_
+#define _XE_PSMI_H_
+
+struct xe_device;
+struct dentry;
+
+void xe_psmi_cleanup(struct xe_device *xe);
+void xe_psmi_debugfs_create(struct xe_device *xe, struct dentry *fs_root);
+
+#endif

-- 
2.49.0

