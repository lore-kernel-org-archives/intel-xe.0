Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2122CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 12:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AC710E5ED;
	Fri, 13 Oct 2023 12:08:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F610E5ED
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697198900; x=1728734900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IeqlBHU8WFomZGIZ/Y61DGI9sIuKKWxEG6ULaVmXvWA=;
 b=JGDwXUWhGiW1jm0vZSNATMhTc9GLKf2rEFcjrzi7n97nNeZrwTs6gUA+
 SIPiqQ4xVpMkVxUKoiHyvCbIDvcwU1ktWYcdZAZ84bDbXtwDJ+GDvURtg
 a1Ua9SMiI7Lv8G3zXaP1KW7hbAnFOZU72ldZIA4FJ6q2y1PJrlET5mSUe
 n9ufblVkQFgCKrWWcmriFL7uLQCggOEuH6k1ofsRitTvWofByk0u/Rxjq
 BJrQYo5ObhJRxO31wmsLaMzFPECJkpqnXpn4jdLgq0TvTUXQFERUGXb0p
 osjNE+cAaGsLo7APsJR7ZItDPyb+tc6x5HTiFj/CHmfXDcAyAarxfTgQJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3769218"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="3769218"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="871058225"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="871058225"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 05:08:13 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 17:46:33 +0530
Message-Id: <20231013121633.1038322-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
References: <20231013121633.1038322-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V6 2/2] drm/xe: Update counter for low level
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
Cc: Vishwanathapura@freedesktop.org
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
gt_guc_communication,
gt_engine_other,
gt_other

Under Tile:
gtt,
interrupt

TODO: Currently this is just a counting of errors, later these
counters will be reported through netlink interface when it is
implemented and ready.

V6:
  - move drm_err to gt and tile specific err API - Aravind
  - Use GTT naming instead of GGTT - Aravind/Niranjana
V5:
  - Dump err_type in string format
V4:
  - dump err_type in drm_err log - Himal
V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 25 +++++++++++-
 drivers/gpu/drm/xe/xe_gt.h                  |  4 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 12 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 39 ++++++++++--------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 26 +++++++++++-
 drivers/gpu/drm/xe/xe_tile.h                |  4 +-
 11 files changed, 139 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b81de3984626..6f875b3886fd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -47,10 +47,18 @@
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
  * @err: enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
  *
  * Increment the driver error counter in respective error
  * category for this GT.
@@ -58,11 +66,26 @@
  * Returns void.
  */
 void xe_gt_report_driver_error(struct xe_gt *gt,
-			       const enum xe_gt_drv_err_type err)
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...)
 {
+	struct va_format vaf;
+	va_list args;
+
 	xe_gt_assert(gt, err >= ARRAY_SIZE(gt->drv_err_cnt));
 	WRITE_ONCE(gt->drv_err_cnt[err],
 		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
+		     XE_GT_DRV_ERR_MAX);
+
+	drm_err(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
+		gt->info.id, xe_gt_drv_err_to_str[err], &vaf);
+	va_end(args);
 }
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 9442d615042f..374c6946620b 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,7 +67,9 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+extern const char *const xe_gt_drv_err_to_str[];
 void xe_gt_report_driver_error(struct xe_gt *gt,
-			       const enum xe_gt_drv_err_type err);
+			       const enum xe_gt_drv_err_type err,
+			       const char *fmt, ...);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..770ed7df8389 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -9,6 +9,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_tile.h"
 #include "xe_trace.h"
 
 #define TLB_TIMEOUT	(HZ / 4)
@@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			break;
 
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
-		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
-			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
+					    gt->info.id, fence->seqno,
+					    gt->tlb_invalidation.seqno_recv);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
  */
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_guc *guc = &gt->uc.guc;
 	int ret;
 
@@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+					    "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
+					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..c40d0cc46293 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     50000, &reply, false);
 	if (ret) {
 timeout:
-		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
-			request[0], reply);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
+					  "mmio request %#x: no reply %#x\n",
+					  request[0], reply);
 		return ret;
 	}
 
@@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
-			request[0], error, hint);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
+					  "mmio request %#x: failure %#x/%#x\n",
+					  request[0], error, hint);
 		return -ENXIO;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM,
+					  "mmio request %#x: unexpected reply %#x\n",
+					  request[0], header);
 		return -EPROTO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8b686c8b3339..1615f4e3c01e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -732,8 +732,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 	if (!ret) {
-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
-			g2h_fence.seqno, action[0]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "Timed out wait for G2H, fence %u, action %04x",
+					  g2h_fence.seqno, action[0]);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
@@ -744,8 +745,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
-			action[0], g2h_fence.error, g2h_fence.hint);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "Send failed, action 0x%04x, error %d, hint %d",
+					  action[0], g2h_fence.error, g2h_fence.hint);
 		ret = -EIO;
 	}
 
@@ -829,7 +831,6 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
 	u32 hxg, origin, type;
 	int ret;
 
@@ -839,9 +840,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		drm_err(&xe->drm,
-			"G2H channel broken on read, origin=%d, reset required\n",
-			origin);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "G2H channel broken on read, origin=%d, reset required\n",
+					  origin);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -858,9 +859,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		drm_err(&xe->drm,
-			"G2H channel broken on read, type=%d, reset required\n",
-			type);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "G2H channel broken on read, type=%d, reset required\n",
+					  type);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -871,7 +872,6 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
 	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
 	u32 *payload = msg + GUC_CTB_HXG_MSG_MIN_LEN;
