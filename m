Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45228C25B75
	for <intel-xe@archiver.kernel.org>; Sat, 18 May 2024 04:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D3D10E055;
	Sat, 18 May 2024 04:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BR4624Yx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFDF10E049
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 May 2024 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716007022; x=1747543022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G+bkk7peoP2p4FRm0hhdmHr4UlItbvh6l7XzVrDSlSg=;
 b=BR4624YxFtfYHD3cXScTgb4mCYyFZoj+KvNxZqXOG9NVSHIaV/2CvSrd
 TRbW03ReKXmXlEotLXZ2kk3vOodrEXALmnhgaUn2+q5u3YIelGoTsY2ic
 xsS4nCji9K2FWRiOPfYkwIMeCRbQTrYLo8gDsRo2Xc/3RFXS3a93u7FQN
 hH9FQCJDHzvDfrcaAQw5qp2SyOp8XCGRE09WNeXFYwOv6Ah44BWHtRH6Q
 I8Ral8VgU6np89Ykum23e92SJE6VrdyToSjbUwPEuHdM9DW++W54p4oqR
 r9myYRChdn4U+Nybc7JCil+QftbP9m0O7wBv3FeZ6+jfFYK4OajIm5CZd Q==;
X-CSE-ConnectionGUID: uFg9fUrMQcCQhtm+AFutxA==
X-CSE-MsgGUID: lQN8J/B+QxqsvZDv7MZDWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="23343735"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="23343735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 21:37:01 -0700
X-CSE-ConnectionGUID: lhBP8LYFQOS6UdLV2cQ/Zg==
X-CSE-MsgGUID: x689o6phQNKned5zvlSyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; d="scan'208";a="32572956"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 17 May 2024 21:37:01 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Date: Fri, 17 May 2024 21:36:58 -0700
Message-ID: <20240518043700.3264362-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240518043700.3264362-1-John.C.Harrison@Intel.com>
References: <20240518043700.3264362-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Other driver code beyond the sysfs interface wants to know about
throttling. So make the query function globally accessible.

v2: Revert include order change (review feedback from Lucas)
v3: Remove '_sysfs' from throttle file names and keep limit query in
the same file rather than moving elsewhere (review feedback from
Rodrigo).
v4: Correct #include while renaming header file (review feedback
from Lucas).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c               |  4 +--
 ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} | 26 +++++++++----------
 drivers/gpu/drm/xe/xe_gt_throttle.h           | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     | 13 ----------
 5 files changed, 33 insertions(+), 29 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c9f067b8f54d..a5959bb7b1fb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -89,7 +89,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
-	xe_gt_throttle_sysfs.o \
+	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 855de40e40ea..18350855d3b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,7 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_throttle_sysfs.h"
+#include "xe_gt_throttle.h"
 #include "xe_guc_pc.h"
 #include "xe_pm.h"
 
@@ -245,5 +245,5 @@ int xe_gt_freq_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return xe_gt_throttle_sysfs_init(gt);
+	return xe_gt_throttle_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
similarity index 86%
rename from drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
rename to drivers/gpu/drm/xe/xe_gt_throttle.c
index fbe21a8599ca..35aa9c8c0506 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -9,14 +9,14 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_throttle_sysfs.h"
+#include "xe_gt_throttle.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 
 /**
  * DOC: Xe GT Throttle
  *
- * Provides sysfs entries for frequency throttle reasons in GT
+ * Provides sysfs entries and other helpers for frequency throttle reasons in GT
  *
  * device/gt#/freq0/throttle/status - Overall status
  * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
@@ -35,7 +35,7 @@ dev_to_gt(struct device *dev)
 	return kobj_to_gt(dev->kobj.parent);
 }
 
-static u32 read_perf_limit_reasons(struct xe_gt *gt)
+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	u32 reg;
 
@@ -51,63 +51,63 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
 
 static u32 read_status(struct xe_gt *gt)
 {
-	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+	u32 status = xe_gt_throttle_get_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
 
 	return status;
 }
 
 static u32 read_reason_pl1(struct xe_gt *gt)
 {
-	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+	u32 pl1 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_1_MASK;
 
 	return pl1;
 }
 
 static u32 read_reason_pl2(struct xe_gt *gt)
 {
-	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+	u32 pl2 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_2_MASK;
 
 	return pl2;
 }
 
 static u32 read_reason_pl4(struct xe_gt *gt)
 {
-	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+	u32 pl4 = xe_gt_throttle_get_limit_reasons(gt) & POWER_LIMIT_4_MASK;
 
 	return pl4;
 }
 
 static u32 read_reason_thermal(struct xe_gt *gt)
 {
-	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+	u32 thermal = xe_gt_throttle_get_limit_reasons(gt) & THERMAL_LIMIT_MASK;
 
 	return thermal;
 }
 
 static u32 read_reason_prochot(struct xe_gt *gt)
 {
-	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+	u32 prochot = xe_gt_throttle_get_limit_reasons(gt) & PROCHOT_MASK;
 
 	return prochot;
 }
 
 static u32 read_reason_ratl(struct xe_gt *gt)
 {
-	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+	u32 ratl = xe_gt_throttle_get_limit_reasons(gt) & RATL_MASK;
 
 	return ratl;
 }
 
 static u32 read_reason_vr_thermalert(struct xe_gt *gt)
 {
-	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+	u32 thermalert = xe_gt_throttle_get_limit_reasons(gt) & VR_THERMALERT_MASK;
 
 	return thermalert;
 }
 
 static u32 read_reason_vr_tdc(struct xe_gt *gt)
 {
-	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+	u32 tdc = xe_gt_throttle_get_limit_reasons(gt) & VR_TDC_MASK;
 
 	return tdc;
 }
@@ -236,7 +236,7 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
 }
 
-int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+int xe_gt_throttle_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.h b/drivers/gpu/drm/xe/xe_gt_throttle.h
new file mode 100644
index 000000000000..02277494715d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_H_
+#define _XE_GT_THROTTLE_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+
+int xe_gt_throttle_init(struct xe_gt *gt);
+
+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
deleted file mode 100644
index 335c402b51a6..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_GT_THROTTLE_SYSFS_H_
-#define _XE_GT_THROTTLE_SYSFS_H_
-
-struct xe_gt;
-
-int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
-
-#endif
-- 
2.43.2

