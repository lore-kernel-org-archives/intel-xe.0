Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916DCA0EE6
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 03:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE3C10E2CF;
	Sat, 16 Aug 2025 03:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrQBwupg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9745B10E2CF
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 03:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755315372; x=1786851372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPimtVQoQDwSyJdyzCQYdNv8H/nzl7YSh4j+i1r9VkY=;
 b=WrQBwupgSfmfmIiCPP71puC/LhkMHu3zvKirS0ZtdTewZ0CMPBW17jKp
 JANuYgO809P6Ivkoyw2ltbuHchtj0+ru/xKK06zx0FBQB0VGc9rFZ19tY
 PGezrjpSkIA4Yxes6q2vTObcbZEh+WWmkzGilm8gHTvvxDG3hJr47brJM
 i376irr1k0EE8YnJ/SupQ9HwADTujMZqFwVQMvpQnAB1z4O8xHM9YcKNS
 vhmaagztyx1DRHkFxIA3KznVusj8Twwg3iN/Aoo2edBDEVPwv41kDork2
 GvYcpwvpQUW6nlzoDnDLLNy+7GWSYOD1NURm5a1G/DY2sAQFs1jl/v+eB g==;
X-CSE-ConnectionGUID: 2kQIeauVSiqDTFoIto5nvQ==
X-CSE-MsgGUID: bmaRUkUGQESDfeCAUxqDbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57586164"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57586164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 20:36:11 -0700
X-CSE-ConnectionGUID: H+r6vNYeS2ySs+jDGv/tXg==
X-CSE-MsgGUID: OcJQYxhDS4OSDy8Bar7S0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166768345"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 20:36:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH v2 1/1] drm/xe/guc: Document GuC submission backend
Date: Fri, 15 Aug 2025 20:36:05 -0700
Message-Id: <20250816033605.2551575-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250816033605.2551575-1-matthew.brost@intel.com>
References: <20250816033605.2551575-1-matthew.brost@intel.com>
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

Add kernel-doc to xe_guc_submit.c describing the submission path,
the per-queue single-threaded model with pause/resume, the driver shadow
state machine and lost-H2G replay, job timeout handling, recovery flows
(GT reset, PM resume, VF resume), and reclaim constraints.

v2:
 - Mirror tweaks for clarity
 - Add new doc to Xe rst files

Signed-off-by: <Matthew Brost matthew.brost@intel.com>
---
 Documentation/gpu/xe/index.rst         |   1 +
 Documentation/gpu/xe/xe_guc_submit.rst |   8 +
 drivers/gpu/drm/xe/xe_guc_submit.c     | 221 +++++++++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_guc_submit.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 42ba6c263cd0..27c9f7e87006 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -27,3 +27,4 @@ DG2, etc is provided to prototype the driver.
    xe_devcoredump
    xe-drm-usage-stats.rst
    xe_configfs
