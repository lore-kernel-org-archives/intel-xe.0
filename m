Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B55C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE9010FDB9;
	Mon,  6 May 2024 13:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAH88Uc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBAF10FD92
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715002719; x=1746538719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/0kbYlF5632ZW+CL6Bq7Hvl6bYA7IgI6/vj28Y6IIU=;
 b=hAH88Uc7vzbMs+bP4vYRHsQOpg2OM+PF4o1oRL/Q+R52JDb4ZfcDJvrm
 puf6X0PnKFYPM7r48QT1zEbPgptkXZJEMgu53e6XeFqhDoBX9K4tP727r
 fmK6jXwikX34x4LVm5pPOrc5fKeRGBs64AZ1nOHBxAYuaMCnjSnB6IBqE
 SETjlO/pPbuZSjeEh0ke+4YJlq2UY8rKEw/1beAds8rZfWZb5YZ3VWhjr
 wliHwq98mTd3C4dK90M+e0LNcTscci7e1x4w8q43xA8+2akfXueXS06ub
 CvfYDGNgN5QfeABPUEcVT1SC8jyfg+h5Aw/fvU6dWXDJnncn+gInwvaZc w==;
X-CSE-ConnectionGUID: jw+1UC4hS6uyJTPpWNdE8Q==
X-CSE-MsgGUID: HXYq4LrxSaeMO5nNMp2+9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21903426"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21903426"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:39 -0700
X-CSE-ConnectionGUID: Hq0/CPwMSzqiJbdrFbaHNQ==
X-CSE-MsgGUID: Xwin017zTuuyJtPERrztJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28131724"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:38:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 7/8] drm/xe/pf: Track adverse events notifications from GuC
Date: Mon,  6 May 2024 15:38:13 +0200
Message-Id: <20240506133814.2571-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240506133814.2571-1-michal.wajdeczko@intel.com>
References: <20240506133814.2571-1-michal.wajdeczko@intel.com>
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

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c   | 143 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h   |  27 ++++
 .../gpu/drm/xe/xe_gt_sriov_pf_monitor_types.h |  22 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |   4 +
 6 files changed, 202 insertions(+)
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
index 000000000000..2c0c5572a6cf
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
@@ -0,0 +1,143 @@
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
+ * xe_gt_sriov_pf_monitor_flr - Process VF FLR.
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
+	xe_gt_assert(gt, e < XE_GUC_KLV_NUM_THRESHOLDS);
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
index 8ac819a7061e..be9aaf30974a 100644
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
@@ -1066,6 +1067,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
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

