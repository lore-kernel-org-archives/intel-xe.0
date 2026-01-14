Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4E3D31A09
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 04:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7EB10E00F;
	Wed, 14 Jan 2026 04:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYT+fM2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C47B10E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 04:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768365706; x=1799901706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hCMhim+Gw6Jsjr56aAScPGutz4Rhq993xMd+kd5scvg=;
 b=IYT+fM2A2qg05EKD1Yq062hR3Qj4kzu0G6IjI0rT8Q/Hhl+5RPgKxjsy
 DibWTwTxRIpUIEQy4gRYlFL98bRji4Kz+mtj5ByeCI/ejCfQuKAHAjoDP
 21alXuewBmvFqsA/1ltRsjXdujlqS0LxfI4wno3fbFaza9CIExsyR13cI
 3LVXKm7rURfvkACGI8lGZgauQmNdFecnXm788efvM/2Qbs2QYiXa/5vi1
 /d5X8W1reOJHdJAvepAVb6438YV+bmds4edVc35SG9jJRFwQgrAox4MJU
 6uOmXdGm38nj2/65X1L9HiKmth8wGyvt2+aUVtCIhea/NcPcGxFr1JG6J g==;
X-CSE-ConnectionGUID: DdK8XY/5QOaNCcdRKrNtGw==
X-CSE-MsgGUID: IIP1Hlg8RxOLhZzAixNTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72243641"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="72243641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 20:41:46 -0800
X-CSE-ConnectionGUID: nnZXv4gGTB+YoquzOsF/6g==
X-CSE-MsgGUID: lYXvUmM6RS2V4m/lEgonrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="205140069"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 20:41:46 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: Fix memory leak in guc_exec_queue_timedout_job
Date: Wed, 14 Jan 2026 04:41:40 +0000
Message-ID: <20260114044140.4020785-1-jia.yao@intel.com>
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

When a timeout is resolved without creating a devcoredump (e.g., scheduling
disable succeeds or check_timeout() determines there's no hang), the early
pre-captured hardware engine snapshots allocated in guc_exec_queue_timedout_job
are not freed. This leaves 64-byte snapshot structures and 8-byte engine name
strings unreferenced, triggering kmemleak warnings.

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

Signed-off-by: Jia Yao <jia.yao@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..083db224a879 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -56,6 +56,31 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
+/*
+ * If we did an early manual engine snapshot for timeout checking but
+ * ended up not creating a devcoredump, discard any pre-captured data
+ * to avoid leaking allocations.
+ */
+static void cleanup_precaptured_snapshot_if_no_devcoredump(struct xe_device *xe,
+							  struct xe_gt *gt)
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
@@ -1584,6 +1609,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		xe_guc_exec_queue_trigger_cleanup(q);
 
+	cleanup_precaptured_snapshot_if_no_devcoredump(xe, q->gt);
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
 	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
@@ -1598,6 +1624,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	xe_sched_submission_start(sched);
 handle_vf_resume:
+	cleanup_precaptured_snapshot_if_no_devcoredump(xe, q->gt);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-- 
2.43.0