+   xe_guc_submit
diff --git a/Documentation/gpu/xe/xe_guc_submit.rst b/Documentation/gpu/xe/xe_guc_submit.rst
new file mode 100644
index 000000000000..81a41a2ad255
--- /dev/null
+++ b/Documentation/gpu/xe/xe_guc_submit.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=================
+Xe GuC Submission
+=================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_guc_submit.c
+   :doc: Overview
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..fdb1a76f5366 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -45,6 +45,227 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
+/*
+ * DOC: Overview
+ *
+ * The GuC submission backend is responsible for submitting GPU jobs to the GuC
+ * firmware, tracking submission state via a state machine, handling GuC-to-host
+ * (G2H) messages related to submission, tracking outstanding jobs, managing job
+ * timeouts, managing queue teardown, and providing recovery mechanisms if GuC
+ * state is lost. Built on top of the DRM scheduler (drm_sched).
+ *
+ * Basic submission flow
+ * ---------------------
+ * Submission is driven by the DRM scheduler vfunc ->run_job(). The flow is:
+ *
+ * 1) Emit the job's ring instructions.
+ * 2) Advance the LRC ring tail:
+ *    - width == 1: simple memory write,
+ *    - width  > 1: append a GuC workqueue (WQ) item.
+ * 3) If the queue is unregistered, issue the register H2G to register the
+ *    context.
+ * 4) Trigger execution via a scheduler enable or context submit command.
+ * 5) Return the job's hardware fence to the DRM scheduler.
+ *
+ * Registration, scheduler enable, and submit commands are issued as host-to-GuC
+ * (H2G) messages over the Command Transport (CT) layer, like all GuC
+ * interactions.
+ *
+ * Completion path
+ * ---------------
+ * When the job's hardware fence signals, the DRM scheduler vfunc ->free_job()
+ * is called; it drops the job's reference, typically freeing it.
+ *
+ * Messages:
+ * ---------
+ * GuC submission scheduler messages form the control plane for queue teardown,
+ * toggling runnability, and modifying queue properties (e.g., scheduler
+ * priority, timeslice, preemption timeout). Messages are initiated via queue
+ * vfuncs that append a control message to the queue. They are processed on the
+ * same single-threaded DRM scheduler workqueue that runs ->run_job() and
+ * ->free_job().
+ *
+ * Lockless model:
+ * ---------------
+ * ->run_job(), ->free_job(), and the message handlers execute as work items on
+ * a single-threaded DRM scheduler workqueue. Per queue, this provides built-in
+ * mutual exclusion: only one of these items can run at a time. As a result,
+ * these paths are lockless with respect to per-queue state tracking. (Global
+ * or cross-queue data structures still use their own synchronization.)
+ *
+ * Starting / stopping:
+ * --------------------
+ * The per-queue, single-threaded DRM scheduler workqueue can be stopped and
+ * started dynamically. Stopping synchronously quiesces the queue's worker
+ * (lets any in-flight item finish and prevents new items from starting),
+ * yielding a stable snapshot while an external operation (e.g., job timeout
+ * handling, GT reset, runtime PM resume, VF resume) inspects and updates
+ * state and performs any required fixups.
+ *
+ * While stopped, no submission, message, or ->free_job() work runs for that
+ * queue, so per-queue state cannot change underneath the operation. When the
+ * operation completes, the queue is started; pending items (if any) are then
+ * processed in order on the same worker, preserving ordering without requiring
+ * additional per-queue locks. Other queues continue to run unaffected.
+ *
+ * State machine:
+ * --------------
+ * The submission state machine is the driver's shadow of the GuC-visible queue
+ * state (e.g., registered, runnable, scheduler properties). It tracks the
+ * transitions we intend to make (issued as H2G commands), marking them pending
+ * until acknowledged via G2H or otherwise observed as applied. It also records
+ * the origin of each transition (->run_job(), timeout handler, explicit control
+ * message, etc.).
+ *
+ * Because H2G commands and/or GuC submission state can be lost across GT reset,
+ * PM resume, or VF resume, this bookkeeping lets recovery decide which
+ * operations to replay, which to elide, and which need fixups, restoring a
+ * consistent queue state without additional per-queue locks.
+ *
+ * Job timeouts:
+ * -------------
+ * To prevent jobs from running indefinitely and violating dma-fence signaling
+ * rules, the DRM scheduler tracks how long each job has been running. If a
+ * threshold is exceeded, it calls ->timeout_job().
+ *
+ * ->timeout_job() stops the queue, samples the LRC context timestamps to
+ * confirm the job actually started and has exceeded the allowed runtime, and
+ * then, if confirmed, signals all pending jobs' fences and initiates queue
+ * teardown. Finally, the queue is started.
+ *
+ * Job timeout handling runs on a per-GT, single-threaded recovery workqueue
+ * that is shared with other recovery paths (e.g., GT reset handling, VF
+ * resume). This guarantees only one recovery action executes at a time. Each
+ * recovery path also holds a runtime PM reference for its duration to prevent
+ * races with suspend/resume and to ensure the GT remains powered while state is
+ * inspected and repaired.
+ *
+ * Queue teardown:
+ * ---------------
+ * Teardown can be triggered by: (1) userspace closing the queue, (2) a G2H
+ * queue-reset notification, or (3) a G2H memory_cat_error for the queue.
+ *
+ * In all cases teardown is driven via the timeout path by setting the queue's
+ * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
+ *
+ * GT resets:
+ * ----------
+ * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
+ * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
+ * as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues (global submission stop). Per-queue workers finish any
+ *      in-flight item and then stop; newly created queues during the window
+ *      initialize in the stopped state.
+ *    - Abort any waits on CT/G2H to avoid deadlock.
+ *
+ * 2) Sanitize driver shadow state:
+ *    - For each queue, clear GuC-derived bits in the submission state machine
+ *      (e.g., registered/enabled) and mark in-flight H2G transitions as lost.
+ *    - Convert/flush any side effects of lost H2G.
+ *
+ * 3) Decide teardown vs. replay:
+ *    - If LRC timestamps/seqno indicate a job started but did not complete,
+ *      initiate teardown via the timeout path (signal all pending fences and
+ *      disable the queue).
+ *    - If no job started, keep the queue for replay.
+ *
+ * 4) Resume:
+ *    - Start remaining queues; resubmit pending jobs.
+ *    - Queues marked for teardown remain stopped/destroyed.
+ *
+ * The entire sequence runs on the per-GT single-threaded recovery worker,
+ * ensuring only one recovery action executes at a time; a runtime PM reference
+ * is held for the duration.
+ *
+ * PM resume:
+ * ----------
+ * PM resume assumes all GuC submission state is lost (the device may have been
+ * powered down). It reuses the GT reset recovery path, but executes in the
+ * context of the caller that wakes the device (runtime PM or system resume).
+ *
+ * Suspend entry:
+ *  - Control-plane message work is quiesced; state toggles that require an
+ *    active device are not enqueued while suspended.
+ *  - Per-queue scheduler workers are stopped before the device is allowed to
+ *    suspend.
+ *  - Barring driver bugs, no queues should have in-flight jobs at
+ *    suspend/resume
+ *
+ * On resume, run the GT reset recovery flow and then start eligible queues.
+ *
+ * Runtime PM and state-change ordering:
+ * -------------------------------------
+ * Runtime/system PM transitions must not race with per-queue submission and
+ * state updates.
+ *
+ * Execution contexts and RPM sources:
+ *  - Scheduler callbacks (->run_job(), ->free_job(), ->timeout_job()):
+ *    executed with an active RPM ref held by the in-flight job.
+ *  - Control-plane message work:
+ *    enqueued from IOCTL paths that already hold an RPM ref; the message path
+ *    itself does not get/put RPM. State toggles are only issued while active.
+ *    During suspend entry, message work is quiesced and no new toggles are
+ *    enqueued until after resume.
+ *  - G2H handlers:
+ *    dispatched with an RPM ref guaranteed by the CT layer.
+ *  - Recovery phases (GT reset/VF resume):
+ *    explicitly get/put an RPM ref for their duration on the per-GT recovery
+ *    worker.
+ *
+ * Consequence:
+ *  - All submission/state mutations run with an RPM reference. The PM core
+ *    cannot enter suspend while these updates are in progress, and resume is
+ *    complete before updates execute. This prevents PM state changes from
+ *    racing with queue state changes.
+ *
+ * VF resume:
+ * ----------
+ * VF resume resembles a GT reset, but GuC submission state is expected to
+ * persist across migration; in-flight H2G commands may be lost, and GGTT
+ * base/offsets may change. Recovery proceeds as follows:
+ *
+ * 1) Quiesce:
+ *    - Stop all queues and abort waits (as with GT reset) to obtain a stable
+ *      snapshot.
+ *    - Queues created while VF resume is in-flight initialize in the stopped
+ *      state.
+ *
+ * 2) Account for lost control-plane operations:
+ *    - Mark any in-flight H2G (register/enable) as lost so they can be replayed.
+ *
+ * 3) Fix up GGTT-relative state:
+ *    - Adjust GGTT-dependent fields for each queue (e.g., addresses embedded
+ *      in job ring batches). A re-run of ->emit_job() performs this fix-up.
+ *    - Any previously written GuC WQ items are squashed/ignored and replaced
+ *      with freshly written entries carrying the corrected GGTT addresses.
+ *
+ * 4) Replay and resubmit:
+ *    - Start queues and replay required H2G in order, then resubmit pending
+ *      jobs. Control-plane messages issued on the message path are also
+ *      reissued if they were lost.
+ *
+ * The goal is to avoid teardown and preserve both job and queue state. As with
+ * other recovery flows, this runs on the per-GT single-threaded recovery
+ * worker with a held runtime PM reference.
+ *
+ * Relation to reclaim:
+ * --------------------
+ * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
+ * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
+ * message handling, and all recovery paths) lies on the reclaim path and must
+ * be reclaim-safe.
+ *
+ * Practical implications:
+ * - No memory allocations in these paths (avoid any allocation that could
+ *   recurse into reclaim or sleep).
+ * - The global submission-state lock may be taken from reclaim-tainted contexts
+ *   (timeout/recovery). Any path that acquires it (including queue init/destroy)
+ *   must not allocate or take locks that can recurse into reclaim while holding
+ *   it; keep the critical section to state/xarray updates.
+ */
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
-- 
2.34.1

