Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85121C55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADEA10E943;
	Tue,  4 Aug 2026 09:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KziGVhQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87AE10E67B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785836238; x=1817372238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SN2/kjTmw++4pC3OWlxsn+bigbb7ZRp4g6dVgyKIQDA=;
 b=KziGVhQj0+F2UB4G+w/df4IrxhyFwvgP61cu3kWLiybeSkbKB/n3XPv0
 cip5rD2s9k/n7U+jJnapLzNLHUT3uIc8rVyJ1+kXjcuiCmSkNjwriaHNp
 cvyaMX50cBDjtryzTcn/Bovnm80ChPaaZG9russna102/WSEzRDjrln0L
 9UWptDGGP9VRGvwAjPn0M1fuDdWufekCEGVbC7U7vnpPJ7LJ8PCpA0/VJ
 f/Tvw2fDhZj0Ct70PufuY9dDZoDeMP1en00pypNiUBhG+icCqrPvZkXTJ
 DcZjtwcbqvHRlkep5Cx/sS3SsF4NeDA6N/3pFG3ZWTWJWwsc/B6gxO1I0 A==;
X-CSE-ConnectionGUID: rpPLjZrWRVKP8U3cJH9MAw==
X-CSE-MsgGUID: 7omWqjXzSPaq8NQloCV/dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111937728"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="111937728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:37:17 -0700
X-CSE-ConnectionGUID: Qh0AQPgkQ6+fY6Cu172grw==
X-CSE-MsgGUID: PmATqE6PTJOFlhbhyp65EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="261528911"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:37:14 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v2 1/1] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Tue,  4 Aug 2026 15:06:48 +0530
Message-ID: <20260804093648.609728-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804093648.609728-1-arvind.yadav@intel.com>
References: <20260804093648.609728-1-arvind.yadav@intel.com>
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

Route a few existing GT TDR and VM rebind failure logs through the
structured SIGID logging helpers.

Use the GT component for GuC job-timeout checks and engine reset-request
failure, which reports them with XE_SIGID_GT_TDR. Use XE_SIGID_MEM_FAULT
for the terminal preempt rebind worker failure, since the VM is killed
immediately afterwards.

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_() helpers to the new xe_log_()
   helpers.
 - Dropped paths already covered by the base SIGID series.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_vm.c         |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..79bd0e46640f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -34,6 +34,7 @@
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_submit_types.h"
 #include "xe_hw_engine.h"
+#include "xe_log.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
@@ -1375,7 +1376,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	u64 running_time_ms;
 
 	if (!xe_sched_job_started(job)) {
-		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
+		xe_log_err(gt, GT, -ETIMEDOUT,
+			   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started\n",
 			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
 			   q->guc->id);
 
@@ -1390,7 +1392,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 				     xe_sched_job_seqno(job),
 				     xe_sched_job_lrc_seqno(job), q->guc->id);
 		else
-			xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+			xe_log_err(gt, GT, -ETIMEDOUT,
+				   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck\n",
 				   xe_sched_job_seqno(job),
 				   xe_sched_job_lrc_seqno(job), q->guc->id);
 
@@ -3354,8 +3357,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
-		  guc_class, instance, reason);
+	xe_log_err(gt, GT, -EIO,
+		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
+		   guc_class, instance, reason);
 
 	xe_gt_reset_async(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e0176861cb6..7c70ea23045a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -28,6 +28,7 @@
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
+#include "xe_log.h"
 #include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
@@ -591,7 +592,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	if (err) {
-		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
+		xe_log_from_recoverable(vm->xe, XE_SIGID_MEM_FAULT,
+					XE_LOG_COMPONENT_NONE, ERR_PTR(err), 0,
+					"Preempt rebind worker failed\n");
 		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
-- 
2.43.0

