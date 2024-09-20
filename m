Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E708C78830
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 12:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4B10E82F;
	Fri, 20 Sep 2024 12:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOemehYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC86610E82F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 12:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726835998; x=1758371998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=umP9Eh3HHtH+2RE7AoiWYIkD8ktJgdL3V3Hkgr4Mwgs=;
 b=EOemehYxSlK8IleP5E4dAq2A9hoIg7icH/Ia3eGCSRwbgvJVk7RBFPam
 2MwxLIr4CWauZTsh88wtKTlGZrJ6D0+9haFORBJAtVEUWnkLEZ2Is6Zb+
 U/kHhgFuchIsxMIZMsixUJ+6xM2i7Kvk98hLP4U5eL5FQfLUm3sNE8+Xs
 JYQ7yV8wUWF+7kHYK9kDA61zFlpX8CniI1guLf2lr79J/jZv3fz7lfHb3
 TlmSjaNzxP3rLpIhd0da0F4NE3aRQb6unxwxq80/HDFrtPFSfAIDxily9
 dmJ58/FQfFHv237GagHV9loaFYY2svSq1HIAvB36eqWvjdlTF0ZzeB7GV g==;
X-CSE-ConnectionGUID: Pjt/XhzMTGmxgirl0VTfhw==
X-CSE-MsgGUID: zWMav/4iQSOvsFyVDll5xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26023949"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="26023949"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 05:39:57 -0700
X-CSE-ConnectionGUID: YrW+I/n3SfmdJl1aGMzDmg==
X-CSE-MsgGUID: 12CzCK0cSwe6JVIHthg97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70416793"
Received: from opintica-mobl1 (HELO mwauld-desk.intel.com) ([10.245.245.19])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 05:39:56 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe/guc_submit: fix UAF in run_job()
Date: Fri, 20 Sep 2024 13:38:07 +0100
Message-ID: <20240920123806.176709-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

The initial kref from dma_fence_init() should match up with whatever
signals the fence, however here we are submitting the job first to the
hw and only then grabbing the extra ref and even then we touch some
fence state before this. This might be too late if the fence is
signalled before we can grab the extra ref. Rather always grab the
refcount early before we do the submission part.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fbbe6a487bbb..b33f3d23a068 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -766,12 +766,15 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
+	struct dma_fence *fence;
 
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
 
 	trace_xe_sched_job_run(job);
 
+	dma_fence_get(job->fence);
+
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_exec_queue(q);
@@ -782,12 +785,16 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (lr) {
 		xe_sched_job_set_error(job, -EOPNOTSUPP);
-		return NULL;
+		fence = NULL;
 	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
-		return job->fence;
+		fence = job->fence;
 	} else {
-		return dma_fence_get(job->fence);
+		fence = dma_fence_get(job->fence);
 	}
+
+	dma_fence_put(job->fence);
+
+	return fence;
 }
 
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
-- 
2.46.0

