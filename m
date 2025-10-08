Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E309CCD187
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA7C10E88E;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxATKKyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D35C10E882
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946708; x=1791482708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xf/V92XwtRk1SA2w74BRoAP1Cioc4CR0QnEpxaomIuY=;
 b=hxATKKyJxy2zxjMmOUj5iWjiqWcGxwQy4PytvdF0mgIxrpfzBa7e1LTj
 UjfugaUsSKms9Ou4PnrXhz2qluXdBiFU30sORN4/pFAP6Pi76KzZ3BbaI
 D7dxLMYxahu9cf6RW6+XcUErm85ewYPKzjIlmeS0uV25CQzZCwRLIURVd
 QZG3V6UpZ0db/rQAeaXEqE9tUYOMX3bsO+Y0bIjNZnlCzGlGDP4UImh1K
 OZfByM7imEmQ7Q0l+CnmApLRWtsNdyoIwT91+zHuqq6dQ448qrqQIIA9Z
 7v5F74t80/91BUXjqmeSjgOeFQtc+xX1Bga61QrtYC/jRUpzNDableNQo Q==;
X-CSE-ConnectionGUID: vUh8ToIoTJeaQfFAsK+iKQ==
X-CSE-MsgGUID: CvNoQUxIRoGnRPqphbRj0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067516"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: Ks1QHjwZQ628vipGBSHwig==
X-CSE-MsgGUID: D9c+gaPORY6YyhF11BmptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593722"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 06/34] drm/xe: Don't change LRC ring head on job
 resubmission
Date: Wed,  8 Oct 2025 11:04:32 -0700
Message-Id: <20251008180500.3261209-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
v7:
 - Only adjust first state on first unsignaled job (Auld)
v8:
 - Break unsignaled job handling to separate patch (Auld)

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

