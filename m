Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EBEC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6A10F7E7;
	Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur197rAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B4810F08F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=s6KNQiRNa/monjPRC0b2eZn9cp09zdONZGbWYHqFYbY=;
 b=Ur197rARADRDF6cuP36pEgGl+pPWJr7Gkbie+G4VK0hluQ8oPCE1mdm7
 kBwPqcMEt8CmvUnoYoX7OCKHSPzp/5OPT5uXFYDzveJ1o9CRH57OHWDVG
 39oBczpMnIeBbVVgfRBoNwOJt1KFD9wbrD/vGWRrk96QvdWhfFy/x3s4i
 mxN1+bduv00bm40qpHmlbZNk2RjLK/rz6yuoWlpvIi3NjYHTclCS83FHC
 W6Flln6JNT6ZElt6HlpsmcxUVUsRQwMlmSAct7T5QikGz5RwGzi4aco31
 Kpeif8xYQWAB24xtXiiJsMQZAgnpWaxotOglL+tX2ZX2CnoBhNH2/rRPy Q==;
X-CSE-ConnectionGUID: HyLItemVTcSK2dqd+WdQhg==
X-CSE-MsgGUID: 6iNsc8wTSTaLATev81kUQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637825"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637825"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: UXfQ7pbJRTC2NXBLGKLheA==
X-CSE-MsgGUID: vHl9VOD3QNSGPz60zwf2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029067"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 25/25] drm/xe: Document ULLS for migration jobs
Date: Thu,  3 Sep 2026 16:58:42 -0700
Message-Id: <20260903235842.3401722-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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

Add a kernel-doc DOC section at the top of xe_migrate.c describing the
Ultra Low Latency Submission (ULLS) scheme used for migration jobs.

Cover the motivation (removing the H2G / GuC / context switch latency
from the page fault and SVM prefetch critical paths), the platform
requirements, the LRC PPHWSP semaphore layout and its relationship to
the migration queue job count, the ring preamble / postamble emitted by
the ring ops, the MMIO tail write submission fast path in the GuC
backend, and the enter / delayed exit flow along with the ULLS job
flags.

Hook the new section into Documentation/gpu/xe/xe_migrate.rst.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: Github-Copilot:Claude-opus-5
---
 Documentation/gpu/xe/xe_migrate.rst |  3 +
 drivers/gpu/drm/xe/xe_migrate.c     | 99 +++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/Documentation/gpu/xe/xe_migrate.rst b/Documentation/gpu/xe/xe_migrate.rst
index f92faec0ac94..d297ee53a582 100644
--- a/Documentation/gpu/xe/xe_migrate.rst
+++ b/Documentation/gpu/xe/xe_migrate.rst
@@ -6,3 +6,6 @@ Migrate Layer
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_migrate_doc.h
    :doc: Migrate Layer
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_migrate.c
+   :doc: ULLS (Ultra Low Latency Submission) for migration jobs
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 87a718b95eb0..66a47a012ba1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -48,6 +48,105 @@
 #include "xe_vm.h"
 #include "xe_vram.h"
 
