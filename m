Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D44CF855A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 03:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7A110E796;
	Thu,  3 Oct 2024 03:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4aTspCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D4110E77E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727925313; x=1759461313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eEHNyxG3ZQ++GTJ0yeuEWZVEvYj6JguRm1JhiPYKVFk=;
 b=Z4aTspCm0dFYbuRDeWqQ9DZYa1xV0bgtnMml2FlRU5wqk5Hf3UlU45GI
 FBBsrXcnr6g7Nm8RbHouS2hZSUs3YC04W7392yYEFNg9FucNsjB0n/7+J
 kZJrtJENgZgkBtjNTT3j8Ek5XNDbCp3a24pv0FlJRtNdcWo1ZHaiTnAOs
 c8eLCelBObB5dwqD9f1VdMq5YBfRmj8vpHVGu8L1UmypR+joKbg8rIE9m
 84yNIDC6y8kLvQ1NY7O9fXTY9s1duUCP5HUhqqMvGYq0OSe+tyfHGvo4c
 MvXWL5l0aCJ/Khdhvasd5RK9HVMOyf5x7ExDQ2JL6LDB8funkZnazcI8F Q==;
X-CSE-ConnectionGUID: 4iVY96fCRPWyC/LY9oJJ5w==
X-CSE-MsgGUID: BIJCE7jdSnWvXQzz0+cRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44577165"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="44577165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 20:15:13 -0700
X-CSE-ConnectionGUID: cWw0WtrdRHuPAZsul6++rA==
X-CSE-MsgGUID: PW8jiGN6QGqoFfHmiinoHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="105031749"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa002.jf.intel.com with ESMTP; 02 Oct 2024 20:15:12 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v24 6/6] drm/xe/guc: Save manual engine capture into capture
 list
Date: Wed,  2 Oct 2024 20:15:05 -0700
Message-Id: <20241003031505.2692473-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003031505.2692473-1-zhanjun.dong@intel.com>
References: <20241003031505.2692473-1-zhanjun.dong@intel.com>
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

Save manual engine capture into capture list.
This removes duplicate register definitions across manual-capture vs
guc-err-capture.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c     |   5 +-
 drivers/gpu/drm/xe/xe_guc_capture.c     | 196 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_capture.h     |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 246 +-----------------------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   2 -
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  59 ------
 6 files changed, 183 insertions(+), 330 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39dbcc680327..395078aafd48 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -107,8 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "\n**** HW Engines ****\n");
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
-			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
-						    &p);
+			xe_engine_snapshot_print(coredump->snapshot.hwe[i], &p);
 	drm_printf(&p, "\n**** VM state ****\n");
 	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
 
@@ -122,7 +121,7 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 	xe_guc_ct_snapshot_free(ss->ct);
 	ss->ct = NULL;
 
-	xe_guc_capture_free(&ss->gt->uc.guc);
+	xe_guc_capture_put_nodes(&ss->gt->uc.guc);
 	ss->matched_node = NULL;
 
 	xe_guc_exec_queue_snapshot_free(ss->ge);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f8859c467850..ea4080af0d94 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -312,7 +312,6 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 		     reglists[i].type == GUC_STATE_CAPTURE_TYPE_GLOBAL))
 			return &reglists[i];
 	}
-
 	return NULL;
 }
 
@@ -876,7 +875,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
 	int guc_id = node->guc_id;
 
 	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
-		if (n != node && !n->locked && n->guc_id == guc_id)
+		if (n && n != node && !n->locked && n->guc_id == guc_id)
 			guc_capture_free_outlist_node(gc, n);
 	}
 }
@@ -930,7 +929,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                   guc->capture->cachelist and populated with the error-capture
  *                   data from GuC and then it's added into guc->capture->outlist linked
  *                   list. This list is used for matchup and printout by xe_devcoredump_read
- *                   and xe_hw_engine_snapshot_print, (when user invokes the devcoredump sysfs).
+ *                   and xe_engine_snapshot_print, (when user invokes the devcoredump sysfs).
  *
  * GUC --> notify context reset:
  * -----------------------------
