Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E006C48BC4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 17:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9D710E94A;
	Fri, 16 Feb 2024 17:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JmQrVKB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506DC10E8B8
 for <Intel-Xe@lists.freedesktop.org>; Fri, 16 Feb 2024 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708106298; x=1739642298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qm57zaE0V6ipwxtT8Q0ntUOvjzZhh/UW1HaCAY6CiTc=;
 b=JmQrVKB2afMnrGvUw+7prRYlgpj/UKoKsT9G0cSar9l5YcMgNquiBFug
 S5XyHgkOaIIJWnzATtnOF9nINQFJo4aMPDiRRy5iVWBTacLyrCXWyLb6V
 R1vqp3kPb7pt1Kl8iiB6v1Gw7I7rCiEq/iTAbUAWCVun9r9/KT7HZZVPP
 E9sL4HWxSsiw9HrPW16VC25MPyUcV1zrQybASvBJFbtXA4mjphzTSA6Ke
 A+nPYtBLUYeiBaMCfhxmY+Euk6w6DWvZmcCIH5Wp1PdZUeB1MOOR4pqL2
 FkHfcrvZYNqS+mbkA9nmIN6BJ/Uvp2KIhl+rxID8jjqE+XfmewfyBsQ1b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2111591"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2111591"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4256331"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 16 Feb 2024 09:58:19 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Date: Fri, 16 Feb 2024 09:55:56 -0800
Message-ID: <20240216175558.411497-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216175558.411497-1-John.C.Harrison@Intel.com>
References: <20240216175558.411497-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/xe_gt_freq.c               |  4 +--
 ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} | 26 +++++++++----------
 drivers/gpu/drm/xe/xe_gt_throttle.h           | 17 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     | 16 ------------
 5 files changed, 33 insertions(+), 32 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c531210695db..82b6a3a6a987 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,7 +87,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
-	xe_gt_throttle_sysfs.o \
+	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index e5b0f4ecdbe8..11049761e9c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,7 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_throttle_sysfs.h"
+#include "xe_gt_throttle.h"
 #include "xe_guc_pc.h"
 
 /**
@@ -218,5 +218,5 @@ void xe_gt_freq_init(struct xe_gt *gt)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
 
-	xe_gt_throttle_sysfs_init(gt);
+	xe_gt_throttle_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
similarity index 86%
rename from drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
rename to drivers/gpu/drm/xe/xe_gt_throttle.c
index 63d640591a52..bfb343a65b24 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -9,13 +9,13 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_throttle_sysfs.h"
+#include "xe_gt_throttle.h"
 #include "xe_mmio.h"
 
 /**
  * DOC: Xe GT Throttle
  *
- * Provides sysfs entries for frequency throttle reasons in GT
+ * Provides sysfs entries and other helpers for frequency throttle reasons in GT
  *
  * device/gt#/freq0/throttle/status - Overall status
  * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
@@ -34,7 +34,7 @@ dev_to_gt(struct device *dev)
 	return kobj_to_gt(dev->kobj.parent);
 }
 
-static u32 read_perf_limit_reasons(struct xe_gt *gt)
+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
 	u32 reg;
 
@@ -48,63 +48,63 @@ static u32 read_perf_limit_reasons(struct xe_gt *gt)
 
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
@@ -233,7 +233,7 @@ static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
 	sysfs_remove_group(gt->freq, &throttle_group_attrs);
 }
 
-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+void xe_gt_throttle_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.h b/drivers/gpu/drm/xe/xe_gt_throttle.h
new file mode 100644
index 000000000000..03c20c837e67
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
+#include <drm/drm_managed.h>
+
+struct xe_gt;
+
+void xe_gt_throttle_init(struct xe_gt *gt);
+
+u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
deleted file mode 100644
index 3ecfd4beffe1..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef _XE_GT_THROTTLE_SYSFS_H_
-#define _XE_GT_THROTTLE_SYSFS_H_
-
-#include <drm/drm_managed.h>
-
-struct xe_gt;
-
-void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
-
-#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
-
-- 
2.43.0