+/**
+ * DOC: ULLS (Ultra Low Latency Submission) for migration jobs
+ *
+ * Migration jobs issued on behalf of GPU page faults and SVM prefetches sit
+ * directly in the critical path of a stalled GPU workload. The dominant cost
+ * of such a job is not the copy or clear itself but the submission latency:
+ * the H2G round trip to GuC, the GuC scheduling decision, and the hardware
+ * context switch required to place the migration LRC on an engine.
+ *
+ * ULLS removes that cost by keeping the migration context resident and
+ * *running* on the hardware engine across jobs. Instead of the ring going
+ * empty and the context being switched out between jobs, the tail of every
+ * ULLS job parks the engine on a semaphore wait for the *next* job's
+ * semaphore. Submitting the next job then only requires the CPU to write the
+ * ring tail via MMIO and signal that semaphore - no H2G, no GuC round trip,
+ * no context switch.
+ *
+ * Requirements
+ * ------------
+ *
+ * ULLS is only used on DGFX with USM support (where a hardware engine is
+ * reserved exclusively for migration jobs) and is not used on SRIOV VFs.
+ * Because the engine is spinning on a semaphore while ULLS is active, it can
+ * not be shared with user submissions. It can also be disabled at load time
+ * with the ``xe.ulls_enable`` module parameter.
+ *
+ * Semaphores
+ * ----------
+ *
+ * The semaphores live in the driver-defined portion of the migration LRC's
+ * PPHWSP (see LRC_ULLS_PPHWSP_OFFSET, mutually exclusive with the parallel
+ * submission area). There are LRC_MIGRATION_ULLS_SEMAPHORE_COUNT of them and
+ * a job's semaphore is selected by ``seqno % COUNT``, so the semaphore ring
+ * wraps with the job seqnos. To guarantee a job can never overwrite the
+ * semaphore of a job still in flight, the GuC backend caps the migration
+ * queue's scheduler job count at LRC_MIGRATION_ULLS_SEMAPHORE_COUNT - 1.
+ *
+ * Ring layout of a ULLS job
+ * -------------------------
+ *
+ * Emitted by emit_migration_job_gen12() in xe_ring_ops.c::
+ *
+ *	preamble:	clear semaphore[seqno]	(reuse for a later wrap)
+ *	<copy timestamp, start seqno store>
+ *	<batch buffer start(s)>			(skipped on first/last job)
+ *	<seqno write + user interrupt>
+ *	postamble:	wait on semaphore[seqno + 1]
+ *						(skipped on the last job)
+ *
+ * The preamble clears the current job's semaphore so it can be reused once
+ * the seqno space wraps. The postamble is what keeps the engine busy: it
+ * blocks on the *next* job's semaphore, which is only signaled when that job
+ * is actually submitted.
+ *
+ * Submission fast path
+ * --------------------
+ *
+ * In submit_exec_queue() (xe_guc_submit.c), for a ULLS job that is not the
+ * first one::
+ *
+ *	xe_hw_engine_write_ring_tail(hwe, tail);	MMIO ring tail write
+ *	xe_lrc_set_ulls_semaphore(lrc, seqno);		release previous job
+ *
+ * and the XE_GUC_ACTION_SCHED_CONTEXT H2G is suppressed entirely. The
+ * previously running job's semaphore wait is satisfied and the engine walks
+ * straight into the newly appended job.
+ *
+ * Enter / exit
+ * ------------
+ *
+ * xe_migrate_ulls_enter() is called from the page fault handler and from the
+ * SVM prefetch path, i.e. exactly where low latency migration matters. It
+ * takes a force wake reference and a PM runtime reference (the engine must
+ * stay awake while it spins), then submits a "first" ULLS job. That first job
+ * carries no batch buffer; it exists only to get the context onto the
+ * hardware through the normal GuC path and to leave the engine waiting on the
+ * next semaphore, pipelining the GuC/HW context switch out of the critical
+ * path.
+ *
+ * Keeping an engine spinning costs power, so ULLS is not left enabled
+ * indefinitely. Every enter and every ULLS job submission re-arms
+ * @xe_migrate.ulls.exit_work with a ULLS_EXIT_JIFFIES delay. When it fires
+ * with the queue idle, it submits a "last" ULLS job - again with no batch
+ * buffer and, crucially, with no postamble semaphore wait - which lets the
+ * ring drain so the context can be switched off the hardware. The force wake
+ * and PM references are then dropped. If the queue was not idle, the worker
+ * simply re-arms itself.
+ *
+ * Job flags
+ * ---------
+ *
+ * The state above is communicated to the ring ops and GuC backend via three
+ * flags on struct xe_sched_job, set under @xe_migrate.job_mutex:
+ *
+ * - @xe_sched_job.is_ulls: job is submitted while in ULLS mode
+ * - @xe_sched_job.is_ulls_first: job that entered ULLS mode
+ * - @xe_sched_job.is_ulls_last: job that exits ULLS mode
+ */
+
 /**
  * struct xe_migrate - migrate context.
  */
-- 
2.34.1

