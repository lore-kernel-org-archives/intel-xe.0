Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A2EC49EA1
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 23:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC03F10E3E3;
	Mon, 29 Jul 2024 23:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObGhhYWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCB610E3C1
 for <Intel-Xe@lists.freedesktop.org>; Mon, 29 Jul 2024 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295075; x=1753831075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SIlLe12PKrpjbvGeAuG3xwF/5ire1nuivP7NgleREfg=;
 b=ObGhhYWn6MPh8jJszKolf/Kqs0zgn4ypy6UrwWb6TVuQMUZVl1T670i7
 gxiqUGACejg/XjeBzCbhs/yF0ViWkvffvLmFq0qQ8URw1KYu6c3rQy1wu
 b/pYPOY6ZUFmedWOOHm6Z5WIUbJL6YEG0DzZqIWvVwDh9uMnOyAMHBXkO
 KUvnoSgqWh6R5fUse5F+l8ftcTFnscczPspJTIqWiAacjhfjdfO0E6Fri
 O/ppLp/z2Cf8Cd5H9WG5GuWLr4/u8eGu5PX9IsP7mzvUcR3taigJl//bQ
 4ESKRLzZoI/nW4fvai2TtYR26pZawDzGN7cy9iJVctN7QLuTnPANi4n9F w==;
X-CSE-ConnectionGUID: /lhwzsNVRiOgjQ3++2mm9Q==
X-CSE-MsgGUID: DJ/SaIpCTwmE3eYcOz5QvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19966927"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="19966927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:17:55 -0700
X-CSE-ConnectionGUID: RFMgY68lSzKafgAm+UbNqA==
X-CSE-MsgGUID: aITYStCGR1K5t27mCBnjxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="54103554"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 16:17:54 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 8/8] drm/xe/guc: Add GuC log to devcoredump captures
Date: Mon, 29 Jul 2024 16:17:52 -0700
Message-ID: <20240729231753.3101070-9-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
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

Add an ption to include the GuC log in devcoredump captures. Note that
this is currently optional and disabled by default. The reason being
that useful GuC logs are large, very large when converted to an ASCII
hex dump! And as they are not always necessary/useful for debugging a
hang, it is not desirable to force all core dump captures to be huge.

NB: The intent is to add support for buffer compression to the core
dumps. Then the log can be included as standard without being too
onerous. At that point the module parameter override can be removed.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 22 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 ++++++++----
 drivers/gpu/drm/xe/xe_module.c            |  3 +++
 drivers/gpu/drm/xe/xe_module.h            |  1 +
 4 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 08a0bb3ee7c0..b7c241bd95d5 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -17,8 +17,10 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_log.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
+#include "xe_module.h"
 #include "xe_sched_job.h"
 #include "xe_vm.h"
 
@@ -74,7 +76,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
 		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
-	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
+	xe_guc_exec_queue_snapshot_capture_delayed(ss->guc.ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
 }
 
@@ -116,9 +118,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
+	if (xe_modparam.enable_guc_log_in_coredump) {
+		drm_printf(&p, "\n**** GuC Log ****\n");
+		xe_guc_log_snapshot_print(xe, coredump->snapshot.guc.log, &p, false);
+	}
 	drm_printf(&p, "\n**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
-	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
+	xe_guc_ct_snapshot_print(xe, coredump->snapshot.guc.ct, &p, false);
+	xe_guc_exec_queue_snapshot_print(coredump->snapshot.guc.ge, &p);
 
 	drm_printf(&p, "\n**** Job ****\n");
 	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
@@ -145,8 +151,9 @@ static void xe_devcoredump_free(void *data)
 
 	cancel_work_sync(&coredump->snapshot.work);
 
-	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
-	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
+	xe_guc_log_snapshot_free(coredump->snapshot.guc.log);
+	xe_guc_ct_snapshot_free(coredump->snapshot.guc.ct);
+	xe_guc_exec_queue_snapshot_free(coredump->snapshot.guc.ge);
 	xe_sched_job_snapshot_free(coredump->snapshot.job);
 	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
 		if (coredump->snapshot.hwe[i])
@@ -199,8 +206,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
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
index 923cdf72a816..6ac8da1631f9 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -35,10 +35,14 @@ struct xe_devcoredump_snapshot {
 	struct work_struct work;
 
 	/* GuC snapshots */
-	/** @ct: GuC CT snapshot */
-	struct xe_guc_ct_snapshot *ct;
-	/** @ge: Guc Engine snapshot */
-	struct xe_guc_submit_exec_queue_snapshot *ge;
+	struct {
+		/** @ct: GuC CT snapshot */
+		struct xe_guc_ct_snapshot *ct;
+		/** @log: GuC log snapshot */
+		struct xe_guc_log_snapshot *log;
+		/** @ge: Guc Engine snapshot */
+		struct xe_guc_submit_exec_queue_snapshot *ge;
+	} guc;
 
 	/** @hwe: HW Engine snapshot array */
 	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7bb99e451fcc..dd837125f397 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -37,6 +37,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
 
+module_param_named_unsafe(enable_guc_log_in_coredump, xe_modparam.enable_guc_log_in_coredump, bool, 0600);
+MODULE_PARM_DESC(enable_guc_log_in_coredump, "Include a capture of the GuC log in devcoredumps");
+
 module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
 MODULE_PARM_DESC(guc_firmware_path,
 		 "GuC firmware path to use instead of the default one");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 61a0d28a28c8..81be7fb05bd1 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,6 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool enable_display;
+	bool enable_guc_log_in_coredump;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
-- 
2.43.2

