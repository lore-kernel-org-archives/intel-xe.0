Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE592CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3E311346B;
	Thu,  4 Apr 2024 19:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktXgW6Zk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15CC11346B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712259423; x=1743795423;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x+ocEaRZR5ZGdUqVRV4uyiYTELCsVWvwYkX8r2Bss58=;
 b=ktXgW6ZkFyoCsRjHOFnkNkufb5CyoNApemoU8+oEKoLnPCpgEjHcqrNS
 xjJTdl9DjhISlHa8pJAgaSn1ck/ZKXHfAAGknKPmWZh2167gBfmkeFcpi
 QW+AYBrGl+44eOBVmvC0FDqbsscL4OoENpCjxUorAW7gglza2QnOpesFr
 zGN5NlxiDLakPWv2aE1r0o5SihEVmpuH8I3YCppdbrlL93AbPBz26dOQQ
 bOb1ZKV8zttfFvvwt8e9aUb04k7crcG64wv/tBkNXAHqOkG25VWyj7UE/
 yk8a2trTJjn1DvhnPSV0hGgkiOMcd890zt/dpXQLzL1vS2HVxga/XvTgH A==;
X-CSE-ConnectionGUID: HQMGC9dCQN69OWZXMhSIXA==
X-CSE-MsgGUID: 6Y5+UUnHQ1iarahjscIHxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19002450"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19002450"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:57 -0700
X-CSE-ConnectionGUID: 0Qrsh1xYSTy869Mka4AYog==
X-CSE-MsgGUID: QhioTaIUTaaXS6EZWLlisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19497249"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe/guc: Prefer GT oriented logs in GuC CTB code
Date: Thu,  4 Apr 2024 21:36:45 +0200
Message-Id: <20240404193647.759-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

A platform can have more than one GuC, so we should use GT-oriented
logs to refer to specific GuC.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 62 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 6c37f4f9bddd..74acc4784a37 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -318,6 +318,7 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
 int xe_guc_ct_enable(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	int err;
 
 	xe_assert(xe, !xe_guc_ct_enabled(ct));
@@ -341,12 +342,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	smp_mb();
 	wake_up_all(&ct->wq);
-	drm_dbg(&xe->drm, "GuC CT communication channel enabled\n");
+	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
 
 	return 0;
 
 err_out:
-	drm_err(&xe->drm, "Failed to enable CT (%d)\n", err);
+	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
@@ -633,8 +634,8 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			      u32 g2h_len, u32 num_g2h,
 			      struct g2h_fence *g2h_fence)
 {
-	struct drm_device *drm = &ct_to_xe(ct)->drm;
-	struct drm_printer p = drm_info_printer(drm->dev);
+	struct xe_gt *gt = ct_to_gt(ct);
+	struct drm_printer p = xe_gt_info_printer(gt);
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
@@ -696,7 +697,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret;
 
 broken:
-	drm_err(drm, "No forward process on H2G, reset required");
+	xe_gt_err(gt, "No forward process on H2G, reset required\n");
 	xe_guc_ct_print(ct, &p, true);
 	ct->ctbs.h2g.info.broken = true;
 
@@ -776,7 +777,7 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			    u32 *response_buffer, bool no_fail)
 {
-	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	struct g2h_fence g2h_fence;
 	int ret = 0;
 
@@ -818,20 +819,20 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
 	if (!ret) {
-		drm_err(&xe->drm, "Timed out wait for G2H, fence %u, action %04x",
-			g2h_fence.seqno, action[0]);
+		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
+			  g2h_fence.seqno, action[0]);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
 		return -ETIME;
 	}
 
 	if (g2h_fence.retry) {
-		drm_warn(&xe->drm, "Send retry, action 0x%04x, reason %d",
-			 action[0], g2h_fence.reason);
+		xe_gt_warn(gt, "H2G retry, action 0x%04x, reason %u",
+			   action[0], g2h_fence.reason);
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d, hint %d",
-			action[0], g2h_fence.error, g2h_fence.hint);
+		xe_gt_err(gt, "H2G send failed, action 0x%04x, error %d, hint %u",
+			  action[0], g2h_fence.error, g2h_fence.hint);
 		ret = -EIO;
 	}
 
@@ -966,7 +967,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	u32 *hxg = msg_to_hxg(msg);
 	u32 origin, type;
 	int ret;
@@ -975,9 +976,8 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
-		drm_err(&xe->drm,
-			"G2H channel broken on read, origin=%d, reset required\n",
-			origin);
+		xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
+			  origin);
 		ct->ctbs.g2h.info.broken = true;
 
 		return -EPROTO;
@@ -994,9 +994,8 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = parse_g2h_response(ct, msg, len);
 		break;
 	default:
-		drm_err(&xe->drm,
-			"G2H channel broken on read, type=%d, reset required\n",
-			type);
+		xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
+			  type);
 		ct->ctbs.g2h.info.broken = true;
 
 		ret = -EOPNOTSUPP;
@@ -1007,7 +1006,6 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	u32 hxg_len = msg_len_to_hxg_len(len);
@@ -1069,12 +1067,12 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
 		break;
 	default:
-		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
+		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
+			  action, ERR_PTR(ret));
 
 	return 0;
 }
@@ -1082,6 +1080,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 {
 	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	struct guc_ctb *g2h = &ct->ctbs.g2h;
 	u32 tail, head, len;
 	s32 avail;
@@ -1116,9 +1115,8 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 			   sizeof(u32));
 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
 	if (len > avail) {
-		drm_err(&xe->drm,
-			"G2H channel broken on read, avail=%d, len=%d, reset required\n",
-			avail, len);
+		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
+			  avail, len);
 		g2h->info.broken = true;
 
 		return -EPROTO;
@@ -1171,7 +1169,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 
 static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
-	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	struct xe_guc *guc = ct_to_guc(ct);
 	u32 hxg_len = msg_len_to_hxg_len(len);
 	u32 *hxg = msg_to_hxg(msg);
@@ -1190,12 +1188,12 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		drm_warn(&xe->drm, "NOT_POSSIBLE");
+		xe_gt_warn(gt, "NOT_POSSIBLE");
 	}
 
 	if (ret)
-		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d\n",
-			action, ret);
+		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
+			  action, ERR_PTR(ret));
 }
 
 /**
@@ -1256,6 +1254,7 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 static void g2h_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
+	struct xe_gt *gt = ct_to_gt(ct);
 	bool ongoing;
 	int ret;
 
@@ -1292,8 +1291,7 @@ static void g2h_worker_func(struct work_struct *w)
 		mutex_unlock(&ct->lock);
 
 		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
-			struct drm_device *drm = &ct_to_xe(ct)->drm;
-			struct drm_printer p = drm_info_printer(drm->dev);
+			struct drm_printer p = xe_gt_info_printer(gt);
 
 			xe_guc_ct_print(ct, &p, false);
 			kick_reset(ct);
-- 
2.43.0

