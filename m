Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76EC25B75
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 01:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE22310FECE;
	Tue,  7 May 2024 01:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwIKO681";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C010E219
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 01:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715046476; x=1746582476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSdV2c9y/EwIXX7kVFPcBj0xJPuMPQJPP39WqtQVX9g=;
 b=iwIKO681XbXdk60xkusT8fusC/nN9MpxK6cv6BHeQMrhk8ux/SfwYa4U
 +TjtPPgBb5Q6xXpni5bIuFQcMfgs85YeZ/CTkMxdAJozAZqo7CO2IMy+x
 QBsFS1NsBz7WcKAgyq34PTAE73zndq+lglOSerOW3ZshJfF4iO7lSe7/G
 +ZrxuxUjPPmWtWycMeFo2Q5dXDkOe3D5DC7BAzdMjCvf9AgSx/cD6gI67
 nCRXTMwM0Aw9hIe0/YX0D4kmH4OqI+p82+nFUkgjHhSN5alPo5Kzzz4gh
 uY2QqHXsgEK8VVDk5kD/mwhytOGO6qqVW+qk4gjVKl9eicA2Q1T2F6ONI Q==;
X-CSE-ConnectionGUID: S5kBGQdiTWOkCZLAvUDk3Q==
X-CSE-MsgGUID: O1aazhLlQ0+u3t+jvRXVPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22230838"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22230838"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 18:47:39 -0700
X-CSE-ConnectionGUID: tLlAbIOfTiuRGJreYP4eaQ==
X-CSE-MsgGUID: dXiP9Q9kQxi635a2esc3Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28441669"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 06 May 2024 18:47:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v8 6/6] drm/xe/guc: Plumb GuC-capture into dev coredump
Date: Mon,  6 May 2024 18:47:36 -0700
Message-Id: <20240507014736.1057093-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507014736.1057093-1-zhanjun.dong@intel.com>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
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

Add xe_hw_engine_snapshot_from_capture to take snapshot from capture
node list.
Add data struct to map register to a snapshot field, although all
field is mapped now, which means the offset could be optimized out,
while in the future, depends on system configuration, the field might
not be consecutive, keep the offset is reserved for future.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c      |   2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      |  71 +++++--
 drivers/gpu/drm/xe/xe_guc_capture.h      |   1 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |   1 -
 drivers/gpu/drm/xe/xe_guc_submit.c       |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        | 251 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_hw_engine.h        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  | 150 +++++++++-----
 drivers/gpu/drm/xe/xe_sched_job.c        |   7 +-
 9 files changed, 347 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3d7980232be1..f5d46989aef5 100644
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
@@ -148,6 +149,7 @@ static void xe_devcoredump_free(void *data)
 		if (coredump->snapshot.hwe[i])
 			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
 	xe_vm_snapshot_free(coredump->snapshot.vm);
+	xe_guc_capture_free(&coredump->snapshot.gt->uc.guc);
 
 	/* To prevent stale data on next snapshot, clear everything */
 	memset(&coredump->snapshot, 0, sizeof(coredump->snapshot));
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 42aae4d99514..959d318f8a6f 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -37,28 +37,33 @@
  *       from the engine-mmio-base
  */
 #define COMMON_XELP_BASE_GLOBAL \
-	{ FORCEWAKE_GT,		    0,      0, "FORCEWAKE" }
+	{ FORCEWAKE_GT,				0,	0}
 
 #define COMMON_BASE_ENGINE_INSTANCE \
