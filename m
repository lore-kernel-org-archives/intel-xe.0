Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CB3C52D73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 14:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEC610E39D;
	Tue,  6 Aug 2024 14:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsVOXwjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A05410E39D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722956228; x=1754492228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Y7a25hvNhOwsiLjHnEEV1wdiRt4NazjJ/RmnT3LDv4=;
 b=NsVOXwjHGdV2LogJ6MebhPV18c/mRECI+mGT/AuSOqKz0FfiuX8Kwfm9
 LebFWRv4z7dM8zhnsG8Uuf5YdXDDQMsz2lAiupQ8pXAx5i371EiAWBn7k
 8KnbVj30M6QzkjAo6fgbff9CTv6ksz0u+H1kHaTuO4sHiCmcfOwUEWKu8
 kBeE8Fq7I8jWnIP6Lj7C/th+nrZvcEFzK1otoFpPDr24ruzszaP36gYcw
 2vwfVyI7HfwUEmQBe+vxCzuM6g4ksR1h6TnrCTRwx4U4hw9nl7k31tyK1
 msYy6cPCXowur38dxegmaS8CgS29vrlzEUQpXRrNCSIYhEwAuT1ZY3iMi w==;
X-CSE-ConnectionGUID: TtvfkGsdQqe6ZiLLEh3HbA==
X-CSE-MsgGUID: h6xE8y0bRGONK9ZdlrLmrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21129798"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="21129798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:57:07 -0700
X-CSE-ConnectionGUID: sGl1ZeWCTy6aK7ixE+Rcyw==
X-CSE-MsgGUID: LO3AS/2FQs6+yXRwJdmxAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56509237"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2024 07:57:06 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v15 5/5] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Tue,  6 Aug 2024 07:57:04 -0700
Message-Id: <20240806145704.165231-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806145704.165231-1-zhanjun.dong@intel.com>
References: <20240806145704.165231-1-zhanjun.dong@intel.com>
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

Add xe_hw_engine_snapshot_from_capture to take snapshot from captured
node list.
Add pre-capture by read from hw engine if GuC capture data is not ready,
the pre-captured data will be refereshed if GuC capture is ready at later
time.
Add data struct to map captured register value to a snapshot field.
Add register name to register list.
Provide xe_guc_capture_get_reg_desc_list to get the register dscriptor
list.
Add function to check if capture is ready for a job.
Sort out snapshot registers into types of global, class, instance and
direct read.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |   2 +
 drivers/gpu/drm/xe/xe_devcoredump.c       |  16 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_capture.c       | 273 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_capture.h       |  19 ++
 drivers/gpu/drm/xe/xe_guc_capture_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |  20 +-
 drivers/gpu/drm/xe/xe_hw_engine.c         | 240 +++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h         |   2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h   | 180 +++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h               |   1 +
 11 files changed, 588 insertions(+), 169 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 3b87f95f9ecf..90884e45c5a8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -597,4 +597,6 @@
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
index 8f971e47933a..48be18da4a3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -27,11 +27,15 @@
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
+#include "xe_sched_job.h"
 
 /*
  * struct __guc_capture_bufstate
@@ -84,28 +88,85 @@ struct __guc_capture_parsed_output {
  *       from the engine-mmio-base
  */
 #define COMMON_XELP_BASE_GLOBAL \
-	{ FORCEWAKE_GT,		    0,      0}
+	{ FORCEWAKE_GT,				0,	0, "FORCEWAKE_GT",\
+	  offsetof(struct snapshot_regs, forcewake_gt)	}
 
 #define COMMON_BASE_ENGINE_INSTANCE \
