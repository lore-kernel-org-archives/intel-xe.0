Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FEFC54735
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 21:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FB510E0E0;
	Tue, 27 Aug 2024 21:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLOTAL8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8345010E0E8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 21:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724795250; x=1756331250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UpRHNJ3Co/aMn1tiq393HxO3iBLjOwaOQykewAci7aU=;
 b=HLOTAL8LSOgODAEcZDhD7xr1Pkbjy5cptDqHMDrPpiyZJksSy7enniRZ
 iZi2axbgvm4tzGYdCByR/D4sY74Ni6AwqEMH0DPg8waX6WhfZ7b2ltht1
 +ikH04ofHcrCaVIL0sZNTWoVzF9imJVkv5SMTP+AufX2x6bXgjIs0ZaKx
 9HfUOll3l/lsQVrjufL853abycDuq1MQqGmE/07RZ0xkfqIfR3/oKvail
 3pGtcS1j0LBcihGaJ7JPOyPDz/abkiodxKP5Q146acWXkuIX83sBOZEw4
 t5rlVXcM05AlbGFRQJZgOJtE6sZFLF08NeVmlVMLVPTrXz65HJStiW7c2 A==;
X-CSE-ConnectionGUID: cKCLzdSuRhCR94VR0zro5Q==
X-CSE-MsgGUID: NFnASwVCSP2VI0tKh1C9SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48683914"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="48683914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 14:47:29 -0700
X-CSE-ConnectionGUID: IXuT91WWR3mfvfZtTZyIiw==
X-CSE-MsgGUID: pbbDPXIKSIqHKCZ+/axMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62733196"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 27 Aug 2024 14:47:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v17 7/7] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Tue, 27 Aug 2024 14:47:26 -0700
Message-Id: <20240827214726.1183935-8-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827214726.1183935-1-zhanjun.dong@intel.com>
References: <20240827214726.1183935-1-zhanjun.dong@intel.com>
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

Add pre-capture by read from hw engine if GuC capture data is not ready,
the pre-captured data will be refereshed if GuC capture is ready at later
time.
Provide xe_guc_capture_get_reg_desc_list to get the register dscriptor
list.
GuC support limited register ranges to be captured, add type of direct
read to read these registers by host.
Add function to check if capture is ready for a job.
Print out snapshot registers by types of global, class, instance and
direct read.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |  16 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 380 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_capture.h       |  26 ++
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |  19 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         | 273 ++++------------
 drivers/gpu/drm/xe/xe_hw_engine.h         |   2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  66 +---
 drivers/gpu/drm/xe/xe_lrc.h               |   1 +
 11 files changed, 504 insertions(+), 285 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e11..6a8dee069974 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -605,4 +605,6 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
+#define SFC_DONE(n)				XE_REG(0x1cc000 + (n) * 0x1000)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bdb76e834e4c..783958829750 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -16,6 +16,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
@@ -135,6 +136,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 
 	xe_vm_snapshot_free(ss->vm);
 	ss->vm = NULL;
+
+	xe_guc_capture_free(&ss->gt->uc.guc);
 }
 
 static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
@@ -204,6 +207,7 @@ static void xe_devcoredump_free(void *data)
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
 	coredump->captured = false;
+	coredump->job = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
 		 "Xe device coredump has been deleted.\n");
 }
@@ -214,8 +218,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
 	const char *process_name = "no process";
@@ -231,6 +233,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	strscpy(ss->process_name, process_name);
 
 	ss->gt = q->gt;
+	coredump->job = job;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
 	cookie = dma_fence_begin_signalling();
@@ -252,14 +255,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
 	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
