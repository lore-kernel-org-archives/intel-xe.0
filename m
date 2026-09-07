Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7CDC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458110E833;
	Mon,  7 Sep 2026 13:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="al6opcgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B172510E833
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788788851; x=1820324851;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VO4K2+rBrlX3pi0gtEs1DVYHleS3r0pUsvGwhO7Ejw0=;
 b=al6opcgcLlztHmTH5Gp+Umd0GwHNALILK9clEO3H1/pBEE5HZ7+0uLfP
 uxNopYPvPm7vq13xf5TCHrxJUP8EwSpsqgTbU/MvoVr3IkKfoBZN29vPu
 Hb+yh1WXXMJPAtEXA9V0Mn6qlfxD4XUOW6EfKv9ey69/RSKj0rEVHC04E
 0sIUlZEL156p1aG2xyZIrbvjdAX3Jli6W0hyF+3VZ8PZV6Gj1YYSRG/IY
 GttdNoKD7bkGr/8AAGnaUd42fewFvjZSpMmXIw+DW03XDLUNvlQ5Lyhoo
 sUO/XS6RuIu4U++6LHFe1l8RSYGlj+bgx+tC9e/F7OUU3tguRCGjxgxE5 Q==;
X-CSE-ConnectionGUID: 33Ekb4u/TDi9Ct/1QIVBGQ==
X-CSE-MsgGUID: ZH9rCc5BRWSJCQdtXBRxIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88953460"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88953460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:47:31 -0700
X-CSE-ConnectionGUID: Ede1ox1cRn65bqbx3BspWw==
X-CSE-MsgGUID: MHk+u6V9TUSRMiyV849KLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="295598689"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:47:29 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
Date: Mon,  7 Sep 2026 19:17:20 +0530
Message-ID: <20260907134719.999549-2-varun.gupta@intel.com>
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

v3:
 - Use xe_exec_queue_get_lrc() instead of raw pointer dereference to
   safely handle concurrent multi-queue group creation and avoid race
   conditions (Sashiko)
v2:
 - Maintain alphabetical order for includes and
   pf_only_debugfs_list (Tejas)
 - Export and reuse xe_lrc_get_multi_queue_active_queue_id() instead
   of duplicate MMIO read (Tejas)

Bspec: 60321, 73976
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 46 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 73 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  5 ++
 drivers/gpu/drm/xe/xe_lrc.c        |  6 +--
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 5 files changed, 128 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 361a70234d1f..d7d6f50d8dab 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -13,6 +13,7 @@
 #include <drm/drm_managed.h>
 #include <linux/math.h>
 
+#include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -25,6 +26,7 @@
 #include "xe_gt_stats.h"
 #include "xe_gt_topology.h"
 #include "xe_guc_hwconfig.h"
+#include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_mmio.h"
@@ -130,6 +132,48 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
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
+		active_id = xe_lrc_get_multi_queue_active_queue_id(hwe);
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
@@ -249,6 +293,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{ "hw_engines", .show = xe_gt_debugfs_show_with_rpm, .data = hw_engines },
 	{ "mocs", .show = xe_gt_debugfs_show_with_rpm, .data = xe_mocs_dump },
+	{ "multi_queue_active_lrca",
+		.show = xe_gt_debugfs_show_with_rpm, .data = multi_queue_active_lrca },
 	{ "pat", .show = xe_gt_debugfs_show_with_rpm, .data = xe_pat_dump },
 	{ "powergate_info", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_idle_pg_print },
 	{ "steering", .show = xe_gt_debugfs_show_with_rpm, .data = steering },
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 99d8c807ff05..a39dcb85e3f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3853,6 +3853,79 @@ bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
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
+		struct xe_lrc *active_lrc;
+		struct xe_lrc *primary_lrc;
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
+		primary_lrc = xe_exec_queue_get_lrc(group->primary, 0);
+		if (!primary_lrc)
+			continue;
+
+		if ((xe_lrc_ggtt_addr(primary_lrc) ^ cur_lrca) & GENMASK(31, 12)) {
+			xe_lrc_put(primary_lrc);
+			continue;
+		}
+
+		active_lrc = xe_exec_queue_get_lrc(q, 0);
+		xe_lrc_put(primary_lrc);
+		if (!active_lrc)
+			continue;
+
+		lrca = xe_lrc_ggtt_addr(active_lrc);
+		xe_lrc_put(active_lrc);
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
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 25fe9dbc9141..f1cf1463f1b2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2705,7 +2705,7 @@ static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
 				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
 }
 
-static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
+u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
 {
 	u32 val = xe_mmio_read32(&hwe->gt->mmio,
 				 RING_CSMQDEBUG(hwe->mmio_base));
@@ -2739,14 +2739,14 @@ static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
 	if (!hwe)
 		return xe_lrc_queue_timestamp(lrc);
 
-	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos)
+	if (xe_lrc_get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos)
 		return xe_lrc_queue_timestamp(lrc);
 
 	/* queue is active, so store the queue timestamp register */
 	reg_queue_ts = get_queue_timestamp(hwe);
 
 	/* double check queue and primary queue are both still active */
-	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos ||
+	if (xe_lrc_get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos ||
 	    !context_active(primary_lrc))
 		return xe_lrc_queue_timestamp(lrc);
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 7be5e3da8bc8..a8ff4e59a1f4 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -158,6 +158,7 @@ int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
 u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
 
 void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
+u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe);
 
 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
 void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
-- 
2.43.0

