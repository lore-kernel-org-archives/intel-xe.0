Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CC2E8B361
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86E810E29A;
	Tue,  3 Feb 2026 21:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TC2pFpVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D04910E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770153191; x=1801689191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSwvy6jtqm5BHrAHvmXAvz2B14u8F0ceeYEzCnwiOnM=;
 b=TC2pFpVNGUB723eRe7FqM/8inydLStevV4i8mzDBZdsmOs71MgKhi6fv
 Y3Zey4SlEyMWeBAvRukLNRo1vLa89nnCALuR+fCuHiwDonlB1298JDIDy
 M8s0yVO4v6zqSK0OWOcUwgNwZKrIj56HIP7d+f5YMg3vRssLJg/XY2TEM
 cOl/oPafuXNHmiiOfyQj3N3xnhPEbNPZSTeLvjPRGaPANDHGoApwNfZtr
 FdPDhH/KskX6bCn4rSWg8dLuNMgrVUJdNpYY6qN9t/L0diGdRbZVjVX6u
 MtulmozvaJ8v432bCCA21jBvt16EyQp4RkfgewhncSfepdfz/2yGVdGBj A==;
X-CSE-ConnectionGUID: P+7EyCjeS8yr2ZS88RsoXQ==
X-CSE-MsgGUID: F3BIwbPDQ02p3M3VesHPOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58913907"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58913907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:13:10 -0800
X-CSE-ConnectionGUID: XuGEAuipQEmAZWiq8hjLlQ==
X-CSE-MsgGUID: d1P4QYz3TrWIOZzK6t2TSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210079750"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:13:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Promote struct xe_tile definition to own file
Date: Tue,  3 Feb 2026 22:12:38 +0100
Message-ID: <20260203211240.745-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203211240.745-1-michal.wajdeczko@intel.com>
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
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

We already have separate .c and .h files for xe_tile functions,
time to introduce _types.h to follow what other components do.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/656886/?series=149807&rev=1
v2: rebased, xe_vram_region already moved
---
 drivers/gpu/drm/xe/xe_device_types.h | 129 +-----------------------
 drivers/gpu/drm/xe/xe_tile_types.h   | 141 +++++++++++++++++++++++++++
 2 files changed, 142 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2ea931c1550a..14bf2c027f89 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -15,10 +15,6 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
-#include "xe_lmtt_types.h"
-#include "xe_memirq_types.h"
-#include "xe_mert.h"
-#include "xe_mmio_types.h"
 #include "xe_oa_types.h"
 #include "xe_pagefault_types.h"
 #include "xe_platform_types.h"
@@ -30,7 +26,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_tile_sriov_vf_types.h"
+#include "xe_tile_types.h"
 #include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -96,129 +92,6 @@ enum xe_wedged_mode {
 	 (_xe)->info.step.graphics >= (min_step) &&			\
 	 (_xe)->info.step.graphics < (max_step))
 