-	for_each_hw_engine(hwe, q->gt, id) {
-		if (hwe->class != q->hwe->class ||
-		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
-			coredump->snapshot.hwe[id] = NULL;
-			continue;
-		}
-		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
-	}
+	xe_hw_engine_snapshot_capture_for_job(job);
 
 	queue_work(system_unbound_wq, &ss->work);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 440d05d77a5a..50165a10abdd 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -69,6 +69,8 @@ struct xe_devcoredump {
 	bool captured;
 	/** @snapshot: Snapshot is captured at time of the first crash */
 	struct xe_devcoredump_snapshot snapshot;
+	/** @job: Point to the issue job */
+	struct xe_sched_job *job;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 20b38d60dca7..16f660db3231 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -27,11 +27,16 @@
 #include "xe_guc_capture.h"
 #include "xe_guc_capture_types.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_guc_log.h"
+#include "xe_guc_submit_types.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine_types.h"
+#include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_mmio.h"
+#include "xe_sched_job.h"
 
 /*
  * struct __guc_capture_bufstate
@@ -69,11 +74,13 @@ struct __guc_capture_parsed_output {
 	u32 eng_inst;
 	u32 guc_id;
 	u32 lrca;
+	u32 type;
+	enum xe_hw_engine_snapshot_source_id source;
 	struct gcap_reg_list_info {
 		u32 vfid;
 		u32 num_regs;
 		struct guc_mmio_reg *regs;
-	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
+	} reginfo[GUC_HOST_CAPTURE_TYPE_MAX];
 #define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
 #define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
 };
@@ -133,6 +140,17 @@ struct __guc_capture_parsed_output {
 	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
 	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}
 
+/*
+ * GuC support limited registers ranges to be captured for debug
+ * purpose, for registers out of these ranges, direct read is the only
+ * way to access.
+ */
+#define XELP_VEC_DIRECT_READ \
+	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
+	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
+	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
+	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}
+
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
 	COMMON_XELP_BASE_GLOBAL,
