Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10BBC001CC
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673BD112323;
	Sun, 14 Apr 2024 19:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9BLT0t7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6A2112324
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121327; x=1744657327;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yObWcB0PzpWUPsEDEREjAC5/Bht6Jc2r89PHEanKJvQ=;
 b=i9BLT0t7JCQYuJYNwChzkQ8sZ9tPQWIGmnzr/4mogzB9CwN3XTcSbnde
 GXsmltsDzWB/erin2AFZV4MaIkzhVQZXY71RlQaUVEA17oGhRYsRn2zT2
 k/wh6c+yRrvRYrFWVBS8yrHxUouK16mTT6aEy/9wmpEGVwR+Pas5ClZWJ
 otG9d1bV5gwXs1M/LG7Aw1set9oiJPK32Ish94HKujkMF3mcvV9LHr1TV
 pnsmbiAg869xrSRiuF4xKN8HnLme0mPpdXLT7afFG14Km98WON0h+XeGB
 v0g+lbkM32RRrsz/65luIUWJ7i3gRkMgFqRWVdgLdByo/7Zq9U+QNphrB w==;
X-CSE-ConnectionGUID: PM1ABXxrTKG7wX0AsbWn8g==
X-CSE-MsgGUID: nWb7pYbHRWWxfF+zVvg2KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983596"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:07 -0700
X-CSE-ConnectionGUID: OjbPWdKSRu2lonpNc26F3A==
X-CSE-MsgGUID: xtBEOtOWQ8eqhUC7HvbImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383442"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe/pf: Add SR-IOV PF specific early GT initialization
Date: Sun, 14 Apr 2024 21:01:36 +0200
Message-Id: <20240414190137.1243-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

The PF driver must maintain additional GT level data per each VF.
This additional per-VF data will be added in upcoming patches and
will include: provisioning configuration (like GGTT space or LMEM
allocation sizes or scheduling parameters), monitoring thresholds
and counters, and more.

As number of supported VFs varies across platforms use flexible
array where first entry will contain metadata for the PF itself
(if such configuration parameter is applicable for the PF) and
all remaining entries will contain data for potential VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |  1 +
 drivers/gpu/drm/xe/xe_gt.c                |  7 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c       | 52 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h       | 20 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h |  9 ++++
 5 files changed, 89 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c46d145606f6..daa5865a2773 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -160,6 +160,7 @@ xe-y += \
 	xe_sriov.o
 
 xe-$(CONFIG_PCI_IOV) += \
+	xe_gt_sriov_pf.o \
 	xe_gt_sriov_pf_control.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_lmtt.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..38956b60e084 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -29,6 +29,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
@@ -311,6 +312,12 @@ int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
 
+	if (IS_SRIOV_PF(gt_to_xe(gt))) {
+		err = xe_gt_sriov_pf_init_early(gt);
+		if (err)
+			return err;
+	}
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
new file mode 100644
index 000000000000..791dcdd767e2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_gt_sriov_pf.h"
+#include "xe_gt_sriov_pf_helpers.h"
+
+/*
+ * VF's metadata is maintained in the flexible array where:
+ *   - entry [0] contains metadata for the PF (only if applicable),
+ *   - entries [1..n] contain metadata for VF1..VFn::
+ *
+ *       <--------------------------- 1 + total_vfs ----------->
+ *      +-------+-------+-------+-----------------------+-------+
+ *      |   0   |   1   |   2   |                       |   n   |
+ *      +-------+-------+-------+-----------------------+-------+
+ *      |  PF   |  VF1  |  VF2  |      ...     ...      |  VFn  |
+ *      +-------+-------+-------+-----------------------+-------+
+ */
+static int pf_alloc_metadata(struct xe_gt *gt)
+{
+	unsigned int num_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
+
+	gt->sriov.pf.vfs = drmm_kcalloc(&gt_to_xe(gt)->drm, 1 + num_vfs,
+					sizeof(*gt->sriov.pf.vfs), GFP_KERNEL);
+	if (!gt->sriov.pf.vfs)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
+ * @gt: the &xe_gt to initialize
+ *
+ * Early initialization of the PF data.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
+{
+	int err;
+
+	err = pf_alloc_metadata(gt);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
new file mode 100644
index 000000000000..05142ffc4319
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_H_
+#define _XE_GT_SRIOV_PF_H_
+
+struct xe_gt;
+
+#ifdef CONFIG_PCI_IOV
+int xe_gt_sriov_pf_init_early(struct xe_gt *gt);
+#else
+static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
+{
+	return 0;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 768277b8bc95..223f280ef748 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -10,12 +10,21 @@
 
 #include "xe_gt_sriov_pf_policy_types.h"
 
+/**
+ * struct xe_gt_sriov_metadata - GT level per-VF metadata.
+ */
+struct xe_gt_sriov_metadata {
+	/* XXX: VF metadata will go here */
+};
+
 /**
  * struct xe_gt_sriov_pf - GT level PF virtualization data.
  * @policy: policy data.
+ * @vfs: metadata for all VFs.
  */
 struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_policy policy;
+	struct xe_gt_sriov_metadata *vfs;
 };
 
 #endif
-- 
2.43.0

