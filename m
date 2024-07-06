Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A693C3DA44
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 00:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B9910E19F;
	Sat,  6 Jul 2024 00:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EExU2DXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD7E10E047
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 00:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720224138; x=1751760138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPOUi8yTaaIX4BtzQO9AnFk9cLpSpHkdlhnW3hpf0gI=;
 b=EExU2DXzFwLMUOe+Oo71PFKUSzy5/LeZ7I0Ey4uQvHQYPXGR0oO3H3z/
 3hV9lZ1ibp39SpNjW1ggYA/hWY1369JcpBWSFuroUD0Zpf+w7bum8HnNy
 cYlCBUdFRPygjUy4ey/AJ7aXNQfjEYflZiikDxy9hHTeMkXyMxik4DmTQ
 uj0bgdGz1sL5Ro3H5LhCYPzu+GueXVeqj6OzjnwATSnw2dq6PdHexxTso
 cxZFuTa91Jl26vNfWK6FFjfBDKxqK7YoPHdbxzafIuJeN5Xvpveo9D1Bg
 lJHm6SZf/DfzsBOPOaND74k2VIPxqK5aTRPqvx0Vz8PFkkilqeLRrvTwu w==;
X-CSE-ConnectionGUID: 6K3JkqQAT9yRoczMGsqArw==
X-CSE-MsgGUID: uG2c0fYTRwOoOQAmPPBKvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17464659"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17464659"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:14 -0700
X-CSE-ConnectionGUID: a7mhYd3nQfWhN+2/ekix9g==
X-CSE-MsgGUID: 4KRUHB1YS++Orms3MCZFfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="78128249"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 17:02:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com,
	michal.wajdeczko@intel.com
Subject: [PATCH 05/11] drm/xe: Add xe_gt_tlb_invalidation_done_handler
Date: Fri,  5 Jul 2024 17:02:46 -0700
Message-Id: <20240706000252.702044-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240706000252.702044-1-matthew.brost@intel.com>
References: <20240706000252.702044-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 46 ++++++++++++---------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e37436c140df..3eca77eb3211 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -413,28 +413,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 					    xe_vma_vm(vma)->usm.asid);
 }
 
-/**
- * xe_guc_tlb_invalidation_done_handler - TLB invalidation done handler
- * @guc: guc
- * @msg: message indicating TLB invalidation done
- * @len: length of message
- *
- * Parse seqno of TLB invalidation, wake any waiters for seqno, and signal any
- * invalidation fences for seqno. Algorithm for this depends on seqno being
- * received in-order and asserts this assumption.
- *
- * Return: 0 on success, -EPROTO for malformed messages.
- */
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
@@ -451,12 +435,12 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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
@@ -476,6 +460,28 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
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

