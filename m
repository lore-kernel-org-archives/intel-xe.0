Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0D6D3900B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 18:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034D10E15D;
	Wed, 14 Jan 2026 18:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbR8V14A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0910E15D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768416309; x=1799952309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6YgB8kJRgHjri6Av1QNgYACQzF81zDfIvDtVPl+drNo=;
 b=EbR8V14Al3iJaFUzyam/VxWQilW3fPEqwoG1b7vMD3Q6UlXyhLWCQc+T
 cEoMPlznXay3Kf4FYl5jY2sV0QP8WIdQowRGoB1dTE3+F/dDD461N3DaE
 8b2VH+VFRafW+QYvF7BDGkMzaEv2dZlfZQcwUqWDcslQBdTWyVep9g9/k
 Zm/bjrGECD1gfliIVsZ9+5EXqQfiEEqZQ9xt3n1OFbb+fArqNzAFKdwMO
 tCfcm0d9vFqlDEf8Fm+tTggdAVNdJA1MkdnVFh85P2drTwjzW6YbeG6AO
 Byunid3/0Azz13oudAEzfm7vJjDxuOiKwJ3Q8dyhEwkbxTesrVo0pat5R g==;
X-CSE-ConnectionGUID: bITf7lc1Qj+h3g8zThZqLg==
X-CSE-MsgGUID: m3hdXZkbQhGumlaTVCLkew==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69775782"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="69775782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 10:45:08 -0800
X-CSE-ConnectionGUID: zqqosXaYSPOiZNDbB1DFUg==
X-CSE-MsgGUID: e8NCZ9pLRNSzAfvgh6rB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="236001271"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa001.fm.intel.com with ESMTP; 14 Jan 2026 10:45:08 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Xin Wang <x.wang@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Fix memory leak in guc_exec_queue_timedout_job
Date: Wed, 14 Jan 2026 18:45:05 +0000
Message-ID: <20260114184505.10264-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114044140.4020785-1-jia.yao@intel.com>
References: <20260114044140.4020785-1-jia.yao@intel.com>
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

When a timeout is resolved without creating a devcoredump (e.g., scheduling
disable succeeds or check_timeout() determines there's no hang),
the early pre-captured hardware engine snapshots allocated in
guc_exec_queue_timedout_job are not freed. This leaves 64-byte snapshot
structures and 8-byte engine name strings unreferenced, triggering kmemleak
warnings.

Fix by explicitly freeing pre-captured snapshots and releasing matched GuC
capture nodes when returning DRM_GPU_SCHED_STAT_NO_HANG without creating a
devcoredump.

Reported by kmemleak:
  unreferenced object 0xffff8881078bb040 (size 64):
    xe_hw_engine_snapshot_capture+0x7d/0x500 [xe]
    xe_engine_snapshot_capture_for_queue+0x162/0x320 [xe]
    guc_exec_queue_timedout_job+0x99c/0x1ca0 [xe]
  unreferenced object 0xffff88810232f1c8 (size 8):
    kstrdup+0x38/0x90
    xe_hw_engine_snapshot_capture+0x97/0x500 [xe]

v2 (Matt Brost)
    - Rename cleanup_precaptured_snapshot_if_no_devcoredump to
	cleanup_snapshot

Signed-off-by: Jia Yao <jia.yao@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..d55d6c4c5199 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -56,6 +56,30 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
+/*
+ * If we did an early manual engine snapshot for timeout checking but
+ * ended up not creating a devcoredump, discard any pre-captured data
+ * to avoid leaking allocations.
+ */
+static void cleanup_snapshot(struct xe_device *xe, struct xe_gt *gt)
+{
+	struct xe_devcoredump *coredump = &xe->devcoredump;
+	int i;
+
+	if (coredump->captured)
+		return;
+
+	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
+	coredump->snapshot.matched_node = NULL;
+
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++) {
+		if (coredump->snapshot.hwe[i]) {
+			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
+			coredump->snapshot.hwe[i] = NULL;
+		}
+	}
+}
+
 /*
  * Helpers for engine state, using an atomic as some of the bits can transition
  * as the same time (e.g. a suspend can be happning at the same time as schedule
@@ -1584,6 +1608,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		xe_guc_exec_queue_trigger_cleanup(q);
 
+	cleanup_snapshot(xe, q->gt);
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
 	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
@@ -1598,6 +1623,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	xe_sched_submission_start(sched);
 handle_vf_resume:
+	cleanup_snapshot(xe, q->gt);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-- 
2.43.0

