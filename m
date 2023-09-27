Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB4E80AB0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 14:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E4210E542;
	Wed, 27 Sep 2023 14:21:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D010E540
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695824481; x=1727360481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJ36QHgl4lCJQcDFEhfggQPA4tMVXBxMpcXoScKtTkM=;
 b=QxCiuJYzLMoGiR0LUFHNMIlHWKsQ02faVZKIajZcMuUX5u6ZO7rGfMpP
 9VvL4l31Ji1xAeBlHFOVtLZ5qYqkWtqKsiYttHNgWwzI2/wUMCG7GAdx1
 /DLSlJo3I1swnJ8AU+VXDfzn1KqXUbCW99eS2p2OB6N8BIdXDJvMFG2wZ
 mXXF9K7BR6AVL349ISLu+VAyHl4pqKdiA2rhXMeePsCUGtUnHhYECS6KV
 nxj2fofZulSjauz7ZHHzinyGxPKnu1live/rdRxCOTGqwsEeAWijn4pRE
 ezReH5AhmsbbdjG8JIqBsNug1CeI/5CdkJ7r6ZaHtN8WnTys48WxC39+9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372178014"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372178014"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080184802"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="1080184802"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2023 07:21:19 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 19:59:19 +0530
Message-Id: <20230927142919.272895-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230927142919.272895-1-tejas.upadhyay@intel.com>
References: <20230927142919.272895-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 2/2] drm/xe: Update counter for low level
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
Cc: matthew.d.roper@intel.com
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

V4:
  - dump err_type in drm_err log - Himal
V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 16 +++++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 44 +++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 19 ++++++---
 7 files changed, 105 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..df09676fb49f 100644
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
+			"gt%d: TLB invalidation fence timeout, seqno=%d recv=%d err_type:%d",
+			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv,
+			XE_TILE_DRV_ERR_GGTT);
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
+			"gt%d: TLB invalidation time'd out, seqno=%d, recv=%d err_type=%d\n",
+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv,
+			XE_TILE_DRV_ERR_GGTT);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..8f0e5a89f64f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &reply, false);
 	if (ret) {
 timeout:
-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
-			request[0], reply);
+		drm_err(&xe->drm, "mmio request %#x: no reply %#x err_type:%d\n",
+			request[0], reply, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return ret;
 	}
 
@@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
-			request[0], error, hint);
+		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x err_type:%d\n",
+			request[0], error, hint, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -ENXIO;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x err_type:%d\n",
+			request[0], header, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2046bd269bbd..9472c247241a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -732,8 +732,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 	if (!ret) {
-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
-			g2h_fence.seqno, action[0]);
+		drm_err(&xe->drm,
+			"Timed out wait for G2H, fence %u, action %04x err_type:%d",
+			g2h_fence.seqno, action[0], XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
@@ -744,8 +746,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
-			action[0], g2h_fence.error, g2h_fence.hint);
+		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d err_type:%d",
+			action[0], g2h_fence.error, g2h_fence.hint, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ret = -EIO;
 	}
 
@@ -840,8 +843,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
 		drm_err(&xe->drm,
-			"G2H channel broken on read, origin=%d, reset required\n",
-			origin);
+			"G2H channel broken on read, origin=%d, reset required err_type:%d\n",
+			origin, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -859,8 +863,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	default:
 		drm_err(&xe->drm,
-			"G2H channel broken on read, type=%d, reset required\n",
-			type);
+			"G2H channel broken on read, type=%d, reset required err_type:%d\n",
+			type, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -918,12 +923,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		drm_err(&xe->drm, "unexpected action 0x%04x err_type:%d\n",
+			action, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d err_type:%d\n",
+			action, ret, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 
 	return 0;
 }
@@ -958,8 +966,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
 		drm_err(&xe->drm,
-			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			avail, len);
+			"G2H channel broken on read, avail=%d, len=%d, reset required err_type:%d\n",
+			avail, len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1026,9 +1035,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_warn(&xe->drm, "NOT_POSSIBLE");
 	}
 
-	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+	if (ret) {
+		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d err_type:%d\n",
+			action, ret, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8a4d299d6cb0..cc7ba2173fcf 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
-		drm_err(&pc_to_xe(pc)->drm,
-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+	if (ret) {
+		drm_err(&pc_to_xe(pc)->drm, "GuC PC query task state failed: %pe err_type:%d",
+			ERR_PTR(ret), XE_GT_DRV_ERR_GUC_COMM);
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
+		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe err_type:%d",
+			ERR_PTR(ret), XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19abd2628ad6..d9d1bcfa9cfa 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1496,13 +1496,17 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_exec_queue *q;
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		drm_err(&xe->drm, "Invalid guc_id %u err_type:%d",
+			guc_id, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
-		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		drm_err(&xe->drm, "Not engine present for guc_id %u err_type:%d",
+			guc_id, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
@@ -1531,7 +1535,9 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 2)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u err_type:%d",
+			len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1541,8 +1547,9 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "Unexpected engine state 0x%04x err_type:%d",
+			atomic_read(&q->guc->state), XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1576,7 +1583,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u err_type:%d",
+			len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1586,8 +1595,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		drm_err(&xe->drm, "Unexpected engine state 0x%04x err_type:%d",
+			atomic_read(&q->guc->state), XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1610,7 +1620,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u err_type:%d",
+			len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1645,7 +1657,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u err_type:%d",
+			len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1671,7 +1685,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	u32 reason;
 
 	if (unlikely(len != 3)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		drm_err(&xe->drm, "Invalid length %u err_type:%d",
+			len, XE_GT_DRV_ERR_GUC_COMM);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1680,8 +1696,10 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
-		guc_class, instance, reason);
+	drm_err(&xe->drm,
+		"GuC engine reset request failed on %d:%d because 0x%08X err_type:%d",
+		guc_class, instance, reason, XE_GT_DRV_ERR_ENGINE);
+	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
 
 	xe_gt_reset_async(guc_to_gt(guc));
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index def9369eb488..cbd3f79cfdd5 100644
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
+		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid! err_type:%d\n",
+			bank, bit, ident, XE_TILE_DRV_ERR_INTR);
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..72e6bd0f6f91 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -126,11 +126,13 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 
 fail:
 	xe_gt_err(gt,
-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d ret_type:%d\n",
 		  idx, e->clr_bits, e->set_bits,
 		  str_yes_no(e->reg.masked),
 		  str_yes_no(e->reg.mcr),
-		  ret);
+		  ret,
+		  XE_GT_DRV_ERR_OTHERS);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -207,7 +209,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_err(gt, "Failed to apply, err=%d err_type:%d\n",
+		  err, XE_GT_DRV_ERR_OTHERS);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -235,8 +239,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
 			xe_gt_err(gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more err_type:%d\n",
+				  hwe->name, RING_MAX_NONPRIV_SLOTS, XE_GT_DRV_ERR_ENGINE);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE);
 			break;
 		}
 
@@ -259,7 +264,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	drm_err(&xe->drm, "Failed to apply, err=%d err_type:%d\n",
+		err, XE_GT_DRV_ERR_OTHERS);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 /**
-- 
2.25.1

