Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A7BC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC65410E14A;
	Tue,  3 Jun 2025 20:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieLvNmwf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C3C10E14A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982522; x=1780518522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aG9KsTuZg3la3VCuhsS8TGAUFqS2DvnZT6KV3qvlsT4=;
 b=ieLvNmwfeeFKHG7SOfkjmSGCKv42Z6THGVQffV2INCPLSzCQG8DilwKT
 RbxRKUJu6PYmpT0lhoDoxr1V1gr+VasUFWFgTdWKPOkXde+fovl/iACyv
 X7VjKt0VwEBlKLlh173X3RhCkD2ITfPS49wYdwEVeJJh7HRXscfqp/6xf
 HWq/3F+v2+rAUu8kQ9x2iyTgjzgXMiaQNwnxi3uzajsgkOfT/ESdKmc31
 ppA4bLElLlrnTlXDuIbNy14Krsx5xc4lc9EEH7vgz8Ok8QvwRg/2wcJjm
 gX+4Av6wQ0xOEPleMIJ5hklIRukzJi7QO5qKXHnEWYbkmpO7FvR1VYXTb g==;
X-CSE-ConnectionGUID: SBfCzTg0TkWmZUQn2zJZfg==
X-CSE-MsgGUID: ++VSPJE4QmS27wybzmSLCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62396647"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="62396647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:42 -0700
X-CSE-ConnectionGUID: EZeq/Wk5SGSqGZ8eMxcjfw==
X-CSE-MsgGUID: YzVH082tQ9ahU5rBnqCDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145583171"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:28:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/4] drm/xe: Promote struct xe_mmio definition to own file
Date: Tue,  3 Jun 2025 22:28:24 +0200
Message-Id: <20250603202826.681-3-michal.wajdeczko@intel.com>
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

We already have separate .c and .h files for xe_mmio functions,
time to introduce _types.h to follow what other components do.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 40 +--------------------
 drivers/gpu/drm/xe/xe_mmio.h         |  3 +-
 drivers/gpu/drm/xe/xe_mmio_types.h   | 53 ++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mmio_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b93c04466637..831dd88a4c52 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,6 +17,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
+#include "xe_mmio_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
@@ -121,45 +122,6 @@ struct xe_vram_region {
 #endif
 };
 
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
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 540bade24790..4e794757b020 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -6,9 +6,10 @@
 #ifndef _XE_MMIO_H_
 #define _XE_MMIO_H_
 
-#include "xe_gt_types.h"
+#include "xe_mmio_types.h"
 
 struct xe_device;
+struct xe_mmio_range;
 struct xe_reg;
 
 int xe_mmio_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_mmio_types.h b/drivers/gpu/drm/xe/xe_mmio_types.h
new file mode 100644
index 000000000000..67c535dd1248
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mmio_types.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2025 Intel Corporation
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
+#endif
-- 
2.47.1

