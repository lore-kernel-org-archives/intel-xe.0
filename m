Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E037ACD4959
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 05:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2D10E4AA;
	Thu, 21 Sep 2023 05:55:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF76C10E0B6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695275724; x=1726811724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZILhzIWgseojnpcicAU7E1GRS7ssQiK3/cHPFt/YBHg=;
 b=nmgQ3k6LlI7DQti79VyMlzJ+EU+KZB1dPUXeONjEg1FcUpe2LFFDCp7Z
 wN9IXqxv00O8DeeIJgWHwMhgI4lQ4paX6tuL2VCbAk68Kf3Yt1/9dQTyE
 k4/9kucUP8uXt1rSPFqui6rfacWDL4btoifSTII45xhWDLNkmnxKBfaYf
 ln+/otpfSO6IUdzU/CeegwQ558yzS70/x2OO9DpyvhPPxd8eVIMYTqCoP
 N851XV44Ge2zkMc1Mu4IS0aP6UefQhMa9HjCITfG/qC5i8tFlFDHCJG83
 1phGTjzGEjjmgdEkVbIgU2jYLKjWEC+n0/73iMNQCaNZG9JSO2Xg1uw+7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444528072"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="444528072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 22:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993939381"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="993939381"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 22:55:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 11:33:14 +0530
Message-Id: <20230921060314.5933-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921060314.5933-1-tejas.upadhyay@intel.com>
References: <20230921060314.5933-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Update counter for low level driver
 errors
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
Cc: Matt Roper <matthew.d.roper@intel.com>
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
driver_gt_enginei_other,
driver_gt_other

Under Tile:
driver_ggtt,
driver_guc_communication,
driver_interrupt

TODO: Currently this is just a counting of errors, later these
counters will be reported through netlink interface when it is
implemented and ready.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
 drivers/gpu/drm/xe/xe_guc.c                 |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 20 ++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.c              | 10 ++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_irq.c                 |  1 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++++
 7 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..e9d0ec662e0e 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,6 +37,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
 		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
 			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_cnt_drv_err(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -331,6 +332,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	if (!ret) {
 		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
 			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_cnt_drv_err(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..19a5cf6c6484 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -665,6 +665,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 timeout:
 		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
 			request[0], reply);
+		xe_tile_cnt_drv_err(gt_to_tile(gt), XE_TILE_DRV_ERR_GUC_COMM);
 		return ret;
 	}
 
@@ -699,6 +700,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
 			request[0], error, hint);
+		xe_tile_cnt_drv_err(gt_to_tile(gt), XE_TILE_DRV_ERR_GUC_COMM);
 		return -ENXIO;
 	}
 
@@ -707,6 +709,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 proto:
 		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
 			request[0], header);
+		xe_tile_cnt_drv_err(gt_to_tile(gt), XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2046bd269bbd..b17c152dd54b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -690,6 +690,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			    u32 *response_buffer, bool no_fail)
 {
+	struct xe_tile *tile = gt_to_tile(ct_to_gt(ct));
 	struct xe_device *xe = ct_to_xe(ct);
 	struct g2h_fence g2h_fence;
 	int ret = 0;
@@ -734,6 +735,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (!ret) {
 		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
 			g2h_fence.seqno, action[0]);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
@@ -741,11 +743,13 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.retry) {
 		drm_warn(&xe->drm, "Send retry, action 0x%04x, reason %d",
 			 action[0], g2h_fence.reason);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		goto retry;
 	}
 	if (g2h_fence.fail) {
 		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
 			action[0], g2h_fence.error, g2h_fence.hint);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		ret = -EIO;
 	}
 
@@ -829,6 +833,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(ct_to_gt(ct));
 	struct xe_device *xe = ct_to_xe(ct);
 	u32 hxg, origin, type;
 	int ret;
@@ -842,6 +847,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, origin=%d, reset required\n",
 			origin);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -861,6 +867,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, type=%d, reset required\n",
 			type);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -871,6 +878,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(ct_to_gt(ct));
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
 	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
@@ -919,17 +927,21 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 	}
 
-	if (ret)
+	if (ret) {
 		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
 			action, ret);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
+	}
 
 	return 0;
 }
 
 static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 {
+	struct xe_tile *tile = gt_to_tile(ct_to_gt(ct));
 	struct xe_device *xe = ct_to_xe(ct);
 	struct guc_ctb *g2h = &ct->ctbs.g2h;
 	u32 tail, head, len;
@@ -960,6 +972,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			avail, len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1006,6 +1019,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(ct_to_gt(ct));
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
 	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[1]);
@@ -1026,9 +1040,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_warn(&xe->drm, "NOT_POSSIBLE");
 	}
 
-	if (ret)
+	if (ret) {
 		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
 			action, ret);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8a4d299d6cb0..e5b743164d9d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -182,6 +182,7 @@ static int pc_action_shutdown(struct xe_guc_pc *pc)
 
 static int pc_action_query_task_state(struct xe_guc_pc *pc)
 {
+	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 	u32 action[] = {
@@ -196,15 +197,18 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
+	if (ret) {
 		drm_err(&pc_to_xe(pc)->drm,
 			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
 
 static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 {
+	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
 	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
 	int ret;
 	u32 action[] = {
@@ -218,9 +222,11 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
 			ERR_PTR(ret));
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19abd2628ad6..70976b49b119 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1492,17 +1492,20 @@ int xe_guc_submit_start(struct xe_guc *guc)
 static struct xe_exec_queue *
 g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
 		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
 		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
@@ -1526,12 +1529,14 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 2)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1543,6 +1548,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		     !exec_queue_pending_disable(q))) {
 		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
 			atomic_read(&q->guc->state));
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1571,12 +1577,14 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1588,6 +1596,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
 		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
 			atomic_read(&q->guc->state));
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1605,12 +1614,14 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1640,12 +1651,14 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	u32 guc_id = msg[0];
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1666,12 +1679,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
+	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
 	struct xe_device *xe = guc_to_xe(guc);
 	u8 guc_class, instance;
 	u32 reason;
 
 	if (unlikely(len != 3)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_tile_cnt_drv_err(tile, XE_TILE_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1682,6 +1697,7 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	/* Unexpected failure of a hardware feature, log an actual error */
 	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
 		guc_class, instance, reason);
+	xe_gt_cnt_drv_err(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
 
 	xe_gt_reset_async(guc_to_gt(guc));
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ccb934f8fa34..a650c1b2b537 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -224,6 +224,7 @@ gt_engine_identity(struct xe_device *xe,
 	if (unlikely(!(ident & INTR_DATA_VALID))) {
 		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
 			bank, bit, ident);
+		xe_tile_cnt_drv_err(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..597dd7970ada 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -131,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  str_yes_no(e->reg.masked),
 		  str_yes_no(e->reg.mcr),
 		  ret);
+	xe_gt_cnt_drv_err(gt, XE_GT_DRV_ERR_OTHERS);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -208,6 +209,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 err_force_wake:
 	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_cnt_drv_err(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -237,6 +239,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 			xe_gt_err(gt,
 				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
 				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_gt_cnt_drv_err(gt, XE_GT_DRV_ERR_ENGINE);
 			break;
 		}
 
@@ -260,6 +263,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 err_force_wake:
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_gt_cnt_drv_err(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 /**
-- 
2.25.1