@@ -918,12 +918,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "unexpected action 0x%04x\n",
+					  action);
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "action 0x%04x failed processing, ret=%d\n",
+					  action, ret);
 
 	return 0;
 }
@@ -957,9 +960,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
-		drm_err(&xe->drm,
-			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			avail, len);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "G2H channel broken on read, avail=%d, len=%d, reset required\n",
+					  avail, len);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1027,8 +1030,9 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM,
+					  "action 0x%04x failed processing, ret=%d\n",
+					  action, ret);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d9375d1d582f..1ee7b68a9fc4 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -197,9 +197,9 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm,
-			"GuC PC query task state failed: %pe", ERR_PTR(ret));
-
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM,
+					  "GuC PC query task state failed: %pe",
+					  ERR_PTR(ret));
 	return ret;
 }
 
@@ -219,9 +219,9 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
-			ERR_PTR(ret));
-
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM,
+					  "GuC PC set param failed: %pe",
+					  ERR_PTR(ret));
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..4b7fe6419d48 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1497,13 +1497,15 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	struct xe_exec_queue *q;
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
-		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid guc_id %u", guc_id);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
-		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Not engine present for guc_id %u", guc_id);
 		return NULL;
 	}
 
@@ -1527,12 +1529,12 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 2)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -1542,8 +1544,9 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(!exec_queue_pending_enable(q) &&
 		     !exec_queue_pending_disable(q))) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Unexpected engine state 0x%04x",
+					  atomic_read(&q->guc->state));
 		return -EPROTO;
 	}
 
@@ -1572,12 +1575,12 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -1587,8 +1590,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
-		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
-			atomic_read(&q->guc->state));
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Unexpected engine state 0x%04x",
+					  atomic_read(&q->guc->state));
 		return -EPROTO;
 	}
 
@@ -1611,7 +1615,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -1646,7 +1651,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -1667,12 +1673,12 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
-	struct xe_device *xe = guc_to_xe(guc);
 	u8 guc_class, instance;
 	u32 reason;
 
 	if (unlikely(len != 3)) {
-		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
+					  "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -1681,8 +1687,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
-		guc_class, instance, reason);
+	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE,
+				  "GuC engine reset request failed on %d:%d because 0x%08X",
+				  guc_class, instance, reason);
 
 	xe_gt_reset_async(guc_to_gt(guc));
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index def9369eb488..2d00baf2c127 100644
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
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
+					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
+					    bank, bit, ident);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..9ee62ff209eb 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	return 0;
 
 fail:
-	xe_gt_err(gt,
-		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-		  idx, e->clr_bits, e->set_bits,
-		  str_yes_no(e->reg.masked),
-		  str_yes_no(e->reg.mcr),
-		  ret);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
+				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
+				  idx, e->clr_bits, e->set_bits,
+				  str_yes_no(e->reg.masked),
+				  str_yes_no(e->reg.mcr),
+				  ret);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	return;
 
 err_force_wake:
-	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d\n", err);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -234,9 +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&sr->xa, reg, entry) {
 		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
+						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+						  hwe->name, RING_MAX_NONPRIV_SLOTS);
 			break;
 		}
 
@@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	return;
 
 err_force_wake:
-	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d\n", err);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 708dd385f2b1..0f0ec8f33a51 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -71,10 +71,17 @@
  *  - MOCS and PAT programming
  */
 
+const char *const xe_tile_drv_err_to_str[] = {
+	[XE_TILE_DRV_ERR_GTT] = "GTT",
+	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
+};
+
 /**
  * xe_tile_report_driver_error - Count driver error for tile
  * @tile: Tile to count error for
- * @err: enum error type
+ * @err: Enum error type
+ * @fmt: debug message format to print error
+ * @...: variable args to print error
  *
  * Increment the driver error counter in respective error
  * category for this tile.
@@ -82,11 +89,26 @@
  * Returns void.
  */
 void xe_tile_report_driver_error(struct xe_tile *tile,
-				 const enum xe_tile_drv_err_type err)
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...)
 {
+	struct va_format vaf;
+	va_list args;
+
 	xe_assert(tile_to_xe(tile), err >= ARRAY_SIZE(tile->drv_err_cnt));
 	WRITE_ONCE(tile->drv_err_cnt[err],
 		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
+
+	va_start(args, fmt);
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
+		     XE_TILE_DRV_ERR_MAX);
+
+	drm_err(&tile->xe->drm, "TILE%u [%s] %pV",
+		tile->id, xe_tile_drv_err_to_str[err], &vaf);
+	va_end(args);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 092a6b17a97e..1e23acdb9c81 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,7 +14,9 @@ int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
+extern const char *const xe_tile_drv_err_to_str[];
 void xe_tile_report_driver_error(struct xe_tile *tile,
-				 const enum xe_tile_drv_err_type err);
+				 const enum xe_tile_drv_err_type err,
+				 const char *fmt, ...);
 
 #endif
-- 
2.25.1