-	{ RING_ESR(0),              0,      0, "ESR" }, \
-	{ RING_EMR(0),              0,      0, "EMR" }, \
-	{ RING_EIR(0),              0,      0, "EIR" }, \
-	{ RING_EXECLIST_STATUS_HI(0), 0,    0, "RING_EXECLIST_STATUS_HI" }, \
-	{ RING_EXECLIST_STATUS_LO(0), 0,    0, "RING_EXECLIST_STATUS_LO" }, \
-	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
-	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
-	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
-	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
-	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
-	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
-	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
-	{ RING_START(0),            0,      0, "START" }, \
-	{ RING_HEAD(0),             0,      0, "HEAD" }, \
-	{ RING_TAIL(0),             0,      0, "TAIL" }, \
-	{ RING_CTL(0),              0,      0, "CTL" }, \
-	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
-	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
-	{ RING_MODE(0),             0,      0, "GFX_MODE" }
+	{ RING_ESR(0),				0,	0}, \
+	{ RING_EMR(0),				0,	0}, \
+	{ RING_EIR(0),				0,	0}, \
+	{ RING_IMR(0),				0,	0}, \
+	{ RING_IPEHR(0),			0,	0}, \
+	{ RING_START(0),			0,	0}, \
+	{ RING_HEAD(0),				0,	0}, \
+	{ RING_TAIL(0),				0,	0}, \
+	{ RING_CTL(0),				0,	0}, \
+	{ RING_MI_MODE(0),			0,	0}, \
+	{ RING_HWSTAM(0),			0,	0}, \
+	{ RING_HWS_PGA(0),			0,	0}, \
+	{ RING_EXECLIST_STATUS_HI(0),		0,	0}, \
+	{ RING_EXECLIST_STATUS_LO(0),		0,	0}, \
+	{ RING_EXECLIST_SQ_CONTENTS_HI(0),	0,	0}, \
+	{ RING_EXECLIST_SQ_CONTENTS_LO(0),	0,	0}, \
+	{ RING_DMA_FADD(0),			0,	0}, \
+	{ RING_DMA_FADD_UDW(0),			0,	0}, \
+	{ RING_BBADDR(0),			0,	0}, \
+	{ RING_BBADDR_UDW(0),			0,	0}, \
+	{ RING_ACTHD(0),			0,	0}, \
+	{ RING_ACTHD_UDW(0),			0,	0}, \
+	{ RING_MODE(0),				0,	0}, \
+	{ RCU_MODE,				0,	0}
 
 /* XE_LP Global */
 static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
@@ -207,7 +212,6 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 	ext->reg = XE_REG(extlist->reg.__reg.addr);
 	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
-	ext->regname = extlist->name;
 }
 
 static int
@@ -1179,6 +1183,31 @@ guc_capture_create_prealloc_nodes(struct xe_guc *guc)
 	__guc_capture_create_prealloc_nodes(guc);
 }
 