-	{ RING_ESR(0),              0,      0}, \
-	{ RING_EMR(0),              0,      0}, \
-	{ RING_EIR(0),              0,      0}, \
-	{ RING_EXECLIST_STATUS_HI(0), 0,    0}, \
-	{ RING_EXECLIST_STATUS_LO(0), 0,    0}, \
-	{ RING_DMA_FADD(0),         0,      0}, \
-	{ RING_DMA_FADD_UDW(0),     0,      0}, \
-	{ RING_IPEHR(0),            0,      0}, \
-	{ RING_BBADDR(0),           0,      0}, \
-	{ RING_BBADDR_UDW(0),       0,      0}, \
-	{ RING_ACTHD(0),            0,      0}, \
-	{ RING_ACTHD_UDW(0),        0,      0}, \
-	{ RING_START(0),            0,      0}, \
-	{ RING_HEAD(0),             0,      0}, \
-	{ RING_TAIL(0),             0,      0}, \
-	{ RING_CTL(0),              0,      0}, \
-	{ RING_MI_MODE(0),          0,      0}, \
-	{ RING_HWS_PGA(0),          0,      0}, \
-	{ RING_MODE(0),             0,      0}
+	{ RING_HWSTAM(0),			0,	0, "HWSTAM",\
+	  offsetof(struct snapshot_regs, ring_hwstam)	}, \
+	{ RING_HWS_PGA(0),			0,	0, "RING_HWS_PGA",\
+	  offsetof(struct snapshot_regs, ring_hws_pga)	}, \
+	{ RING_HEAD(0),				0,	0, "RING_HEAD",\
+	  offsetof(struct snapshot_regs, ring_head)	}, \
+	{ RING_TAIL(0),				0,	0, "RING_TAIL",\
+	  offsetof(struct snapshot_regs, ring_tail)	}, \
+	{ RING_CTL(0),				0,	0, "RING_CTL",\
+	  offsetof(struct snapshot_regs, ring_ctl)	}, \
+	{ RING_MI_MODE(0),			0,	0, "RING_MI_MODE",\
+	  offsetof(struct snapshot_regs, ring_mi_mode)	}, \
+	{ RING_MODE(0),				0,	0, "RING_MODE",\
+	  offsetof(struct snapshot_regs, ring_mode)	}, \
+	{ RING_ESR(0),				0,	0, "RING_ESR",\
+	  offsetof(struct snapshot_regs, ring_esr)	}, \
+	{ RING_EMR(0),				0,	0, "RING_EMR",\
+	  offsetof(struct snapshot_regs, ring_emr)	}, \
+	{ RING_EIR(0),				0,	0, "RING_EIR",\
+	  offsetof(struct snapshot_regs, ring_eir)	}, \
+	{ RING_IMR(0),				0,	0, "RING_IMR",\
+	  offsetof(struct snapshot_regs, ring_imr)	}, \
+	{ RING_IPEHR(0),			0,	0, "IPEHR",\
+	  offsetof(struct snapshot_regs, ipehr)		}, \
+	/* 64 bit register - Start */			   \
+	{ RING_ACTHD(0),			0,	0, "ACTHD",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_acthd)	}, \
+	{ RING_ACTHD_UDW(0),			0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_acthd) + 4}, \
+	{ RING_BBADDR(0),			0,	0, "RING_BBADDR",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_bbaddr)	}, \
+	{ RING_BBADDR_UDW(0),			0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_bbaddr) + 4}, \
+	{ RING_START(0),			0,	0, "RING_START",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_start)	}, \
+	{ RING_START_UDW(0),			0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_start) + 4}, \
+	{ RING_DMA_FADD(0),			0,	0, "RING_DMA_FADD",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_dma_fadd)	}, \
+	{ RING_DMA_FADD_UDW(0),			0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_dma_fadd) + 4}, \
+	{ RING_EXECLIST_STATUS_LO(0),		0,	0, "RING_EXECLIST_STATUS",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_execlist_status)}, \
+	{ RING_EXECLIST_STATUS_HI(0),		0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_execlist_status) + 4}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0),	0,	0, "RING_EXECLIST_SQ_CONTENTS",\
+	  offsetof(struct snapshot_regs, u64_regs.ring_execlist_sq_contents)}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0),	0,	0, NULL,\
+	  offsetof(struct snapshot_regs, u64_regs.ring_execlist_sq_contents) + 4}, \
+	/* 64 bit register - End */			   \
+	/* Extra handling registers */			   \
+	{ INDIRECT_RING_STATE(0),		0,	0, "INDIRECT_RING_STATE",\
+	  offsetof(struct snapshot_regs, extra_op.indirect_ring_state)}
+	/*
+	 * GuC support limited registers ranges to be captured for debug
+	 * purpose, for registers out of these ranges, direct read is the only
+	 * way to access.
+	 * For registers requires extra condition check, add into this list.
+	 * GuC based register capture process will ignore list of DIRECT_READ
+	 * type.
+	 */
+
+#define COMMON_XELP_RC_CLASS \
+	{ RCU_MODE,				0,	0, "RCU_MODE",\
+	  offsetof(struct snapshot_regs, rcu_mode)	}
+
+#define XELP_DIRECT_READ_VEC \
+	{ SFC_DONE(0),				0,	0, "SFC_DONE[0]", \
+	  offsetof(struct snapshot_regs, sfc_done_0)	}, \
+	{ SFC_DONE(1),				0,	0, "SFC_DONE[1]", \
+	  offsetof(struct snapshot_regs, sfc_done_1)	}, \
+	{ SFC_DONE(2),				0,	0, "SFC_DONE[2]", \
+	  offsetof(struct snapshot_regs, sfc_done_2)	}, \
+	{ SFC_DONE(3),				0,	0, "SFC_DONE[3]", \
+	  offsetof(struct snapshot_regs, sfc_done_3)	}
 
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
@@ -117,6 +178,11 @@ static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_rc_class_regs[] = {
+	COMMON_XELP_RC_CLASS,
+};
+
 /* Media Decode/Encode Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_vd_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
@@ -127,6 +193,11 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
 };
 
+/* Video Enhancement Per-Engine-Class */
+static const struct __guc_mmio_reg_descr xe_vec_direct_read_regs[] = {
+	XELP_DIRECT_READ_VEC,
+};
+
 /* Blitter Per-Engine-Instance */
 static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] = {
 	COMMON_BASE_ENGINE_INSTANCE,
@@ -159,12 +230,13 @@ static const struct __guc_mmio_reg_descr empty_regs_list[] = {
 /* List of lists */
 static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
 	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
-	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(xe_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
 	MAKE_REGLIST(xe_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
 	MAKE_REGLIST(xe_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(xe_vec_direct_read_regs, PF, DIRECT_READ, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
 	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
@@ -233,6 +305,13 @@ guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
 	return NULL;
 }
 
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_reg_desc_list(u32 owner, u32 type,
+				 enum guc_capture_list_class_type capture_class)
+{
+	return guc_capture_get_one_list(xe_lp_lists, owner, type, capture_class);
+}
+
 static struct __guc_mmio_reg_descr_group *
 guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
 			     u32 owner, u32 type, u32 id)
@@ -1376,6 +1455,158 @@ guc_capture_create_prealloc_nodes(struct xe_guc *guc)
 	__guc_capture_create_prealloc_nodes(guc);
 }
 
+static void
+cp_reg_to_snapshot(int type, const struct __guc_mmio_reg_descr_group *list, u32 offset, u32 value,
+		   struct snapshot_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < list->num_regs; i++) {
+		const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
+
+		if (offset == sub_list->reg.addr) {
+			u32 *field = (u32 *)((uintptr_t)regs + sub_list->position_in_snapshot);
+			*field = value;
+			return;
+		}
+	}
+}
+
+static void
+guc_capture_find_ecode(struct __guc_capture_parsed_output *node,
+		       struct xe_hw_engine_snapshot *snapshot,
+		       enum guc_capture_list_class_type capture_class)
+{
+	int i, type;
+
+	if (!node)
+		return;
+
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
+		struct gcap_reg_list_info *reginfo = &node->reginfo[type];
+		struct guc_mmio_reg *regs = reginfo->regs;
+		const struct __guc_mmio_reg_descr_group *list;
+
+		/* Get register list for the type/class */
+		list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF,
+							type, capture_class);
+		if (!list)
+			return;
+
+		for (i = 0; i < reginfo->num_regs; i++)
+			cp_reg_to_snapshot(type, list, regs[i].offset, regs[i].value,
+					   &snapshot->reg);
+	}
+}
+
+/**
+ * xe_hw_engine_snapshot_from_capture - Take a engine snapshot from GuC capture.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Xe HW Engine snapshot object to save data, copied from error capture
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct __guc_capture_parsed_output *n, *ntmp;
+	struct xe_devcoredump *devcoredump = &xe->devcoredump;
+	struct list_head *list = &guc->capture->outlist;
+	struct xe_sched_job *job = devcoredump->job;
+	struct xe_exec_queue *q = job->q;
+	u16 guc_id = q->guc->id;
+	u32 lrca;
+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+	snapshot->source = XE_HW_ENGINE_SOURCE_GUC_CAPTURE;
+	lrca = xe_lrc_ggtt_addr(job->q->lrc[0]) & LRC_GTT_ADDRESS_MASK;
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on engine class and instance.
+	 */
+	list_for_each_entry_safe(n, ntmp, list, link) {
+		if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
+		    n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca) {
+			enum guc_capture_list_class_type capture_class;
+
+			capture_class = xe_guc_class_to_capture_class(guc_class);
+			guc_capture_find_ecode(n, snapshot, capture_class);
+			list_del(&n->link);
+			return;
+		}
+	}
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
+			    n->guc_id == guc_id && (n->lrca & LRC_GTT_ADDRESS_MASK) == lrca)
+				return true;
+		}
+	}
+	return false;
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
  * xe_guc_capture_init - Init for GuC register capture
  * @guc: The GuC object
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 6bfa6ed73587..0cb6861443ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -12,6 +12,18 @@
 #include "xe_guc_fwif.h"
 
 struct xe_guc;
