Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F611C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6053010E914;
	Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kj3K3shc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3F810E914
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3KtHutHePAqBYAKxUl7tlBRBiqE3P6vZxMwE8Gxv7Q=;
 b=Kj3K3shc085Q4spFgWNGRSAynMRL6eX7nxXk1NC4oeLNUN8iCwTs8qRr
 Mssmrid8xvwL1Rsm1SWE+Ae9OsLM8QohRHqom/gdZJweyCPjA4BvJfpDY
 6awDc+WadvocZcBokFky+vMNMOlG8HUdvEKbWxTMT/MEDSfrwMi9aBH9W
 VgDEiJHOvHxvTkFyCXyXzG8osPcNdwDGgysUSOtfDlIO2x3zkbIpBB03J
 1EzEfbd9RJEKz6et8NBQSeIlRnwdGkgfXIiWTNXtmnj9VZJer7uZPsIS/
 N4eYkZJJUSOa7ApYIe5UIjCnAbDYSRyO3tZZtP9Kcqy4+IIYXqZOZsAJ3 A==;
X-CSE-ConnectionGUID: DKFsiyDmQHygo20GEqfcTg==
X-CSE-MsgGUID: 2BuWyIC8SNygAIuF1cPMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468782"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: z/3FiAb2Rau5FfANNgTlcg==
X-CSE-MsgGUID: GEEH6CdBR9KR6W3jrvKdFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048800"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/7] drm/xe/gt: Extract emit_job_sync()
Date: Thu,  3 Jul 2025 15:41:12 -0700
Message-ID: <20250703-lrc-refactors-v1-3-6aa22f174041@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

Both the nop and wa jobs are going through the same boiler plate calls
to emit the job with a timeout and handling error for both bb and job.
Extract emit_job_sync() so those functions create the bb, handling
possible errors and delegate the part about really emitting the job
and waiting for its completion.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 59 +++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a926f560f2e36..67425e37c2187 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -146,30 +146,23 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 
 static void gt_reset_worker(struct work_struct *w);
 
-static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
+static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
+			 long timeout_jiffies)
 {
 	struct xe_sched_job *job;
-	struct xe_bb *bb;
 	struct dma_fence *fence;
 	long timeout;
 
-	bb = xe_bb_new(gt, 4, false);
-	if (IS_ERR(bb))
-		return PTR_ERR(bb);
-
 	job = xe_bb_create_job(q, bb);
-	if (IS_ERR(job)) {
-		xe_bb_free(bb, NULL);
+	if (IS_ERR(job))
 		return PTR_ERR(job);
-	}
 
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
-	timeout = dma_fence_wait_timeout(fence, false, HZ);
+	timeout = dma_fence_wait_timeout(fence, false, timeout_jiffies);
 	dma_fence_put(fence);
-	xe_bb_free(bb, NULL);
 	if (timeout < 0)
 		return timeout;
 	else if (!timeout)
@@ -178,17 +171,28 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	return 0;
 }
 
+static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
+{
+	struct xe_bb *bb;
+	int ret;
+
+	bb = xe_bb_new(gt, 4, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
+	ret = emit_job_sync(q, bb, HZ);
+	xe_bb_free(bb, NULL);
+
+	return ret;
+}
+
 static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 {
 	struct xe_reg_sr *sr = &q->hwe->reg_lrc;
 	struct xe_reg_sr_entry *entry;
+	int count_rmw = 0, count = 0, ret;
 	unsigned long idx;
-	struct xe_sched_job *job;
 	struct xe_bb *bb;
-	struct dma_fence *fence;
-	long timeout;
-	int count_rmw = 0;
-	int count = 0;
 	size_t bb_len;
 
 	/* count RMW registers as those will be handled separately */
@@ -199,9 +203,6 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 			++count_rmw;
 	}
 
-	if (count || count_rmw)
-		xe_gt_dbg(gt, "LRC WA %s save-restore batch\n", sr->name);
-
 	bb_len = count * 2;
 	if (count_rmw)
 		bb_len += count_rmw * 20 + 7;
@@ -292,25 +293,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 
 	xe_lrc_emit_hwe_state_instructions(q, bb);
 
-	job = xe_bb_create_job(q, bb);
-	if (IS_ERR(job)) {
-		xe_bb_free(bb, NULL);
-		return PTR_ERR(job);
-	}
+	if (bb->len)
+		xe_gt_dbg(gt, "LRC WA %s save-restore batch: %u dw", sr->name, bb->len);
 
-	xe_sched_job_arm(job);
-	fence = dma_fence_get(&job->drm.s_fence->finished);
-	xe_sched_job_push(job);
-
-	timeout = dma_fence_wait_timeout(fence, false, HZ);
-	dma_fence_put(fence);
+	ret = emit_job_sync(q, bb, HZ);
 	xe_bb_free(bb, NULL);
-	if (timeout < 0)
-		return timeout;
-	else if (!timeout)
-		return -ETIME;
 
-	return 0;
+	return ret;
 }
 
 int xe_gt_record_default_lrcs(struct xe_gt *gt)

-- 
2.49.0