@@ -938,12 +937,13 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                   L--> xe_devcoredump
  *                          L--> devcoredump_snapshot
  *                               --> xe_hw_engine_snapshot_capture
+ *                               --> xe_engine_manual_capture(For manual capture)
  *
  * User Sysfs / Debugfs
  * --------------------
  *      --> xe_devcoredump_read->
  *             L--> xxx_snapshot_print
- *                    L--> xe_hw_engine_snapshot_print
+ *                    L--> xe_engine_snapshot_print
  *                         Print register lists values saved at
  *                         guc->capture->outlist
  *
@@ -1065,6 +1065,9 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
 {
 	struct __guc_capture_parsed_output *found = NULL;
 
+	if (!guc->capture)
+		return NULL;
+
 	if (!list_empty(&guc->capture->cachelist)) {
 		struct __guc_capture_parsed_output *n, *ntmp;
 
@@ -1519,6 +1522,128 @@ guc_capture_create_prealloc_nodes(struct xe_guc *guc)
 	__guc_capture_create_prealloc_nodes(guc);
 }
 
+static void
+read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_group *list,
+		 struct guc_mmio_reg *regs)
+{
+	int i;
+
+	if (!list || list->num_regs == 0)
+		return;
+
+	if (!regs)
+		return;
+
+	for (i = 0; i < list->num_regs; i++) {
+		struct __guc_mmio_reg_descr desc = list->list[i];
+		u32 value;
+
+		if (!list->list)
+			return;
+
+		if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) {
+			value = xe_hw_engine_mmio_read32(hwe, desc.reg);
+		} else {
+			if (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS &&
+			    FIELD_GET(GUC_REGSET_STEERING_NEEDED, desc.flags)) {
+				int group, instance;
+
+				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, desc.flags);
+				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, desc.flags);
+				value = xe_gt_mcr_unicast_read(hwe->gt, XE_REG_MCR(desc.reg.addr),
+							       group, instance);
+			} else {
+				value = xe_mmio_read32(&hwe->gt->mmio, desc.reg);
+			}
+		}
+
+		regs[i].value = value;
+		regs[i].offset = desc.reg.addr;
+		regs[i].flags = desc.flags;
+		regs[i].mask = desc.mask;
+	}
+}
+
+/**
+ * xe_engine_manual_capture - Take a manual engine snapshot from engine.
+ * @hwe: Xe HW Engine.
+ * @snapshot: The engine snapshot
+ *
+ * Take engine snapshot from engine read.
+ *
+ * Returns: None
+ */
+void
+xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_devcoredump *devcoredump = &xe->devcoredump;
+	enum guc_capture_list_class_type capture_class;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_capture_parsed_output *new;
+	enum guc_state_capture_type type;
+	u16 guc_id = 0;
+	u32 lrca = 0;
+
+	new = guc_capture_get_prealloc_node(guc);
+	if (!new)
+		return;
+
+	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
+		struct gcap_reg_list_info *reginfo = &new->reginfo[type];
+		/*
+		 * regsinfo->regs is allocated based on guc->capture->max_mmio_per_node
+		 * which is based on the descriptor list driving the population so
+		 * should not overflow
+		 */
+
+		/* Get register list for the type/class */
+		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
+							capture_class, false);
+		if (!list) {
+			xe_gt_dbg(gt, "Empty GuC capture register descriptor for %s",
+				  hwe->name);
+			continue;
+		}
+
+		read_reg_to_node(hwe, list, reginfo->regs);
+		reginfo->num_regs = list->num_regs;
+
+		/* Capture steering registers for rcs/ccs */
+		if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+			list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
+								type, capture_class, true);
+			if (list) {
+				read_reg_to_node(hwe, list, &reginfo->regs[reginfo->num_regs]);
+				reginfo->num_regs += list->num_regs;
+			}
+		}
+	}
+
+	if (devcoredump && devcoredump->captured) {
+		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
+
+		if (ge) {
+			guc_id = ge->guc.id;
+			if (ge->lrc[0])
+				lrca = ge->lrc[0]->context_desc;
+		}
+	}
+
+	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
+	new->eng_inst = hwe->instance;
+	new->guc_id = guc_id;
+	new->lrca = lrca;
+	new->is_partial = 0;
+	new->locked = 1;
+	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
+	guc_capture_add_node_to_outlist(guc->capture, new);
+	devcoredump->snapshot.matched_node = new;
+}
+
 static struct guc_mmio_reg *
 guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
 {
@@ -1549,7 +1674,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 	u32 last_value, i;
 	bool is_ext;
 
-	if (!list || list->num_regs == 0)
+	if (!guc->capture || !list || list->num_regs == 0)
 		return;
 	XE_WARN_ON(!devcore_snapshot->matched_node);
 
@@ -1604,7 +1729,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
  *
  * This function prints out a given Xe HW Engine snapshot object.
  */
-void xe_engine_guc_capture_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
 {
 	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
 		"full-capture",
@@ -1614,14 +1739,23 @@ void xe_engine_guc_capture_print(struct xe_hw_engine_snapshot *snapshot, struct
 	const struct __guc_mmio_reg_descr_group *list;
 	enum guc_capture_list_class_type capture_class;
 
-	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_devcoredump *devcoredump = &xe->devcoredump;
-	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
+	struct xe_gt *gt;
+	struct xe_guc *guc;
+	struct xe_device *xe;
+	struct xe_devcoredump *devcoredump;
+	struct xe_devcoredump_snapshot *devcore_snapshot;
 
 	if (!snapshot)
 		return;
-	XE_WARN_ON(!devcore_snapshot->matched_node);
+
+	gt = snapshot->hwe->gt;
+	guc = &gt->uc.guc;
+	xe = gt_to_xe(gt);
+	devcoredump = &xe->devcoredump;
+	devcore_snapshot = &devcoredump->snapshot;
+
+	if (!guc->capture || !devcore_snapshot->matched_node)
+		return;
 
 	xe_gt_assert(gt, snapshot->source <= XE_ENGINE_CAPTURE_SOURCE_GUC);
 	xe_gt_assert(gt, snapshot->hwe);
@@ -1636,6 +1770,8 @@ void xe_engine_guc_capture_print(struct xe_hw_engine_snapshot *snapshot, struct
 	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tReserved: %s\n",
+		   str_yes_no(snapshot->kernel_reserved));
 
 	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
 		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
@@ -1709,7 +1845,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
 		 * lrca info.
 		 */
 		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
-			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
+			if (n && n->eng_class == guc_class && n->eng_inst == hwe->instance &&
 			    n->guc_id == guc_id && n->lrca == lrca &&
 			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
 				n->locked = 1;
@@ -1745,28 +1881,48 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
 			continue;
 		}
 
-		if (!coredump->snapshot.hwe[id])
+		if (!coredump->snapshot.hwe[id]) {
 			coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, job);
+		} else {
+			struct __guc_capture_parsed_output *new;
+
+			new = xe_guc_capture_get_matching_and_lock(job);
+			if (new) {
+				struct xe_guc *guc =  &q->gt->uc.guc;
+
+				/*
+				 * If we are in here, it means we found a fresh
+				 * GuC-err-capture node for this engine after
+				 * previously failing to find a match in the
+				 * early part of guc_exec_queue_timedout_job.
+				 * Thus we must free the manually captured node
+				 */
+				guc_capture_free_outlist_node(guc->capture,
+							      coredump->snapshot.matched_node);
+				coredump->snapshot.matched_node = new;
+			}
+		}
 
 		break;
 	}
 }
 
 /*
- * xe_guc_capture_free - Cleanup GuC captured register list
+ * xe_guc_capture_put_nodes - Put nodes from outlist
  * @guc: The GuC object
  *
- * Free matched_node and all nodes with the equal guc_id from GuC captured
- * register list
+ * Put all nodes from GuC captured outlist
  */
