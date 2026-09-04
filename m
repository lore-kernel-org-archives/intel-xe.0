Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E1AC79F88
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3B10F842;
	Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/1rk6bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46D510E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488536; x=1820024536;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MbllGcP78uFA79HGTj5Tm0Cs/Ryi2xzALggJAzkBID0=;
 b=Z/1rk6blcW2ZQLpaWFDkT3Wxxo87NDglYuXOJ2nCNdHH0LaOxkaYMEH2
 Q71KJjGLt9jP7OK47aLoT+hRcA1bpeHuyGTaX+TqbY6efbXH6hCIxQsfR
 a79XBXkWL7zXisIWr7LmcrrMygU9DSJMbtebmMPmNEeIOk+BetcL1IMM3
 T8Zjz3Pcr5VLCe8HHJ1h5xTq0bd/zrU4TW3S+XeTBb1f6vGFiokJTo8PW
 li9iwHIlP/FKCLY4L+UJRxHsKxXMJokgIPcTF/0X5KBAbGYzcrEpgnipJ
 2VW/1oNUIlaqj+uk5OY1wpI9QY18PXn2rVE4oFa0P5Q8MyyHGa466XPtc w==;
X-CSE-ConnectionGUID: uY2sqftyRDSClRsRGF43cg==
X-CSE-MsgGUID: AAXqmqTaQs2Wreb/3CZFFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506297"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:16 -0700
X-CSE-ConnectionGUID: trfIXD0LRZGchCfBlbKJZA==
X-CSE-MsgGUID: BbTGlOMZRXSNyqMTA2p3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185142"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 25/25] drm/xe: Document ULLS for migration jobs
Date: Thu,  3 Sep 2026 19:22:07 -0700
Message-Id: <20260904022207.3490018-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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
 Documentation/gpu/xe/xe_migrate.rst |   3 +
 drivers/gpu/drm/xe/xe_migrate.c     | 109 ++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 94b71571b076..de47e9b528cc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -48,6 +48,115 @@
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
+ * Exactly one exec queue - the migration queue - is ever scheduled on the
+ * reserved paging engine, and this is what makes the MMIO ring tail write in
+ * the submission fast path safe. The ring tail register belongs to whichever
+ * context is currently on the engine, so writing it from the CPU is only
+ * correct if the driver knows that context can not be anything other than the
+ * migration LRC. If more than one queue could be scheduled on the engine, a
+ * ULLS queue could clobber the ring tail of an unrelated queue, and mutual
+ * exclusion between the ULLS queue and every other queue on the engine would
+ * have to be built - via fences - before touching the register.
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