@@ -164,6 +182,11 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* Video Enhancement direct read registers */
+static const struct __guc_mmio_reg_descr xe_vec_direct_read_regs[] = {
+	XELP_VEC_DIRECT_READ,
+};
+
 /* Blitter Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
@@ -201,6 +224,8 @@ static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
 	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(xe_vec_direct_read_regs, PF, HOST_DIRECT_READ,
+		     GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
@@ -217,6 +242,8 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
 	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(xe_vec_direct_read_regs, PF, HOST_DIRECT_READ,
+		     GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
@@ -292,6 +319,23 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
+				 enum guc_capture_list_class_type capture_class)
+{
+	return guc_capture_get_one_list(guc_capture_get_device_reglist(gt_to_xe(gt)), owner, type,
+					capture_class);
+}
+
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_ext_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
+				     enum guc_capture_list_class_type capture_class)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+
+	return guc_capture_get_one_list(guc->capture->extlists, owner, type, capture_class);
+}
+
 struct __ext_steer_reg {
 	const char *name;
 	struct xe_reg_mcr reg;
@@ -810,16 +854,16 @@ guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
 static void
 guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
 {
-	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
+	struct guc_mmio_reg *tmp[GUC_HOST_CAPTURE_TYPE_MAX];
 	int i;
 
-	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+	for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i) {
 		tmp[i] = node->reginfo[i].regs;
 		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
 		       guc->capture->max_mmio_per_node);
 	}
 	memset(node, 0, sizeof(*node));
-	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i)
+	for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i)
 		node->reginfo[i].regs = tmp[i];
 
 	INIT_LIST_HEAD(&node->link);
@@ -864,6 +908,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
  *                   L--> xe_devcoredump
  *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
  *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
+ *                               --> xe_guc_capture_node_from_hw(..If no GUC CAPTURE)
  *
  * User Sysfs / Debugfs
  * --------------------
@@ -1197,6 +1242,8 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
 		}
 		node->is_partial = is_partial;
 		node->reginfo[datatype].vfid = FIELD_GET(GUC_STATE_CAPTURE_HEADER_VFID, hdr.owner);
+		node->source = XE_HW_ENGINE_SOURCE_GUC_CAPTURE;
+		node->type = datatype;
 
 		switch (datatype) {
 		case GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE:
@@ -1363,7 +1410,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
 	if (!new)
 		return NULL;
 
-	for (i = 0; i < GUC_STATE_CAPTURE_TYPE_MAX; ++i) {
+	for (i = 0; i < GUC_HOST_CAPTURE_TYPE_MAX; ++i) {
 		new->reginfo[i].regs = drmm_kzalloc(drm, guc->capture->max_mmio_per_node *
 					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
 		if (!new->reginfo[i].regs) {
@@ -1401,7 +1448,7 @@ guc_get_max_reglist_count(struct xe_guc *guc)
 	int i, j, k, tmp, maxregcount = 0;
 
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
-		for (j = 0; j < GUC_STATE_CAPTURE_TYPE_MAX; ++j) {
+		for (j = 0; j < GUC_HOST_CAPTURE_TYPE_MAX; ++j) {
 			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
 				if (j == GUC_STATE_CAPTURE_TYPE_GLOBAL && k > 0)
 					continue;
@@ -1429,6 +1476,327 @@ guc_capture_create_prealloc_nodes(struct xe_guc *guc)
 	__guc_capture_create_prealloc_nodes(guc);
 }
 
+static void
+read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_group *list,
+		 struct __guc_capture_parsed_output *node)
+{
+	struct gcap_reg_list_info *reginfo = &node->reginfo[list->type];
+	struct guc_mmio_reg *regs = reginfo->regs;
+	int i;
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
+		value = (list->type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE) ?
+			xe_hw_engine_mmio_read32(hwe, desc.reg) :
+			xe_mmio_read32(hwe->gt, desc.reg);
+
+		regs[i].value = value;
+		regs[i].offset = desc.reg.addr;
+		regs[i].flags = desc.flags;
+		regs[i].mask = desc.mask;
+	}
+}
+
+/**
+ * xe_guc_capture_node_from_hw - Take a engine snapshot from GuC capture.
+ * @hwe: Xe HW Engine.
+ * @type: GuC capture register type
+ * @list: The register list
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void xe_guc_capture_node_from_hw(struct xe_hw_engine *hwe, u32 type,
+				 const struct __guc_mmio_reg_descr_group *list)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_devcoredump *devcoredump = &xe->devcoredump;
+	struct __guc_capture_parsed_output *new = NULL;
+	struct gcap_reg_list_info *reginfo;
+	u16 guc_id = 0;
+	u32 lrca = 0;
+
+	if (!list || list->num_regs == 0)
+		return;
+	XE_WARN_ON(list->num_regs > guc->capture->max_mmio_per_node);
+
+	new = guc_capture_get_prealloc_node(guc);
+	if (!new)
+		return;
+
+	new->is_partial = false;
+	reginfo = &new->reginfo[type];
+
+	read_reg_to_node(hwe, list, new);
+
+	reginfo->num_regs = list->num_regs;
+
+	if (devcoredump->captured) {
+		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
+
+		guc_id = ge->guc.id;
+		lrca = ge->lrc[0]->context_desc & LRC_GTT_ADDRESS_MASK;
+	}
+
+	new->eng_class = hwe->class;
+	new->eng_inst = hwe->instance;
+	new->guc_id = guc_id;
+	new->lrca = lrca;
+	new->source = XE_HW_ENGINE_SOURCE_HW_ENGINE;
+	new->type = type;
+	guc_capture_add_node_to_outlist(guc->capture, new);
+}
+
+static struct guc_mmio_reg *
+guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
+{
+	int i;
+
+	if (reginfo && reginfo->num_regs > 0) {
+		struct guc_mmio_reg *regs = reginfo->regs;
+
+		if (regs)
+			for (i = 0; i < reginfo->num_regs; i++)
+				if (regs[i].offset == addr && regs[i].flags == flags)
+					return &regs[i];
+	}
+
+	return NULL;
+}
+
+static void
+snapshot_print_by_list(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p, u32 type,
+		       const struct __guc_mmio_reg_descr_group *list)
+{
+	struct xe_gt *gt = snapshot->hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_devcoredump *devcoredump = &xe->devcoredump;
+	u16 guc_id = 0;
+	u32 last_value, lrca = 0;
+	struct list_head *node;
+	int i, guc_class;
+	bool is_ext;
+
+	if (!list)
+		return;
+
+	is_ext = list == guc->capture->extlists;
+
+	if (devcoredump->captured) {
+		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
+
+		guc_id = ge->guc.id;
+		lrca =  ge->lrc[0]->context_desc;
+	}
+
+	guc_class = xe_engine_class_to_guc_class(snapshot->hwe->class);
+
+	node = &guc->capture->outlist;
+	for (i = 0; i < list->num_regs; i++) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+		const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
+
+		list_for_each_entry_safe(n, ntmp, node, link) {
+			if (n->eng_class == guc_class && n->eng_inst == snapshot->hwe->instance &&
+			    n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca) {
+				struct gcap_reg_list_info *reginfo = &n->reginfo[type];
+				struct guc_mmio_reg *reg;
+				u32 value;
+
+				reg = guc_capture_find_reg(reginfo, sub_list->reg.addr,
+							   sub_list->flags);
+				if (!reg)
+					continue;
+
+				value = reg->value;
+				if (sub_list->data_type == REG_64BIT_LOW_DW) {
+					last_value = value;
+					continue;
+				} else if (sub_list->data_type == REG_64BIT_HI_DW) {
+					u64 value_qw = ((u64)value << 32) | last_value;
+
+					if (sub_list->regname)
+						drm_printf(p, "\t%s: 0x%016llx\n",
+							   sub_list->regname, value_qw);
+					break;
+				}
+
+				if (!sub_list->regname)
+					break;
+
+				if (is_ext) {
+					int dss, group, instance;
+
+					group = FIELD_GET(GUC_REGSET_STEERING_GROUP,
+							  sub_list->flags);
+					instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE,
+							     sub_list->flags);
+					dss = xe_gt_mcr_steering_info_to_dss_id(gt,
+										group, instance);
+
+					drm_printf(p, "\t%s[%u]: 0x%08x\n", sub_list->regname, dss,
+						   value);
+				} else {
+					drm_printf(p, "\t%s: 0x%08x\n", sub_list->regname,
+						   value);
+				}
+				break;
+			}
+		}
+	}
+}
+
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p)
+{
+	int type;
+	const struct __guc_mmio_reg_descr_group *list;
+	enum guc_capture_list_class_type capture_class;
+
+	if (!snapshot)
+		return;
+
+	xe_gt_assert(snapshot->hwe->gt, snapshot->source <= XE_HW_ENGINE_SOURCE_GUC_CAPTURE);
+	xe_gt_assert(snapshot->hwe->gt, snapshot->hwe);
+
+	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
+
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
+	drm_printf(p, "\tCapture source: %s\n",
+		   snapshot->source == XE_HW_ENGINE_SOURCE_GUC_CAPTURE ? "GuC" : "Engine");
+	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_HOST_CAPTURE_TYPE_MAX; type++) {
+		list = xe_guc_capture_get_reg_desc_list(snapshot->hwe->gt,
+							GUC_CAPTURE_LIST_INDEX_PF, type,
+							capture_class);
+		snapshot_print_by_list(snapshot, p, type, list);
+	}
+
+	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+		list = xe_guc_capture_get_ext_reg_desc_list(snapshot->hwe->gt,
+							    GUC_CAPTURE_LIST_INDEX_PF,
+							    GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
+							    capture_class);
+		snapshot_print_by_list(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS, list);
+	}
+
+	drm_puts(p, "\n");
+}
+
+/**
+ * xe_guc_capture_is_ready_for - Check if capture is ready for the job.
+ * @job: The job object.
+ *
+ * Search within the capture outlist for the job.
+ *
+ * Returns: True if found a node for the job
+ */
+bool xe_guc_capture_is_ready_for(struct xe_sched_job *job)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_exec_queue *q = job->q;
+	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
+
+	if (!q || !q->gt)
+		return false;
+
+	/* Find hwe for the job */
+	for_each_hw_engine(hwe, q->gt, id) {
+		if (hwe != q->hwe)
+			continue;
+		guc_class = xe_engine_class_to_guc_class(hwe->class);
+		break;
+	}
+
+	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+		struct xe_guc *guc =  &q->gt->uc.guc;
+		struct list_head *list = &guc->capture->outlist;
+		u16 guc_id = q->guc->id;
+		u32 lrca = xe_lrc_ggtt_addr(job->q->lrc[0]) & LRC_GTT_ADDRESS_MASK;
+
+		/*
+		 * Look for a matching GuC reported error capture node from
+		 * the internal output link-list based on engine, guc id and
+		 * lrca info.
+		 */
+		list_for_each_entry_safe(n, ntmp, list, link) {
+			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
+			    n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca &&
+			    n->source == XE_HW_ENGINE_SOURCE_GUC_CAPTURE)
+				return true;
+		}
+	}
+	return false;
+}
+
+/*
+ * xe_guc_capture_free_pre_capture - Free the pre captured register list
+ * @guc: The GuC object
+ *
+ * Free the pre captured register list
+ */
+void xe_guc_capture_free_pre_capture(struct xe_guc *guc)
+{
+	if (guc->capture && !list_empty(&guc->capture->outlist)) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			if (n->source == XE_HW_ENGINE_SOURCE_HW_ENGINE &&
+			    /* Direct read is for host only, no need to refresh */
+			    n->type != GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ) {
+				list_del(&n->link);
+				/* put node back to cache list */
+				guc_capture_add_node_to_cachelist(guc->capture, n);
+			}
+		}
+	}
+}
+
+/*
+ * xe_guc_capture_free - Free the GuC captured register list
+ * @guc: The GuC object
+ *
+ * Free the GuC captured register list
+ */
+void xe_guc_capture_free(struct xe_guc *guc)
+{
+	if (guc->capture && !list_empty(&guc->capture->outlist)) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			list_del(&n->link);
+			/* put node back to cache list */
+			guc_capture_add_node_to_cachelist(guc->capture, n);
+		}
+	}
+}
+
 /*
  * xe_guc_capture_steered_list_init - Init steering register list
  * @guc: The GuC object
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 3a690e8b714a..bcda17ef9eb9 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -12,6 +12,21 @@
 #include "xe_guc_fwif.h"
 
 struct xe_guc;
+struct xe_hw_engine;
+struct xe_hw_engine_snapshot;
+struct xe_sched_job;
+
+/* Register-types of GuC capture register lists for host side process */
+enum guc_capture_host_type {
+	/*
+	 * GuC support limited registers ranges to be captured for debug
+	 * purpose, for registers out of these ranges, direct read is the only
+	 * way to access.
+	 */
+	GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ = GUC_STATE_CAPTURE_TYPE_MAX,
+};
+
+#define GUC_HOST_CAPTURE_TYPE_MAX	(GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ + 1)
 
 static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
 {
@@ -44,6 +59,17 @@ int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
 			       enum guc_capture_list_class_type capture_class, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
 size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
+				 enum guc_capture_list_class_type capture_class);
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_ext_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
+				     enum guc_capture_list_class_type capture_class);
+bool xe_guc_capture_is_ready_for(struct xe_sched_job *job);
+void xe_guc_capture_node_from_hw(struct xe_hw_engine *hwe, u32 type,
+				 const struct __guc_mmio_reg_descr_group *list);
+void xe_guc_capture_free_pre_capture(struct xe_guc *guc);
+void xe_guc_capture_free(struct xe_guc *guc);
 int xe_guc_capture_steered_list_init(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 2057125b1bfa..857ad10bb8f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -41,6 +41,8 @@ struct __guc_mmio_reg_descr {
 	u32 mask;
 	/** @regname: Name of the register */
 	const char *regname;
+	/** @position_in_snapshot: The offset position in snapshot structure */
+	u32 position_in_snapshot;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 381be84740cf..44353e323f24 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1073,6 +1073,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
+	struct xe_device *xe = guc_to_xe(guc);
 	int err = -ETIME;
 	pid_t pid = -1;
 	int i = 0;
@@ -1100,6 +1101,18 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!skip_timeout_check && !xe_sched_job_started(job))
 		goto rearm;
 
+	/* Pre-capture register snapshot, if devcoredump not captured and GuC capture not ready */
+	if (!exec_queue_killed(q) && !xe->devcoredump.captured && xe_device_uc_enabled(xe) &&
+	    xe->wedged.mode >= 1 && !xe_guc_capture_is_ready_for(job)) {
+		/* take force wake before engine register pre-capture */
+		if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
+			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
+
+		xe_hw_engine_snapshot_capture_for_job(job);
+
+		xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	}
+
 	/*
 	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
 	 * modify scheduling state to read timestamp. We could read the
@@ -1182,7 +1195,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(job);
+		xe_devcoredump(job); /* pre-captured data will be refreshed by GuC capture */
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
@@ -1979,8 +1992,6 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
-	/* FIXME: Do error capture, most likely async */
-
 	trace_xe_exec_queue_reset(q);
 
 	/*
@@ -2006,7 +2017,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
  * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
  * called 1st to check status before process the data comes with the message.
  *
- * Returns: None
+ * Returns: error code. 0 if success
  */
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 18980238a2ea..ad3a108a2491 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -23,6 +23,8 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_types.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -312,6 +314,7 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
+
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	reg.addr += hwe->mmio_base;
@@ -809,54 +812,26 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-static bool
-is_slice_common_per_gslice(struct xe_device *xe)
-{
-	return GRAPHICS_VERx100(xe) >= 1255;
-}
-
 static void
-xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
-				       struct xe_hw_engine_snapshot *snapshot)
+xe_hw_engine_snapshot_from_hw(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot,
+			      u32 type)
 {
 	struct xe_gt *gt = hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int dss;
-	u16 group, instance;
-
-	snapshot->reg.instdone.ring = xe_hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
+	enum guc_capture_list_class_type capture_class;
+	const struct __guc_mmio_reg_descr_group *list;
 
-	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
+	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
 
-	if (is_slice_common_per_gslice(xe) == false) {
-		snapshot->reg.instdone.slice_common[0] =
-			xe_mmio_read32(gt, SC_INSTDONE);
-		snapshot->reg.instdone.slice_common_extra[0] =
-			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
-		snapshot->reg.instdone.slice_common_extra2[0] =
-			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
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
+	/* Get register list for the type/class */
+	list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type, capture_class);
 
-	for_each_geometry_dss(dss, gt, group, instance) {
-		snapshot->reg.instdone.sampler[dss] =
-			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
-		snapshot->reg.instdone.row[dss] =
-			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
+	xe_guc_capture_node_from_hw(hwe, type, list);
 
-		if (GRAPHICS_VERx100(xe) >= 1255)
-			snapshot->reg.instdone.geom_svg[dss] =
-				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
-						       group, instance);
+	/* Capture steering registers for rcs/ccs */
+	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
+		list = xe_guc_capture_get_ext_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
+							    capture_class);
+		xe_guc_capture_node_from_hw(hwe, type, list);
 	}
 }
 
