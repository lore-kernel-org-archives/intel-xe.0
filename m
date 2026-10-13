Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A25CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 15:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67B10E940;
	Tue, 13 Oct 2026 15:25:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF3510E929
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791905095; x=1823441095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eq5i2COEgxPuGCUSgBIRzUEClnV5/X8AEi66fMy6Iho=;
 b=l2/R5/S0EK3AKX6oM2SBw7N/wm5jVD8M7WYDnOLKDxJovp1kkv6vxc7H
 aYcj3WCRSFuORw3R7w0MtYfUCB0pAQWo5Yd4qGtluHb+fUA1QXw85DRTD
 PiqBWqZLY+Q8DBNN28YDXd0iOs9W0bIhXojnRNgqUxfC1zBqwWyAmw33a
 cfEv2TRmo/jDjnqiJZEJLOb4eldhbXdiBc5ZHjn74eUjuryUXmfXTOPpk
 QXTZR8vjgWY+GPbA6+ZWvdMKD7+ogq0yAsEvQ2uvN2+xWMeHTqpDamYYH
 xbmr8SVBXk5dVfveZWpIQ3djNpOkLi9oUoutRjMkBcmfOCWv3rTzySfv/ g==;
X-CSE-ConnectionGUID: yr/0SwltQ6iy0llZCNBQlw==
X-CSE-MsgGUID: 0tVZYCseRo6DOXj3d2zP4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="621597"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="621597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:24:25 -0700
X-CSE-ConnectionGUID: 8+gkRtk+SV2mZel4pT8C9g==
X-CSE-MsgGUID: NbDk9PVfR7qtnjv/4X/7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1116821"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa005.jf.intel.com with ESMTP; 13 Oct 2026 08:24:23 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v7 2/3] drm/xe/guc: Protect timeout handling from device unplug
Date: Tue, 13 Oct 2026 15:24:19 +0000
Message-ID: <20261013152417.3189567-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
References: <20261013152417.3189567-5-satyanarayana.k.v.p@intel.com>
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
V6 -> V7:
- Move the drm_dev_enter() after testing DMA_FENCE_FLAG_SIGNALED_BIT bit
(Matt B).

V5 -> V6:
- Return DRM_GPU_SCHED_STAT_NO_HANG instead of DRM_GPU_SCHED_STAT_ENODEV
(Piotr).

V4 -> V5:
- Return DRM_GPU_SCHED_STAT_ENODEV instead of DRM_GPU_SCHED_STAT_NO_HANG
  (Sashiko).

V3 -> V4:
- None.

V2 -> V3:
- Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7ce73489c35f..e0a3ce6015e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1599,6 +1599,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	pid_t pid = -1;
 	bool wedged = false, wedge_device = false, skip_timeout_check;
+	int idx;
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
@@ -1614,6 +1615,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	    vf_recovery(guc))
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
+	if (!drm_dev_enter(&xe->drm, &idx)) {
+		xe_sched_job_set_error(job, -ENODEV);
+		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
+
 	/* Kill the run_job entry point */
 	if (xe_exec_queue_is_multi_queue(q))
 		xe_guc_exec_queue_group_stop(q);
@@ -1786,6 +1792,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * We want the job added back to the pending list so it gets freed; this
 	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
 	 */
+	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 
 rearm:
@@ -1799,6 +1806,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		xe_sched_submission_start(sched);
 handle_vf_resume:
+	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
-- 
2.43.0

