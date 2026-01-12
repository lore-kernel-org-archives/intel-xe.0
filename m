Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E1BCF45D9
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AA010E43B;
	Mon, 12 Jan 2026 23:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lh0OmR+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D884510E2BA
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260457; x=1799796457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FFGh2VbhC+gu5paSIHnQHffcQT+E5ZTl7lDas3ns+Q0=;
 b=Lh0OmR+dzs+Y2iZAMGHT2s2Fj6Z6/ub0I+wNHo+jMOlTXUE1FiESoPbR
 ZqUbetvYOM/n7jPDiSEpA7/tH6MDmipY455y+qi6o5qvjAWAWhANsCX7r
 EmIShtNyBMKZ4rdyx4WtLiqTz1Xoh8NjKaj+ayYHEMu/tSyLLwUsPz5i6
 FTYA6te23dt9eprthRsCOTlmItwpxYu0klEd59lESCYF19iCRhwRtt6Nn
 uCfCNA1ZACY3JY5wwoIgK3AafmSP+xqhErpIAsU9YHwAQRn19vJ9Wa27M
 2oylUVYyUq/wOC6MHfvJPPuoiBP+fopxGOmAmWw8bOh2Vh2L2y8m+Ermi A==;
X-CSE-ConnectionGUID: RWTv/9D/SNODF7TTkHUqtQ==
X-CSE-MsgGUID: K72J3FPCSIy8IpeD/Nqk+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594770"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594770"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
X-CSE-ConnectionGUID: AzvRa5GaS/e26fJhlaV0Mw==
X-CSE-MsgGUID: lrHhZEIwQOmYUJpaifc2KQ==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 07/11] drm/xe: Add send_tlb_inval_ppgtt helper
Date: Mon, 12 Jan 2026 15:27:26 -0800
Message-Id: <20260112232730.3347414-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Extract the common code that issues a TLB invalidation H2G for PPGTTs
into a helper function. This helper can be reused for both ASID-based
and context-based TLB invalidations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 30 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index a6a1c371a28e..070d2e2cb7c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -150,20 +150,16 @@ static u64 normalize_invalidation_range(struct xe_gt *gt, u64 *start, u64 *end)
  */
 #define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
 
-static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
-				     u64 start, u64 end, u32 asid,
-				     struct drm_suballoc *prl_sa)
+static int send_tlb_inval_ppgtt(struct xe_guc *guc, u32 seqno, u64 start,
+				u64 end, u32 id, u32 type,
+				struct drm_suballoc *prl_sa)
 {
 #define MAX_TLB_INVALIDATION_LEN	7
-	struct xe_guc *guc = tlb_inval->private;
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	u64 length = end - start;
 	int len = 0, err;
 
-	if (guc_to_xe(guc)->info.force_execlist)
-		return -ECANCELED;
-
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
 	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
@@ -174,14 +170,15 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 								 &end);
 
 		/* Flush on NULL case, Media is not required to modify flush due to no PPC so NOP */
-		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, !prl_sa);
-		action[len++] = asid;
+		action[len++] = MAKE_INVAL_OP_FLUSH(type, !prl_sa);
+		action[len++] = id;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(normalize_len) - ilog2(SZ_4K);
 	}
 
 	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
+#undef MAX_TLB_INVALIDATION_LEN
 
 	err = send_tlb_inval(guc, action, len);
 	if (!err && prl_sa)
@@ -189,6 +186,21 @@ static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
 	return err;
 }
 
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid,
+				     struct drm_suballoc *prl_sa)
+{
+	struct xe_guc *guc = tlb_inval->private;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	if (guc_to_xe(guc)->info.force_execlist)
+		return -ECANCELED;
+
+	return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
+				    XE_GUC_TLB_INVAL_PAGE_SELECTIVE, prl_sa);
+}
+
 static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
 {
 	struct xe_guc *guc = tlb_inval->private;
-- 
2.34.1