@@ -874,8 +849,9 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
-	size_t len;
-	u64 val;
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 type;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -885,28 +861,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
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
@@ -916,156 +870,69 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->mmio_base = hwe->mmio_base;
 
 	/* no more VF accessible data below this point */
-	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+	if (IS_SRIOV_VF(xe))
 		return snapshot;
 
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
+	/* If GuC not enabled, and capture outlist has no job data, take it from engine */
+	if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 && xe->devcoredump.job &&
+	    xe_guc_capture_is_ready_for(xe->devcoredump.job)) {
+		snapshot->source = XE_HW_ENGINE_SOURCE_GUC_CAPTURE;
+		/* GuC won't report direct read registers, read here */
+		xe_hw_engine_snapshot_from_hw(hwe, snapshot,
+					      GUC_STATE_CAPTURE_TYPE_HOST_DIRECT_READ);
+	} else {
+		snapshot->source = XE_HW_ENGINE_SOURCE_HW_ENGINE;
+		for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_HOST_CAPTURE_TYPE_MAX;
+		     type++)
+			xe_hw_engine_snapshot_from_hw(hwe, snapshot, type);
 	}
 
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
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
-
 	return snapshot;
 }
 
-static void
-xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture_for_job - Take snapshot of associated engine
+ * @job: The job object
+ *
+ * Take snapshot of associated HW Engine
+ *
+ * Returns: None.
+ */
+void
+xe_hw_engine_snapshot_capture_for_job(struct xe_sched_job *job)
 {
-	struct xe_gt *gt = snapshot->hwe->gt;
-	struct xe_device *xe = gt_to_xe(gt);
-	u16 group, instance;
-	unsigned int dss;
-
-	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = q->logical_mask;
 
-	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
-		return;
+	for_each_hw_engine(hwe, q->gt, id) {
+		if (hwe->class != q->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask))
+			continue;
 
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
+		if (!coredump->snapshot.hwe[id]) {
+			coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+		} else {
+			/* If pre-captured and Guc capture ready now */
+			if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 &&
+			    xe_guc_capture_is_ready_for(job)) {
+				/*
+				 * Remove the pre-captured nodes from outlist,
+				 * only keep the GuC reported data.
+				 * Except direct read registers, which is read
+				 * by host only.
+				 */
+				xe_guc_capture_free_pre_capture(&q->gt->uc.guc);
+			}
 		}
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
+		break;
 	}
 }
 
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
 
