Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E425CA9ED8
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D58410ECCC;
	Mon, 12 Oct 2026 05:51:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BF910ECCC
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791784262; x=1823320262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xdr0vTyEuSiyqU1fchqa4ukDeBij7joQ6Dd1XcklWIg=;
 b=RBqF+rGf7Ml6WTH1Etd844TyE+dfZP87yHOtl0BCt9Doyr5sazInIhpX
 fXHW3KAbJLjlCuytG/sGGfkkhJ+k9mwrODOvHtMQORFEUHWzGNErQ3Rwx
 s7pkSKKvDOp/lm33CpnMxBRhTIMTU5hf5eYLUmNSrz5qGCuf/iBGHu0Ry
 RpD8GZDQ6zNO75vo+ZtqYJyGS9dPGyORRf8qXPkyHUIWK6C+24YPeTfv2
 evyRsS3jGBjyXQ0REPz1C3P/G1eNdpFEXkLpPnpOARV+RDjFiyqb+23Am
 xohWyWddqA9kPI2kw6UcCd9UyAw/6IQfdvEGW4BiHmUu7iLIt99DZr+XT w==;
X-CSE-ConnectionGUID: aspIIHneSvuc6oUWfs7fpA==
X-CSE-MsgGUID: 3asPc/C0RwapoIxyzyuWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="361485"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="361485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:51:01 -0700
X-CSE-ConnectionGUID: N7ir2qUQSsOcYpTWE4A4wQ==
X-CSE-MsgGUID: 813oDWLnQTObFit847jLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1271075"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2026 22:51:00 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 2/3] drm/xe/guc: Protect timeout handling from device unplug
Date: Mon, 12 Oct 2026 05:50:56 +0000
Message-ID: <20261012055053.964468-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
References: <20261012055053.964468-5-satyanarayana.k.v.p@intel.com>
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
V4 -> V5:
- Return DRM_GPU_SCHED_STAT_ENODEV instead of DRM_GPU_SCHED_STAT_NO_HANG
  (Sashiko).

V3 -> V4:
- None.

V2 -> V3:
- Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..082c94340b41 100644
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
+		return DRM_GPU_SCHED_STAT_ENODEV;
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

