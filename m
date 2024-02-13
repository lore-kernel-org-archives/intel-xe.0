Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54F5C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 04:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7880F10E2A7;
	Tue, 13 Feb 2024 04:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izdGBPb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160110E2A7
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707798723; x=1739334723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oWrTislv9x9LXakUjEGlXFNO6EjKLBvPwGoPtvYznY8=;
 b=izdGBPb0gUL+hb+/NtDW0yi5VEy8gFg8qPRTZgltm/haSw9JXBNpVn5y
 HU0hVDWbg6HobewLwl6ev/qm2qEq/R8s+5rVCH+khJacyH1VVHR3Bs7wy
 OBZQ94u5+LlPjyGZvMKl2KonCe0lf+y9yiOs/zNPsW0BYUEkScbBflHrn
 zZ/yT1rSyvaL1X/pDWS/NefQyYgtpRuZBo75AdhMi4HKgduH7LH6BKDD/
 nSuUNxTDM1dKePvj0+HQHRbS7fILQqGbQdMqJ4n9mT4HuWG7k3pPAl+bH
 wrNEruyF/KmdJsODwN/V/Y/CM9SluH4ld5r3/K2sb3syZ57xqje0YDwQJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13190372"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="13190372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 20:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2774685"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 20:32:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Remove exec queue bind.fence_*
Date: Mon, 12 Feb 2024 20:32:51 -0800
Message-Id: <20240213043251.3482928-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

struct xe_exec_queue bind.fence_* members are unused. Remove these.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  4 ----
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 29 ++++++++----------------
 2 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2976635be4d3..da84ac93a559 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -94,10 +94,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
 		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
 	}
-	if (q->flags & EXEC_QUEUE_FLAG_VM) {
-		q->bind.fence_ctx = dma_fence_context_alloc(1);
-		q->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
-	}
 
 	return q;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 648391961fc4..3df8571e4a07 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -115,26 +115,15 @@ struct xe_exec_queue {
 		struct list_head link;
 	} persistent;
 
-	union {
-		/**
-		 * @parallel: parallel submission state
-		 */
-		struct {
-			/** @parallel.composite_fence_ctx: context composite fence */
-			u64 composite_fence_ctx;
-			/** @parallel.composite_fence_seqno: seqno for composite fence */
-			u32 composite_fence_seqno;
-		} parallel;
-		/**
-		 * @bind: bind submission state
-		 */
-		struct {
-			/** @bind.fence_ctx: context bind fence */
-			u64 fence_ctx;
-			/** @bind.fence_seqno: seqno for bind fence */
-			u32 fence_seqno;
-		} bind;
-	};
+	/**
+	 * @parallel: parallel submission state
+	 */
+	struct {
+		/** @parallel.composite_fence_ctx: context composite fence */
+		u64 composite_fence_ctx;
+		/** @parallel.composite_fence_seqno: seqno for composite fence */
+		u32 composite_fence_seqno;
+	} parallel;
 
 	/** @sched_props: scheduling properties */
 	struct {
-- 
2.34.1

