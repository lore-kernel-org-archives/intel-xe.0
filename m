Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CBEC531FA
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 08:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A90910E051;
	Fri, 24 Jul 2026 08:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VAEYdQCg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F17A10E051
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784883435; x=1816419435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRTdz1BiBWC4zOeQ2IUzzJY3/lp47POk5KwsUFswHJI=;
 b=VAEYdQCgGHPsoSnj9rusJga7oL4SoZTxWjz4x7JF0SOeBF3tYHjHUDkz
 BOJc9gej4NdlK7IC4zZqADJZ2gffmiwLypF+e1rU9pYzrfl0vIznpWz65
 XXn1+SsJzzW8wW46h2lOPSAcy2igboQ8siue3O6oKFxyQ8Po7WU13tuw7
 utPL2rYr/Ski3q9VbOeGJ4A/P0BiSn52JaHJf8A7jAgrs6dnw0vh6Vh7a
 9BPInOuK2MDQ/YuTCSP0dDo7kmbp6EvSqdXFaEuaiRcYzE1Rsh0ZDihgC
 rLuMaxCUqi3wRK9Hpj3vDN/XXD/s30E67f6hK+Ta8nAueQqHRDOxDgaSc Q==;
X-CSE-ConnectionGUID: VSjz8gLMQI2AUM+FgXFX+A==
X-CSE-MsgGUID: pnLbG0YZRfKO8hb/OB50qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103088794"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="103088794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:57:15 -0700
X-CSE-ConnectionGUID: NjW5BFdHT0uHqRMp1Yoc9Q==
X-CSE-MsgGUID: To2MCnQVQSKx4IesQKXaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="259318391"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:57:13 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, dnyaneshwar.bhadane@intel.com,
 mallesh.koujalagi@intel.com, matthew.brost@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [RFC 1/1] drm/xe: Use RAS logging for GT fault paths
Date: Fri, 24 Jul 2026 14:27:03 +0530
Message-ID: <20260724085703.2540087-2-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724085703.2540087-1-arvind.yadav@intel.com>
References: <20260724085703.2540087-1-arvind.yadav@intel.com>
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

Route selected GT fault logs through the structured RAS logging helpers.

Use the GT TDR category for GuC scheduling timeouts, uncorrectable local
errors, and engine reset failures, as these paths lead to job
invalidation, TDR handling, or GT reset. Use the memory fault category
for terminal preempt rebind worker failures, unknown-context GuC Memory
CAT errors, and page fault queue overflow.

Add a ratelimited memory fault wrapper for the noisy fault paths.

This keeps these fault reports on the SIG_ID-based RAS logging path while
leaving informational and notice-only paths unchanged.

Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 35 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_pagefault.c  | 10 +++++----
 drivers/gpu/drm/xe/xe_ras_log.h    | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_vm.c         |  4 +++-
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8aaed4fd13ea..a4467601e931 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -40,6 +40,7 @@
 #include "xe_mocs.h"
 #include "xe_module.h"
 #include "xe_pm.h"
+#include "xe_ras_log.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
@@ -1287,7 +1288,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	if (!ret && !vf_recovery(guc)) {
 		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
-		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
+		xe_ras_log_gt_tdr(guc_to_xe(guc), q->gt, -ETIMEDOUT,
+				  "Pending enable/disable failed to respond");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
 		xe_sched_tdr_queue_imm(sched);
@@ -1375,9 +1377,10 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 	u64 running_time_ms;
 
 	if (!xe_sched_job_started(job)) {
-		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
-			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-			   q->guc->id);
+		xe_ras_log_gt_tdr(gt_to_xe(gt), gt, -ETIMEDOUT,
+				  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
+				  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+				  q->guc->id);
 
 		/* GuC never scheduled this job - let the caller trigger a GT reset. */
 		return true;
@@ -1390,9 +1393,10 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
 				     xe_sched_job_seqno(job),
 				     xe_sched_job_lrc_seqno(job), q->guc->id);
 		else
-			xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
-				   xe_sched_job_seqno(job),
-				   xe_sched_job_lrc_seqno(job), q->guc->id);
+			xe_ras_log_gt_tdr(gt_to_xe(gt), gt, -ETIMEDOUT,
+					  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
+					  xe_sched_job_seqno(job),
+					  xe_sched_job_lrc_seqno(job), q->guc->id);
 
 		return xe_sched_invalidate_job(job, 0);
 	}