+static void
+guc_capture_delete_one_node(struct drm_device *drm, struct __guc_capture_parsed_output *node)
+{
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		drmm_kfree(drm, node->reginfo[i].regs);
+	list_del(&node->link);
+	drmm_kfree(drm, node);
+}
+
+static void
+guc_capture_free_list(struct drm_device *drm, struct list_head  *list)
+{
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	list_for_each_entry_safe(n, ntmp, list, link)
+		guc_capture_delete_one_node(drm, n);
+}
+
+void xe_guc_capture_free(struct xe_guc *guc)
+{
+	guc_capture_free_list(guc_to_drm(guc), &guc->capture->outlist);
+}
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	guc->capture = drmm_kzalloc(guc_to_drm(guc), sizeof(*guc->capture), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
index 891f1e0fcb82..cc5e7c083e7b 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -14,6 +14,7 @@ void xe_guc_capture_process(struct xe_guc *guc);
 int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
 int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
 int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
+void xe_guc_capture_free(struct xe_guc *guc);
 int xe_guc_capture_init(struct xe_guc *guc);
 
 #endif /* _XE_GUC_CAPTURE_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
index c406669355e3..90ab9d6fb21c 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -86,7 +86,6 @@ struct __guc_mmio_reg_descr {
 	struct xe_reg reg;
 	u32 flags;
 	u32 mask;
-	const char *regname;
 };
 
 struct __guc_mmio_reg_descr_group {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index dcbeb3eff5ff..37d1879209de 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -26,6 +26,7 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_id_mgr.h"
@@ -959,6 +960,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gt *gt = q->gt;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
@@ -976,9 +978,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 		   xe_sched_job_seqno(job), q->guc->id, q->flags);
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+	xe_gt_WARN(gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
 		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
+	xe_gt_WARN(gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
 		   "VM job timed out on non-killed execqueue\n");
 
 	simple_error_capture(q);
@@ -1717,9 +1719,6 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 
 	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
-
-	/* FIXME: Do error capture, most likely async */
-
 	trace_xe_exec_queue_reset(q);
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ec69803152a2..caacaf72bb94 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -20,6 +20,9 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
@@ -262,6 +265,56 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
+struct __reg_map_descr capture_engine_reg[] = {
+	{offsetof(struct snap_shot_regs, ring_hwstam),	"HWSTAM",	RING_HWSTAM(0)	},
+	{offsetof(struct snap_shot_regs, ring_hws_pga),	"RING_HWS_PGA",	RING_HWS_PGA(0)	},
+	{offsetof(struct snap_shot_regs, ring_start),	"RING_START",	RING_START(0)	},
+	{offsetof(struct snap_shot_regs, ring_head),	"RING_HEAD",	RING_HEAD(0)	},
+	{offsetof(struct snap_shot_regs, ring_tail),	"RING_TAIL",	RING_TAIL(0)	},
+	{offsetof(struct snap_shot_regs, ring_ctl),	"RING_CTL",	RING_CTL(0)	},
+	{offsetof(struct snap_shot_regs, ring_mi_mode),	"RING_MI_MODE",	RING_MI_MODE(0)	},
+	{offsetof(struct snap_shot_regs, ring_mode),	"RING_MODE",	RING_MODE(0)	},
+	{offsetof(struct snap_shot_regs, ring_imr),	"RING_IMR",	RING_IMR(0)	},
+	{offsetof(struct snap_shot_regs, ring_esr),	"RING_ESR",	RING_ESR(0)	},
+	{offsetof(struct snap_shot_regs, ring_emr),	"RING_EMR",	RING_EMR(0)	},
+	{offsetof(struct snap_shot_regs, ring_eir),	"RING_EIR",	RING_EIR(0)	},
+	{offsetof(struct snap_shot_regs, ipehr),	"IPEHR",	RING_IPEHR(0)	},
+	{offsetof(struct snap_shot_regs, rcu_mode),	"RCU_MODE",	RCU_MODE	},
+};
+
+struct __reg_map_descr_64 capture_engine_reg_64[] = {
+	{
+		offsetof(struct snap_shot_regs, ring_acthd),
+		"ACTHD",
+		RING_ACTHD(0),
+		RING_ACTHD_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_bbaddr),
+		"RING_BBADDR",
+		RING_BBADDR(0),
+		RING_BBADDR_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_dma_fadd),
+		"RING_DMA_FADD",
+		RING_DMA_FADD(0),
+		RING_DMA_FADD_UDW(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_execlist_status),
+		"RING_EXECLIST_STATUS",
+		RING_EXECLIST_STATUS_LO(0),
+		RING_EXECLIST_STATUS_HI(0)
+	},
+	{
+		offsetof(struct snap_shot_regs, ring_execlist_sq_contents),
+		"RING_EXECLIST_SQ_CONTENTS",
+		RING_EXECLIST_SQ_CONTENTS_LO(0),
+		RING_EXECLIST_SQ_CONTENTS_HI(0)
+	}
+};
+
 static void hw_engine_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
@@ -823,6 +876,113 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
 	}
 }
 
