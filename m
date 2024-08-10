Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD0C3DA7F
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 19:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC1D10E160;
	Sat, 10 Aug 2024 19:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3FbXLxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F3710E160
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 19:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723318277; x=1754854277;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29KNQP688aGPgCNBORISJtHP+zH/5cT/pJ7uEsvPYyU=;
 b=f3FbXLxutnCH9zEqmdGg5tmiSyrUsPFsPeEcPvnXdmmVPBcuwdnTL8N+
 sM+yXBCmOiOAiIiGNcXeLyi0eBulLf9K55Yk/fnPwn91j/4+Sd68OMv+L
 MyMxTMLe0puKBNrNZ86d1gZWQkhks9J1BUV6hnHtjVbOXrtbsbltVOEti
 sIFx2uPskH9rEXkhthe9KBgc5J11iGm/Hiik48wY95z94phFUgw7GHg2w
 Wz05fmdZ7upmwnsFpe+tIlbCYIyz9rZTZeGIXTauwGgUaj+IgUz3Fmi1j
 UiHwRl2z9g3G9kl29M9/8ZcM0pVB2XAByj+YFnifHvfXABK/ojgXDqQjl Q==;
X-CSE-ConnectionGUID: BN/+2yw0R5aD/WCMN9Z1sg==
X-CSE-MsgGUID: rDhOXwfaSzSbaGIrV8QquQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38980153"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="38980153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 12:31:16 -0700
X-CSE-ConnectionGUID: poll4+coSnCtj8Pfcu4JGg==
X-CSE-MsgGUID: GhyFh0XES/+ETFC9IV60jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; d="scan'208";a="62707941"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2024 12:31:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH v4 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
Date: Sat, 10 Aug 2024 21:15:18 +0200
Message-ID: <20240810191522.18616-1-nirmoy.das@intel.com>
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

v4: Rebase and other minor fixes (Matt)
v3: s/CONFIG_DRM_XE_STATS/CONFIG_DEBUG_FS(Lucas)
v2: add missing docs
    Add boundary checks for stats id and other improvements (Michal)
    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  1 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 ++
 drivers/gpu/drm/xe/xe_gt_stats.c   | 48 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_stats.h   | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
 5 files changed, 88 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b846b36a7bfd..e11392b5dd3d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -277,6 +277,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 	xe-y += xe_debugfs.o \
 		xe_gt_debugfs.o \
 		xe_gt_sriov_vf_debugfs.o \
+		xe_gt_stats.o \
 		xe_guc_debugfs.o \
 		xe_huc_debugfs.o \
 		xe_uc_debugfs.o
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 5e7fd937917a..5125d76ccfac 100644
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
@@ -286,6 +287,7 @@ static const struct drm_info_list debugfs_list[] = {
 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
 	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
 	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
+	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
new file mode 100644
index 000000000000..a054cd52329c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -0,0 +1,48 @@
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
+/**
+ * xe_gt_stats_incr - Increments the specified stats counter
+ * @gt: graphics tile
+ * @id: xe_gt_stats_id type id that needs to be incremented
+ * @incr: value to be incremented with
+ *
+ * Increments the specified stats counter.
+ */
+void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
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
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
new file mode 100644
index 000000000000..1be71ce533db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_stats.h
@@ -0,0 +1,28 @@
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
+#ifdef CONFIG_DEBUG_FS
+int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
+void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
+#else
+static inline void
+xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id,
+		 int incr)
+{
+}
+
+#endif
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 631928258d71..8e46c0969bc7 100644
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
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
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