+struct xe_hw_engine;
+struct xe_hw_engine_snapshot;
+struct xe_sched_job;
+
+/*
+ * GuC support limited registers ranges to be captured for debug
+ * purpose, for registers out of these ranges, direct read is the only
+ * way to access.
+ * GuC based register capture process will ignore list of DIRECT_READ
+ * type.
+ */
+#define GUC_STATE_CAPTURE_TYPE_DIRECT_READ GUC_STATE_CAPTURE_TYPE_MAX
 
 static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
 {
@@ -44,6 +56,13 @@ int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
 			       enum guc_capture_list_class_type capture_class, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
 size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
+const struct __guc_mmio_reg_descr_group *
+xe_guc_capture_get_reg_desc_list(u32 owner, u32 type,
+				 enum guc_capture_list_class_type capture_class);
+void xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe,
+					struct xe_hw_engine_snapshot *snapshot);
+bool xe_guc_capture_is_ready_for(struct xe_sched_job *job);
+void xe_guc_capture_free(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
index 63cb4d7cf518..337dd4933124 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
@@ -28,6 +28,8 @@ struct __guc_mmio_reg_descr {
 	u32 mask;
 	/** @regname: Name of the register */
 	const char *regname;
+	/** @position_in_snapshot: The offset position in snapshot structure */
+	u32 position_in_snapshot;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b87cf6a705a8..026eb668aaee 100644
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
@@ -1100,6 +1101,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (!skip_timeout_check && !xe_sched_job_started(job))
 		goto rearm;
 
+	/* Pre-capture register snapshot, if devcoredump not captured and GuC capture not ready */
+	if (!exec_queue_killed(q) && !xe->devcoredump.captured && xe_device_uc_enabled(xe) &&
+	    xe->wedged.mode >= 1 && !xe_guc_capture_is_ready_for(job)) {
+		/* take force wake before engine register pre-capture */
+		/* keep going if fw fails as we still want to save the memory and SW data */
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
@@ -1182,7 +1196,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	if (!exec_queue_killed(q))
-		xe_devcoredump(job);
+		xe_devcoredump(job); /* pre-captured data will be refreshed by GuC capture */
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
@@ -1951,8 +1965,6 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
-	/* FIXME: Do error capture, most likely async */
-
 	trace_xe_exec_queue_reset(q);
 
 	/*
@@ -1978,7 +1990,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
  * XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION to host, this function will be
  * called 1st to check status before process the data comes with the message.
  *
- * Returns: None
+ * Returns: error code. 0 if success
  */
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 403eb1d2d20a..4b1a7a4b4740 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -23,6 +23,8 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_types.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -291,6 +293,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
 	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
+
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	reg.addr += hwe->mmio_base;
@@ -836,6 +839,48 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 	}
 }
 
+static void
+xe_hw_engine_snapshot_from_hw_by_type(struct xe_hw_engine *hwe,
+				      struct xe_hw_engine_snapshot *snapshot, int type)
+{
+	const struct __guc_mmio_reg_descr_group *list;
+	enum guc_capture_list_class_type capture_class;
+	int i;
+
+	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
+	list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF, type, capture_class);
+	if (!list)
+		return;
+
+	for (i = 0; i < list->num_regs; i++) {
+		u32 *field;
+		const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
+
+		/* loop until extra operation registers zone */
+		if (sub_list->position_in_snapshot == offsetof(struct snapshot_regs, extra_op))
+			break;
+
+		field = (u32 *)((uintptr_t)&snapshot->reg + sub_list->position_in_snapshot);
+		if (type == GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE)
+			*field = hw_engine_mmio_read32(hwe, sub_list->reg);
+		else
+			*field = xe_mmio_read32(hwe->gt, sub_list->reg);
+	}
+}
+
+static void
+xe_hw_engine_snapshot_from_hw(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	int type;
+
+	snapshot->source = XE_HW_ENGINE_SOURCE_HW_ENGINE;
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++)
+		xe_hw_engine_snapshot_from_hw_by_type(hwe, snapshot, type);
+
+	/* Capture steering registers */
+	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -850,8 +895,10 @@ struct xe_hw_engine_snapshot *
 xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
