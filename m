Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BDECA0EE6
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 06:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A124010E809;
	Fri, 30 Aug 2024 06:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNTBjZxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8567C10E806
 for <Intel-Xe@lists.freedesktop.org>; Fri, 30 Aug 2024 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724998992; x=1756534992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfEnMgnfTEpy1lrySPU8tpA+hsvq18CZw6NCeyiUwsw=;
 b=PNTBjZxPQRaWcxDJs2WiqXmPvGQXUaCINofXqDEL8kY+88S1pvB201+X
 p6FLKN2RyqolbNtfjWBuqW4BpU3eUtHwu5WPgJgMYJiGOaOM2TJ1XWAnP
 VE7EvhSBAwwa1N/TRwyllh8n8vzJQUu19FX1eeGivwaedTMG2fp4PP/ZU
 P0kvgUlY3pG6PM2K0NXATb6kRxrEtubdR43lsGr0ArCtLe1DP0y4X0CWe
 GoQhv8PEwjDxw3Z5Hhwy3GbCE5gfhY/r+iSzcW5beGqXyMNKSBXyNJqbG
 bWZWHipmQmfPlVWWxZqzmfHssMImVOwJOfIsTDI0JixohAV3PDGAHjuDW g==;
X-CSE-ConnectionGUID: f5O662GYS+mpkkEh5Jpw2Q==
X-CSE-MsgGUID: SdF8F26wS7ub0m8eImZPtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34245225"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34245225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 23:23:12 -0700
X-CSE-ConnectionGUID: 4IwSDFeYSd6fymJVQLSbWA==
X-CSE-MsgGUID: l+juUXX6SEmsAQrlmdudDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="87040583"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 23:23:12 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v6 8/9] drm/xe/guc: Add GuC log to devcoredump captures
Date: Thu, 29 Aug 2024 23:23:09 -0700
Message-ID: <20240830062310.3450387-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
References: <20240830062310.3450387-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 14 +++++++-----
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index eec7b89ab48b..bb3f91130d86 100644
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
 
@@ -97,9 +99,11 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
+	drm_printf(&p, "\n**** GuC Log ****\n");
+	xe_guc_log_snapshot_print(coredump->snapshot.guc.log, &p);
 	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
-	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
+	xe_guc_ct_snapshot_print(coredump->snapshot.guc.ct, &p);
+	xe_guc_exec_queue_snapshot_print(coredump->snapshot.guc.ge, &p);
 
 	drm_printf(&p, "\n**** Job ****\n");
 	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
@@ -119,11 +123,14 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
 {
 	int i;
 
-	xe_guc_ct_snapshot_free(ss->ct);
-	ss->ct = NULL;
+	xe_guc_log_snapshot_free(ss->guc.log);
+	ss->guc.log = NULL;
 
-	xe_guc_exec_queue_snapshot_free(ss->ge);
-	ss->ge = NULL;
+	xe_guc_ct_snapshot_free(ss->guc.ct);
+	ss->guc.ct = NULL;
+
+	xe_guc_exec_queue_snapshot_free(ss->guc.ge);
+	ss->guc.ge = NULL;
 
 	xe_sched_job_snapshot_free(ss->job);
 	ss->job = NULL;
@@ -147,7 +154,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->guc.ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 
 	/* Calculate devcoredump size */
@@ -248,8 +255,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
-	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
-	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
+	coredump->snapshot.guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
+	coredump->snapshot.guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
+	coredump->snapshot.guc.ge = xe_guc_exec_queue_snapshot_capture(q);
 	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
 	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 440d05d77a5a..f68d2cba187d 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -34,11 +34,15 @@ struct xe_devcoredump_snapshot {
 	/** @work: Workqueue for deferred capture outside of signaling context */
 	struct work_struct work;
 
-	/* GuC snapshots */
-	/** @ct: GuC CT snapshot */
-	struct xe_guc_ct_snapshot *ct;
-	/** @ge: Guc Engine snapshot */
-	struct xe_guc_submit_exec_queue_snapshot *ge;
+	/** @guc: GuC related snapshots */
+	struct {
+		/** @guc.ct: GuC CT snapshot */
+		struct xe_guc_ct_snapshot *ct;
+		/** @guc.log: GuC log snapshot */
+		struct xe_guc_log_snapshot *log;
+		/** @guc.ge: Guc Engine snapshot */
+		struct xe_guc_submit_exec_queue_snapshot *ge;
+	} guc;
 
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
-- 
2.46.0

