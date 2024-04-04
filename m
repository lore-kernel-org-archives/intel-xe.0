Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579A2CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1211346D;
	Thu,  4 Apr 2024 19:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFKabbGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CBE11346D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712259423; x=1743795423;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IK4zWfGV2NGLVHoh6Gp5Vdu3txHc/e8NAYoS3saBA6s=;
 b=iFKabbGqkDj3mmuDjmPpWWd2PFPT9S/7wuHjjKeIm0R4qmX+OWj9JVv9
 m30GMj96FLN4Io4S+btfGubuab9/YEnhv4o+vFmvV+YMrOCrpT3vd4P7L
 m4QyStNRaLVnF10BHY8Q4epVTw2Oq0kIAJ019arxTNkOP7W9FFKD8kjIZ
 1KJYtZ5xNV4VXUCgpQxAqtLtHKtvrl8SMjuAGjtw9Jc3zsxB34nU4VHbe
 XWU8LpHRS4O+HVMtU1MhQRwdu2EGejznVchGzc6k3yYOUYsZlxMK1SXpd
 2kCi7VA9x0LuLCPwtvW8nHXkqi2o3OgU0kpYJdS2t0LkLjTcE70cqaOhT w==;
X-CSE-ConnectionGUID: eSXdDxSiRe+5wMgmnqvbxA==
X-CSE-MsgGUID: OWShkjtgRCeRo2uqHG7fsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19002455"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19002455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:58 -0700
X-CSE-ConnectionGUID: Eka/pu0BQ3GPTVgn7IstZg==
X-CSE-MsgGUID: njDIj0JVRBO5rdZTiK8Bag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19497256"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:36:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/guc: Prefer GT oriented asserts in CTB code
Date: Thu,  4 Apr 2024 21:36:46 +0200
Message-Id: <20240404193647.759-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240404193647.759-1-michal.wajdeczko@intel.com>
References: <20240404193647.759-1-michal.wajdeczko@intel.com>
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

GuC CTB is related to the GT, so best to use xe_gt_assert().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 74acc4784a37..06952b0480f7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -144,7 +144,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
-	xe_assert(xe, !(guc_ct_size() % PAGE_SIZE));
+	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
 	spin_lock_init(&ct->fast_lock);
 	xa_init(&ct->fence_lookup);
@@ -171,7 +171,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	if (err)
 		return err;
 
-	xe_assert(xe, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
 	ct->state = XE_GUC_CT_STATE_DISABLED;
 	return 0;
 }
@@ -321,7 +321,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	struct xe_gt *gt = ct_to_gt(ct);
 	int err;
 
-	xe_assert(xe, !xe_guc_ct_enabled(ct));
+	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
 
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
@@ -428,7 +428,7 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 
 static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
-	xe_assert(ct_to_xe(ct), g2h_len <= ct->ctbs.g2h.info.space);
+	xe_gt_assert(ct_to_gt(ct), g2h_len <= ct->ctbs.g2h.info.space);
 
 	if (g2h_len) {
 		lockdep_assert_held(&ct->fast_lock);
@@ -441,8 +441,8 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->fast_lock);
-	xe_assert(ct_to_xe(ct), ct->ctbs.g2h.info.space + g2h_len <=
-		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
+	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
+		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
 	ct->ctbs.g2h.info.space += g2h_len;
 	--ct->g2h_outstanding;
@@ -461,6 +461,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		     u32 ct_fence_value, bool want_response)
 {
 	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt = ct_to_gt(ct);
 	struct guc_ctb *h2g = &ct->ctbs.h2g;
 	u32 cmd[H2G_CT_HEADERS];
 	u32 tail = h2g->info.tail;
@@ -471,8 +472,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
-	xe_assert(xe, full_len <= GUC_CTB_MSG_MAX_LEN);
-	xe_assert(xe, tail <= h2g->info.size);
+	xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
+	xe_gt_assert(gt, tail <= h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
 	if (tail + full_len > h2g->info.size) {
@@ -521,7 +522,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);
 
-	trace_xe_guc_ctb_h2g(ct_to_gt(ct)->info.id, *(action - 1), full_len,
+	trace_xe_guc_ctb_h2g(gt->info.id, *(action - 1), full_len,
 			     desc_read(xe, h2g, head), h2g->info.tail);
 
 	return 0;
@@ -550,15 +551,15 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 				u32 len, u32 g2h_len, u32 num_g2h,
 				struct g2h_fence *g2h_fence)
 {
-	struct xe_device *xe = ct_to_xe(ct);
+	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
 	u16 seqno;
 	int ret;
 
-	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
-	xe_assert(xe, !g2h_len || !g2h_fence);
-	xe_assert(xe, !num_g2h || !g2h_fence);
-	xe_assert(xe, !g2h_len || num_g2h);
-	xe_assert(xe, g2h_len || !num_g2h);
+	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, !g2h_len || !g2h_fence);
+	xe_gt_assert(gt, !num_g2h || !g2h_fence);
+	xe_gt_assert(gt, !g2h_len || num_g2h);
+	xe_gt_assert(gt, g2h_len || !num_g2h);
 	lockdep_assert_held(&ct->lock);
 
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
@@ -576,7 +577,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 		goto out;
 	}
 
-	xe_assert(xe, xe_guc_ct_enabled(ct));
+	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
 	if (g2h_fence) {
 		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
@@ -639,7 +640,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
-	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
+	xe_gt_assert(gt, !g2h_len || !g2h_fence);
 	lockdep_assert_held(&ct->lock);
 	xe_device_assert_mem_access(ct_to_xe(ct));
 
@@ -709,7 +710,7 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	int ret;
 
-	xe_assert(ct_to_xe(ct), !g2h_len || !g2h_fence);
+	xe_gt_assert(ct_to_gt(ct), !g2h_len || !g2h_fence);
 
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
@@ -901,7 +902,6 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
 static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 {
 	struct xe_gt *gt =  ct_to_gt(ct);
-	struct xe_device *xe = gt_to_xe(gt);
 	u32 *hxg = msg_to_hxg(msg);
 	u32 hxg_len = msg_len_to_hxg_len(len);
 	u32 fence = FIELD_GET(GUC_CTB_MSG_0_FENCE, msg[0]);
@@ -939,7 +939,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		return 0;
 	}
 
-	xe_assert(xe, fence == g2h_fence->seqno);
+	xe_gt_assert(gt, fence == g2h_fence->seqno);
 
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
@@ -1087,7 +1087,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	u32 action;
 	u32 *hxg;
 
-	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
+	xe_gt_assert(gt, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
 	lockdep_assert_held(&ct->fast_lock);
 
 	if (ct->state == XE_GUC_CT_STATE_DISABLED)
@@ -1099,7 +1099,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
 	if (g2h->info.broken)
 		return -EPIPE;
 
-	xe_assert(xe, xe_guc_ct_enabled(ct));
+	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
 
 	/* Calculate DW available to read */
 	tail = desc_read(xe, g2h, tail);
-- 
2.43.0