+	struct xe_gt *gt = hwe->gt;
+	struct xe_device *xe = gt_to_xe(gt);
 	size_t len;
-	u64 val;
+	u32 i;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -892,65 +939,80 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->mmio_base = hwe->mmio_base;
 
 	/* no more VF accessible data below this point */
-	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+	if (IS_SRIOV_VF(xe))
 		return snapshot;
 
-	snapshot->reg.ring_execlist_status =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_status |= val << 32;
-
-	snapshot->reg.ring_execlist_sq_contents =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_LO(0));
-	val = hw_engine_mmio_read32(hwe, RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents |= val << 32;
-
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	val = hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd |= val << 32;
-
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	val = hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr |= val << 32;
-
-	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	val = hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd |= val << 32;
-
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
-	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
-	if (GRAPHICS_VERx100(hwe->gt->tile->xe) >= 2000) {
-		val = hw_engine_mmio_read32(hwe, RING_START_UDW(0));
-		snapshot->reg.ring_start |= val << 32;
-	}
-	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
-		snapshot->reg.indirect_ring_state =
+	/* If GuC not enabled, and capture outlist not empty, take it from engine */
+	if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 && xe->devcoredump.job &&
+	    xe_guc_capture_is_ready_for(xe->devcoredump.job))
+		xe_hw_engine_snapshot_from_capture(hwe, snapshot);
+	else
+		xe_hw_engine_snapshot_from_hw(hwe, snapshot);
+
+	/* Read direct ready registers */
+	xe_hw_engine_snapshot_from_hw_by_type(hwe, snapshot, GUC_STATE_CAPTURE_TYPE_DIRECT_READ);
+
+	/* Extra operation required registers zone - start */
+	if (xe_gt_has_indirect_ring_state(hwe->gt))
+		snapshot->reg.extra_op.indirect_ring_state =
 			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
