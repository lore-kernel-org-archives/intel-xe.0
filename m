Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284E4C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 04:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9FE10E093;
	Mon,  8 Jul 2024 04:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJFgrGCm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F3910E093
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 04:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720411371; x=1751947371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/fEiBIASVaj8vuc7DpjHafCM/EJYK4ZkyHIEJL61iYU=;
 b=ZJFgrGCmwFTxr7SeE7aZjcLvoU9FOJyck9VzAU5Alim6/eUl/WXTwiPR
 Cd8PcIqvQqBKasrZ1CX/lE8j4c1Rima1DU65JyK0puUfIAX9DvOTIyQMX
 SQCjKLl5UN1CQW4j7uoHXENwqcVXM6s8PDyAVIbiJGs1CptHcrK6lgPbw
 BfGu9Vm10cY/FAwF7DPHmr7oXXQlyyXJgtv3bR71vreY0PFClQp3dkcnh
 N80yCmCMOspdxrriAB7DcnRSFAA4NQIAbcIqESYRdUV4I+Pxn2g7GPJLb
 dE4Zi2gXWo36tImTcdG8A0HBJ2c58+pzTzLIbrjo2nx2WuiV76hRhqv4i w==;
X-CSE-ConnectionGUID: KRGXEObARjOgm7LGa1evug==
X-CSE-MsgGUID: waB2TA8uSkW6u/Q1bqfvrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28205301"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="28205301"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:51 -0700
X-CSE-ConnectionGUID: uCOQdexwTeayzoE1lgLPeA==
X-CSE-MsgGUID: H14QKPkuRSS0lnqtdLN3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="78518770"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 21:02:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v2 03/11] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Date: Sun,  7 Jul 2024 21:03:23 -0700
Message-Id: <20240708040331.766264-4-matthew.brost@intel.com>
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

tlb_invalidation.lock is the lock for GT TLB invalidation fences, name
this accurately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
 drivers/gpu/drm/xe/xe_gt_types.h            | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 687214d07ac7..147840b66ba9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -80,7 +80,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	gt->tlb_invalidation.seqno = 1;
 	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
 	spin_lock_init(&gt->tlb_invalidation.pending_lock);
-	spin_lock_init(&gt->tlb_invalidation.lock);
+	spin_lock_init(&gt->tlb_invalidation.fence_lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
 
@@ -491,11 +491,11 @@ static const struct dma_fence_ops invalidation_fence_ops = {
 void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
 				       struct xe_gt_tlb_invalidation_fence *fence)
 {
-	spin_lock_irq(&gt->tlb_invalidation.lock);
+	spin_lock_irq(&gt->tlb_invalidation.fence_lock);
 	dma_fence_init(&fence->base, &invalidation_fence_ops,
-		       &gt->tlb_invalidation.lock,
+		       &gt->tlb_invalidation.fence_lock,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&gt->tlb_invalidation.lock);
+	spin_unlock_irq(&gt->tlb_invalidation.fence_lock);
 	INIT_LIST_HEAD(&fence->link);
 	dma_fence_get(&fence->base);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..d190a66514c0 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -192,8 +192,8 @@ struct xe_gt {
 		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
 		 */
 		struct delayed_work fence_tdr;
-		/** @tlb_invalidation.lock: protects TLB invalidation fences */
-		spinlock_t lock;
+		/** @tlb_invalidation.fence_lock: protects TLB invalidation fences */
+		spinlock_t fence_lock;
 	} tlb_invalidation;
 
 	/**
-- 
2.34.1