-void xe_guc_capture_free(struct xe_guc *guc)
+void xe_guc_capture_put_nodes(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
-	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
+	struct __guc_capture_parsed_output *n, *ntmp;
 
-	if (n) {
-		guc_capture_remove_stale_matches_from_list(guc->capture, n);
+	if (!guc->capture)
+		return;
+
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
 		guc_capture_free_outlist_node(guc->capture, n);
 	}
 	devcoredump->snapshot.matched_node = NULL;
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 92ca6ea21906..cfb5ed9b7d8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -51,10 +51,11 @@ const struct __guc_mmio_reg_descr_group *
 xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
 				 enum guc_capture_list_class_type capture_class, bool is_ext);
 struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job);
+void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
+void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_engine_snapshot_capture_for_job(struct xe_sched_job *job);
-void xe_engine_guc_capture_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
 void xe_guc_capture_steered_list_init(struct xe_guc *guc);
-void xe_guc_capture_free(struct xe_guc *guc);
+void xe_guc_capture_put_nodes(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1e7b3bbdd944..8c569167f8e4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -826,117 +826,6 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-static bool
-is_slice_common_per_gslice(struct xe_device *xe)
-{
-	return GRAPHICS_VERx100(xe) >= 1255;
-}
-
-static void
-xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
-				       struct xe_hw_engine_snapshot *snapshot)
-{
-	struct xe_gt *gt = hwe->gt;
-	struct xe_mmio *mmio = &gt->mmio;
-	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int dss;
-	u16 group, instance;
-
-	snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
-
-	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
-
-	if (is_slice_common_per_gslice(xe) == false) {
-		snapshot->reg.instdone.slice_common[0] =
-			xe_mmio_read32(mmio, SC_INSTDONE);
-		snapshot->reg.instdone.slice_common_extra[0] =
-			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA);
-		snapshot->reg.instdone.slice_common_extra2[0] =
-			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA2);
-	} else {
-		for_each_geometry_dss(dss, gt, group, instance) {
-			snapshot->reg.instdone.slice_common[dss] =
-				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
-			snapshot->reg.instdone.slice_common_extra[dss] =
-				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
-			snapshot->reg.instdone.slice_common_extra2[dss] =
-				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
-		}
-	}
-
-	for_each_geometry_dss(dss, gt, group, instance) {
-		snapshot->reg.instdone.sampler[dss] =
-			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
-		snapshot->reg.instdone.row[dss] =
-			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
-
-		if (GRAPHICS_VERx100(xe) >= 1255)
-			snapshot->reg.instdone.geom_svg[dss] =
-				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
-						       group, instance);
-	}
-}
-
-static void
-xe_hw_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
-{
-	u64 val;
-
-	snapshot->reg.ring_execlist_status =
-		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_status |= val << 32;
-
-	snapshot->reg.ring_execlist_sq_contents =
-		xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
-	val = xe_hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents |= val << 32;
-
-	snapshot->reg.ring_acthd = xe_hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	val = xe_hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd |= val << 32;
-
-	snapshot->reg.ring_bbaddr = xe_hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	val = xe_hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr |= val << 32;
-
-	snapshot->reg.ring_dma_fadd =
-		xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	val = xe_hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd |= val << 32;
-
-	snapshot->reg.ring_hwstam = xe_hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = xe_hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
-	snapshot->reg.ring_start = xe_hw_engine_mmio_read32(hwe, RING_START(0));
-	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
-		val = xe_hw_engine_mmio_read32(hwe, RING_START_UDW(0));
-		snapshot->reg.ring_start |= val << 32;
-	}
-	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
-		snapshot->reg.indirect_ring_state =
-			xe_hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
-	}
-
-	snapshot->reg.ring_head =
-		xe_hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
-	snapshot->reg.ring_tail =
-		xe_hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = xe_hw_engine_mmio_read32(hwe, RING_CTL(0));
-	snapshot->reg.ring_mi_mode =
-		xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = xe_hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = xe_hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = xe_hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = xe_hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = xe_hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ipehr = xe_hw_engine_mmio_read32(hwe, RING_IPEHR(0));
-	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
-
-	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(&hwe->gt->mmio, RCU_MODE);
-}
-
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -952,7 +841,6 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job)
 {
 	struct xe_hw_engine_snapshot *snapshot;
-	size_t len;
 	struct __guc_capture_parsed_output *node;
 
 	if (!xe_hw_engine_is_valid(hwe))
@@ -963,28 +851,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
 	if (!snapshot)
 		return NULL;
 
-	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
-	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
-	 * set in struct xe_hw_engine_snapshot, so here doing additional
-	 * allocations.
-	 */
-	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
-	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
-	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
-	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
-	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
-	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
-	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
-	if (!snapshot->reg.instdone.slice_common ||
-	    !snapshot->reg.instdone.slice_common_extra ||
-	    !snapshot->reg.instdone.slice_common_extra2 ||
-	    !snapshot->reg.instdone.sampler ||
-	    !snapshot->reg.instdone.row ||
-	    !snapshot->reg.instdone.geom_svg) {
-		xe_hw_engine_snapshot_free(snapshot);
-		return NULL;
-	}
-
 	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
 	snapshot->hwe = hwe;
 	snapshot->logical_instance = hwe->logical_instance;
@@ -1013,115 +879,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
 	}
 
 	/* otherwise, do manual capture */
