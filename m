Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06193C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 11:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D1410E4B7;
	Wed,  7 Aug 2024 11:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIRTl5iP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C729110E4B7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723029852; x=1754565852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rAFA8rHf5Va+bn45TlR3k0u3Hoa8vlLslOlnnAK8ahE=;
 b=ZIRTl5iPe6dSJoM9XdqiJI1z9WKoofbgK2XaVfViFnd0v/+BQt8xNSvw
 IxfgNLVhIUg6osfri1vHo0Uo8DYnYPAeUGHE/XrV8yAPjvk6D76ARG1U/
 0bXpohW2ZuqFl6QURf7Bj6YwLnwao07IdocUdh7e34IVph1AWnfywygz/
 yH+D3AtqyU7V+8Ka05f+pNA9YdbgizAoGHnRnKehHNU2AsrBUvfSDCQ4j
 55CicXA50Ba1kTAlxIDsyU2tpt6MnC0mZ3d1C8sq6ERTie4Pq0gS3uowI
 9l1KSGACmGcIMq/yJePbz7PvI87HzL7ILGXKvV3Gp0T86D9lhz8iJM6g8 g==;
X-CSE-ConnectionGUID: IITGeGXgQ4mYCr4XwMOHpA==
X-CSE-MsgGUID: eZenBy12Q/WLP6Q5R2vDtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20907973"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="20907973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 04:24:12 -0700
X-CSE-ConnectionGUID: 5/N/U8n3R8iz2AQd3AMJLw==
X-CSE-MsgGUID: +RMZ7igZRzmQN9W3lXKrqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="61642990"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 04:24:11 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Date: Wed,  7 Aug 2024 13:07:58 +0200
Message-ID: <20240807110802.13385-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add skeleton APIs for recording and printing various stats over
debugfs. This currently only added counter types stats which is backed
by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be disabled
on production system.

v2: add missing docs
    Add boundary checks for stats id and other improvements (Michal)
    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
 drivers/gpu/drm/xe/xe_gt_stats.c   | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
 6 files changed, 109 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..4db6d707c1af 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
 
 	 Recomended for driver developers only.
 	 If in doubt, say "N".
+
+config DRM_XE_STATS
+	bool "Enable XE statistics"
+	default n
+	help
+	  Choose this option to enable support for collecting and
+	  displaying XE statistics as debugfs.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1ff9602a52f6..b0bbb248f644 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o
 
+xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
+
 # include helpers for tests even when XE is built-in
 ifdef CONFIG_DRM_XE_KUNIT_TEST
 xe-y += tests/xe_kunit_helpers.o
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..3765c04919dc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_mcr.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_vf_debugfs.h"
+#include "xe_gt_stats.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -286,6 +287,9 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
+	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
+#endif
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
new file mode 100644
index 000000000000..b13aee5488d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <linux/atomic.h>
+
+#include <drm/drm_print.h>
+
+#include "xe_gt.h"
+#include "xe_gt_stats.h"
+
+#ifdef CONFIG_DRM_XE_STATS
+
+/**
+ * xe_gt_stats_incr - Increments the specified stats counter
+ * @gt: graphics tile
+ * @id: xe_gt_stats_id type id that needs to be incremented
+ * @incr: value to be incremented with
+ *
+ * Increments the specified stats counter if that is within expected range.
+ */
+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr)
+{
+	if (id >= __XE_GT_STATS_NUM_IDS)
+		return;
+
+	atomic_add(incr, &gt->stats.counters[id]);
+}
+
+static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+};
+
+/**
+ * xe_gt_stats_print_info - Print the GT stats
+ * @gt: graphics tile
+ * @p: drm_printer where it will be printed out.
+ *
+ * This prints out all the available GT stats.
+ */
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
+{
+	enum xe_gt_stats_id id;
+
+	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
+		drm_printf(p, "%s: %d\n", stat_description[id],
+			   atomic_read(&gt->stats.counters[id]));
+
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
new file mode 100644
index 000000000000..04a1d61ce1fb
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_STATS_H_
+#define _XE_GT_STATS_H_
+
+struct xe_gt;
+struct drm_printer;
+
+enum xe_gt_stats_id {
+	/* must be the last entry */
+	__XE_GT_STATS_NUM_IDS,
+};
+
+#ifdef CONFIG_DRM_XE_STATS
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
+void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, int incr);
+#else
+static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
+{
+	return 0;
+}
+
+static inline void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id,
+				    int incr)
+{
+}
+
+#endif
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 631928258d71..4955612fb01d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -10,6 +10,7 @@
 #include "xe_gt_idle_types.h"
 #include "xe_gt_sriov_pf_types.h"
 #include "xe_gt_sriov_vf_types.h"
+#include "xe_gt_stats.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_oa.h"
@@ -133,6 +134,14 @@ struct xe_gt {
 		u8 has_indirect_ring_state:1;
 	} info;
 
+#if IS_ENABLED(CONFIG_DRM_XE_STATS)
+	/** @stats: GT stats */
+	struct {
+		/** @stats.counters: counters for various GT stats */
+		atomic_t counters[__XE_GT_STATS_NUM_IDS];
+	} stats;
+#endif
+
 	/**
 	 * @mmio: mmio info for GT.  All GTs within a tile share the same
 	 * register space, but have their own copy of GSI registers at a
-- 
2.42.0