+static void cp_reg_to_snapshot(u32 offset, u32 value, struct snap_shot_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg); i++)
+		if (offset == capture_engine_reg[i].reg.addr) {
+			u32 *field = (u32 *)((uintptr_t)regs + capture_engine_reg[i].dst_offset);
+			*field = value;
+			return;
+		}
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		if (offset == capture_engine_reg_64[i].reg_lo.addr) {
+			u64 *field = (u64 *)((uintptr_t)regs + capture_engine_reg_64[i].dst_offset);
+			*field = upper_32_bits(*field) | value;
+			return;
+		}
+		if (offset == capture_engine_reg_64[i].reg_hi.addr) {
+			u64 *field = (u64 *)((uintptr_t)regs + capture_engine_reg_64[i].dst_offset);
+			*field = ((u64)value << 32) | lower_32_bits(*field);
+			return;
+		}
+	}
+}
+
+static void guc_capture_find_ecode(struct __guc_capture_parsed_output *node,
+				   struct xe_hw_engine_snapshot *snapshot)
+{
+	struct gcap_reg_list_info *reginfo;
+	struct guc_mmio_reg *regs;
+	int i;
+
+	if (!node)
+		return;
+
+	reginfo = node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
+	regs = reginfo->regs;
+	for (i = 0; i < reginfo->num_regs; i++)
+		cp_reg_to_snapshot(regs[i].offset, regs[i].value, &snapshot->reg);
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
+	struct xe_guc *guc = &gt->uc.guc;
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	if (list_empty(&guc->capture->outlist))
+		return xe_hw_engine_snapshot_from_engine(hwe, snapshot);
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on engine class and instance.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+		u32 hwe_guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+		if (n->eng_class == hwe_guc_class && n->eng_inst == hwe->instance) {
+			guc_capture_find_ecode(n, snapshot);
+			list_del(&n->link);
+			return;
+		}
+	}
+}
+
+/**
+ * xe_hw_engine_snapshot_from_engine - Take a quick engine snapshot from HW.
+ * @hwe: Xe HW Engine.
+ * @snapshot: Point to the Xe HW Engine snapshot object to save data.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: None
+ */
+void
+xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	int i;
+
+	/* Skip RCU_MODE, the last print */
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg) - 1; i++) {
+		u32 *field = (u32 *)((uintptr_t)&snapshot->reg + capture_engine_reg[i].dst_offset);
+		*field = hw_engine_mmio_read32(hwe, capture_engine_reg[i].reg);
+	}
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		u64 *field = (u64 *)((uintptr_t)&snapshot->reg +
+				      capture_engine_reg_64[i].dst_offset);
+		*field = hw_engine_mmio_read32(hwe, capture_engine_reg_64[i].reg_lo) |
+			 (u64)hw_engine_mmio_read32(hwe, capture_engine_reg_64[i].reg_hi) << 32;
+	}
+	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+
+	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
+}
+
 /**
  * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
  * @hwe: Xe HW Engine.
@@ -838,7 +998,6 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
 	struct xe_hw_engine_snapshot *snapshot;
 	size_t len;
-	u64 val;
 
 	if (!xe_hw_engine_is_valid(hwe))
 		return NULL;
@@ -882,49 +1041,15 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
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
+	/* If GuC not enabled, take it from engine */
+	if (xe_device_uc_enabled(gt_to_xe(hwe->gt)))
+		xe_hw_engine_snapshot_from_capture(hwe, snapshot);
+	else
+		xe_hw_engine_snapshot_from_engine(hwe, snapshot);
 
-	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+	/* appy mask for ring head and tail */
+	snapshot->reg.ring_head &= HEAD_ADDR;
+	snapshot->reg.ring_tail &= TAIL_ADDR;
 
 	return snapshot;
 }
@@ -982,6 +1107,8 @@ xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, str
 void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 				 struct drm_printer *p)
 {
+	int i;
+
 	if (!snapshot)
 		return;
 
@@ -990,29 +1117,25 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
-	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
-	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_status);
-	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
-		   snapshot->reg.ring_execlist_sq_contents);
-	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
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
-	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
+
+	for (i = 0;
+	     /* Skip RCU_MODE, will be processed later */
+	     i < ARRAY_SIZE(capture_engine_reg) - 1;
+	     i++) {
+		u32 *field = (u32 *)((uintptr_t)&snapshot->reg + capture_engine_reg[i].dst_offset);
+
+		drm_printf(p, "\t%s: 0x%08x\n", capture_engine_reg[i].regname, *field);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg_64); i++) {
+		u64 *field = (u64 *)((uintptr_t)&snapshot->reg +
+				     capture_engine_reg_64[i].dst_offset);
+
+		drm_printf(p, "\t%s: 0x%016llx\n", capture_engine_reg_64[i].regname, *field);
+	}
 	xe_hw_engine_snapshot_instdone_print(snapshot, p);
 
+	/* Last RCU_MODE print */
 	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
 		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
 			   snapshot->reg.rcu_mode);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..937ce20ea8de 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -62,6 +62,10 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe,
+					struct xe_hw_engine_snapshot *snapshot);
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe->name;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 9f9755e31b9f..4433c0c8ffc2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -150,6 +150,99 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 };
 
