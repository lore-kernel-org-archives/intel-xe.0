Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A5DC04FF8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C0111283B;
	Mon, 15 Apr 2024 22:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJfkTJC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D487112838
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 22:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713218760; x=1744754760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ks/7QJ3A2sW34LUqbcotIYzNktJOZrVwZip+0+8crI=;
 b=MJfkTJC/dx3tKZFrD9ap9Wy1ZZQA1RxcsKopFyDU3mvY4OH/b0hSwNCw
 cpyjCJdrQADlT4645yoE+hVazUaNvLLZstwbm0ldiJ4VoVvFMmKldQN8R
 CP0tMDJhCW00qtEZsolEM8z9TbH9BUYqd/fBVed0IsgxQZYrlwLQI7py2
 xoa6pyea8xMZeLO9R2MMJKUGeVhdiSADmHDoFLCFSjS01Gzc2oRddRPgN
 tmBMeLgoQGaWzR7/rEBecEZbEHV6ogUQ8YTeBoqFBeH73GkiOPYNID/JO
 5a7WuWUtPs9aEnbx3g5znWuIkCY3sO2hYMR71BTreotRz5chqq10IuRWN g==;
X-CSE-ConnectionGUID: pHhDjqv7SrODeeVFLBUSUw==
X-CSE-MsgGUID: eJEQ132mTAumRJkWKj0Vyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12478156"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="12478156"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:06:00 -0700
X-CSE-ConnectionGUID: Kl2Bx/FHRwCJ32BPsjdKrw==
X-CSE-MsgGUID: bKq7fxl6RtKKpisqpVtWAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22117583"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:05:31 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v6 3/4] drm/xe/xe_guc_submit: Allow lr exec queues to be banned
Date: Mon, 15 Apr 2024 14:50:11 -0700
Message-Id: <20240415215012.2978778-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
References: <20240415215012.2978778-1-jonathan.cavitt@intel.com>
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

LR queues currently don't get banned during a GT/GuC reset because they
lack a job.  Though they don't have a job to detect the reset status of,
it's still possible to tell when they should be banned by looking at the
LRC: if the LRC head and tail don't match, then the exec queue should be
banned and cleaned up.

This also requires swapping the usage of xe_sched_tdr_queue_imm with
xe_guc_exec_queue_trigger_cleanup, as the former is specific to non-lr
exec queues.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---

v2:
- Fix Subject line
- Modify change slightly to remove need for "ban" boolean

v3: Revert change involving "ban" boolean to version 1

v4: Add missing semicolon and remove whitespace

v5: Use new xe_lrc_ring_tail function

 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 09331dc41ebdb..89cf84a5f888d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1422,15 +1422,23 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
+		bool ban = false;
 
 		if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				set_exec_queue_banned(q);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
+				ban = true;
 			}
+		} else if (xe_exec_queue_is_lr(q) &&
+			   (xe_lrc_ring_head(q->lrc) != xe_lrc_ring_tail(q->lrc))) {
+			ban = true;
+		}
+
+		if (ban) {
+			set_exec_queue_banned(q);
+			xe_guc_exec_queue_trigger_cleanup(q);
 		}
 	}
 }
-- 
2.25.1