-	xe_hw_engine_manual_capture(hwe, snapshot);
+	xe_engine_manual_capture(hwe, snapshot);
 	snapshot->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
 	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
 
 	return snapshot;
 }
 
-static void
-xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
-{
-	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	u16 group, instance;
-	unsigned int dss;
-
-	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
-
-	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
-
-	if (is_slice_common_per_gslice(xe) == false) {
-		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
-			   snapshot->reg.instdone.slice_common[0]);
-		drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
-			   snapshot->reg.instdone.slice_common_extra[0]);
-		drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
-			   snapshot->reg.instdone.slice_common_extra2[0]);
-	} else {
-		for_each_geometry_dss(dss, gt, group, instance) {
-			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
-				   snapshot->reg.instdone.slice_common[dss]);
-			drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
-				   snapshot->reg.instdone.slice_common_extra[dss]);
-			drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
-				   snapshot->reg.instdone.slice_common_extra2[dss]);
-		}
-	}
-
-	for_each_geometry_dss(dss, gt, group, instance) {
-		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
-			   snapshot->reg.instdone.sampler[dss]);
-		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
-			   snapshot->reg.instdone.row[dss]);
-
-		if (GRAPHICS_VERx100(xe) >= 1255)
-			drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
-				   dss, snapshot->reg.instdone.geom_svg[dss]);
-	}
-}
-
-static void __xe_hw_engine_manual_print(struct xe_hw_engine_snapshot *snapshot,
-					struct drm_printer *p)
-{
-	drm_printf(p, "%s (physical), logical instance=%d\n",
-		   snapshot->name ? snapshot->name : "",
-		   snapshot->logical_instance);
-	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		   snapshot->forcewake.domain, snapshot->forcewake.ref);
-	drm_printf(p, "\tReserved: %s\n",
-		   str_yes_no(snapshot->kernel_reserved));
-	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
-	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_status);
-	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_sq_contents);
-	drm_printf(p, "\tRING_START: 0x%016llx\n", snapshot->reg.ring_start);
-	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
-	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
-	drm_printf(p, "\tRING_MI_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
-	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		   snapshot->reg.ring_mode);
-	drm_printf(p, "\tRING_IMR: 0x%08x\n", snapshot->reg.ring_imr);
-	drm_printf(p, "\tRING_ESR: 0x%08x\n", snapshot->reg.ring_esr);
-	drm_printf(p, "\tRING_EMR: 0x%08x\n", snapshot->reg.ring_emr);
-	drm_printf(p, "\tRING_EIR: 0x%08x\n", snapshot->reg.ring_eir);
-	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
-	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
-	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
-	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
-		   snapshot->reg.indirect_ring_state);
-	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
-	xe_hw_engine_snapshot_instdone_print(snapshot, p);
-
-	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			   snapshot->reg.rcu_mode);
-	drm_puts(p, "\n");
-}
-
-/**
- * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
- * @snapshot: Xe HW Engine snapshot object.
- * @p: drm_printer where it will be printed out.
- *
- * This function prints out a given Xe HW Engine snapshot object.
- */
-void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
-				 struct drm_printer *p)
-{
-	if (!snapshot)
-		return;
-
-	if (snapshot->source == XE_ENGINE_CAPTURE_SOURCE_MANUAL)
-		__xe_hw_engine_manual_print(snapshot, p);
-	else
-		xe_engine_guc_capture_print(snapshot, p);
-}
 /**
  * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
  * @snapshot: Xe HW Engine snapshot object.
@@ -1134,12 +898,6 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
 	if (!snapshot)
 		return;
 
-	kfree(snapshot->reg.instdone.slice_common);
-	kfree(snapshot->reg.instdone.slice_common_extra);
-	kfree(snapshot->reg.instdone.slice_common_extra2);
-	kfree(snapshot->reg.instdone.sampler);
-	kfree(snapshot->reg.instdone.row);
-	kfree(snapshot->reg.instdone.geom_svg);
 	kfree(snapshot->name);
 	kfree(snapshot);
 }
@@ -1156,7 +914,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
 	struct xe_hw_engine_snapshot *snapshot;
 
 	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
-	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_engine_snapshot_print(snapshot, p);
 	xe_hw_engine_snapshot_free(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index c2428326a366..da0a6922a26f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -58,8 +58,6 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
-void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
-				 struct drm_printer *p);
 void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 55805c78d9d1..719f27ef00a5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -182,65 +182,6 @@ struct xe_hw_engine_snapshot {
 	u32 mmio_base;
 	/** @kernel_reserved: Engine reserved, can't be used by userspace */
 	bool kernel_reserved;
