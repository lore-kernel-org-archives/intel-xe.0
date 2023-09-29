Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74F3E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:16:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B2710E6B0;
	Fri, 29 Sep 2023 06:16:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D28710E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695968181; x=1727504181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+6h0L8xmtlgPMxqz4QLaktX/JP38LwerCgkpKqrTaeI=;
 b=EJUUTRRpuR+6SqeDTsIIjz0/t4m5GWGTPFTE9oaH1lK+E7EXbUccbk62
 +D0qD2bbtXlvVSLYKDuVUZhJRPguJ5V96t4GhE7z6EjFGYMYerjNX8aTh
 DlnUIhWmYWeMRnG/jMW0GiCn7XRaVWiR/XulAg2n/qZS/nl4/4h/zDC5B
 Mkj1uzIlPfZknBuOCYZk7Ki3vJ/zRz6v1nQJI6xtGkjHVcu6KhPIVR0bU
 1QspRpr4EnI8LEZS0tA5Vt3Qa1AuglcENUNiUF2bnOueBNe2hlsaFxRWQ
 IDzS704Exjtzt+NC/UlqMVqkqifm7D4hZKSk63H2mLqof1c+wnVAeGNiO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386104580"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="386104580"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923521160"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923521160"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 23:16:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 11:54:20 +0530
Message-Id: <20230929062420.394375-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929062420.394375-1-tejas.upadhyay@intel.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: Roper@freedesktop.org, Wajdeczko@freedesktop.org,
	Matthew D <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

we added a low level driver error counter and incrementing on
each occurrance. Focus is on errors that are not functionally
affecting the system and might otherwise go unnoticed and cause
power/performance regressions, so checking for the error
counters should help.

Importantly the intention is not to go adding new error checks,
but to make sure the existing important error conditions are
propagated in terms of counter under respective categories like
below :
Under GT:
driver_gt_guc_communication,
driver_gt_other_engine,
driver_gt_other

Under Tile:
driver_ggtt,
driver_interrupt

TODO: Currently this is just a counting of errors, later these
counters will be reported through netlink interface when it is
implemented and ready.

V5:
  - Dump err_type in string format
V4:
  - dump err_type in drm_err log - Himal
