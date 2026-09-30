Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D03CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 09:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0643910E965;
	Wed, 30 Sep 2026 09:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsJCg2YD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803F10E965
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790761256; x=1822297256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=119RlcGX0xv5UlgnyMTHvoEg0Ejj+Wtd9zO+fJCv/X8=;
 b=RsJCg2YDQD9ATGpncRAhxc2sAMGrffbB83b78UGJidw/HTI+7E+g5pEw
 iuV/Mg3ChMox6JW7kMTc+t5FkzXwlrgI19xxYgOpuY0xuHxy28KODnSx7
 eXqyOnzgPJ7CYU7UGUnogMTvqhE0KLYTM/yBa4YYo4HOK4D0DYASY79Pr
 vy6qRSTS9R+O6U5U/l3u1xo9RHZpGW94NE6K5AJHru1Dx2so8xKcF1PGD
 01V17ze4tcBIFaR2gGtLeUUEc+yIKL56oc5fYA6uqIncWF6PshL7kKIQh
 vfCyDnighAxo4lXXOva/nE84wIUCWneAbID9WRi7CAuNc1S+rdNEgmBKR A==;
X-CSE-ConnectionGUID: t0osNp96RWu3JY4NjC0fRw==
X-CSE-MsgGUID: T5g8XZqwS82Pc/MhzKawKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95303810"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95303810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:56 -0700
X-CSE-ConnectionGUID: cMgXQ3/PT4Kr4z5yy8Ugyw==
X-CSE-MsgGUID: tcsXVDfgR2a8xy03c0Pd7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274768710"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:54 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 2/3] drm/xe/guc: Publish the ring tail when replaying a
 chained ULLS job
Date: Wed, 30 Sep 2026 15:10:34 +0530
Message-ID: <20260930094031.3365707-7-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930094031.3365707-5-varun.gupta@intel.com>
References: <20260930094031.3365707-5-varun.gupta@intel.com>
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

A chained ULLS job skips the ring tail write in submit_exec_queue()
since its predecessor's postamble has already published it from within
the ring. After a GT reset the context is re-registered with scheduling
disabled and that postamble is gone, so nothing publishes the replayed
job's tail: the context is enabled with head == tail and the job never
starts. On the kernel migration queue the second timeout wedges the
device.

Publish the tail for a chained job when the queue is not enabled. This
is the state in which submit_exec_queue() already sends the scheduling
enable H2G instead of relying on a resident context, and the tail write
precedes that H2G. guc_exec_queue_stop() clears ENABLED on reset and
register_exec_queue() does not set it, so the first replayed ULLS job
always takes this path; its re-emitted postamble then publishes the
next tail as usual. With the queue enabled nothing changes.

job->restore_replay does not identify this case, it is only set on the
SR-IOV VF pause/unpause path.

Fixes: 40c756bdbbee ("drm/xe: Add ULLS migration job support to GuC submission")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cd9bb9f9e28c..1d98ec67c5c6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1190,10 +1190,15 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
 	if (!job->restore_replay || job->last_replay) {
-		/* A ULLS job past the first publishes its own ring tail */
+		/*
+		 * A chained ULLS job relies on its predecessor's postamble to
+		 * publish its ring tail. After a reset the context comes back
+		 * disabled with that postamble gone, so publish it here.
+		 */
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
-		else if (!xe_sched_job_ulls_is_chained(job))
+		else if (!xe_sched_job_ulls_is_chained(job) ||
+			 !exec_queue_enabled(q))
 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 		job->last_replay = false;
 	}
-- 
2.43.0

