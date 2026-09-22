Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF71C982FE
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 14:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFD488EBA;
	Tue, 22 Sep 2026 14:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PtS3oanv";
	dkim-atps=neutral
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com
 [74.125.227.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702F4892F6
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 14:46:49 +0000 (UTC)
Received: by mail-vs2-f12.google.com with SMTP id
 71dfb90a1353d-5c67e2ff27bso2554692e0c.1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790088408; x=1790693208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W9UBxJeTMVvi9qsnlU006JDfJHWsecdWJRKILfadoLk=;
 b=PtS3oanv+sLX9/4geUwaZLZ1X0HG81DP3k/xq5IKp6zSuvlPca44xW/4pAd3gjVrNg
 rNADgtuzqZnxZtFIgUePOBjBNdS9ixiz/3b3jf3SVn/FnYqapmXmZacOMuNOZZr4qlXP
 A5mAv5XteP/bns/kWvoDat4gIg0tZNMBA3ATk4EhYzfv6I59ko6YxHA0Jcqyp7TZStKP
 1MaGTPj0koF+LR4eR74Ij+Zpf3+8PrkFRsd1TmtaAfiGmmq5EaUiNJZbPQyeuPU3WWAP
 AqxvAAljcgLgBfgILGGjTUXRce8D6mQBGAqt1nTbINcUZwqO0rFHZMgmp59d+gBqe0OW
 Gc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790088408; x=1790693208;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W9UBxJeTMVvi9qsnlU006JDfJHWsecdWJRKILfadoLk=;
 b=Pxlh0WABIRcM3h+F5NC2LtvO0w+8OM7yrRHJJJwZPdM/STjr4ok52OqNtZ6d4bQFHg
 SAtzdFvcq9McEwVObvJI/KNEhyaJECbDiJjO5utNUBGYwrn6LVB7ICcgRkNZybOFVHCQ
 VwxnMmWXGEvud90jLD63Dqmqr9WA6V0/Eq5Dz3Wzu5iW++Gs7bpOZOT394qfXiS68X1g
 0BusxXi0MVIpQwx4I+vPBCKlmRVvRFbURFHCUWHz7L0HZIKcI+03AQALR2gclJ20Wd0d
 mXTtCr58SDKGhqjurb+Dwy2HNsFszaVVLOyirvvrIN9RlC3cP0P5XQ1BbjQxK4fEMrwL
 6bEQ==
X-Gm-Message-State: AFuF++k+lt+uehDvho3FQjo/g9GtgI6Jg6KCH0UAW13YIu2AvQUewXNF
 OnWs2O4wT/rKxOXZiqOX9zPoFHBXYPpAd32QNonXrQGltWHpd0Krs+3DYz6ULZwc
X-Gm-Gg: AYBFou2nn80Eu4H/XOjXOiHrk498tmLUW6QUpbwHsgds4nl6lWWEI4rj4Izo01wgToN
 /Cqi8/jMssNDwVKotKTqyNl/o3QVw1pXomcCHoeOKM5Z0RP9yrJj9/LqkWzi6D4mnDLXIA6fv1q
 fR3PVm6TeOC5rR/M0B9sPD6DNbaMnpOqtblMhdJQ64iPwdpwFggtcSuLLDUA4wXVEga6ygQSFli
 7JBgZjRNEjo/QWhSQoy3E1aHN/knP5bjEIeFhvd0JMdP4J6HmBPAc4kITI3hx3p9ZVGUvYFlyAt
 56oliC0sRpX59WH+xzASLqigji7DbtZ5BH2W9RQ2IZcmETeC2lAuWa8W0VjCy4aFlxiDgcZgyJV
 sfayndmgrq2Byk7SBY7jBKHmmvFuXA5jnvXzpPtL0sICxJCdK/gKSOfkvacr+rvXU9E0NTAjamD
 1bImOZMcmACNoULhqu/lh1czeWqWA8FcZPw9SHBTGzv6UMf40yvjFLxhB3utv5M73kbpAl2KgqN
 0Iz1+bb7yO6pDZiN2OhBIlhW2emoRCC6vgUfVve84BmkVKdtP2v9MISiOSBayU=
X-Received: by 2002:a05:6122:3486:b0:5c9:a60b:e5a3 with SMTP id
 71dfb90a1353d-5c9b59abe8amr9299758e0c.14.1790088408127; 
 Tue, 22 Sep 2026 07:46:48 -0700 (PDT)
Received: from lord.bigscale.net ([170.246.210.5])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-9850d661d77sm2017067241.7.2026.09.22.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 07:46:47 -0700 (PDT)
From: =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 stuart.summers@intel.com, julia.filipchuk@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@intel.com, navonjohnlukose@gmail.com,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>
Subject: [PATCH v6 1/3] drm/xe: Capture devcoredump on TLB invalidation timeout
Date: Tue, 22 Sep 2026 11:46:32 -0300
Message-ID: <20260922144634.55130-2-talesam@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922144634.55130-1-talesam@gmail.com>
References: <20260922144634.55130-1-talesam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

TLB invalidation timeouts currently leave no record of the firmware
state behind: there is no exec queue or job to blame, so nothing calls
xe_devcoredump() and the GuC log content at the time of the hang is
lost.

Add xe_devcoredump_gt(), a variant of xe_devcoredump() for hangs that
are not tied to an exec queue or job. It captures the GuC log and CT
state of the affected GT, reusing the existing snapshot machinery and
the "only first snapshot" policy, and hook it up to the TLB invalidation
timeout path.

This was instrumental in diagnosing GuC TLB invalidation ack stalls on
ARL (see Link), where the invalidation request is consumed from the H2G
CTB immediately but the ack G2H only arrives ~2.3s later, after the
timeout has already fired.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
Signed-off-by: Tales A. Mendonça <talesam@gmail.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 46 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_devcoredump.h | 15 +++++++---
 drivers/gpu/drm/xe/xe_tlb_inval.c   | 35 ++++++++++++++++++++++
 3 files changed, 71 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b918f046ae1..ab681b14886 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -74,11 +74,6 @@ static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
 	return container_of(coredump, struct xe_device, devcoredump);
 }
 