@@ -3278,7 +3282,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
 		 * context. In such case only PF will be notified about that fault.
 		 */
-		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
+		xe_ras_log_mem_fault_ratelimited(gt_to_xe(gt), gt, -EIO,
+						 "Memory CAT error reported by GuC!");
 		return 0;
 	}
 
@@ -3320,7 +3325,8 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	guc_id = msg[0];
 
 	if (guc_id == GUC_ID_UNKNOWN) {
-		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
+		xe_ras_log_gt_tdr(gt_to_xe(gt), gt, -EIO,
+				  "GuC: Uncorrectable local error with unknown GuC id");
 		return 0;
 	}
 
@@ -3328,9 +3334,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_err(gt,
-		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
-		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+	xe_ras_log_gt_tdr(gt_to_xe(gt), gt, -EIO,
+			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
 	trace_xe_guc_uncorrectable_error(q);
 
@@ -3354,8 +3360,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
 	reason = msg[2];
 
 	/* Unexpected failure of a hardware feature, log an actual error */
-	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
-		  guc_class, instance, reason);
+	xe_ras_log_gt_tdr(guc_to_xe(guc), gt, -EIO,
+			  "GuC engine reset request failed on %d:%d because 0x%08X",
+			  guc_class, instance, reason);
 
 	xe_gt_reset_async(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..b869d5f679ea 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -16,6 +16,7 @@
 #include "xe_hw_engine.h"
 #include "xe_pagefault.h"
 #include "xe_pagefault_types.h"
+#include "xe_ras_log.h"
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
@@ -486,12 +487,13 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
 			pf_queue->size;
 		queue_work(xe->usm.pf_wq, &pf_queue->worker);
-	} else {
-		drm_warn(&xe->drm,
-			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
+	if (full)
+		xe_ras_log_mem_fault_ratelimited(xe, pf->gt, -ENOSPC,
+						 "PageFault Queue (%d) full, shouldn't be possible",
+						 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+
 	return full ? -ENOSPC : 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
index 3f94e6747e86..b62478f04bfd 100644
--- a/drivers/gpu/drm/xe/xe_ras_log.h
+++ b/drivers/gpu/drm/xe/xe_ras_log.h
@@ -7,6 +7,7 @@
 #define _XE_RAS_LOG_H_
 
 #include <linux/cper.h>
+#include <linux/ratelimit.h>
 
 #include "xe_sig_ids.h"
 
@@ -25,6 +26,15 @@ void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
  * Driver error reporting macros
  */
 
+#define xe_ras_log_ratelimited(_xe, _gt, _sig_id, _cper_sev, _errno, _fmt, ...) \
+	do { \
+		static DEFINE_RATELIMIT_STATE(_rs, DEFAULT_RATELIMIT_INTERVAL, \
+					      DEFAULT_RATELIMIT_BURST); \
+		if (__ratelimit(&_rs)) \
+			__xe_ras_log((_xe), (_gt), (_sig_id), (_cper_sev), \
+				     (_errno), _fmt, ##__VA_ARGS__); \
+	} while (0)
+
 /* FATAL */
 #define xe_ras_log_probe(xe, errno, fmt, ...) \
 	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
@@ -55,6 +65,10 @@ void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
 	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
 		     (errno), fmt, ##__VA_ARGS__)
 
+#define xe_ras_log_mem_fault_ratelimited(_xe, _gt, _errno, _fmt, ...) \
+	xe_ras_log_ratelimited((_xe), (_gt), XE_SIG_MEM_FAULT, \
+			       CPER_SEV_RECOVERABLE, (_errno), _fmt, ##__VA_ARGS__)
+
 #define xe_ras_log_io_bus(xe, errno, fmt, ...) \
 	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
 		     (errno), fmt, ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e0176861cb6..3f4c015c8d61 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_pxp.h"
+#include "xe_ras_log.h"
 #include "xe_sriov_vf.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
@@ -591,7 +592,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	if (err) {
-		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
+		xe_ras_log_mem_fault(vm->xe, NULL, err,
+				      "Preempt rebind worker failed: err=%d", err);
 		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
-- 
2.43.0

