Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B86ACCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 21:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27E510E70B;
	Tue,  7 Oct 2025 21:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrNIyXgI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC64410E70B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759874157; x=1791410157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z7p3/NZS9fyhyqt033k4ticRXZnlpKm1UsVZMpf9UfA=;
 b=YrNIyXgIn4pfjyFHCY2CeCQSlMQMhMGuO7W9fqqKvt3U+wxpBBi+epyc
 TAwGE3F71wU+qlspYfgDWjkGzvFrSlLw+shm3/3XMYcswbFzDCdwLC8uO
 VlOtOFkG7dJAIjkm4bLZ+orOBqbhObNe/1NqJ7a26cZUx5JIthzYmYl1C
 Ve0q3t8I42hvqVnRyJa4oaPj3fwDD2J7K00K4M6130j1k1IET6P9tN7kg
 hZXQtvPdv/+X+PYdJ4o8T8HsVOZ0Pnh5HdHbg4h1FBb5/LSa6YfTJ7Duv
 n4lHPTDPR09EVC6CPrJuw1XrcZDQz0ZfbCWvo7ilMxlZQDDvNQ2oVCPoN A==;
X-CSE-ConnectionGUID: wxXFUbbgSDaX6dU/DvdeJw==
X-CSE-MsgGUID: sQMEPx1iQiGrHx05FWKN1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72743507"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="72743507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:55:53 -0700
X-CSE-ConnectionGUID: gHuexN8kRGy3FFxvhsJH7A==
X-CSE-MsgGUID: ugF9oSIITqmXgJa/tBfpZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="180090617"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:55:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 stuart.summers@intel.com, matthew.brost@intel.com
Subject: [PATCH] drm/xe/xe_guc_submit: Check all long-running exec queues on
 stop
Date: Tue,  7 Oct 2025 21:55:51 +0000
Message-ID: <20251007215550.141304-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

In guc_exec_queue_stop, the target exec queue is banned when one of the
following conditions is true:

- The exec queue has a job that has started but not completed.
- The exec queue has a job that has experienced more than two GT resets.
- The exec queue is long-running, and the LRC is NOT idle.

Notably, the last condition is not mutually-exclusive from the first
two.  However, we use an else-if to determine the last condition only if
the exec queue does not have a first scheduled job.  This means that if
the exec queue:

- Is long-running,
- Has an LRC that is NOT idle,
- Has a job that has not yet started, and
- Said job has not experienced more than two GT resets,

The exec queue will NOT be banned.

The check used to make sense when long-running exec queues weren't
allowed to have jobs, but this is no longer the case, so we no longer
want to else-if here.

Fixes: abdea2847acf ("drm/xe/xe_guc_submit: Allow lr exec queues to be banned")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 16f78376f196..86b96d7e58e9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1839,11 +1839,12 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				trace_xe_sched_job_ban(job);
 				ban = true;
 			}
-		} else if (xe_exec_queue_is_lr(q) &&
-			   !xe_lrc_ring_is_idle(q->lrc[0])) {
-			ban = true;
 		}
 
+		if (xe_exec_queue_is_lr(q) &&
+		    !xe_lrc_ring_is_idle(q->lrc[0]))
+			ban = true;
+
 		if (ban) {
 			set_exec_queue_banned(q);
 			xe_guc_exec_queue_trigger_cleanup(q);
-- 
2.43.0

