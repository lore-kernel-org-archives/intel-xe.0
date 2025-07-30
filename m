Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38EC87FCC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB4410E45F;
	Wed, 30 Jul 2025 20:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibQYKBoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C7A10E6DC
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753908327; x=1785444327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QHgTnMdgPa3+g3wJhlJtpam6pTwPnTkEA0XDB3fJK64=;
 b=ibQYKBoiL2ROgKTm3xUVSExp4AlfqUt6krvI/aN+N+Rwwfa24+ld0F2B
 8GNzTMCLwagU37OaEZffV6ag6ud3ON1/gYJZpansUyHuRdsom+46tiWk9
 AV3BjAfOEKBWfRd3vkqndrBSJGNyJxQo2USjyqj35cjr0ygReRPDFRyfU
 IdHxN7amrUpYFfm7NDZ3a5LP4n0fOGQTvQ1dh+/p7psxpiT2xVFR0Xstr
 2ldARhStSQvi6GvA3yDC/cLtN1RSpnE5Mx9DGRunjkS700+Dirg2KjH2X
 9uxfDoxAMTzOVfSiRzsR0G0c4JZaT6Cp1C/Ag71nfcybB5u4QcgPmmR1i w==;
X-CSE-ConnectionGUID: iNAioxASQkmYlNBRWl8iLQ==
X-CSE-MsgGUID: e4VQOJCBSCuSxO4/GwC3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60046389"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="60046389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:45:17 -0700
X-CSE-ConnectionGUID: eRI2It0ZQqi2ArQpdCX4xw==
X-CSE-MsgGUID: 76+RpmMtQlaDb3wva/FSRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193925771"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT136ARLU.fm.intel.com) ([10.105.23.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:45:17 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/8] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Wed, 30 Jul 2025 20:45:10 +0000
Message-Id: <20250730204514.76459-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730204514.76459-1-stuart.summers@intel.com>
References: <20250730204514.76459-1-stuart.summers@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

Decouple GT TLB seqno handling from G2H handler.

v2:
 - Add kernel doc

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_inval.c | 47 ++++++++++++++++++----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval.c b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
index 188e09124887..3e69aab4a01d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
@@ -483,27 +483,18 @@ void xe_gt_tlb_inval_vm(struct xe_gt *gt, struct xe_vm *vm)
 }
 
 /**
- * xe_guc_tlb_inval_done_handler - TLB invalidation done handler
- * @guc: guc
- * @msg: message indicating TLB invalidation done
- * @len: length of message
- *
- * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
- * invalidation fences for seqno. Algorithm for this depends on seqno being
- * received in-order and asserts this assumption.
+ * xe_gt_tlb_inval_done_handler - GT TLB invalidation done handler
+ * @gt: gt
+ * @seqno: seqno of invalidation that is done
  *
- * Return: 0 on success, -EPROTO for malformed messages.
+ * Update recv seqno, signal any GT TLB invalidation fences, and restart TDR
  */
-int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+static void xe_gt_tlb_inval_done_handler(struct xe_gt *gt, int seqno)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_inval_fence *fence, *next;
 	unsigned long flags;
 
-	if (unlikely(len != 1))
-		return -EPROTO;
-
 	/*
 	 * This can also be run both directly from the IRQ handler and also in
 	 * process_g2h_msg(). Only one may process any individual CT message,
@@ -520,12 +511,12 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&gt->tlb_inval.pending_lock, flags);
-	if (tlb_inval_seqno_past(gt, msg[0])) {
+	if (tlb_inval_seqno_past(gt, seqno)) {
 		spin_unlock_irqrestore(&gt->tlb_inval.pending_lock, flags);
-		return 0;
+		return;
 	}
 
-	WRITE_ONCE(gt->tlb_inval.seqno_recv, msg[0]);
+	WRITE_ONCE(gt->tlb_inval.seqno_recv, seqno);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_inval.pending_fences, link) {
@@ -545,6 +536,28 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		cancel_delayed_work(&gt->tlb_inval.fence_tdr);
 
 	spin_unlock_irqrestore(&gt->tlb_inval.pending_lock, flags);
+}
+
+/**
+ * xe_guc_tlb_inval_done_handler - TLB invalidation done handler
+ * @guc: guc
+ * @msg: message indicating TLB invalidation done
+ * @len: length of message
+ *
+ * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
+ * invalidation fences for seqno. Algorithm for this depends on seqno being
+ * received in-order and asserts this assumption.
+ *
+ * Return: 0 on success, -EPROTO for malformed messages.
+ */
+int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (unlikely(len != 1))
+		return -EPROTO;
+
+	xe_gt_tlb_inval_done_handler(gt, msg[0]);
 
 	return 0;
 }
-- 
2.34.1