-	}
+	/* Extra operation required registers zone - End */
 
-	snapshot->reg.ring_head =
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
-	snapshot->reg.ring_tail =
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
-	snapshot->reg.ring_mi_mode =
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
-	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
+	/* appy mask for ring head and tail */
+	snapshot->reg.ring_head &= HEAD_ADDR;
+	snapshot->reg.ring_tail &= TAIL_ADDR;
 
-	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+	/* adjust u64 endine in snapshot */
+	for (i = 0; i < sizeof(snapshot->reg.u64_regs); i += sizeof(u64)) {
+		u64 *pdata = (u64 *)((ulong)&snapshot->reg + i);
+		u32 *pl = (u32 *)pdata;
+		u32 *ph = (u32 *)((ulong)pdata + 4);
+
+		*pdata = ((u64)*ph) << 32 | *pl;
+	}
 
 	return snapshot;
 }
 
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
+{
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = q->logical_mask;
+
+	for_each_hw_engine(hwe, q->gt, id) {
+		if (hwe->class != q->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask))
+			continue;
+
+		if (!coredump->snapshot.hwe[id]) {
+			coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+		} else {
+			/* If pre-captured and Guc capture ready now */
+			if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 &&
+			    xe_guc_capture_is_ready_for(job)) {
+				/* Clear snapshot registers, skip pointers */
+				memset(&coredump->snapshot.hwe[id]->reg, 0,
+				       offsetof(struct snapshot_regs, instdone));
+				/* Refresh with GuC captured data */
+				xe_hw_engine_snapshot_from_capture(hwe, coredump->snapshot.hwe[id]);
+			}
+		}
+	}
+}
+
 static void
 xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
 {
@@ -1004,42 +1066,68 @@ xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, str
 void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 				 struct drm_printer *p)
 {
+	int i, type;
+
 	if (!snapshot)
 		return;
 
+	xe_gt_assert(snapshot->hwe->gt, snapshot->source <= XE_HW_ENGINE_SOURCE_GUC_CAPTURE);
+
 	drm_printf(p, "%s (physical), logical instance=%d\n",
 		   snapshot->name ? snapshot->name : "",
 		   snapshot->logical_instance);
+	drm_printf(p, "\tCapture source: %s\n",
+		   snapshot->source == XE_HW_ENGINE_SOURCE_GUC_CAPTURE ? "GuC" : "Engine");
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
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
+
+	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type <= GUC_STATE_CAPTURE_TYPE_DIRECT_READ;
+	     type++) {
+		const struct __guc_mmio_reg_descr_group *list;
+		enum guc_capture_list_class_type capture_class;
+
+		capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
+		list = xe_guc_capture_get_reg_desc_list(GUC_CAPTURE_LIST_INDEX_PF, type,
+							capture_class);
+		if (!list)
+			continue;
+
+		for (i = 0; i < list->num_regs; i++) {
+			u32 *field;
+			const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
+
+			/* loop 32bit registers until 64 bit registers */
+			if (sub_list->position_in_snapshot ==
+			    offsetof(struct snapshot_regs, u64_regs))
+				break;
+			field = (u32 *)((uintptr_t)&snapshot->reg + sub_list->position_in_snapshot);
+			drm_printf(p, "\t%s: 0x%08x\n", sub_list->regname, *field);
+		}
+
+		if (type != GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE)
+			continue; /* 64bit registers is for engine instance only */
+
+		/* Each 64 bit registers take 2 entry in the list */
+		for (; i < list->num_regs; i += 2) {
+			u64 *field;
+			const struct __guc_mmio_reg_descr *sub_list = &list->list[i];
+
+			/* loop 64 bit registers until extra_op registers */
+			if (sub_list->position_in_snapshot ==
+			    offsetof(struct snapshot_regs, extra_op))
+				break;
+			field = (u64 *)((uintptr_t)&snapshot->reg + sub_list->position_in_snapshot);
+			drm_printf(p, "\t%s: 0x%016llx\n", sub_list->regname, *field);
+		}
+	}
+
+	/* Extra operation required registers - Start */
 	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