+/**
+ * struct __reg_map_descr - Mapping table, defines a 32 bit register and corresponding data field
+ *
+ * Contains the defines of a 32 bit register, and the offset in the capture snapshot.
+ */
+struct __reg_map_descr {
+	/** @dst_offset: Offset in snap_shot_regs structure */
+	u32 dst_offset;
+	/** @regname: Name of register */
+	const char *regname;
+	/** @reg: Hardware register */
+	struct xe_reg reg;
+};
+
+/**
+ * struct __reg_map_descr_64 - Mapping table, defines a 64 bit register and corresponding data field
+ *
+ * Contains the defines of a 64 bit register, and the offset in the capture snapshot.
+ */
+struct __reg_map_descr_64 {
+	/** @dst_offset: Offset in snap_shot_regs structure */
+	u32 dst_offset;
+	/** @regname: Name of register */
+	const char *regname;
+	/** @reg_lo: Low 32bit hardware register of the 64 bit register*/
+	struct xe_reg reg_lo;
+	/** @reg_hi: Hi 32bit hardware register of the 64 bit register*/
+	struct xe_reg reg_hi;
+};
+
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of useful hardware engine info and registers.
+ */
+struct snap_shot_regs {
+	/** @ring_acthd: RING_ACTHD */
+	u64 ring_acthd;
+	/** @ring_bbaddr: RING_BBADDR */
+	u64 ring_bbaddr;
+	/** @ring_dma_fadd: RING_DMA_FADD */
+	u64 ring_dma_fadd;
+	/** @ring_execlist_status: RING_EXECLIST_STATUS */
+	u64 ring_execlist_status;
+	/** @ring_execlist_sq_contents: RING_EXECLIST_SQ_CONTENTS */
+	u64 ring_execlist_sq_contents;
+	/** @ring_hwstam: RING_HWSTAM */
+	u32 ring_hwstam;
+	/** @ring_hws_pga: RING_HWS_PGA */
+	u32 ring_hws_pga;
+	/** @ring_start: RING_START */
+	u32 ring_start;
+	/** @ring_head: RING_HEAD */
+	u32 ring_head;
+	/** @ring_tail: RING_TAIL */
+	u32 ring_tail;
+	/** @ring_ctl: RING_CTL */
+	u32 ring_ctl;
+	/** @ring_mi_mode: RING_MI_MODE */
+	u32 ring_mi_mode;
+
+	/** @ring_mode: RING_MODE */
+	u32 ring_mode;
+	/** @ring_imr: RING_IMR */
+	u32 ring_imr;
+	/** @ring_esr: RING_ESR */
+	u32 ring_esr;
+	/** @ring_emr: RING_EMR */
+	u32 ring_emr;
+	/** @ring_eir: RING_EIR */
+	u32 ring_eir;
+	/** @ipehr: IPEHR */
+	u32 ipehr;
+	/** @rcu_mode: RCU_MODE */
+	u32 rcu_mode;
+	struct {
+		/** @reg.instdone.ring: RING_INSTDONE */
+		u32 ring;
+		/** @reg.instdone.slice_common: SC_INSTDONE */
+		u32 *slice_common;
+		/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
+		u32 *slice_common_extra;
+		/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
+		u32 *slice_common_extra2;
+		/** @reg.instdone.sampler: SAMPLER_INSTDONE */
+		u32 *sampler;
+		/** @reg.instdone.row: ROW_INSTDONE */
+		u32 *row;
+		/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
+		u32 *geom_svg;
+	} instdone;
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -172,62 +265,7 @@ struct xe_hw_engine_snapshot {
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
-		u32 ring_start;
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
+	struct snap_shot_regs reg;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..922cd1a8753f 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -9,9 +9,11 @@
 #include <linux/dma-fence-array.h>
 #include <linux/slab.h>
 
+#include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
@@ -191,10 +193,11 @@ void xe_sched_job_destroy(struct kref *ref)
 {
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
+	struct xe_device *xe = job_to_xe(job);
 
 	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_pm_runtime_put(job_to_xe(job));
-	xe_exec_queue_put(job->q);
+		xe_pm_runtime_put(xe);
+
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
 	job_free(job);
-- 
2.34.1

