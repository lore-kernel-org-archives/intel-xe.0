Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A96ECD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 20:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C251124EE;
	Fri, 29 May 2026 20:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiIvxCUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D7A1124EE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 20:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780086723; x=1811622723;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NrU4fBXGV5leluB529e2TAJJHwbM/YvTBE0Ps5nhnng=;
 b=DiIvxCUnd20oGUCZYlJFGrREtAbc80fyGvzSZS/fX2+Uv2+04r4noaS3
 AEKSKPoPxnK5s0oGNsFXEo8oBgeNg302quHEPUp2onNLGRZCY3YlvsNK1
 bomaiaywsLSEs3NBV1C4440r4MePYc7xDrAnVx/dqtX/pIYT7qp/qij0/
 kpFaHimppp36r5UmH/Rj6KNF4c5YHQqWShXSMmSdA5GtkO7SX5mfmreVX
 qAw9GG+4ZF7XwjuWtqUnhVIF70uCZcDYPf1Fb0HPRL0gYDLBmvPd+CtJ0
 E2Om426QW3VvhNV4iwoutGmQViW8hTrHZLvgaXhQ4W4OEwIA1KmrrPq2u w==;
X-CSE-ConnectionGUID: Y/YPtFD1StesYtfXs+2qaQ==
X-CSE-MsgGUID: xkZoIOMuQh+tn6zBH8nUDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106395812"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="106395812"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 13:32:03 -0700
X-CSE-ConnectionGUID: 1e/uM1uoSzOzU1eRbvF1bQ==
X-CSE-MsgGUID: DzGjgHolToegkHJ3yz/gcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="241904215"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 13:32:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/multi_queue: Fix secondary queue GuC scheduling in
 idle_skip_suspend path
Date: Fri, 29 May 2026 13:31:55 -0700
Message-ID: <20260529203154.706923-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

In a multi-queue group all GuC scheduling must go through the primary
queue's GuC ID. Secondary queues have no independent GuC ID for
scheduling purposes.

The idle_skip_suspend optimisation skips the full GuC disable/enable
round-trip for queues that are idle at suspend time. It sets
EXEC_QUEUE_STATE_SUSPENDED (and EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND) but
leaves the queue GuC-enabled, signalling the suspend fence immediately.
On resume it re-enters scheduling by calling sched_context().

The bug: the resume handler called sched_context(q) with the secondary
queue directly. sched_context() builds XE_GUC_ACTION_SCHED_CONTEXT
using q->guc->id, which is the secondary's ID. GuC does not recognise
secondary queue IDs for scheduling, hence returns and error which
leads to GT reset.

Fix the resume path: when the idle_skip_suspend branch handles a
secondary queue, commit the secondary's ring tail explicitly via
xe_lrc_set_ring_tail() (submit_exec_queue() skips this step when the
idle_skip_suspend flag is set), then call sched_context() on the primary
queue so GuC is poked through the correct ID. The poke is skipped when
exec_queue_enabled(pq) is false, meaning the primary was properly
suspended through GuC and its own resume will re-enable scheduling and
pick up the secondary's committed ring tail.

Also fix submit_exec_queue(): after switching to the primary via
xe_exec_queue_multi_queue_primary(), return early if the primary is
suspended. This can happen when the primary took the idle_skip_suspend
path while the secondary still had a job queued on the shared submit_wq.
The secondary's ring tail is already committed to GGTT before this
check, so returning early is safe.

Add an assertion in sched_context() that the caller is never a
secondary queue, replacing the now-incorrect !exec_queue_pending_disable
assertion which did not account for the cross-queue call path.

Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for multi queue support")
Cc: stable@vger.kernel.org # v7.0+
Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 32 ++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806..e1e0d03b2678 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1171,6 +1171,9 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	 */
 	q = xe_exec_queue_multi_queue_primary(q);
 
+	if (exec_queue_suspended(q))
+		return;
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1853,7 +1856,8 @@ static void sched_context(struct xe_exec_queue *q)
 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_parallel(q));
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	/* Secondary queues must never interface GuC directly; use primary */
+	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_multi_queue_secondary(q));
 
 	trace_xe_exec_queue_submit(q);
 
@@ -1879,7 +1883,31 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 			enable_scheduling(q);
 		} else if (exec_queue_idle_skip_suspend(q)) {
 			clear_exec_queue_idle_skip_suspend(q);
-			sched_context(q);
+			if (xe_exec_queue_is_multi_queue_secondary(q)) {
+				struct xe_exec_queue *pq =
+					xe_exec_queue_multi_queue_primary(q);
+
+				/*
+				 * Secondary queues cannot send GuC actions
+				 * directly; all scheduling must go through the
+				 * primary queue's GuC ID. Commit the secondary's
+				 * ring tail first so GuC sees the pending work
+				 * when the primary context is next scheduled.
+				 * Only poke GuC if the primary is fully active:
+				 * enabled *and* not itself idle_skip_suspend
+				 * (where its VM pages may be mid-invalidation).
+				 * If the primary is suspended in any way, its
+				 * own resume will re-enable GuC scheduling and
+				 * pick up the secondary's updated ring tail.
+				 */
+				xe_lrc_set_ring_tail(q->lrc[0],
+						     q->lrc[0]->ring.tail);
+				if (exec_queue_enabled(pq) &&
+				    !exec_queue_idle_skip_suspend(pq))
+					sched_context(pq);
+			} else {
+				sched_context(q);
+			}
 		}
 	} else {
 		clear_exec_queue_suspended(q);
-- 
2.43.0

