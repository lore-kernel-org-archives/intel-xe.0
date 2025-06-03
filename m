Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FBEC5B552
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52AC10E221;
	Tue,  3 Jun 2025 20:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XExwZxak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9416A10E221
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982524; x=1780518524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddCzAgyleUh7S9Ex2S6FR8n2SaK4z6TvgQFBQI2pGt0=;
 b=XExwZxaknhd5/toetg/5RGXoWs/U8r7SdqwCFgbONcetsccPGuPV/M7W
 KdD1Y30gCEK6D77F45owbcDWc95qk4u9LtoL+PN69RxYjPRO0YA1bI6gn
 K0C9VE0b3NeT1oZDyhqpV8KROMsYwHebDE9zDi0pd0ZwVuIplLgYQJdpv
 8qGPp7p3iBhToMjNPFKe0aMDlOWAr+LAbUp9X1F5xnBadAQ2IZz3YgZ5K
 jfVWZ6Vs/MuXeKj54fm0qNYgRAwZiwV5DEToTPvSkTx3Fk7BhGuwQnviC
 oJN4muvQRo8TxwC73CtT6joRiRYZJr+DC4DE+F57dSVxFGC7yeI/wKR1G g==;
X-CSE-ConnectionGUID: FEaOqr9aQMi8v5QpeoSO2w==
X-CSE-MsgGUID: yJvGgGXLQ8qPEKly35b6xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62396648"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62396648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:44 -0700
X-CSE-ConnectionGUID: FmHwc+pOTSi1WS6opKK7EQ==
X-CSE-MsgGUID: tj+fkqp7R0KOj2lAFXr3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145583176"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/4] drm/xe: Promote struct xe_tile definition to own file
Date: Tue,  3 Jun 2025 22:28:25 +0200
Message-Id: <20250603202826.681-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250603202826.681-1-michal.wajdeczko@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 159 +------------------------
 drivers/gpu/drm/xe/xe_tile_types.h   | 172 +++++++++++++++++++++++++++
 2 files changed, 173 insertions(+), 158 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 831dd88a4c52..c9401acb6710 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,14 +10,10 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
-#include <drm/drm_pagemap.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
-#include "xe_lmtt_types.h"
-#include "xe_memirq_types.h"
-#include "xe_mmio_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
@@ -25,14 +21,13 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
-#include "xe_ttm_vram_mgr_types.h"
+#include "xe_tile_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
 #endif
 
 struct intel_display;
-struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
 
@@ -62,158 +57,6 @@ struct xe_pxp;
 	 (_xe)->info.step.graphics >= (min_step) &&			\
 	 (_xe)->info.step.graphics < (max_step))
 
-#define tile_to_xe(tile__)								\
-	_Generic(tile__,								\
-		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
-		 struct xe_tile * : (tile__)->xe)
-
-/**
- * struct xe_vram_region - memory region structure
- * This is used to describe a memory region in xe
- * device, such as HBM memory or CXL extension memory.
- */
-struct xe_vram_region {
-	/** @io_start: IO start address of this VRAM instance */
-	resource_size_t io_start;
-	/**
-	 * @io_size: IO size of this VRAM instance
-	 *
-	 * This represents how much of this VRAM we can access
-	 * via the CPU through the VRAM BAR. This can be smaller
-	 * than @usable_size, in which case only part of VRAM is CPU
-	 * accessible (typically the first 256M). This
-	 * configuration is known as small-bar.
-	 */
-	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
-	/**
-	 * @actual_physical_size: Actual VRAM size
-	 *
-	 * Actual VRAM size including reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t actual_physical_size;
-	/** @mapping: pointer to VRAM mappable space */
-	void __iomem *mapping;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
-#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
-	struct dev_pagemap pagemap;
-	/**
-	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
-	 * pages of this tile.
-	 */
-	struct drm_pagemap dpagemap;
-	/**
-	 * @hpa_base: base host physical address
-	 *
-	 * This is generated when remap device memory as ZONE_DEVICE
-	 */
-	resource_size_t hpa_base;
-#endif
-};
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
-		 * @mem.vram: VRAM info for tile.
-		 *
-		 * Although VRAM is associated with a specific tile, it can
-		 * still be accessed by all tiles' GTs.
-		 */
-		struct xe_vram_region vram;
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
-		} vf;
-	} sriov;
-
-	/** @memirq: Memory Based Interrupts. */
-	struct xe_memirq memirq;
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
-};
-
 /**
  * struct xe_device - Top level struct of XE device
  */
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
new file mode 100644
index 000000000000..572b6c4b651d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2025 Intel Corporation
+ */
+
+#ifndef _XE_TILE_TYPES_H_
+#define _XE_TILE_TYPES_H_
+
+#include <drm/drm_pagemap.h>
+
+#include "xe_lmtt_types.h"
+#include "xe_memirq_types.h"
+#include "xe_mmio_types.h"
+#include "xe_ttm_vram_mgr_types.h"
+
+struct xe_device;
+struct xe_ggtt;
+struct xe_gt;
+
+#define tile_to_xe(tile__)								\
+	_Generic(tile__,								\
+		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
+		 struct xe_tile * : (tile__)->xe)
+
+/**
+ * struct xe_vram_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_vram_region {
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @dpa_base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
+	struct dev_pagemap pagemap;
+	/**
+	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
+	 * pages of this tile.
+	 */
+	struct drm_pagemap dpagemap;
+	/**
+	 * @hpa_base: base host physical address
+	 *
+	 * This is generated when remap device memory as ZONE_DEVICE
+	 */
+	resource_size_t hpa_base;
+#endif
+};
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
+		 * @mem.vram: VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region vram;
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
+		} vf;
+	} sriov;
+
+	/** @memirq: Memory Based Interrupts. */
+	struct xe_memirq memirq;
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
+};
+
+#endif
-- 
2.47.1

