Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71345CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 18:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1572B10E5D6;
	Fri,  5 Apr 2024 18:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQkyyJAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADB210E5D6
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 18:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712340626; x=1743876626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+GO17xBYNSPVhPspQshazEfN8YqziaBUDwpyYal8hs=;
 b=jQkyyJAd9bgbJDDQfOke//raE+S+2UMQsSGpVpw+ns6OdRQfRy5xK8SF
 Y0LSdlEsL7m6+Oz9VPr04wD18Jp7hR2zwLnt6gMyK7tT6axYu9RKcMFnq
 Xgq2eX7gb352MYFz+ZrSN5UfscDGbITgxS9Phhu9GkoYHtFUd97/mZsWc
 6PeJ8X8L3S1Vu12FvTHhCV0W/t8yWJM4JbC4YiSbSN7Ft/Q9+d2lM1w75
 9sMHGnsi4xNoq+qI6N2ZFRa0Z4djFJPrTGnJFaD08h4vj7nLz8Ka2ftcY
 UsT+MTcm+ZBgUohGfmdrTmft7Gu5h+u5F/IRE4tjLtq/OzBBg7x/Fq/e7 w==;
X-CSE-ConnectionGUID: ibfxM1TzQOSGa9w2UdPajg==
X-CSE-MsgGUID: DkvZTau6RGW8zwXEXFxAhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19116686"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19116686"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:24 -0700
X-CSE-ConnectionGUID: 95lC+uzPSy2ZS6nrKKP2bA==
X-CSE-MsgGUID: 8HhKDk0FRU2HEbNcNwC7GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19273125"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 11:10:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v4 2/3] drm/xe/xe_guc_submit: Allow lr exec queues to be banned
Date: Fri,  5 Apr 2024 10:55:04 -0700
Message-Id: <20240405175505.1161756-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
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

LR queues currently don't get banned during a GT/GuC reset because they
lack a job.  Though they don't have a job to detect the reset status of,
it's still possible to tell when they should be banned by looking at the
LRC: if the LRC head and tail don't match, then the exec queue should be
banned and cleaned up.

This also requires swapping the usage of xe_sched_tdr_queue_imm with
xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
exec queues.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---

v2:
- Fix Subject line
- Modify change slightly to remove need for "ban" boolean

v3: Revert change involving "ban" boolean to version 1

v4: Add missing semicolon and remove whitespace

 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1a6abb10a960e..e72f2a6cad60a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1424,15 +1424,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
+		bool ban = false;
 
 		if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				set_exec_queue_banned(q);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
+				ban = true;
 			}
+		} else if (xe_exec_queue_is_lr(q) &&
+			   (xe_lrc_ring_head(q->lrc) != q->lrc->ring.tail)) {
+			ban = true;
+		}
+
+		if (ban) {
+			set_exec_queue_banned(q);
+			xe_guc_exec_queue_trigger_cleanup(q);
 		}
 	}
 }
-- 
2.25.1