-	/** @reg: Useful MMIO register snapshot */
-	struct {
-		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
-		u64 ring_execlist_status;
-		/** @reg.ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
-		u64 ring_execlist_sq_contents;
-		/** @reg.ring_acthd: RING_ACTHD */
-		u64 ring_acthd;
-		/** @reg.ring_bbaddr: RING_BBADDR */
-		u64 ring_bbaddr;
-		/** @reg.ring_dma_fadd: RING_DMA_FADD */
-		u64 ring_dma_fadd;
-		/** @reg.ring_hwstam: RING_HWSTAM */
-		u32 ring_hwstam;
-		/** @reg.ring_hws_pga: RING_HWS_PGA */
-		u32 ring_hws_pga;
-		/** @reg.ring_start: RING_START */
-		u64 ring_start;
-		/** @reg.ring_head: RING_HEAD */
-		u32 ring_head;
-		/** @reg.ring_tail: RING_TAIL */
-		u32 ring_tail;
-		/** @reg.ring_ctl: RING_CTL */
-		u32 ring_ctl;
-		/** @reg.ring_mi_mode: RING_MI_MODE */
-		u32 ring_mi_mode;
-		/** @reg.ring_mode: RING_MODE */
-		u32 ring_mode;
-		/** @reg.ring_imr: RING_IMR */
-		u32 ring_imr;
-		/** @reg.ring_esr: RING_ESR */
-		u32 ring_esr;
-		/** @reg.ring_emr: RING_EMR */
-		u32 ring_emr;
-		/** @reg.ring_eir: RING_EIR */
-		u32 ring_eir;
-		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
-		u32 indirect_ring_state;
-		/** @reg.ipehr: IPEHR */
-		u32 ipehr;
-		/** @reg.rcu_mode: RCU_MODE */
-		u32 rcu_mode;
-		struct {
-			/** @reg.instdone.ring: RING_INSTDONE */
-			u32 ring;
-			/** @reg.instdone.slice_common: SC_INSTDONE */
-			u32 *slice_common;
-			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
-			u32 *slice_common_extra;
-			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
-			u32 *slice_common_extra2;
-			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
-			u32 *sampler;
-			/** @reg.instdone.row: ROW_INSTDONE */
-			u32 *row;
-			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
-			u32 *geom_svg;
-		} instdone;
-	} reg;
 };
 
 #endif
-- 
2.34.1

