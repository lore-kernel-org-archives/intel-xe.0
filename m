Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA9CCDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 02:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46CD10E149;
	Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nic4qCU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D5910E149
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782356035; x=1813892035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AI2v2dQ1uDKiRvDsSIXkF1P6omfw9W/HCsSW7rcOUfI=;
 b=nic4qCU09ThCIno/WKegWwdbc/MYKvHwGw4ckfHP7hB9uCjQBOrO5Y0v
 yEkTSkNpgf3OSQIz+xe8OHnhBTI4pvOZLnX5WCG+HttHR2pbrMUAHb7Uz
 dh2DtGFRX/ItBhhbbVOepDobE3QbwWK+DrwA158fnVp4kRQUjX2IZguDt
 L7rb3auzeQabtZweuqI4it20dazHMZH/vk/4eB6kMES5hteWDuRftYw4w
 qT6oH1wFl58BpgKK6w+/rYbciT9YCRLyrwGIxV9BKbej6GvO/sddofu86
 /lwShJTUj1k/SR9ajbkYwctwYJaiDwUBx8TFolnz+o+BHEWLb4b1OeuG5 Q==;
X-CSE-ConnectionGUID: G2bBy11sRmKS2/++ZLtnKQ==
X-CSE-MsgGUID: 7l54lfWFQ9uDyXcXXf5tew==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93781079"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93781079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
X-CSE-ConnectionGUID: Rm9hgX6JTvK2y+l9dYa2Zw==
X-CSE-MsgGUID: ovSfuXsrR0mqZe6m3kQjEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254118532"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 1/5] drm/xe: only resume exec queues that were actually
 suspended
Date: Wed, 24 Jun 2026 19:53:50 -0700
Message-ID: <20260625025348.1620469-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

A consumer-issued suspend() can fail (e.g. the queue is killed, banned
or wedged), leaving the queue un-suspended. The consumer must then not
issue the matching resume(): resuming a queue that was never suspended
is incorrect.

Add an lr.suspended flag to struct xe_exec_queue that records whether a
consumer suspend() succeeded and a matching resume() is still owed. Set
it on a successful suspend() in the preempt-fence path, clear it on
resume(), and only resume queues that have it set.

In resume_and_reinstall_preempt_fences() also skip queues that have
since been reset/killed/banned/wedged: such a queue's suspend may not
have completed (suspend_pending can still be set, e.g. a preempt fence
signalled with -ENOENT without waiting), so resuming it would trip the
!suspend_pending assert in the backend. Leave it marked suspended and
let teardown resolve its state.

A queue is only ever suspended by a single consumer at a time
(preempt-fence mode and hw engine group fault mode are mutually
exclusive), so a single flag is sufficient.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_preempt_fence.c    |  7 +++++++
 drivers/gpu/drm/xe/xe_vm.c               | 18 +++++++++++++++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index d27ce24daae5..dbb2ee8eb5de 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -200,6 +200,18 @@ struct xe_exec_queue {
 		u32 seqno;
 		/** @lr.link: link into VM's list of exec queues */
 		struct list_head link;
+		/**
+		 * @lr.suspended: Tracks whether the consumer-issued suspend()
+		 * succeeded and a matching resume() is still owed. suspend() can
+		 * fail (e.g. killed/banned/wedged), leaving the queue
+		 * un-suspended, so consumers must only resume() queues that were
+		 * actually suspended. Set by the suspend caller on success and
+		 * cleared by the resume caller. A queue is only ever suspended by
+		 * a single consumer at a time (preempt-fence mode and hw engine
+		 * group fault mode are mutually exclusive), so a single flag is
+		 * sufficient.
+		 */
+		bool suspended;
 	} lr;
 
 #define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index d6427b473ddd..4aa570fe745d 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -74,6 +74,13 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
 	struct xe_exec_queue *q = pfence->q;
 
 	pfence->error = q->ops->suspend(q);
+	/*
+	 * Record a successful suspend so the rebind worker only resumes queues
+	 * that were actually suspended; a failed suspend() leaves the queue
+	 * un-suspended and must not be paired with a resume().
+	 */
+	if (!pfence->error)
+		WRITE_ONCE(q->lr.suspended, true);
 	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
 	return true;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..23f4a9fb9a49 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -206,7 +206,23 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
 	xe_vm_assert_held(vm);
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
-		q->ops->resume(q);
+		/*
+		 * Only resume queues whose suspend() actually succeeded. A
+		 * failed suspend() (e.g. killed/banned/wedged) leaves the queue
+		 * un-suspended, so it must not be resumed.
+		 *
+		 * Also skip queues that have since been reset/killed/banned/
+		 * wedged: their suspend may not have completed (suspend_pending
+		 * can still be set, e.g. a preempt fence signalled with -ENOENT
+		 * without waiting), so resuming would trip the !suspend_pending
+		 * assert in the backend. Such queues are being torn down anyway,
+		 * so leave them marked suspended and let teardown resolve their
+		 * state.
+		 */
+		if (READ_ONCE(q->lr.suspended) && !q->ops->reset_status(q)) {
+			WRITE_ONCE(q->lr.suspended, false);
+			q->ops->resume(q);
+		}
 
 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->lr.pfence,
 					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
-- 
2.43.0

