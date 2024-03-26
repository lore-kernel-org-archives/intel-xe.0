Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61019C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18F10F214;
	Tue, 26 Mar 2024 19:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4BWTZh9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E75510F212
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480536; x=1743016536;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mXSpiCDkkI2P1LHsMCToULWiinOoG6heyWQTlaOORiI=;
 b=l4BWTZh93ypU/4z+/j+u8H5YwQhkKXADfBXquVOI3iN30UGg8XqHDZlK
 KA4fgezC5K1XrMJ6NoOwGb/x7OtfEkDx9bg6+MXVoE4Q/Ut4LYafnwW9J
 E2AtDJ1K2V+FvJ6mKFux2zgQIrkMmIcIlaeta6pr/ne0V7ILeY2hN3x99
 6lSnRUz7crnKO1ifo+8y5eVQIkCsXkaCug3zsbRcvOdDnOCiX1HHsJ9Gm
 aHMIAFgZyGn9jcyL/159Muj9T9vKpFvXQHqzRG1CL1Rw3vcYTZUhhKf4b
 fKa1sFxnvVYNbFXweuPAnQ0KrTZMEw39dDEiqszYIPSpQqH2JIIQVaITs A==;
X-CSE-ConnectionGUID: fwS1UzKkS1iXnggarJY3xA==
X-CSE-MsgGUID: 8+maL8HMT4K3sXzDgdrBvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="31994181"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31994181"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20704791"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.156.251])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events
Date: Tue, 26 Mar 2024 20:15:18 +0100
Message-Id: <20240326191518.363-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240326191518.363-1-michal.wajdeczko@intel.com>
References: <20240326191518.363-1-michal.wajdeczko@intel.com>
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

GuC will use VF_STATE_NOTIFY events to notify the PF about changes
of the VF state, in particular when a VF FLR was requested.  Add
very minimal support for such events to avoid reporting errors due
to unexpected G2H. We will improve handling of these messages later.

While around also add few basic functions to control the VF state
(pause, resume, stop) as we will also exercise them soon.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 257 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  27 ++
 drivers/gpu/drm/xe/xe_guc_ct.c              |   5 +
 4 files changed, 290 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..25f352b3de15 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -155,6 +155,7 @@ xe-y += \
 	xe_sriov.o
 
 xe-$(CONFIG_PCI_IOV) += \