-static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
-{
-	return &q->gt->uc.guc;
-}
-
 static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
 				     ssize_t start,
 				     struct xe_devcoredump *coredump)
@@ -325,40 +320,44 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 }
 
 static void devcoredump_snapshot(struct xe_devcoredump *coredump,
+				 struct xe_gt *gt,
 				 struct xe_exec_queue *q,
 				 struct xe_sched_job *job)
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
-	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_guc *guc = &gt->uc.guc;
 	const char *process_name = "no process";
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
-	if (q->vm && q->vm->xef) {
+	if (q && q->vm && q->vm->xef) {
 		process_name = q->vm->xef->process_name;
 		ss->pid = q->vm->xef->pid;
 	}
 
 	strscpy(ss->process_name, process_name);
 
-	ss->gt = q->gt;
+	ss->gt = gt;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
 	/* keep going if fw fails as we still want to save the memory and SW data */
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	cookie = dma_fence_begin_signalling();
 
 	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
 	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct);
-	ss->ge = xe_guc_exec_queue_snapshot_capture(q);
-	if (job)
-		ss->job = xe_sched_job_snapshot_capture(job);
-	ss->vm = xe_vm_snapshot_capture(q->vm);
 
-	xe_engine_snapshot_capture_for_queue(q);
+	if (q) {
+		ss->ge = xe_guc_exec_queue_snapshot_capture(q);
+		if (job)
+			ss->job = xe_sched_job_snapshot_capture(job);
+		ss->vm = xe_vm_snapshot_capture(q->vm);
+
+		xe_engine_snapshot_capture_for_queue(q);
+	}
 
 	queue_work(system_dfl_wq, &ss->work);
 
@@ -366,19 +365,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 }
 
 /**
- * xe_devcoredump - Take the required snapshots and initialize coredump device.
- * @q: The faulty xe_exec_queue, where the issue was detected.
- * @job: The faulty xe_sched_job, where the issue was detected.
+ * __xe_devcoredump - Take the required snapshots and initialize coredump device.
+ * @gt: The GT where the issue was detected.
+ * @q: The faulty xe_exec_queue, where the issue was detected, may be NULL for
+ *     hangs that are not tied to an exec queue (e.g. TLB invalidation
+ *     timeouts); in that case only the GT-level state (GuC log and CT state)
+ *     is captured.
+ * @job: The faulty xe_sched_job, where the issue was detected, may be NULL.
  * @fmt: Printf format + args to describe the reason for the core dump
  *
  * This function should be called at the crash time within the serialized
  * gt_reset. It is skipped if we still have the core dump device available
  * with the information of the 'first' snapshot.
  */
