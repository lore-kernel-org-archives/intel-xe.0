Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE770CCD187
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDFC10E79C;
	Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNM5WrId";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF810E787
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384447; x=1790920447;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GUiIQ2o1buqwE+xsUomdIhup98iVBvG6NK4+1guaGRc=;
 b=LNM5WrIdv9JwY41pmMSqT6vyDfaUFQuQWYsvJE3EFpeTaqICPN2pDwdN
 FJUWNXTuG+Aqf7cGEyn4x92mNztD6ECxFkemLKS5WXjR+LbEknelQdQae
 P11VPPEsDUav1jkuActW/NseJp251K66KxFdWpSI73uFHQwenvsCi0O6M
 shjHzZOV6sugytUce2wq8P9Jk9xq+JrMaWDZHT6Q0nn4yLiUABtyNO7VJ
 vvHrHYxBVGRtM47MnShIEzLq9k+3Kde/z4E0vJSXziYSQxGZIK/Ktdf5j
 K6a5nFLqGP8Ht0OXnA3eYcHBWCWO2wb/szlydimiDMBtd13HCz/FOHIQU A==;
X-CSE-ConnectionGUID: SvucW/CHT2aAaCcHN85y2g==
X-CSE-MsgGUID: URLbd+JDRQCKQFf3GO+d7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304495"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:06 -0700
X-CSE-ConnectionGUID: JaBsfCDkSEyeXJtc6kA15w==
X-CSE-MsgGUID: HLkPfyxBQ66hi2zq7KSmKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083524"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 02/34] Revert "drm/xe/vf: Rebase exec queue parallel
 commands during migration recovery"
Date: Wed,  1 Oct 2025 22:53:30 -0700
Message-Id: <20251002055402.1865880-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

This reverts commit ba180a362128cb71d16c3f0ce6645448011d2607.

Due to change in the VF migration recovery design this code
is not needed any more.

v3:
 - Add commit message (Michal / Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ----
 drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ------------------------
 2 files changed, 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 31090c69dfbe..47756e4674a1 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -196,14 +196,6 @@ enum xe_guc_register_context_multi_lrc_param_offsets {
 	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN = 11,
 };
 
-enum xe_guc_context_wq_item_offsets {
-	XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN = 0,
-	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
-	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS,
-	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID,
-	XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL,
-};
-
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 53024eb5670b..3ac0950f55be 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -735,18 +735,12 @@ static void wq_item_append(struct xe_exec_queue *q)
 	if (wq_wait_for_space(q, wqi_size))
 		return;
 
-	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN);
 	wqi[i++] = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
 		FIELD_PREP(WQ_LEN_MASK, len_dw);
-	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW);
 	wqi[i++] = xe_lrc_descriptor(q->lrc[0]);
-	xe_gt_assert(guc_to_gt(guc), i ==
-		     XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS);
 	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
 		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc[0]->ring.tail / sizeof(u64));
-	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID);
 	wqi[i++] = 0;
-	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL);
 	for (j = 1; j < q->width; ++j) {
 		struct xe_lrc *lrc = q->lrc[j];
 
@@ -767,50 +761,6 @@ static void wq_item_append(struct xe_exec_queue *q)
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
 }
 
-static int wq_items_rebase(struct xe_exec_queue *q)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
-	int i = q->guc->wqi_head;
-
-	/* the ring starts after a header struct */
-	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
-
-	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
-		u32 len_dw, type, val;
-
-		if (drm_WARN_ON_ONCE(&xe->drm, i < 0 || i > 2 * WQ_SIZE))
-			break;
-
-		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) +
-					 XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN,
-					 WQ_SIZE / sizeof(u32));
-		len_dw = FIELD_GET(WQ_LEN_MASK, val);
-		type = FIELD_GET(WQ_TYPE_MASK, val);
-
-		if (drm_WARN_ON_ONCE(&xe->drm, len_dw >= WQ_SIZE / sizeof(u32)))
-			break;
-
-		if (type == WQ_TYPE_MULTI_LRC) {
-			val = xe_lrc_descriptor(q->lrc[0]);
-			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) +
-					   XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
-					   WQ_SIZE / sizeof(u32), val);
-		} else if (drm_WARN_ON_ONCE(&xe->drm, type != WQ_TYPE_NOOP)) {
-			break;
-		}
-
-		i += (len_dw + 1) * sizeof(u32);
-	}
-
-	if ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
-		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
-		return -EBADMSG;
-	}
-	return 0;
-}
-
 #define RESUME_PENDING	~0x0ull
 static void submit_exec_queue(struct xe_exec_queue *q)
 {
@@ -2669,10 +2619,6 @@ int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
 		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
 		if (err)
 			break;
-		if (xe_exec_queue_is_parallel(q))
-			err = wq_items_rebase(q);
-		if (err)
-			break;
 	}
 	mutex_unlock(&guc->submission_state.lock);
 
-- 
2.34.1

