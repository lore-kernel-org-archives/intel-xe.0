Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B59C3DA4C
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC99B10E1E6;
	Mon,  8 Jul 2024 04:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMXEx5Hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DAD10E012
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411371; x=1751947371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YFVozRLo/S07vBtesJrdm5jhM9jy7JZ5z3qYor2E/Gc=;
 b=MMXEx5HrLCfciEoDpw3LpeKAvl1AyLRI+qJsi6HmUlxKeHwWB7QfwSXq
 sTcXYjWeMVseBMPsv3fjX9bbQX7FwShU88V+47MdxRu81cDP/vAtXVzFH
 Km7FEVAhIw/Tq5RtzJT9iwBRErhDGsrcQfexw/IVluUWuLvMlGJS2gRXJ
 UzrmDgxXaCmVJovqXCi5LqODC1dOiliZUZjjHd4slzNOmsuUH5Bh0AZpF
 esgJ/jwx7vjhfAB68w4dfZr9GB/VKLB5YcwaNHg+zPCn1YmU4vZFQDxpM
 tmB7IvWT4V98BhaG0upzhmvnMnBAMITqvbu15ou69KjsisMNXK/SO4Iyk Q==;
X-CSE-ConnectionGUID: yXkbydOBRR6kyuWojTQ1uQ==
X-CSE-MsgGUID: ok+xkL2jSCWS6B81DisSaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205303"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205303"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:51 -0700
X-CSE-ConnectionGUID: lG2UaAKRTAq9GnM5ntgU8g==
X-CSE-MsgGUID: Nhaf0BpZQ7ixcEQavTDzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518776"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 05/11] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Sun,  7 Jul 2024 21:03:25 -0700
Message-Id: <20240708040331.766264-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708040331.766264-1-matthew.brost@intel.com>
References: <20240708040331.766264-1-matthew.brost@intel.com>
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

Decouple GT TLB seqno handling from G2H handler.

v2:
 - Add kernel doc

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 47 +++++++++++++--------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 9062d9f85ffb..2493ea91b637 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -412,27 +412,18 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 }
 
 /**
- * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
- * @guc: guc
- * @msg: message indicating TLB invalidation done
- * @len: length of message
+ * xe_gt_tlb_invalidation_done_handler - GT TLB invalidation done handler
+ * @gt: gt
+ * @seqno: seqno of invalidation that is done
  *
- * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
- * invalidation fences for seqno. Algorithm for this depends on seqno being
- * received in-order and asserts this assumption.
- *
- * Return: 0 on success, -EPROTO for malformed messages.
+ * Update recv seqno, signal any GT TLB invalidation fences, and restart TDR
  */
-int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+static void xe_gt_tlb_invalidation_done_handler(struct xe_gt *gt, int seqno)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 	unsigned long flags;
 
-	if (unlikely(len != 1))
-		return -EPROTO;
-
 	/*
 	 * This can also be run both directly from the IRQ handler and also in
 	 * process_g2h_msg(). Only one may process any individual CT message,
@@ -449,12 +440,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * process_g2h_msg().
 	 */
 	spin_lock_irqsave(&gt->tlb_invalidation.pending_lock, flags);
-	if (tlb_invalidation_seqno_past(gt, msg[0])) {
+	if (tlb_invalidation_seqno_past(gt, seqno)) {
 		spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
-		return 0;
+		return;
 	}
 
-	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, msg[0]);
+	WRITE_ONCE(gt->tlb_invalidation.seqno_recv, seqno);
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
@@ -474,6 +465,28 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
 
 	spin_unlock_irqrestore(&gt->tlb_invalidation.pending_lock, flags);
+}
+
+/**
+ * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
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
+int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (unlikely(len != 1))
+		return -EPROTO;
+
+	xe_gt_tlb_invalidation_done_handler(gt, msg[0]);
 
 	return 0;
 }
-- 
2.34.1

