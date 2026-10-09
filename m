Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8690BCA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 14:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4350910E9DB;
	Fri,  9 Oct 2026 14:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGFDMzH3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B7310E9DB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791557954; x=1823093954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pPe1qGUS6VbmQKCF0ENegjM6yyXudZHeh4d7el6A7Dg=;
 b=gGFDMzH3aVcoFfGlha8T3EaAwi5qRiH0WVxgGa8JOs9OwCVZM5ISp0wH
 aOR21i1e1d7QpLMOShGrFkZTQvr7ijIpLfWOSIXF4wralOdFyGjAVdH0p
 bbXuD52/u7D4NVygS3dpxsfJO/FOJ09usJarh2SeGxox1DJ5E0qDvnzb4
 cjRY0+TMkx8+ka4kRTwHOfG6YdfpWqnk+1uR7z0BcCtzDbETkz6ThMjA0
 HdwSnH/VQELtYFAMywQEm/+pr6qXbK4Jfp+s9R+TASP+gJMicpvOLTh56
 q7/4zih+1gkN7hxvNn5B7+LUQ4WqFrxCD8KdXwOrAF/s7LA0Oh4suSZZX A==;
X-CSE-ConnectionGUID: xqKJJWavQfyv0eh35it0MA==
X-CSE-MsgGUID: fFnINLBNRe2RGGFh2ZMnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="251624"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="251624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 07:59:14 -0700
X-CSE-ConnectionGUID: KiCUcJLCRPuLV6UWaBf+Nw==
X-CSE-MsgGUID: +WRfiIh0ReGHusgPQhkshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="305966"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa002.jf.intel.com with ESMTP; 09 Oct 2026 07:59:13 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 2/3] drm/xe/guc: Protect timeout handling from device unplug
Date: Fri,  9 Oct 2026 14:59:09 +0000
Message-ID: <20261009145906.886719-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
References: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
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

Fixes: 6eb2aad402cc ("drm/xe: Move hw_engine_fini to devm managed")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: LLM
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

