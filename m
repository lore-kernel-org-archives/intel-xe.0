Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B9C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 23:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CC110E02C;
	Wed, 24 Jul 2024 23:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q07lofhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E310E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 23:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721865514; x=1753401514;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RxDCUSUOBjrL1j0ODZMBiYxKXCLoCzaaUOnM/j+IMg4=;
 b=Q07lofhr/j584jnrgUytgoCyRQARF/Kl4WzAVW0YnavBoSbcAtZ8Hij1
 Dm7qvoEhhesK+ss3LqSha+nxxR7K8O/0br/MtjXXtFwNioxFEre5oHzc6
 8HTmIUl7ziVCAm1dQmgp93gHtobwi5cUcM/c3aOQ3+jawthzLBiinOBKk
 tR+JS4yH8j/cACc6KjiH8+EcWa4IL+LktwXJGLeDxYoM6q5ZYDhk8zVUi
 RRLtigbbdnmZL64Y22191bXIUt7qZPBRs5sMuzulEF2Q6XZYGaW0KKfPO
 oMLFjFHFBHeIrcayZR9S2/xOjPNGhEpvskILDaDCXYyRi3DTCPCgB2OS6 Q==;
X-CSE-ConnectionGUID: efZJSFF/RgCMxLmIEymJzQ==
X-CSE-MsgGUID: bxbjVrCgTWOx/RC3fq2UaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19429890"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19429890"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 16:58:33 -0700
X-CSE-ConnectionGUID: 1X8Zs+YESrWwUM6YvhSDCQ==
X-CSE-MsgGUID: eaO7ECMNRVmZAIeC3Sd/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="57308631"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 16:58:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Resume TDR after GT reset
Date: Wed, 24 Jul 2024 16:59:19 -0700
Message-Id: <20240724235919.1917216-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Not starting the TDR after GT reset on exec queue which have been
restarted can lead to jobs being able to be run forever. Fix this by
restarting the TDR.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 5 +++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c    | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index e4ad1d6ce1d5..7f24e58cc992 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -90,6 +90,11 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
 	cancel_work_sync(&sched->work_process_msg);
 }
 
+void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
+}
+
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg)
 {
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 10c6bb9c9386..6aac7fe68673 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -22,6 +22,8 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
 void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
 
+void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
+
 void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 460808507947..2327e11ae311 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1768,6 +1768,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 	}
 
 	xe_sched_submission_start(sched);
+	xe_sched_submission_resume_tdr(sched);
 }
 
 int xe_guc_submit_start(struct xe_guc *guc)
-- 
2.34.1

