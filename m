Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DACCA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 23:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BDD10E81D;
	Wed, 20 Aug 2025 23:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqKOsL1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC81410E80B
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755732660; x=1787268660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JyS/D7ho0fDtwoLMFUuNCCIb/I7OFBO9eB0IuHJw5jI=;
 b=fqKOsL1I20wk84oMUHYtQJj0ljEyzfd9h/oZmaz2GZxD2AfYo138kG2C
 EkjHHcUJoGUPNnvrtt4ws9roaJv8WSwa+jLOj/PjY4oVgz9CXnoIt/xJP
 Kf64jwF4XkJmIoO9opHqsS3VHEKeeOqV+95Su9gNRHI6YFJ/CKzMV9Xxx
 z5HJsQYevJFz2/MWPDXQuXaF7ymKhXORQj6kUZO6dCbWi1NIPuR3dsZJB
 QrIbrUgdyLc3m2Arbpa01DmUfUTKBxKDk27EuQYW8sjxJEgbJx4VzW+Ay
 sOe3//am66oOY4IVpNtAdFs+8vSkkEtVDZ1aTTP6/BhqwEZjLhlG/HjbA Q==;
X-CSE-ConnectionGUID: Bsb2ACJHQKKc6DlQb4pQ4g==
X-CSE-MsgGUID: k40YSHYqTwu4KXxK1TZFMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45586302"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="45586302"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
X-CSE-ConnectionGUID: bLKHBk0JR1SPQxOqhuy7cg==
X-CSE-MsgGUID: tWSFV7KsQm6KZLbJF8oTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167470931"
Received: from dut137arlu.fm.intel.com ([10.105.23.66])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 16:30:59 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 farah.kassabri@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/9] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Wed, 20 Aug 2025 23:30:53 +0000
Message-Id: <20250820233057.83894-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250820233057.83894-1-stuart.summers@intel.com>
References: <20250820233057.83894-1-stuart.summers@intel.com>
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
index 2cd5ae49dfcf..cf28e6f5546a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval.c
@@ -515,27 +515,18 @@ void xe_gt_tlb_inval_vm(struct xe_gt *gt, struct xe_vm *vm)
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
@@ -552,12 +543,12 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
@@ -577,6 +568,28 @@ int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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

