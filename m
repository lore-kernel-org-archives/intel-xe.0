Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A81CA0FF9
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0A10E6B8;
	Tue, 26 Aug 2025 18:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krzjgxOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAD310E3A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756232957; x=1787768957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZ0Lu9GK6FeMZYBREt4xfQhIl5hWtANBGmHfpNPgrzI=;
 b=krzjgxOPXBKXfYe1gzzplM3hEUzSOwxfqVHz8ynaU6CsFHxx3BHMA16b
 EzjNbYm1oVR1b2rFtdZvv/Phll9yZUVeDzuBT8/AgKpEKYCARKM8RjYIl
 uBEcRDT/URZ+rgAdzcIt4Z4pRrRUM4NCiOUZcPm1bNkjJVam4zzScUJdC
 RaJj+qEVA6tdrWn05nKuuxovnerauAMiKNio+sH/5ixlpJ+toFUq5qf5y
 UTOcaGuHqWLRLtPR2LBVwpJhhVjoDdSvAWx1CXm4LFIzZrEEFwoHOjwEU
 w3EAlE2JIXplE8/kHCos4NCAt64xlpyH4eb8e4sm7ZAzHOIbbEZKY4fUz Q==;
X-CSE-ConnectionGUID: eIavCPk4Sh+OgyPTNI91sw==
X-CSE-MsgGUID: D0kVbI2xTnKg1JdjI/PKpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="76080654"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="76080654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:17 -0700
X-CSE-ConnectionGUID: mFwqnGhoSoOSJynYzs9mHw==
X-CSE-MsgGUID: 3uiG/EsMTnChUIYGexL0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173800846"
Received: from dut137arlu.fm.intel.com ([10.105.23.75])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:29:14 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/9] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Tue, 26 Aug 2025 18:29:07 +0000
Message-Id: <20250826182911.392550-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826182911.392550-1-stuart.summers@intel.com>
References: <20250826182911.392550-1-stuart.summers@intel.com>
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
index 1571fd917830..37b3b45ec230 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
@@ -506,27 +506,18 @@ void xe_gt_tlb_inval_vm(struct xe_gt *gt, struct xe_vm *vm)
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
@@ -543,12 +534,12 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
@@ -568,6 +559,28 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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

