Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AE6CE7A9C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 20:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5578010E155;
	Thu,  5 Sep 2024 20:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADdYE4ay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29DC10E051
 for <Intel-Xe@lists.freedesktop.org>; Thu,  5 Sep 2024 20:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725569479; x=1757105479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xs8f3KH19QJgeaiMejxN+lmvy1em+XUuUic3/S8M10g=;
 b=ADdYE4ayyqnEDSgJWsMi4xMh0UagVKMsBdyc520bzqZmNcN20ZYMUCyg
 kGOvIc3DnEg7Cqmji0X/ROwZZr5qdPOH2FcnZ0gDtjZ9KQuhy90dy/XzP
 +J+I+xJm4Uaw+LNejaV/pCLFdxp/VNpK78RkdrsSWoDW6XoK6MGmFriK1
 WSbgTxgJMbuRKmnvGM/EPXmCu/eB7L09QE8mVMIFTK8ORaNIMFptJo1qC
 1Glp/FHh2QwiPOK+RJ9EA7UvTeW4WAx5Z6iNHpbaaxVY5eBhZa6tRioqt
 caYxVpPLeokQRTxLpKU3SOtqtGX6Op3k+NWReYdiMXB/eDZ69C6a53aTm w==;
X-CSE-ConnectionGUID: VmYx0FgkSSKD3eC3Vjjofg==
X-CSE-MsgGUID: OuUNXyOeTMmW94/UbvdAwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34982289"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="34982289"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 13:51:08 -0700
X-CSE-ConnectionGUID: a5gziW8ZTDixmybPabD10w==
X-CSE-MsgGUID: CKrZTH93TbuT5nz4kiyY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="66486772"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 05 Sep 2024 13:51:07 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v7 09/10] drm/xe/guc: Add GuC log to devcoredump captures
Date: Thu,  5 Sep 2024 13:51:04 -0700
Message-ID: <20240905205106.1063091-10-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 16 ++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 10 +++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 5e2e93ad773c..36663ef76752 100644
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
 
@@ -97,8 +99,10 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
+	drm_printf(&p, "\n**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(coredump->snapshot.guc.log, &p);
 	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	xe_guc_ct_snapshot_print(coredump->snapshot.guc.ct, &p);
 
 	drm_printf(&p, "\n**** Contexts ****\n");
 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
@@ -121,8 +125,11 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
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
@@ -250,7 +257,8 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	coredump->snapshot.guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+	coredump->snapshot.guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
 	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
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
2.46.0

