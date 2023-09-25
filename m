Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE15CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 14:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2585710E256;
	Mon, 25 Sep 2023 14:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C310E256
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695651375; x=1727187375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5QMJkrLF1lAba/ScXRqkaAacNXyq/41zNlae0LcGl8=;
 b=cluY6sDOi+aJnbpwXiPfJZjX2/8fTK3iw9pNKrHLFwb/xmLWzoZZ3f7B
 7dUQToTg35Tw0c+/CytWwNLIC/qqHwA6B/1jACD7nSGTA6lzPHY/ef9xl
 iDOYXruAzgdkwVXydWZgze3ikJZz3cMVd3I/pwF9ABS9BoYU+VR5aYlDZ
 +CEvD4EQ1kNe0y8vmSs+sRIFPgtL23jZPLSB8q2FqdtiVxEUMUDwXvjMx
 wd+pAhra/zAJ7mGnrT8vCq0g1X5WGnWgwpYp00BeTnx4BZvncsSV05dE6
 F5dqM+YWK8u1V8/x30XwRxjjHnxK4KhkACHXXqEJV0jUzlICWAC6iIAyJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380133960"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="380133960"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725001687"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="725001687"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2023 07:16:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 19:54:09 +0530
Message-Id: <20230925142409.189969-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925142409.189969-1-tejas.upadhyay@intel.com>
References: <20230925142409.189969-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 2/2] drm/xe: Update counter for low level
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

V2:
  - Use modified APIs

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
 drivers/gpu/drm/xe/xe_guc.c                 |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  8 ++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 10 ++++++++++
 drivers/gpu/drm/xe/xe_irq.c                 |  1 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++++
 7 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bd6005b9d498..0a9c96316599 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,6 +37,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
 		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
 			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 
 		list_del(&fence->link);
 		fence->base.error = -ETIME;
@@ -331,6 +332,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	if (!ret) {
 		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
 			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GGTT);
 		return -ETIME;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 84f0b5488783..2f3f3b814455 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -665,6 +665,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 timeout:
 		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
 			request[0], reply);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return ret;
 	}
 
@@ -699,6 +700,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
 			request[0], error, hint);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -ENXIO;
 	}
 
@@ -707,6 +709,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 proto:
 		drm_err(&xe->drm, "mmio request %#x: unexpected reply %#x\n",
 			request[0], header);
+		xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2046bd269bbd..1dbfea2f39ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -734,6 +734,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (!ret) {
 		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
 			g2h_fence.seqno, action[0]);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
@@ -746,6 +747,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	if (g2h_fence.fail) {
 		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
 			action[0], g2h_fence.error, g2h_fence.hint);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ret = -EIO;
 	}
 
@@ -842,6 +844,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, origin=%d, reset required\n",
 			origin);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -861,6 +864,7 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, type=%d, reset required\n",
 			type);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -919,11 +923,13 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		break;
 	default:
 		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 	}
 
 	if (ret)
 		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
 			action, ret);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 
 	return 0;
 }
@@ -960,6 +966,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 		drm_err(&xe->drm,
 			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
 			avail, len);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1026,9 +1033,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		drm_warn(&xe->drm, "NOT_POSSIBLE");
 	}
 
-	if (ret)
+	if (ret) {
 		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
 			action, ret);
+		xe_gt_report_driver_error(ct_to_gt(ct), XE_GT_DRV_ERR_GUC_COMM);
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8a4d299d6cb0..c9501229a0ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
 
 	/* Blocking here to ensure the results are ready before reading them */
 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
-	if (ret)
+	if (ret) {
 		drm_err(&pc_to_xe(pc)->drm,
 			"GuC PC query task state failed: %pe", ERR_PTR(ret));
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
@@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret)
+	if (ret) {
 		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
 			ERR_PTR(ret));
+		xe_gt_report_driver_error(pc_to_gt(pc), XE_GT_DRV_ERR_GUC_COMM);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19abd2628ad6..ba4494c3981b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1497,12 +1497,14 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 
 	if (unlikely(guc_id >= GUC_ID_MAX)) {
 		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
 	if (unlikely(!q)) {
 		drm_err(&xe->drm, "Not engine present for guc_id %u", guc_id);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return NULL;
 	}
 
@@ -1532,6 +1534,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(len < 2)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1543,6 +1546,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		     !exec_queue_pending_disable(q))) {
 		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
 			atomic_read(&q->guc->state));
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1577,6 +1581,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1588,6 +1593,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
 		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
 			atomic_read(&q->guc->state));
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1611,6 +1617,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1646,6 +1653,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	if (unlikely(len < 1)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1672,6 +1680,7 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 
 	if (unlikely(len != 3)) {
 		drm_err(&xe->drm, "Invalid length %u", len);
+		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM);
 		return -EPROTO;
 	}
 
@@ -1682,6 +1691,7 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	/* Unexpected failure of a hardware feature, log an actual error */
 	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because 0x%08X",
 		guc_class, instance, reason);
+	xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_ENGINE);
 
 	xe_gt_reset_async(guc_to_gt(guc));
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 504cb94d0ee8..654c9f34b162 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -224,6 +224,7 @@ gt_engine_identity(struct xe_device *xe,
 	if (unlikely(!(ident & INTR_DATA_VALID))) {
 		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
 			bank, bit, ident);
+		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 87adefb56024..2b3fe4ff2009 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -131,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 		  str_yes_no(e->reg.masked),
 		  str_yes_no(e->reg.mcr),
 		  ret);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 	reg_sr_inc_error(sr);
 
 	return ret;
@@ -208,6 +209,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 
 err_force_wake:
 	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
@@ -237,6 +239,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 			xe_gt_err(gt,
 				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
 				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE);
 			break;
 		}
 
@@ -260,6 +263,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 err_force_wake:
 	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
+	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
 }
 
 /**
-- 
2.25.1

