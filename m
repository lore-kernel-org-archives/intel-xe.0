Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8447E8B365
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FC410E288;
	Tue,  3 Feb 2026 21:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaRVgyq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9661710E288
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770153188; x=1801689188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIbCSbD12owZXBLe7yAWbcZw5EVxVmDx1EO70MddMBk=;
 b=TaRVgyq9ReThh+f7gMt8zZlYp27ZBMOzs684RmydGnkd+4pMF3ZCBoko
 NYubQwfqIPHdApif35sUMEw9uidM+yXD5/cs5dCdrwz8YwW2jasQACWtz
 BIhs0SSBPjrBb9RzbRvqYKufwEpHNCzndzBPe5LpQ22wD3U+DJtSGOIov
 Vj+5NNmMr+DDkQrftfVaJz+TVfWkP0/oXYLLKxwIqdShJ3JgBks7J90wr
 nu9l9N2zjBvwcg+ULEbW3RjOYyq6/e3PXEk+ugubZaVldaBa6Q2yy17oS
 hEw7zYlf/5Rof2BB86brNjiXlzal563FNPzTDCKqYJbuYBJKBgrelU+O/ A==;
X-CSE-ConnectionGUID: IcsAFBrjS5aixs2hRqlRhw==
X-CSE-MsgGUID: NE0QNtdQQXCsHMfhQqEFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58913900"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58913900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:13:08 -0800
X-CSE-ConnectionGUID: DlevB3wuSYeFXho3E4QLTg==
X-CSE-MsgGUID: skzOshXdTFmihID6pjrDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210079744"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:13:06 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 2/4] drm/xe: Promote struct xe_mmio definition to own file
Date: Tue,  3 Feb 2026 22:12:37 +0100
Message-ID: <20260203211240.745-3-michal.wajdeczko@intel.com>
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

We already have separate .c and .h files for xe_mmio functions,
time to introduce _types.h to follow what other components do.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com> #v1
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> #v1
---
v1: https://patchwork.freedesktop.org/patch/656885/?series=149807&rev=1
v2: rebased, also move xe_mmio_range (Michal)
---
 drivers/gpu/drm/xe/xe_device_types.h | 40 +----------------
 drivers/gpu/drm/xe/xe_gt_types.h     |  5 ---
 drivers/gpu/drm/xe/xe_mmio.h         |  2 +-
 drivers/gpu/drm/xe/xe_mmio_types.h   | 64 ++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b4600c5069a9..2ea931c1550a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -18,6 +18,7 @@
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
 #include "xe_mert.h"
+#include "xe_mmio_types.h"
 #include "xe_oa_types.h"
 #include "xe_pagefault_types.h"
 #include "xe_platform_types.h"
@@ -100,45 +101,6 @@ enum xe_wedged_mode {
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
-/**
- * struct xe_mmio - register mmio structure
- *
- * Represents an MMIO region that the CPU may use to access registers.  A
- * region may share its IO map with other regions (e.g., all GTs within a
- * tile share the same map with their parent tile, but represent different
- * subregions of the overall IO space).
- */
-struct xe_mmio {
-	/** @tile: Backpointer to tile, used for tracing */
-	struct xe_tile *tile;
-
-	/** @regs: Map used to access registers. */
-	void __iomem *regs;
-
-	/**
-	 * @sriov_vf_gt: Backpointer to GT.
-	 *
-	 * This pointer is only set for GT MMIO regions and only when running
-	 * as an SRIOV VF structure
-	 */
-	struct xe_gt *sriov_vf_gt;
-
-	/**
-	 * @regs_size: Length of the register region within the map.
-	 *
-	 * The size of the iomap set in *regs is generally larger than the
-	 * register mmio space since it includes unused regions and/or
-	 * non-register regions such as the GGTT PTEs.
-	 */
-	size_t regs_size;
-
-	/** @adj_limit: adjust MMIO address if address is below this value */
-	u32 adj_limit;
-
-	/** @adj_offset: offset to add to MMIO address when adjusting */
-	u32 adj_offset;
-};
-
 /**
  * struct xe_tile - hardware tile structure
  *
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 5318d92fd473..1d7360b56ac6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -45,11 +45,6 @@ typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
 typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_MASK_BITS)];
 
-struct xe_mmio_range {
-	u32 start;
-	u32 end;
-};
-
 /*
  * The hardware has multiple kinds of multicast register ranges that need
  * special register steering (and future platforms are expected to add
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index b7e69ed67cbe..befe021f2215 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -6,7 +6,7 @@
 #ifndef _XE_MMIO_H_
 #define _XE_MMIO_H_
 
-#include "xe_gt_types.h"
+#include "xe_mmio_types.h"
 
 struct xe_device;
 struct xe_reg;
diff --git a/drivers/gpu/drm/xe/xe_mmio_types.h b/drivers/gpu/drm/xe/xe_mmio_types.h
new file mode 100644
index 000000000000..99e8f269eaf2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mmio_types.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2026 Intel Corporation
+ */
+
+#ifndef _XE_MMIO_TYPES_H_
+#define _XE_MMIO_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+struct xe_tile;
+
+/**
+ * struct xe_mmio - register mmio structure
+ *
+ * Represents an MMIO region that the CPU may use to access registers.  A
+ * region may share its IO map with other regions (e.g., all GTs within a
+ * tile share the same map with their parent tile, but represent different
+ * subregions of the overall IO space).
+ */
+struct xe_mmio {
+	/** @tile: Backpointer to tile, used for tracing */
+	struct xe_tile *tile;
+
+	/** @regs: Map used to access registers. */
+	void __iomem *regs;
+
+	/**
+	 * @sriov_vf_gt: Backpointer to GT.
+	 *
+	 * This pointer is only set for GT MMIO regions and only when running
+	 * as an SRIOV VF structure
+	 */
+	struct xe_gt *sriov_vf_gt;
+
+	/**
+	 * @regs_size: Length of the register region within the map.
+	 *
+	 * The size of the iomap set in *regs is generally larger than the
+	 * register mmio space since it includes unused regions and/or
+	 * non-register regions such as the GGTT PTEs.
+	 */
+	size_t regs_size;
+
+	/** @adj_limit: adjust MMIO address if address is below this value */
+	u32 adj_limit;
+
+	/** @adj_offset: offset to add to MMIO address when adjusting */
+	u32 adj_offset;
+};
+
+/**
+ * struct xe_mmio_range - register range structure
+ *
+ * @start: first register offset in the range.
+ * @end: last register offset in the range.
+ */
+struct xe_mmio_range {
+	u32 start;
+	u32 end;
+};
+
+#endif
-- 
2.47.1