V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  |  6 +++
 drivers/gpu/drm/xe/xe_gt.h                  |  1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 ++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 16 ++++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 47 +++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 20 ++++++---
 drivers/gpu/drm/xe/xe_tile.c                |  5 +++
 drivers/gpu/drm/xe/xe_tile.h                |  1 +
 11 files changed, 123 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a8b5f012588b..3c174b7430be 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,6 +47,12 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+const char *const xe_gt_drv_err_to_str[] = {
+	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
+	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
+	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
+};
+
 /**
  * xe_gt_report_driver_error - Count driver error for gt
  * @gt: GT to count error for
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9442d615042f..70c131022f59 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,6 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+extern const char *const xe_gt_drv_err_to_str[];
 void xe_gt_report_driver_error(struct xe_gt *gt,
 			       const enum xe_gt_drv_err_type err);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..63a152d74176 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_tile.h"
 #include "xe_trace.h"
 
 #define TLB_TIMEOUT	(HZ / 4)
@@ -35,8 +36,11 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
-			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		drm_err(&gt_to_xe(gt)->drm,
+			"gt%d: TLB invalidation fence timeout, seqno=%d recv=%d [%s]",
+			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv,
+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -329,8 +333,11 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		drm_err(&xe->drm,
+			"gt%d: TLB invalidation time'd out, seqno=%d, recv=%d [%s]\n",
+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv,
+			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..a006de620b82 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &reply, false);
 	if (ret) {
 timeout:
-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
-			request[0], reply);
+		drm_err(&xe->drm, "mmio request %#x: no reply %#x [%s]\n",
+			request[0], reply, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return ret;
 	}
 
@@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
-			request[0], error, hint);
+		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x [%s]\n",
+			request[0], error, hint, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -ENXIO;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x [%s]\n",
+			request[0], header, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8b686c8b3339..f68d7fc2c486 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -732,8 +732,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 	if (!ret) {
-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
-			g2h_fence.seqno, action[0]);
+		drm_err(&xe->drm,
+			"Timed out wait for G2H, fence %u, action %04x [%s]",
+			g2h_fence.seqno, action[0], xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
@@ -744,8 +746,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
-			action[0], g2h_fence.error, g2h_fence.hint);
+		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d [%s]",
+			action[0], g2h_fence.error, g2h_fence.hint,
+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ret = -EIO;
 	}
 
@@ -840,8 +844,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
 		drm_err(&xe->drm,
-			"G2H channel broken on read, origin=%d, reset required\n",
-			origin);
+			"G2H channel broken on read, origin=%d, reset required [%s]\n",
+			origin, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -859,8 +864,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	default:
 		drm_err(&xe->drm,
-			"G2H channel broken on read, type=%d, reset required\n",
-			type);
+			"G2H channel broken on read, type=%d, reset required [%s]\n",
+			type, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -918,12 +924,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		drm_err(&xe->drm, "unexpected action 0x%04x [%s]\n",
+			action, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d [%s]\n",
+			action, ret, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 
 	return 0;
 }
@@ -958,8 +967,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
 		drm_err(&xe->drm,
-			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			avail, len);
+			"G2H channel broken on read, avail=%d, len=%d, reset required [%s]\n",
+			avail, len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1026,9 +1036,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_warn(&xe->drm, "NOT_POSSIBLE");
 	}
 
-	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+	if (ret) {
+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d [%s]\n",
+			action, ret, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9375d1d582f..8fb180f706f4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
-		drm_err(&pc_to_xe(pc)->drm,
-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+	if (ret) {
+		drm_err(&pc_to_xe(pc)->drm, "GuC PC query task state failed: %pe [%s]",
+			ERR_PTR(ret), xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
@@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
-			ERR_PTR(ret));
+	if (ret) {
+		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe [%s]",
+			ERR_PTR(ret), xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..208ffde879ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1497,13 +1497,17 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_exec_queue *q;
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		drm_err(&xe->drm, "Invalid guc_id %u [%s]",
+			guc_id, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
-		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		drm_err(&xe->drm, "Not engine present for guc_id %u [%s]",
+			guc_id, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
@@ -1532,7 +1536,9 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 2)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u [%s]",
+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1542,8 +1548,10 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
+			atomic_read(&q->guc->state),
+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1577,7 +1585,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u [%s]",
+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1587,8 +1597,10 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
+			atomic_read(&q->guc->state),
+			xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1611,7 +1623,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u [%s]",
+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1646,7 +1660,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u [%s]",
+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1672,7 +1688,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	u32 reason;
 
 	if (unlikely(len != 3)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u [%s]",
+			len, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1681,8 +1699,11 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
-		guc_class, instance, reason);
+	drm_err(&xe->drm,
+		"GuC engine reset request failed on %d:%d because 0x%08X [%s]",
+		guc_class, instance, reason,
+		xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
+	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
 
 	xe_gt_reset_async(guc_to_gt(guc));
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index def9369eb488..3b773d055871 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -18,6 +18,7 @@
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
+#include "xe_tile.h"
 
 /*
  * Interrupt registers for a unit are always consecutive and ordered
@@ -222,8 +223,9 @@ gt_engine_identity(struct xe_device *xe,
 		 !time_after32(local_clock() >> 10, timeout_ts));
 
 	if (unlikely(!(ident & INTR_DATA_VALID))) {
-		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
-			bank, bit, ident);
+		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid! [%s]\n",
+			bank, bit, ident, xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_INTR]);
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..46ec3ade5577 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -126,11 +126,13 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 
 fail:
 	xe_gt_err(gt,
-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d [%s]\n",
 		  idx, e->clr_bits, e->set_bits,
 		  str_yes_no(e->reg.masked),
 		  str_yes_no(e->reg.mcr),
-		  ret);
+		  ret,
+		  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -207,7 +209,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_err(gt, "Failed to apply, err=%d [%s]\n",
+		  err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -235,8 +239,10 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
 			xe_gt_err(gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more [%s]\n",
+				  hwe->name, RING_MAX_NONPRIV_SLOTS,
+				  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE);
 			break;
 		}
 
@@ -259,7 +265,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	drm_err(&xe->drm, "Failed to apply, err=%d [%s]\n",
+		err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 708dd385f2b1..6f70e4cf3e03 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,6 +71,11 @@
  *  - MOCS and PAT programming
  */
 
+const char *const xe_tile_drv_err_to_str[] = {
+	[XE_TILE_DRV_ERR_GGTT] = "GGTT",
+	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
+};
+
 /**
  * xe_tile_report_driver_error - Count driver error for tile
  * @tile: Tile to count error for
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 092a6b17a97e..a0e7a95f53e5 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
+extern const char *const xe_tile_drv_err_to_str[];
 void xe_tile_report_driver_error(struct xe_tile *tile,
 				 const enum xe_tile_drv_err_type err);
 
-- 
2.25.1

