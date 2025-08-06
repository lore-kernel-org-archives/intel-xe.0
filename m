Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3E2CA0EC0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 22:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94110E7CE;
	Wed,  6 Aug 2025 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QENoKwBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D6A10E31E
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754519047; x=1786055047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QHgTnMdgPa3+g3wJhlJtpam6pTwPnTkEA0XDB3fJK64=;
 b=QENoKwBe5N53GXJ+peHh6j5PwjYv0CW/BPgY6p2FA2b5eQ7v0qsykxN/
 +t1t5K2b1RU91IKoHrikWqbYygn25zjHvSQ9AvEFg8D4+QCx8Qdbf/+ux
 g0+hMgWUTZwZ8cBJ2JJzAq7n0TwKEhXX7gHTJmnz4ZBlfi08yZzTfVWVl
 pLys2FPUMk3cqdwz3wehAo63kNGv5bk1G/cy11ZFA6+kPr+cFeqFihsaO
 KzS43/2c9T09kl3lCHgg5yjtyJonvzl2aCl61VV2dI70BK/pgtcRy4/0q
 C9ORfO757l6t7SZ5mmFCyx8E7UpvIc1I1ujq0nNxLs6HDrTjCcZr1Hl7a A==;
X-CSE-ConnectionGUID: lyU+6iXrSMG5sGbJz8sNkw==
X-CSE-MsgGUID: lDXHlfAzRXCl3oc/qTe9Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56928152"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56928152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:07 -0700
X-CSE-ConnectionGUID: vZf4tKiDQK2N46fg9jz4JQ==
X-CSE-MsgGUID: 5/E1jiIZR2KWXwcPhK5+OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="188560828"
Received: from dut136arlu.fm.intel.com ([10.105.23.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 15:24:07 -0700
From: stuartsummers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, farah.kassabri@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/8] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Wed,  6 Aug 2025 22:24:00 +0000
Message-Id: <20250806222404.30333-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806222404.30333-1-stuart.summers@intel.com>
References: <20250806222404.30333-1-stuart.summers@intel.com>
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

