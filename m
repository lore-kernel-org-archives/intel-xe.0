Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2F8C78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1381810E835;
	Fri, 20 Sep 2024 13:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4zwnG98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDC210E04D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726840086; x=1758376086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqQanBvH1DfHeOQNg08L3408+PTTZzUNeeVVE+Y7PSw=;
 b=Q4zwnG98akUIMxxeYsaIcEqDHkD8uUGoYF4Ymwz+niUJrHZZSzoP95Vc
 qE1YpHDLH0QAE/NOWOMnlHLXFR/A7mtwlVffoPQQE3vhfROLezgbystnS
 5KcM/VH36pLx8mJBkTA+e/gqZFKj7Q3Lgh4kiN1AS+5E9dhIUUwBFPpGG
 M25uxqw8+Wc4pav4y95HCRgPog9p506JQB/6qVXC3/K6s5vKL2lgwCmjn
 x2n7RdGcx5u9/IJDdVVlXd62kPw+PKCUZ2EskSfmJEuEAZJTB8peQkNXe
 /+XcbNqE3ryeZk0MD+1SzGLwMaplTBndXZu3UGYIGv1YbNmAHT+Tnajv5 g==;
X-CSE-ConnectionGUID: yqT8Pr4iR+aBPjPbFh6FWw==
X-CSE-MsgGUID: Ct/6uaDkQFWKE03invePGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25363801"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25363801"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:48:05 -0700
X-CSE-ConnectionGUID: 5hO2CeFBRB6MhAfSVcxNaA==
X-CSE-MsgGUID: v3kd1gPBT4idqJLFdTCZqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="74684677"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:47:06 -0700
From: bnilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [[CI] 10/12] drm/xe/guc: Add GuC log to devcoredump captures
Date: Fri, 20 Sep 2024 19:36:44 +0530
Message-Id: <20240920140646.618008-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920140646.618008-1-badal.nilawar@intel.com>
References: <20240920140646.618008-1-badal.nilawar@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

Include the GuC log in devcoredump captures because they can be useful
with debugging certain types of bug.

v2: Fix kerneldoc
v3: Drop module parameter as now using more compact ascii85 encoding
rather than hexdump (although still not compressed) (review feedback
from Matthew B). Rebase onto recent refactoring of devcoredump code.
v4: Don't move the submission snapshot inside the GuC internals
structure 'cos it really doesn't belong there.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0884c49942fe..a2d816713489 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -18,8 +18,10 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_log.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_module.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -100,8 +102,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
 	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
 
+	drm_puts(&p, "\n**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(ss->guc.log, &p);
 	drm_puts(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(ss->ct, &p);
+	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
 
 	drm_puts(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
@@ -124,8 +128,11 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 {
 	int i;
 
-	xe_guc_ct_snapshot_free(ss->ct);
-	ss->ct = NULL;
+	xe_guc_log_snapshot_free(ss->guc.log);
+	ss->guc.log = NULL;
+
+	xe_guc_ct_snapshot_free(ss->guc.ct);
+	ss->guc.ct = NULL;
 
 	xe_guc_exec_queue_snapshot_free(ss->ge);
 	ss->ge = NULL;
@@ -253,7 +260,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	ss->ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
 	ss->job = xe_sched_job_snapshot_capture(job);
 	ss->vm = xe_vm_snapshot_capture(q->vm);
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 3cc2f095fdfb..06ac75ce63dd 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -34,9 +34,13 @@ struct xe_devcoredump_snapshot {
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-	/* GuC snapshots */
-	/** @ct: GuC CT snapshot */
-	struct xe_guc_ct_snapshot *ct;
+	/** @guc: GuC snapshots */
+	struct {
+		/** @guc.ct: GuC CT snapshot */
+		struct xe_guc_ct_snapshot *ct;
+		/** @guc.log: GuC log snapshot */
+		struct xe_guc_log_snapshot *log;
+	} guc;
 
 	/** @ge: GuC Submission Engine snapshot */
 	struct xe_guc_submit_exec_queue_snapshot *ge;
-- 
2.34.1

