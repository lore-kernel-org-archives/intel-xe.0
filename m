Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF2CA0EE4
	for <intel-xe@archiver.kernel.org>; Sat, 16 Aug 2025 00:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362110E2BF;
	Sat, 16 Aug 2025 00:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9euEQfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AFD10E2BF
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Aug 2025 00:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755305326; x=1786841326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NqCigaPVzgkwOzVWFdsX27wwEpAzCHyfmII6QrGtpQM=;
 b=a9euEQfiPZeiG6HFo8GB940mDX9jG3KlzUqIKQuarJ0kHVLfhpuSMO9a
 cfZXFKNvuhTFA9DNpLFG25U5HmFpF+rhi1rYY9wpsDGj7kC6ZUJuohfKQ
 BU6n3A20ubilS03/g8sxOqqh5xN1igHGgRQDkj13gtYbVpgt17L4RpumW
 c/LNYKtarGiHU1Qs9CO/9rPuKeLeojmLHscwjR3p/5v3UZLTnKSN4QyXc
 c5uc0tUbjGD5/Yc/giXvNaUsvXH3V20hy1LSKRXqJA+cLBDZAz5DMLFIk
 rXzimm+vAP/c4LZsTXRPuDhvUIozjmfw2X8vzvBOcnM54zVo5S7F1XUdB g==;
X-CSE-ConnectionGUID: bxnAC4QXTr+65ufMmPmeQw==
X-CSE-MsgGUID: +1K/IZdTT96PMJ0j53BJOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83053197"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="83053197"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:48:45 -0700
X-CSE-ConnectionGUID: lYUgcIJwRu6lDyP4PnBl8A==
X-CSE-MsgGUID: XXQ2dZ8dRNi7YmyYyMH0kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172468479"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 17:48:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH 1/1] drm/xe/guc: Document GuC submission backend
Date: Fri, 15 Aug 2025 17:48:41 -0700
Message-Id: <20250816004841.2549488-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250816004841.2549488-1-matthew.brost@intel.com>
References: <20250816004841.2549488-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add kernel-doc to xe_guc_submit.c describing the submission path
the per-queue single-threaded model with pause/resume, the driver shadow
state machine and lost-H2G replay, job timeout handling, recovery flows
(GT reset, PM resume, VF resume), and reclaim constraints.

