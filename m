Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D98ECCD184
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EEC10E402;
	Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3LCVeIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F9410E341
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749044; x=1791285044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=zrFjQ3NzFMHUytb1ocBefuP6ns8dvZagiOUlx4fqc4w=;
 b=R3LCVeIroFAiIqLycvZ4LmACLUoScJ9tkHZvpK+gKO596iHl8O2gu4sn
 PmEqcwgQjRrvqq84X1JcbwyYB+m235mNEUzW+lOw/BZuWeIsw1kBLfu1K
 /jTK7FuJRpbbKgOG3WkT8SZuwYM91ocOSUCFXKDg8V+6qXVd9+vYyiV9t
 X2ycBquUdzMZfxT2VHALhYFYZWzZe0+dTzxo2DS5jY7+0NptB65pOAvIQ
 8benbGfW98hy0mhKMeINmC6WcIs47wLm2h907EpcYlVXENhfdXVKVV4yr
 C+iJzGTWWH28M/cUOUlti1UAE1n/2CWrv4JpU9mkY5qXSJ1Hnn4iO+u0W w==;
X-CSE-ConnectionGUID: weozVL2zSwmLKgfESZtd3A==
X-CSE-MsgGUID: PXHBO5T4RyyKgL8qmoYTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020381"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:43 -0700
X-CSE-ConnectionGUID: qpPYhIyxRaKbpdNSa8W8lQ==
X-CSE-MsgGUID: zoHd7UAxTuWa0BLyYfqUjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655220"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 05/30] drm/xe: Don't change LRC ring head on job
 resubmission
Date: Mon,  6 Oct 2025 04:10:13 -0700
Message-Id: <20251006111038.2234860-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

Now that we save the job's head during submission, it's no longer
necessary to adjust the LRC ring head during resubmission. Instead, a
software-based adjustment of the tail will overwrite the old jobs in
place. For some odd reason, adjusting the LRC ring head didn't work on
parallel queues, which was causing issues in our CI.

v5:
 - Add comment in guc_exec_queue_start explaning why the function works
   (Auld)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3a534d93505f..d123bdb63369 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2008,11 +2008,25 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		if (job) {
+			for (i = 0; i < q->width; ++i) {
+				/*
+				 * The GuC context is unregistered at this point
+				 * time, adjusting software ring tail ensures
+				 * jobs are rewritten in original placement,
+				 * adjusting LRC tail ensures the newly loaded
+				 * GuC / contexts only view the LRC tail
+				 * increasing as jobs are written out.
+				 */
+				q->lrc[i]->ring.tail = job->ptrs[i].head;
+				xe_lrc_set_ring_tail(q->lrc[i],
+						     xe_lrc_ring_head(q->lrc[i]));
+			}
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
-- 
2.34.1

