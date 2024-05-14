Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9861AC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 19:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF2A10E816;
	Tue, 14 May 2024 19:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZ1Q4Qez";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D260910E6CE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715713270; x=1747249270;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wZMbPCM32hT+Ka1iVcD2lGVr+FHhbBAD9NVj/tCIvAs=;
 b=lZ1Q4Qez6nxJKPvkezwC73YRK+s3pGfg/WSmTfn+0hK89T3ZcZWuOv+b
 8zGhTBDpICh4TMU9HAHLDlgIyL0fDNCRL0qhOfoBnzHTOQbzT52sfkWwo
 UJ1fRsgdJIORiD3TpVtL4iFvxevkxw5VP+f6gHO9c1riwnccRK/gzaHDx
 oqDHFGTKFUo32l13eO+/IMk3OsDMZPXit0VCyQ2inoa4v0S6Yd7jeu3UY
 Y9f52H2QuvHmwTeJJOmxJKav2z+MBYlSTX+W7kT2Xj3MJu9vrC7TF3vY8
 mPH19R/E8wzE/bZJNdWZbj2Gwi//KshXnxHARk2UGTdgnc6kANtutEbpS A==;
X-CSE-ConnectionGUID: oM+NmD2uS9qt7VzXzirJ2g==
X-CSE-MsgGUID: jz7yFbPxTwuK3YQQFtl4JA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11523185"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11523185"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:10 -0700
X-CSE-ConnectionGUID: RKQD5N93Tg2xNk37j4VErQ==
X-CSE-MsgGUID: fIqUUsZ3QbKdkJ64f1989g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35565514"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 12:01:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/xe/pf: Track adverse events notifications from GuC
Date: Tue, 14 May 2024 21:00:14 +0200
Message-Id: <20240514190015.2172-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240514190015.2172-1-michal.wajdeczko@intel.com>
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
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

When thresholds used to monitor VFs activities are configured,
then GuC may send GUC2PF_ADVERSE_EVENT messages informing the
PF driver about exceeded thresholds. Start handling such messages.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: improve function description (Piotr)
    add explicit asserts (Piotr)
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c   | 147 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h   |  27 ++++
 .../gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h |  22 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +
 6 files changed, 206 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b620389761d5..31198375022a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -164,6 +164,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf_config.o \
 	xe_gt_sriov_pf_control.o \
 	xe_gt_sriov_pf_debugfs.o \
+	xe_gt_sriov_pf_monitor.o \
 	xe_gt_sriov_pf_policy.o \
 	xe_gt_sriov_pf_service.o \
 	xe_lmtt.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