-	drm_printf(p, "%s (physical), logical instance=%d\n",
-		   snapshot->name ? snapshot->name : "",
-		   snapshot->logical_instance);
-	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		   snapshot->forcewake.domain, snapshot->forcewake.ref);
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
 
 /**
  * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
@@ -1079,12 +946,6 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 022819a4a8eb..1df6a082487c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -11,6 +11,7 @@
 struct drm_printer;
 struct drm_xe_engine_class_instance;
 struct xe_device;
+struct xe_sched_job;
 
 #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
 #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
@@ -57,6 +58,7 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 
 struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_capture_for_job(struct xe_sched_job *job);
 void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
 void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 				 struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 39f24012d0f4..4e3e9ddf5f5a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -154,6 +154,11 @@ struct xe_hw_engine {
 	struct xe_hw_engine_group *hw_engine_group;
 };
 
+enum xe_hw_engine_snapshot_source_id {
+	XE_HW_ENGINE_SOURCE_HW_ENGINE,
+	XE_HW_ENGINE_SOURCE_GUC_CAPTURE
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -162,6 +167,8 @@ struct xe_hw_engine {
 struct xe_hw_engine_snapshot {
 	/** @name: name of the hw engine */
 	char *name;
+	/** @source: Data source, either hw_engine or GuC capture */
+	enum xe_hw_engine_snapshot_source_id source;
 	/** @hwe: hw engine */
 	struct xe_hw_engine *hwe;
 	/** @logical_instance: logical instance of this hw engine */
@@ -175,65 +182,6 @@ struct xe_hw_engine_snapshot {
 	} forcewake;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
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
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..cc00fa878d3c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -21,6 +21,7 @@ struct xe_lrc_snapshot;
 struct xe_vm;
 
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
+#define LRC_GTT_ADDRESS_MASK	GENMASK(31, 12)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size);
-- 
2.34.1

