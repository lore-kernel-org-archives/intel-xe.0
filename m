Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10A7C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 11:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0632A10E57E;
	Tue, 23 Jul 2024 11:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsSY/du/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0FB10E576
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721734341; x=1753270341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHNILOP4QDc1tMHPcXlp0dqZqGKAqzGZN3iw4jwLqHE=;
 b=TsSY/du/Ct10dKzFWUYk8MS6vRtca1Us93KvvhuKRsLxLpHWusmlvlM9
 4kex8v/7liTUfkx8fQAUjBi9eSXDN9DfS/lHdCplMUOJaWAeB/a/0eHjg
 LNnxy13ptSjwMGK278Zd5fHf6oWyllbeaMj6LhQtvMQxkbp1VMDk/WzZU
 RWtqCDvOx8X1eV9rTP9uMIlwcnl9H3jV9+IyuIzsXjas12+XZumUVIUCg
 6JkkD+4f0x7UUtCSVhUuxdrYDnbyxBwjCdUEEbKo5wuQHgveCFInSkyEe
 C709s29YloQgj2ohCDUPMcJ784Qdb8prJ+M0/OO5PmMIh8XJSBVWTUyNP w==;
X-CSE-ConnectionGUID: P6dCz6rpSJCrxgjJnvUQNA==
X-CSE-MsgGUID: Mdx5KImuTAGtSa1AYVN34g==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29942657"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29942657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:21 -0700
X-CSE-ConnectionGUID: LtYuJMCGSf26Oxwk/CCqQw==
X-CSE-MsgGUID: wghnfwNDR4eo3SFhbY77AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="89671734"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:32:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH 1/2] drm/xe: Add sent and recv counters for tlb invalidations
Date: Tue, 23 Jul 2024 13:16:09 +0200
Message-ID: <20240723111610.21564-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240723111610.21564-1-nirmoy.das@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add counters for TLB invalidation sent, receive requests which
then could be query as sysfs files from userspace.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 37 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 481d83d07367..f84717c1aafa 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -37,8 +37,11 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
 }
 
 static void
-__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+__invalidation_fence_signal(struct xe_gt *gt,
+			    struct xe_gt_tlb_invalidation_fence *fence,
+			    bool failed)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
 
 	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
@@ -46,13 +49,19 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
 	dma_fence_signal(&fence->base);
 	if (!stack)
 		dma_fence_put(&fence->base);
+
+	/* Only increment the counter when tlb inval is done successfully */
+	if (!failed)
+		atomic64_inc(&gt->tlb_invalidation.received_count);
 }
 
 static void
-invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
+invalidation_fence_signal(struct xe_gt *gt,
+			  struct xe_gt_tlb_invalidation_fence *fence,
+			  bool failed)
 {
 	list_del(&fence->link);
-	__invalidation_fence_signal(xe, fence);
+	__invalidation_fence_signal(gt, fence, failed);
 }
 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
@@ -76,7 +85,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 			  fence->seqno, gt->tlb_invalidation.seqno_recv);
 
 		fence->base.error = -ETIME;
-		invalidation_fence_signal(xe, fence);
+		invalidation_fence_signal(gt, fence, true);
 	}
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
 		queue_delayed_work(system_wq,
@@ -102,6 +111,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
 	spin_lock_init(&gt->tlb_invalidation.lock);
 	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
 			  xe_gt_tlb_fence_timeout);
+	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
+	atomic64_set(&gt->tlb_invalidation.received_count, 0);
 
 	return 0;
 }
@@ -140,7 +151,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
 
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link)
-		invalidation_fence_signal(gt_to_xe(gt), fence);
+		invalidation_fence_signal(gt, fence, false);
+	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
+	atomic64_set(&gt->tlb_invalidation.received_count, 0);
 	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
 	mutex_unlock(&gt->uc.guc.ct.lock);
 }
@@ -182,7 +195,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 	action[1] = seqno;
 	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
 				    G2H_LEN_DW_TLB_INVALIDATE, 1);
-	if (!ret && fence) {
+	if (!ret) {
 		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 		/*
 		 * We haven't actually published the TLB fence as per
@@ -191,7 +204,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 		 * we can just go ahead and signal the fence here.
 		 */
 		if (tlb_invalidation_seqno_past(gt, seqno)) {
-			__invalidation_fence_signal(xe, fence);
+			__invalidation_fence_signal(gt, fence, false);
 		} else {
 			fence->invalidation_time = ktime_get();
 			list_add_tail(&fence->link,
@@ -203,14 +216,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
 						   tlb_timeout_jiffies(gt));
 		}
 		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
-	} else if (ret < 0 && fence) {
-		__invalidation_fence_signal(xe, fence);
+	} else if (ret < 0) {
+		__invalidation_fence_signal(gt, fence, true);
 	}
 	if (!ret) {
 		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
 			TLB_INVALIDATION_SEQNO_MAX;
 		if (!gt->tlb_invalidation.seqno)
 			gt->tlb_invalidation.seqno = 1;
+
+		atomic64_inc(&gt->tlb_invalidation.sent_count);
 	}
 	mutex_unlock(&guc->ct.lock);
 
@@ -321,7 +336,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
-		__invalidation_fence_signal(xe, fence);
+		__invalidation_fence_signal(gt, fence, true);
 		return 0;
 	}
 
@@ -455,7 +470,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
 			break;
 
-		invalidation_fence_signal(xe, fence);
+		invalidation_fence_signal(gt, fence, false);
 	}
 
 	if (!list_empty(&gt->tlb_invalidation.pending_fences))
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index ef68c4a92972..130d9f5cb5c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -199,6 +199,10 @@ struct xe_gt {
 		struct delayed_work fence_tdr;
 		/** @tlb_invalidation.lock: protects TLB invalidation fences */
 		spinlock_t lock;
+		/** @tlb_invalidation.sent_count: counter for sent TLB inval requests */
+		atomic64_t sent_count;
+		/** @tlb_invalidation.received_count: counter for received TLB inval requestes */
+		atomic64_t received_count;
 	} tlb_invalidation;
 
 	/**
-- 
2.42.0