new file mode 100644
index 000000000000..7d532bded02a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "abi/guc_actions_sriov_abi.h"
+#include "abi/guc_messages_abi.h"
+
+#include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_monitor.h"
+#include "xe_gt_sriov_printk.h"
+#include "xe_guc_klv_helpers.h"
+#include "xe_guc_klv_thresholds_set.h"
+
+/**
+ * xe_gt_sriov_pf_monitor_flr - Cleanup VF data after VF FLR.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * On FLR this function will reset all event data related to the VF.
+ * This function is for PF only.
+ */
+void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid)
+{
+	int e;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_sriov_pf_assert_vfid(gt, vfid);
+
+	for (e = 0; e < XE_GUC_KLV_NUM_THRESHOLDS; e++)
+		gt->sriov.pf.vfs[vfid].monitor.guc.events[e] = 0;
+}
+
+static void pf_update_event_counter(struct xe_gt *gt, u32 vfid,
+				    enum xe_guc_klv_threshold_index e)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, e < XE_GUC_KLV_NUM_THRESHOLDS);
+
+	gt->sriov.pf.vfs[vfid].monitor.guc.events[e]++;
+}
+
+static int pf_handle_vf_threshold_event(struct xe_gt *gt, u32 vfid, u32 threshold)
+{
+	char origin[8];
+	int e;
+
+	e = xe_guc_klv_threshold_key_to_index(threshold);
+	xe_sriov_function_name(vfid, origin, sizeof(origin));
+
+	/* was there a new KEY added that we missed? */
+	if (unlikely(e < 0)) {
+		xe_gt_sriov_notice(gt, "unknown threshold key %#x reported for %s\n",
+				   threshold, origin);
+		return -ENOTCONN;
+	}
+
+	xe_gt_sriov_dbg(gt, "%s exceeded threshold %u %s\n",
+			origin, xe_gt_sriov_pf_config_get_threshold(gt, vfid, e),
+			xe_guc_klv_key_to_string(threshold));
+
+	pf_update_event_counter(gt, vfid, e);
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_monitor_process_guc2pf - Handle adverse event notification from the GuC.
+ * @gt: the &xe_gt
+ * @msg: G2H event message
+ * @len: length of the message
+ *
+ * This function is intended for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 vfid;
+	u32 threshold;
+
+	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
+		     GUC_ACTION_GUC2PF_ADVERSE_EVENT);
+
+	if (unlikely(!IS_SRIOV_PF(xe)))
+		return -EPROTO;
+
+	if (unlikely(FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_0_MBZ, msg[0])))
+		return -EPFNOSUPPORT;
+
+	if (unlikely(len < GUC2PF_ADVERSE_EVENT_EVENT_MSG_LEN))
+		return -EPROTO;
+
+	vfid = FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_1_VFID, msg[1]);
+	threshold = FIELD_GET(GUC2PF_ADVERSE_EVENT_EVENT_MSG_2_THRESHOLD, msg[2]);
+
+	if (unlikely(vfid > xe_gt_sriov_pf_get_totalvfs(gt)))
+		return -EINVAL;
+
+	return pf_handle_vf_threshold_event(gt, vfid, threshold);
+}
+
+/**
+ * xe_gt_sriov_pf_monitor_print_events - Print adverse events counters.
+ * @gt: the &xe_gt to print events from
+ * @p: the &drm_printer
+ *
+ * Print adverse events counters for all VFs.
+ * VFs with no events are not printed.
+ *
+ * This function can only be called on PF.
+ */
+void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
+{
+	unsigned int n, total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
+	const struct xe_gt_sriov_monitor *data;
+	int e;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	for (n = 1; n <= total_vfs; n++) {
+		data = &gt->sriov.pf.vfs[n].monitor;
+
+		for (e = 0; e < XE_GUC_KLV_NUM_THRESHOLDS; e++)
+			if (data->guc.events[e])
+				break;
+
+		/* skip empty unless in debug mode */
+		if (e >= XE_GUC_KLV_NUM_THRESHOLDS &&
+		    !IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV))
+			continue;
+
+#define __format(...) "%s:%u "
+#define __value(TAG, NAME, ...) , #NAME, data->guc.events[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)]
+
+		drm_printf(p, "VF%u:\t" MAKE_XE_GUC_KLV_THRESHOLDS_SET(__format) "\n",
+			   n MAKE_XE_GUC_KLV_THRESHOLDS_SET(__value));
+
+#undef __format
+#undef __value
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
new file mode 100644
index 000000000000..7ca9351a271b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_MONITOR_H_
+#define _XE_GT_SRIOV_PF_MONITOR_H_
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct drm_printer;
+struct xe_gt;
+
+void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid);
+void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
+
+#ifdef CONFIG_PCI_IOV
+int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
+#else
+static inline int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
+{
+	return -EPROTO;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
new file mode 100644
index 000000000000..e27c0308c5db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_MONITOR_TYPES_H_
+#define _XE_GT_SRIOV_PF_MONITOR_TYPES_H_
+
+#include "xe_guc_klv_thresholds_set_types.h"
+
+/**
+ * struct xe_gt_sriov_monitor - GT level per-VF monitoring data.
+ */
+struct xe_gt_sriov_monitor {
+	/** @guc: monitoring data related to the GuC. */
+	struct {
+		/** @guc.events: number of adverse events reported by the GuC. */
+		unsigned int events[XE_GUC_KLV_NUM_THRESHOLDS];
+	} guc;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 880754f3e215..40cbaea3ef44 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include "xe_gt_sriov_pf_config_types.h"
+#include "xe_gt_sriov_pf_monitor_types.h"
 #include "xe_gt_sriov_pf_policy_types.h"
 #include "xe_gt_sriov_pf_service_types.h"
 
@@ -18,6 +19,10 @@
 struct xe_gt_sriov_metadata {
 	/** @config: per-VF provisioning data. */
 	struct xe_gt_sriov_config config;
+
+	/** @monitor: per-VF monitoring data. */
+	struct xe_gt_sriov_monitor monitor;
+
 	/** @version: negotiated VF/PF ABI version */
 	struct xe_gt_sriov_pf_service_version version;
 };
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 0151d29b3c58..c1f258348f5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -22,6 +22,7 @@
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_relay.h"
@@ -1071,6 +1072,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
 		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
 		break;
+	case GUC_ACTION_GUC2PF_ADVERSE_EVENT:
+		ret = xe_gt_sriov_pf_monitor_process_guc2pf(gt, hxg, hxg_len);
+		break;
 	default:
 		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
-- 
2.43.0

