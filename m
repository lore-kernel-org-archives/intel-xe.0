Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A13CD1299
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 19:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF1F11203F;
	Tue,  9 Apr 2024 19:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjNhqpOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847C710F830
 for <Intel-Xe@lists.freedesktop.org>; Tue,  9 Apr 2024 19:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712689527; x=1744225527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ScT9J9Roe+e1a8pmCWscu95IobVtkjWyGtp56dhz+HQ=;
 b=kjNhqpOIVKq5GM6eygRShNw6yjEZDQMhZNrXQy6GgalC36tplRwqIVCI
 fHyn9L9hIxeLb7pqsrU5rjHaIqX0d00TgenbXj5OiQdO5YIegrodXbnDg
 O/rcAXAoaFllrftqXxgYnnUyGSU2dpkGGZ2T7rMccDXs3V2TVhklBZftP
 IzKabUCR8cyrKewCWeRavYH8TTEX/zVLkh8nRELrqqItX7dq9o85UNZxd
 Lu0/1ndxVZuMgJQe3l9WEc1lFYMaJEVxtL8rsX5de48oubLdmwpjaPluk
 2fTUUNoV1oSxQY9SDbBnq/dJNymDft6y+68kB1KUV7tLyBTFtG//jsgPz w==;
X-CSE-ConnectionGUID: MaEj7LnsSFGo8XvNFF2Dfg==
X-CSE-MsgGUID: vWjoi361RsuFsTAJYCHmag==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11814857"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11814857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 12:05:16 -0700
X-CSE-ConnectionGUID: HTCQonYCT5mrwqgog+CVOw==
X-CSE-MsgGUID: Xp72ERnnR1O65uqc9ZuSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20884213"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 09 Apr 2024 12:05:17 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Date: Tue,  9 Apr 2024 12:05:13 -0700
Message-ID: <20240409190516.2884064-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
References: <20240409190516.2884064-1-John.C.Harrison@Intel.com>
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
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     | 16 ------------
 5 files changed, 33 insertions(+), 32 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => xe_gt_throttle.c} (86%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e5b1715f721e..5d22652e47fc 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -88,7 +88,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
-	xe_gt_throttle_sysfs.o \
+	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 32b9a743629c..d2e035671820 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,7 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
-#include "xe_gt_throttle_sysfs.h"
+#include "xe_gt_throttle.h"
 #include "xe_guc_pc.h"
 #include "xe_pm.h"
 
@@ -250,5 +250,5 @@ void xe_gt_freq_init(struct xe_gt *gt)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
 
-	xe_gt_throttle_sysfs_init(gt);
+	xe_gt_throttle_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
similarity index 86%
rename from drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
rename to drivers/gpu/drm/xe/xe_gt_throttle.c
index 9c33045ff1ef..e5113cca41f2 100644
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
 
-void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+void xe_gt_throttle_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.h b/drivers/gpu/drm/xe/xe_gt_throttle.h
new file mode 100644
index 000000000000..8123115fe93f
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
2.43.2