+	xe_gt_sriov_pf_control.o \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
new file mode 100644
index 000000000000..40b8f881fe04
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "abi/guc_actions_sriov_abi.h"
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_printk.h"
+#include "xe_guc_ct.h"
+#include "xe_sriov.h"
+
+static const char *control_cmd_to_string(u32 cmd)
+{
+	switch (cmd) {
+	case GUC_PF_TRIGGER_VF_PAUSE:
+		return "PAUSE";
+	case GUC_PF_TRIGGER_VF_RESUME:
+		return "RESUME";
+	case GUC_PF_TRIGGER_VF_STOP:
+		return "STOP";
+	case GUC_PF_TRIGGER_VF_FLR_START:
+		return "FLR_START";
+	case GUC_PF_TRIGGER_VF_FLR_FINISH:
+		return "FLR_FINISH";
+	default:
+		return "<unknown>";
+	}
+}
+
+static int guc_action_vf_control_cmd(struct xe_guc *guc, u32 vfid, u32 cmd)
+{
+	u32 request[PF2GUC_VF_CONTROL_REQUEST_MSG_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_PF2GUC_VF_CONTROL),
+		FIELD_PREP(PF2GUC_VF_CONTROL_REQUEST_MSG_1_VFID, vfid),
+		FIELD_PREP(PF2GUC_VF_CONTROL_REQUEST_MSG_2_COMMAND, cmd),
+	};
+	int ret;
+
+	/* XXX those two commands are now sent from the G2H handler */
+	if (cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH)
+		return xe_guc_ct_send_g2h_handler(&guc->ct, request, ARRAY_SIZE(request));
+
+	ret = xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
+	return ret > 0 ? -EPROTO : ret;
+}
+
+static int pf_send_vf_control_cmd(struct xe_gt *gt, unsigned int vfid, u32 cmd)
+{
+	int err;
+
+	xe_gt_assert(gt, vfid != PFID);
+
+	err = guc_action_vf_control_cmd(&gt->uc.guc, vfid, cmd);
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, "VF%u control command %s failed (%pe)\n",
+				vfid, control_cmd_to_string(cmd), ERR_PTR(err));
+	return err;
+}
+
+static int pf_send_vf_pause(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_PAUSE);
+}
+
+static int pf_send_vf_resume(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_RESUME);
+}
+
+static int pf_send_vf_stop(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_STOP);
+}
+
+static int pf_send_vf_flr_start(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_START);
+}
+
+static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_FINISH);
+}
+
+/**
+ * xe_gt_sriov_pf_control_pause_vf - Pause a VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_pause(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_control_resume_vf - Resume a VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_resume(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_control_stop_vf - Stop a VF.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
+{
+	return pf_send_vf_stop(gt, vfid);
+}
+
+/**
+ * DOC: The VF FLR Flow with GuC
+ *
+ *          PF                        GUC             PCI
+ * ========================================================
+ *          |                          |               |
+ * (1)      |                         [ ] <----- FLR --|
+ *          |                         [ ]              :
+ * (2)     [ ] <-------- NOTIFY FLR --[ ]
+ *         [ ]                         |
+ * (3)     [ ]                         |
+ *         [ ]                         |
+ *         [ ]-- START FLR ---------> [ ]
+ *          |                         [ ]
+ * (4)      |                         [ ]
+ *          |                         [ ]
+ *         [ ] <--------- FLR DONE -- [ ]
+ *         [ ]                         |
+ * (5)     [ ]                         |
+ *         [ ]                         |
+ *         [ ]-- FINISH FLR --------> [ ]
+ *          |                          |
+ *
+ * Step 1: PCI HW generates interrupt to the GuC about VF FLR
+ * Step 2: GuC FW sends G2H notification to the PF about VF FLR
+ * Step 2a: on some platforms G2H is only received from root GuC
+ * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
+ * Step 3a: on some platforms PF must send H2G to all other GuCs
+ * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
+ * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
+ */
+
+static bool needs_dispatch_flr(struct xe_device *xe)
+{
+	return xe->info.platform == XE_PVC;
+}
+
+static void pf_handle_vf_flr(struct xe_gt *gt, u32 vfid)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_gt *gtit;
+	unsigned int gtid;
+
+	xe_gt_sriov_info(gt, "VF%u FLR\n", vfid);
+
+	if (needs_dispatch_flr(xe)) {
+		for_each_gt(gtit, xe, gtid)
+			pf_send_vf_flr_start(gtit, vfid);
+	} else {
+		pf_send_vf_flr_start(gt, vfid);
+	}
+}
+
+static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
+{
+	pf_send_vf_flr_finish(gt, vfid);
+}
+
+static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
+{
+	switch (eventid) {
+	case GUC_PF_NOTIFY_VF_FLR:
+		pf_handle_vf_flr(gt, vfid);
+		break;
+	case GUC_PF_NOTIFY_VF_FLR_DONE:
+		pf_handle_vf_flr_done(gt, vfid);
+		break;
+	case GUC_PF_NOTIFY_VF_PAUSE_DONE:
+		break;
+	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
+		break;
+	default:
+		return -ENOPKG;
+	}
+	return 0;
+}
+
+static int pf_handle_pf_event(struct xe_gt *gt, u32 eventid)
+{
+	switch (eventid) {
+	case GUC_PF_NOTIFY_VF_ENABLE:
+		xe_gt_sriov_dbg_verbose(gt, "VFs %s/%s\n",
+					str_enabled_disabled(true),
+					str_enabled_disabled(false));
+		break;
+	default:
+		return -ENOPKG;
+	}
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_control_process_guc2pf - Handle VF state notification from GuC.
+ * @gt: the &xe_gt
+ * @msg: the G2H message
+ * @len: the length of the G2H message
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
+{
+	u32 vfid;
+	u32 eventid;
+
+	xe_gt_assert(gt, len);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
+	xe_gt_assert(gt, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
+		     GUC_ACTION_GUC2PF_VF_STATE_NOTIFY);
+
+	if (unlikely(!xe_device_is_sriov_pf(gt_to_xe(gt))))
+		return -EPROTO;
+
+	if (unlikely(FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_0_MBZ, msg[0])))
+		return -EPFNOSUPPORT;
+
+	if (unlikely(len != GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN))
+		return -EPROTO;
+
+	vfid = FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID, msg[1]);
+	eventid = FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT, msg[2]);
+
+	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
new file mode 100644
index 000000000000..850a3e37661f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_CONTROL_H_
+#define _XE_GT_SRIOV_PF_CONTROL_H_
+
+#include <linux/errno.h>
+#include <linux/types.h>
+
+struct xe_gt;
+
+int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
+
+#ifdef CONFIG_PCI_IOV
+int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
+#else
+static inline int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
+{
+	return -EPROTO;
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 1d930a8eeeca..f4890e9a1e93 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -21,6 +21,7 @@
 #include "xe_gt.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_relay.h"
@@ -1008,6 +1009,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u32 hxg_len = msg_len_to_hxg_len(len);
 	u32 *hxg = msg_to_hxg(msg);
 	u32 action, adj_len;
@@ -1063,6 +1065,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
 		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
 		break;
+	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
+		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
+		break;
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
 	}
-- 
2.43.0