-#define tile_to_xe(tile__)								\
-	_Generic(tile__,								\
-		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
-		 struct xe_tile * : (tile__)->xe)
-
-/**
- * struct xe_tile - hardware tile structure
- *
- * From a driver perspective, a "tile" is effectively a complete GPU, containing
- * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
- *
- * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
- * device and designate one "root" tile as being responsible for external PCI
- * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
- * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
- * with each tile similarly.  Device-wide interrupts can be enabled/disabled
- * at the root tile, and the MSTR_TILE_INTR register will report which tiles
- * have interrupts that need servicing.
- */
-struct xe_tile {
-	/** @xe: Backpointer to tile's PCI device */
-	struct xe_device *xe;
-
-	/** @id: ID of the tile */
-	u8 id;
-
-	/**
-	 * @primary_gt: Primary GT
-	 */
-	struct xe_gt *primary_gt;
-
-	/**
-	 * @media_gt: Media GT
-	 *
-	 * Only present on devices with media version >= 13.
-	 */
-	struct xe_gt *media_gt;
-
-	/**
-	 * @mmio: MMIO info for a tile.
-	 *
-	 * Each tile has its own 16MB space in BAR0, laid out as:
-	 * * 0-4MB: registers
-	 * * 4MB-8MB: reserved
-	 * * 8MB-16MB: global GTT
-	 */
-	struct xe_mmio mmio;
-
-	/** @mem: memory management info for tile */
-	struct {
-		/**
-		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
-		 *
-		 * Although VRAM is associated with a specific tile, it can
-		 * still be accessed by all tiles' GTs.
-		 */
-		struct xe_vram_region *kernel_vram;
-
-		/**
-		 * @mem.vram: general purpose VRAM info for tile.
-		 *
-		 * Although VRAM is associated with a specific tile, it can
-		 * still be accessed by all tiles' GTs.
-		 */
-		struct xe_vram_region *vram;
-
-		/** @mem.ggtt: Global graphics translation table */
-		struct xe_ggtt *ggtt;
-
-		/**
-		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
-		 *
-		 * Media GT shares a pool with its primary GT.
-		 */
-		struct xe_sa_manager *kernel_bb_pool;
-
-		/**
-		 * @mem.reclaim_pool: Pool for PRLs allocated.
-		 *
-		 * Only main GT has page reclaim list allocations.
-		 */
-		struct xe_sa_manager *reclaim_pool;
-	} mem;
-
-	/** @sriov: tile level virtualization data */
-	union {
-		struct {
-			/** @sriov.pf.lmtt: Local Memory Translation Table. */
-			struct xe_lmtt lmtt;
-		} pf;
-		struct {
-			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node *ggtt_balloon[2];
-			/** @sriov.vf.self_config: VF configuration data */
-			struct xe_tile_sriov_vf_selfconfig self_config;
-		} vf;
-	} sriov;
-
-	/** @memirq: Memory Based Interrupts. */
-	struct xe_memirq memirq;
-
-	/** @csc_hw_error_work: worker to report CSC HW errors */
-	struct work_struct csc_hw_error_work;
-
-	/** @pcode: tile's PCODE */
-	struct {
-		/** @pcode.lock: protecting tile's PCODE mailbox data */
-		struct mutex lock;
-	} pcode;
-
-	/** @migrate: Migration helper for vram blits and clearing */
-	struct xe_migrate *migrate;
-
-	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
-	struct kobject *sysfs;
-
-	/** @debugfs: debugfs directory associated with this tile */
-	struct dentry *debugfs;
-
-	/** @mert: MERT-related data */
-	struct xe_mert mert;
-};
-
 /**
  * struct xe_device - Top level struct of Xe device
  */
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
new file mode 100644
index 000000000000..33932fd547d7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2026 Intel Corporation
+ */
+
+#ifndef _XE_TILE_TYPES_H_
+#define _XE_TILE_TYPES_H_
+
+#include <linux/mutex_types.h>
+#include <linux/workqueue_types.h>
+
+#include "xe_lmtt_types.h"
+#include "xe_memirq_types.h"
+#include "xe_mert.h"
+#include "xe_mmio_types.h"
+#include "xe_tile_sriov_vf_types.h"
+
+#define tile_to_xe(tile__)								\
+	_Generic(tile__,								\
+		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile * : (tile__)->xe)
+
+/**
+ * struct xe_tile - hardware tile structure
+ *
+ * From a driver perspective, a "tile" is effectively a complete GPU, containing
+ * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
+ *
+ * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
+ * device and designate one "root" tile as being responsible for external PCI
+ * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
+ * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
+ * with each tile similarly.  Device-wide interrupts can be enabled/disabled
+ * at the root tile, and the MSTR_TILE_INTR register will report which tiles
+ * have interrupts that need servicing.
+ */
+struct xe_tile {
+	/** @xe: Backpointer to tile's PCI device */
+	struct xe_device *xe;
+
+	/** @id: ID of the tile */
+	u8 id;
+
+	/**
+	 * @primary_gt: Primary GT
+	 */
+	struct xe_gt *primary_gt;
+
+	/**
+	 * @media_gt: Media GT
+	 *
+	 * Only present on devices with media version >= 13.
+	 */
+	struct xe_gt *media_gt;
+
+	/**
+	 * @mmio: MMIO info for a tile.
+	 *
+	 * Each tile has its own 16MB space in BAR0, laid out as:
+	 * * 0-4MB: registers
+	 * * 4MB-8MB: reserved
+	 * * 8MB-16MB: global GTT
+	 */
+	struct xe_mmio mmio;
+
+	/** @mem: memory management info for tile */
+	struct {
+		/**
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *vram;
+
+		/** @mem.ggtt: Global graphics translation table */
+		struct xe_ggtt *ggtt;
+
+		/**
+		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
+		 *
+		 * Media GT shares a pool with its primary GT.
+		 */
+		struct xe_sa_manager *kernel_bb_pool;
+
+		/**
+		 * @mem.reclaim_pool: Pool for PRLs allocated.
+		 *
+		 * Only main GT has page reclaim list allocations.
+		 */
+		struct xe_sa_manager *reclaim_pool;
+	} mem;
+
+	/** @sriov: tile level virtualization data */
+	union {
+		struct {
+			/** @sriov.pf.lmtt: Local Memory Translation Table. */
+			struct xe_lmtt lmtt;
+		} pf;
+		struct {
+			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
+			struct xe_ggtt_node *ggtt_balloon[2];
+			/** @sriov.vf.self_config: VF configuration data */
+			struct xe_tile_sriov_vf_selfconfig self_config;
+		} vf;
+	} sriov;
+
+	/** @memirq: Memory Based Interrupts. */
+	struct xe_memirq memirq;
+
+	/** @csc_hw_error_work: worker to report CSC HW errors */
+	struct work_struct csc_hw_error_work;
+
+	/** @pcode: tile's PCODE */
+	struct {
+		/** @pcode.lock: protecting tile's PCODE mailbox data */
+		struct mutex lock;
+	} pcode;
+
+	/** @migrate: Migration helper for vram blits and clearing */
+	struct xe_migrate *migrate;
+
+	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
+	struct kobject *sysfs;
+
+	/** @debugfs: debugfs directory associated with this tile */
+	struct dentry *debugfs;
+
+	/** @mert: MERT-related data */
+	struct xe_mert mert;
+};
+
+#endif
-- 
2.47.1