-__printf(3, 4)
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
+__printf(4, 5)
+void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_queue *q,
+		      struct xe_sched_job *job, const char *fmt, ...)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_devcoredump *coredump = &xe->devcoredump;
 	va_list varg;
 
@@ -396,7 +400,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
 	coredump->snapshot.reason = kvasprintf(GFP_ATOMIC, fmt, varg);
 	va_end(varg);
 
-	devcoredump_snapshot(coredump, q, job);
+	devcoredump_snapshot(coredump, gt, q, job);
 
 	drm_info(&xe->drm, "Xe device coredump has been created\n");
 	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 5391a80a4d1..bc4800b3a3f 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -11,15 +11,17 @@
 struct drm_printer;
 struct xe_device;
 struct xe_exec_queue;
+struct xe_gt;
 struct xe_sched_job;
 
 #ifdef CONFIG_DEV_COREDUMP
-void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
+void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_queue *q,
+		      struct xe_sched_job *job, const char *fmt, ...);
 int xe_devcoredump_init(struct xe_device *xe);
 #else
-static inline void xe_devcoredump(struct xe_exec_queue *q,
-				  struct xe_sched_job *job,
-				  const char *fmt, ...)
+static inline void __xe_devcoredump(struct xe_gt *gt, struct xe_exec_queue *q,
+				    struct xe_sched_job *job,
+				    const char *fmt, ...)
 {
 }
 
@@ -29,6 +31,11 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 }
 #endif
 
+#define xe_devcoredump(_q, _job, _fmt, ...) \
+	__xe_devcoredump((_q)->gt, _q, _job, _fmt, ##__VA_ARGS__)
+#define xe_devcoredump_gt(_gt, _fmt, ...) \
+	__xe_devcoredump(_gt, NULL, NULL, _fmt, ##__VA_ARGS__)
+
 void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffix,
 			   const void *blob, size_t offset, size_t size);
 
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index dd1030de9ab..f7d6640d345 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_devcoredump.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt_stats.h"
@@ -29,6 +30,12 @@
 
 #define FENCE_STACK_BIT		DMA_FENCE_FLAG_USER_BITS
 
+/* The frontend is only ever embedded in a GT */
+static struct xe_gt *tlb_inval_to_gt(struct xe_tlb_inval *tlb_inval)
+{
+	return container_of(tlb_inval, struct xe_gt, tlb_inval);
+}
+
 static void xe_tlb_inval_fence_fini(struct xe_tlb_inval_fence *fence)
 {
 	if (WARN_ON_ONCE(!fence->tlb_inval))
@@ -73,6 +80,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 	struct xe_device *xe = tlb_inval->xe;
 	struct xe_tlb_inval_fence *fence, *next;
 	long timeout_delay = tlb_inval->ops->timeout_delay(tlb_inval);
+	int timedout_seqno = 0, seqno_recv = 0;
 
 	tlb_inval->ops->flush(tlb_inval);
 
@@ -90,13 +98,40 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 			"TLB invalidation fence timeout, seqno=%d recv=%d",
 			fence->seqno, tlb_inval->seqno_recv);
 
+		if (!timedout_seqno) {
+			/*
+			 * Hold a PM reference across the capture below. Every
+			 * pending fence holds one, so the device is awake
+			 * here, but signalling them may drop the last
+			 * reference and let it autosuspend before the
+			 * snapshot touches the hardware.
+			 */
+			xe_pm_runtime_get_noresume(xe);
+		}
+
+		timedout_seqno = fence->seqno;
+
 		fence->base.error = -ETIME;
 		xe_tlb_inval_fence_signal(fence);
 	}
 	if (!list_empty(&tlb_inval->pending_fences))
 		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
+	seqno_recv = tlb_inval->seqno_recv;
 	spin_unlock_irq(&tlb_inval->pending_lock);
+
+	/*
+	 * Capture the GuC log and CT state so the firmware side of the hang
+	 * can be inspected; there is no queue or job to blame here. Must be
+	 * outside pending_lock as the capture takes sleeping locks, hence
+	 * @seqno_recv is sampled above while the lock is still held.
+	 */
+	if (timedout_seqno) {
+		xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
+				  "TLB invalidation fence timeout, seqno=%d recv=%d",
+				  timedout_seqno, seqno_recv);
+		xe_pm_runtime_put(xe);
+	}
 }
 
 /**
-- 
2.55.0

