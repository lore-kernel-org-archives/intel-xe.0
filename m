Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750E2CA9EBB
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC4F1120E6;
	Fri,  9 Oct 2026 12:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8BEvqT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567CE1120DB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791548376; x=1823084376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7wUqwiKMYylSdgjgGymYGwZ09CZEOLtxDwuYPEYkYhk=;
 b=D8BEvqT8w1Q1v+EXpdSjuYZzEch9+dXrFE9jUNWEmOOLQAkdZY6eVRMu
 6+/HEewOAMg/XzKH+Q4trpeBisEoFoMZPjNKSbmKUF9ycI/8ijIIWxr7d
 gU0SgOpor0y5FQAiSxGzmfOreoDTqnMg/cjOMqzBcePissd+iKQgFaEXG
 4QIClMnWKP5DxwwtUCtR4v4YhSaIpG7nDhCZGbRvnO6deGhS3zkc2/cZP
 jBWZBydAsj8TKFDtIgZObHnvj6ssLT+tpSQX6rI/wvroNPUYciPlArXXw
 LD+fqdH1Idw5q1QdpfZBf51x4gOLZq7jKXr7q9jotnKWwoEgH5U/qxj1W w==;
X-CSE-ConnectionGUID: bcXy/gNiQtOSbxC2Cvc2VQ==
X-CSE-MsgGUID: X8GjqXzPTwetZHhQ7ZK6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="231646"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="231646"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:19:36 -0700
X-CSE-ConnectionGUID: mCi9OWf2TeSDURpIwvSlGw==
X-CSE-MsgGUID: HDvoHKVSTyObrD3bftQ8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2097436"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 05:19:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 2/3] drm/xe/guc: Protect timeout handling from device unplug
Date: Fri,  9 Oct 2026 12:19:23 +0000
Message-ID: <20261009121921.818671-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
References: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
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

The GuC scheduler timeout callback accesses device and GT state while
handling a timed-out job. Guard the callback with drm_dev_enter() and
drm_dev_exit() so device unplug waits for in-flight timeout handling.
If unplug has already started, mark the job with -ENODEV and return it
to the scheduler for cleanup.

Assisted-by: LLM
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")
---
V2 -> V3:
- Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..68fd9785a8da 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1599,6 +1599,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	pid_t pid = -1;
 	bool wedged = false, wedge_device = false, skip_timeout_check;
+	int idx;
+
+	if (!drm_dev_enter(&xe->drm, &idx)) {
+		xe_sched_job_set_error(job, -ENODEV);
+		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
@@ -1611,8 +1617,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * lost.
 	 */
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
-	    vf_recovery(guc))
+	    vf_recovery(guc)) {
+		drm_dev_exit(idx);
 		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
 
 	/* Kill the run_job entry point */
 	if (xe_exec_queue_is_multi_queue(q))
@@ -1786,6 +1794,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * We want the job added back to the pending list so it gets freed; this
 	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
 	 */
+	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 
 rearm:
@@ -1799,6 +1808,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		xe_sched_submission_start(sched);
 handle_vf_resume:
+	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-- 
2.43.0