-		   snapshot->reg.indirect_ring_state);
-	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+		   snapshot->reg.extra_op.indirect_ring_state);
+	/* Extra operation required registers - End */
+
 	xe_hw_engine_snapshot_instdone_print(snapshot, p);
 
-	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			   snapshot->reg.rcu_mode);
 	drm_puts(p, "\n");
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index d227ffe557eb..3d1fad5dc098 100644
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
index 70e6434f150d..053007f0658d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -152,6 +152,125 @@ struct xe_hw_engine {
 	struct xe_oa_unit *oa_unit;
 };
 
+/**
+ * struct snapshot_regs - Hardware registers snapshot
+ *
+ * Contains the snapshot of useful hardware registers.
+ */
+struct snapshot_regs {
+	/* Global registers - start */
+	/** @forcewake_gt: The FORCEWAKE_GT register */
+	u32 forcewake_gt;
+	/* Global registers - end */
+
+	/* Engine class registers - start */
+	/** @rcu_mode: The RCU_MODE register */
+	u32 rcu_mode;
+	/* Engine class registers - end */
+
+	/* Direct read registers - start */
+	/** @sfc_done_0: The SFC_DONE[0] register */
+	u32 sfc_done_0;
+	/** @sfc_done_1: The SFC_DONE[1] register */
+	u32 sfc_done_1;
+	/** @sfc_done_2: The SFC_DONE[2] register */
+	u32 sfc_done_2;
+	/** @sfc_done_3: The SFC_DONE[3] register */
+	u32 sfc_done_3;
+	/* Direct read registers - end */
+
+	/* Engine instance registers - start */
+	/** @ring_hwstam: The RING_HWSTAM register */
+	u32 ring_hwstam;
+	/** @ring_hws_pga: The RING_HWS_PGA register */
+	u32 ring_hws_pga;
+	/** @ring_head: The RING_HEAD register */
+	u32 ring_head;
+	/** @ring_tail: The RING_TAIL register */
+	u32 ring_tail;
+	/** @ring_ctl: The RING_CTL register */
+	u32 ring_ctl;
+	/** @ring_mi_mode: The RING_MI_MODE register */
+	u32 ring_mi_mode;
+	/** @ring_mode: The RING_MODE register */
+	u32 ring_mode;
+	/** @ring_imr: The RING_IMR register */
+	u32 ring_imr;
+	/** @ring_esr: The RING_ESR register */
+	u32 ring_esr;
+	/** @ring_emr: The RING_EMR register */
+	u32 ring_emr;
+	/** @ring_eir: The RING_EIR register */
+	u32 ring_eir;
+	/** @ipehr: The IPEHR register */
+	u32 ipehr;
+
+	/* 64 bit engine instance registers - start */
+	/**
+	 * @u64_regs: 64 bit registers
+	 *
+	 * u64 data captured by 2 u32 from GuC or by hw mmio read.
+	 * Save data into this u64 zone will always write in format of:
+	 *  offset + 0000: [low 32]
+	 *  offset + 0004: [high 32]
+	 * Once all data captured, data will be converted to CPU endian order at the
+	 * end of xe_hw_engine_snapshot_capture
+	 */
+	struct {
+		/** @u64_regs.ring_acthd: The RING_ACTHD register */
+		u64 ring_acthd;
+		/** @u64_regs.ring_bbaddr: The RING_BBADDR register */
+		u64 ring_bbaddr;
+		/** @u64_regs.ring_start: The RING_START register */
+		u64 ring_start;
+		/** @u64_regs.ring_dma_fadd: The RING_DMA_FADD register */
+		u64 ring_dma_fadd;
+		/** @u64_regs.ring_execlist_status: The RING_EXECLIST_STATUS register */
+		u64 ring_execlist_status;
+		/** @u64_regs.ring_execlist_sq_contents: The RING_EXECLIST_SQ_CONTENTS register */
+		u64 ring_execlist_sq_contents;
+	} u64_regs;
+	/* 64 bit engine instance registers - end */
+	/* Engine instance type - end */
+
+	/* Extra operation required registers - start */
+	/** @extra_op: Extra operation required registers */
+	struct {
+		/*
+		 * If all members deleted from this structure,
+		 * uncoment the "Reserved" below
+		 */
+		/* u32 Reserved; */
+
+		/** @extra_op.indirect_ring_state: The INDIRECT_RING_STATE register */
+		u32 indirect_ring_state;
+	} extra_op;
+	/* Extra operation required registers - end */
+
+	/** @instdone: Steering registers */
+	struct {
+		/** @reg.instdone.ring: The RING_INSTDONE register */
+		u32 ring;
+		/** @reg.instdone.slice_common: The SC_INSTDONE register */
+		u32 *slice_common;
+		/** @reg.instdone.slice_common_extra: The SC_INSTDONE_EXTRA register */
+		u32 *slice_common_extra;
+		/** @reg.instdone.slice_common_extra2: The SC_INSTDONE_EXTRA2 register */
+		u32 *slice_common_extra2;
+		/** @reg.instdone.sampler: The SAMPLER_INSTDONE register */
+		u32 *sampler;
+		/** @reg.instdone.row: The ROW_INSTDONE register */
+		u32 *row;
+		/** @reg.instdone.geom_svg: The INSTDONE_GEOM_SVGUNIT register */
+		u32 *geom_svg;
+	} instdone;
+};
+
+enum xe_hw_engine_snapshot_source_id {
+	XE_HW_ENGINE_SOURCE_HW_ENGINE,
+	XE_HW_ENGINE_SOURCE_GUC_CAPTURE
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -160,6 +279,8 @@ struct xe_hw_engine {
 struct xe_hw_engine_snapshot {
 	/** @name: name of the hw engine */
 	char *name;
+	/** @source: Data source, either hw_engine or GuC capture */
+	enum xe_hw_engine_snapshot_source_id source;
 	/** @hwe: hw engine */
 	struct xe_hw_engine *hwe;
 	/** @logical_instance: logical instance of this hw engine */
@@ -174,64 +295,7 @@ struct xe_hw_engine_snapshot {
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
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
+	struct snapshot_regs reg;
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

