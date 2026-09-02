Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B466C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8A10E35F;
	Wed,  2 Sep 2026 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3qdVdOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D68C10E35F
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360634; x=1819896634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1TwCIM0R6FBabygShICvr+yy4F2gwY+8cJ+X+PzF3mQ=;
 b=B3qdVdOMkmpus9zjxFxOBqt5+onWzrxPC2Q3etD59oq+pCGNXGsZMwva
 mZkzXnGdgv5Utl0EZf4uO+ktH8YKYaJjO68/9cnpVYZHZhotxfZNRVHf0
 LVbO28BmDaqYOv051EPOxxm2EbobyUAobOUpTCc2qdgB6Xs744sK+89CQ
 vnCXue50Zwt7p8srw4Vk2ym3eROueqCJtUa6tbpE1flUA3AxTR7VB+TYD
 ZE11axuNrY549E9fX8YbVLTIXlYIIQVI7q+jXMjEoo4YHBDJousfYE7j/
 g71WKJLOAkNrJZLWBNvGvQNzQq7eQRfMiBI9oVsU/hUc3sTSsc1f6KoLr Q==;
X-CSE-ConnectionGUID: fXFDgu0hToq8U161iGCw6A==
X-CSE-MsgGUID: Tm2THzf3TCiOVaJXRbE1ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92688468"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92688468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:50:33 -0700
X-CSE-ConnectionGUID: dtERbhQAR8aqYBaw7xUXxQ==
X-CSE-MsgGUID: BW9lo9S/Sxe8DURDRfccyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="265726170"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:50:32 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH] drm/xe: Add multi_queue_active_lrca debugfs
Date: Wed,  2 Sep 2026 20:20:17 +0530
Message-ID: <20260902145016.3351123-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Add a per-GT debugfs file, multi_queue_active_lrca, that prints, for
every engine supporting multi-queue, the currently active queue ID
(CSMQDEBUG) and the LRCA of the exec queue occupying that slot within
the running multi-queue group.

RING_CURRENT_LRCA only reports the primary queue's LRCA for the group
and does not update to reflect the active queue in multi-queue mode,
which makes it hard to tell which queue is actually running when
debugging multi-queue CSB/context-switch issues. Resolve the active
LRCA by matching the primary LRCA against each queue's group and
picking the queue at the reported active_id position.

Bspec: 60321, 73976
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 48 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 59 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  5 +++
 3 files changed, 112 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 361a70234d1f..6efbee06a642 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -13,11 +13,13 @@
 #include <drm/drm_managed.h>
 #include <linux/math.h>
 
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_guc_submit.h"
 #include "xe_gt_idle.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_pf_debugfs.h"
@@ -130,6 +132,50 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int multi_queue_active_lrca(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u32 cur_lrca, active_id, lrca;
+		unsigned int fw_ref;
+
+		if (!xe_gt_supports_multi_queue(gt, hwe->class))
+			continue;
+
+		/*
+		 * Forcewake is dropped before xe_guc_submit_active_multi_queue_lrca()
+		 * below, which takes guc->submission_state.lock, to avoid holding a
+		 * GT forcewake ref across a mutex acquired elsewhere in the opposite
+		 * order.
+		 */
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
+			drm_printf(p, "%s\tforcewake failed, skipping\n", hwe->name);
+			xe_force_wake_put(gt_to_fw(gt), fw_ref);
+			continue;
+		}
+
+		cur_lrca = xe_mmio_read32(&gt->mmio,
+					  RING_CURRENT_LRCA(hwe->mmio_base));
+		active_id = REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK,
+					  xe_mmio_read32(&gt->mmio,
+							 RING_CSMQDEBUG(hwe->mmio_base)));
+
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+		lrca = xe_guc_submit_active_multi_queue_lrca(guc, hwe, cur_lrca,
+							     active_id);
+
+		drm_printf(p, "%s\tactive_queue_id %u\tcurrent_lrca 0x%08x\tactive_lrca 0x%08x\n",
+			   hwe->name, active_id, cur_lrca, lrca);
+	}
+
+	return 0;
+}
+
 static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_gt_mcr_steering_dump(gt, p);
@@ -248,6 +294,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
+	{ "multi_queue_active_lrca",
+		.show = xe_gt_debugfs_show_with_rpm, .data = multi_queue_active_lrca },
 	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
 	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..1d9b55909504 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3853,6 +3853,65 @@ bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
 	return false;
 }
 
+/**
+ * xe_guc_submit_active_multi_queue_lrca() - Resolve the LRCA of the active
+ * queue in the multi-queue group currently running on an engine.
+ * @guc: the &xe_guc managing the exec queues
+ * @hwe: the &xe_hw_engine whose active queue is being resolved
+ * @cur_lrca: value read from RING_CURRENT_LRCA, identifies the running group
+ * @active_id: current Active Queue ID read from CSMQDEBUG (position in group)
+ *
+ * The running group is identified by matching @cur_lrca against the group's
+ * primary LRCA; @active_id then selects the active queue within that group.
+ *
+ * Return: the LRCA of the active queue, or 0 if no matching queue is found.
+ */
+u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
+					  struct xe_hw_engine *hwe,
+					  u32 cur_lrca, u32 active_id)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+	u32 lrca = 0;
+
+	/*
+	 * submission_state.lock also protects exec_queue teardown: an exec
+	 * queue is removed from exec_queue_lookup before its group/primary
+	 * are freed, so any q found in the xarray below has a live group
+	 * and primary for as long as we hold the lock.
+	 */
+	guard(mutex)(&guc->submission_state.lock);
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		if (!q->multi_queue.valid || !group || !group->primary)
+			continue;
+		/*
+		 * Multi-queue exec queues are bound to a hw engine class;
+		 * GuC dynamically schedules them onto one of the class's
+		 * physical instances, so there is no fixed queue-to-instance
+		 * mapping to filter on here.
+		 */
+		if (q->class != hwe->class)
+			continue;
+		if (q->multi_queue.pos != active_id)
+			continue;
+		/*
+		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
+		 * bits reported by RING_CURRENT_LRCA are not meaningful, so
+		 * only compare bits [31:12].
+		 */
+		if ((xe_lrc_ggtt_addr(group->primary->lrc[0]) ^ cur_lrca) & GENMASK(31, 12))
+			continue;
+
+		lrca = xe_lrc_ggtt_addr(q->lrc[0]);
+		break;
+	}
+
+	return lrca;
+}
+
 /**
  * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
  * exec queues registered to given GuC.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index ccade320dc69..29abf07d8f04 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -11,6 +11,7 @@
 struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
+struct xe_hw_engine;
 
 int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
 int xe_guc_submit_enable(struct xe_guc *guc);
@@ -55,6 +56,10 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
 
+u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
+					  struct xe_hw_engine *hwe,
+					  u32 cur_lrca, u32 active_id);
+
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
 #endif
-- 
2.43.0