Signed-off-by: Matthew Brost matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 181 +++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..121bb2c91fbd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -45,6 +45,187 @@
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
+ * 1) Emit the job’s ring instructions.
+ * 2) Advance the LRC ring tail:
+ *    - width == 1: simple memory write,
+ *    - width  > 1: append a WQ item.
+ * 3) Ensure the context (queue) is registered if required.
+ * 4) Trigger execution via a scheduler enable or context submit command.
+ * 5) Return the job’s hardware fence to the DRM scheduler.
+ *
+ * Registration, scheduler enable, and submit commands are issued as host-to-GuC
+ * (H2G) messages over the Command Transport (CT) layer, like all GuC
+ * interactions.
+ *
+ * Completion path
+ * ---------------
+ * When the job’s hardware fence signals, the DRM scheduler vfunc ->free_job()
+ * is called; it drops the job’s reference, typically freeing it
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
+ * The per-queue, single-threaded DRM scheduler workqueue can be paused and
+ * resumed dynamically. Pausing synchronously quiesces the queue’s worker
+ * (lets any in-flight item finish and prevents new items from starting),
+ * yielding a stable snapshot while an external operation (e.g., job timeout
+ * handling, GT reset, runtime PM resume, VF resume) inspects and updates
+ * state and performs any required fixups.
+ *
+ * While paused, no submission, message, or ->free_job() work runs for that
+ * queue, so per-queue state cannot change underneath the operation. When the
+ * operation completes, the queue is resumed; pending items (if any) are then
+ * processed in-order on the same worker, preserving ordering without requiring
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
+ * Because H2G can be lost across resets, power events, and VF resume, this
+ * bookkeeping enables recovery paths (GT reset, runtime PM resume, VF resume)
+ * to determine which operations must be replayed, which can be elided, and
+ * which require fixups, restoring a consistent queue state without additional
+ * per-queue locks.
+ *
+ * Job timeouts:
+ * -------------
+ * To prevent jobs from running indefinitely and violating dma-fence signaling
+ * rules, the DRM scheduler tracks how long each job has been running. If a
+ * threshold is exceeded, it calls ->timeout_job().
+ *
+ * ->timeout_job() pauses the queue, samples the LRC context timestamps to
+ * confirm the job actually started and has exceeded the allowed runtime, and
+ * then—if confirmed—signals all pending jobs’ fences and initiates queue
+ * teardown. Finally, the queue is resumed.
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
+ * In all cases teardown is driven via the timeout path by setting the queue’s
+ * DRM scheduler timeout to zero, forcing an immediate ->timeout_job() pass.
+ *
+ * GT resets:
+ * ----------
+ * GT resets are triggered by catastrophic errors (e.g., CT channel failure).
+ * The GuC is reset and all GuC-side submission state is lost. Recovery proceeds
+ * as follows:
+ *
+ * 1) Quiesce:
+ *    - Pause all queues (global submission stop). Per-queue workers finish any
+ *      in-flight item and then stop; newly created queues during the window
+ *      initialize in the paused state.
+ *    - Abort any waits on CT/G2H to avoid deadlock.
+ *
+ * 2) Sanitize driver shadow state:
+ *    - For each queue, clear GuC-derived bits in the submission state machine
+ *      (e.g., registered/enable) and mark in-flight H2G transitions as lost.
+ *    - Convert/flush any side effects of lost H2G.
+ *
+ * 3) Decide teardown vs. replay:
+ *    - If the LRC seqno show a job started but did not complete, initiate
+ *      teardown via the timeout path (signals all pending fences and disables
+ *      the queue).
+ *    - If no job started, keep the queue for replay.
+ *
+ * 4) Resume:
+ *    - Unpause remaining queues; resubmit pending jobs.
+ *    - Queues marked for teardown remain stopped/destroyed.
+ *
+ * The entire sequence runs on the per-GT single-threaded recovery worker,
+ * ensuring only one recovery action executes at a time; a runtime PM reference
+ * is held for the duration.
+ *
+ * PM resume:
+ * ----------
+ * PM resume assumes all GuC submission state is lost (the device may have been
+ * powered down). It reuses the GT-reset recovery path, but executes in the
+ * context of the caller that wakes the device (runtime PM or system resume).
+ * Under normal operation no queues should have in-flight jobs at resume.
+ *
+ * VF resume:
+ * ----------
+ * VF resume resembles a GT reset, but GuC submission state is expected to
+ * persist across migration; what may be lost are in-flight H2G commands, and
+ * GGTT base/offsets may change. Recovery proceeds as follows:
+ *
+ * 1) Quiesce:
+ *    - Pause all queues and abort waits (as with GT reset) to obtain a stable
+ *      snapshot.
+ *
+ * 2) Account for lost control-plane operations:
+ *    - Mark any in-flight H2G (register/enable) as lost so they can be replayed.
+ *
+ * 3) Fix up GGTT-relative state:
+ *    - Adjust GGTT-dependent fields for each queue (e.g., addresses embedded in
+ *      job ring batches). A re-run of ->emit_job() performs this fix-up.
+ *
+ * 4) Replay and resubmit:
+ *    - Resume queues and replay required H2G in-order, then resubmit pending
+ *      jobs. Control-plane messages issued on the message path are also
+ *      reissued if they were lost.
+ *
+ * The goal is to avoid teardown and preserve both job and queue state. As with
+ * other recovery flows, this runs on the per-GT single-threaded recovery
+ * worker with a held runtime PM reference.
+ *
+ * Relation with reclaim:
+ * ----------------------
+ * Jobs signal dma-fences, and the MM may wait on those fences during reclaim.
+ * As a consequence, the entire GuC submission backend (DRM scheduler callbacks,
+ * message handling, and all recovery paths) lies on the reclaim path and must
+ * be reclaim-safe.
+ *
+ * Practical implications:
+ * - No memory allocations in these paths (avoid any allocation that could
+ *   recurse into reclaim or sleep).
+ * - The global submission-state lock used by recovery is treated as
+ *   reclaim-tainted to prevent lock-order inversions with reclaim.
+ */
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
-- 
2.34.1

