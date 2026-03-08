Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307FAF5513F
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69E510E09C;
	Sun,  8 Mar 2026 13:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbQMKccG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181E10E09C
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Mar 2026 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772978291; x=1804514291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XIeVpsvykSAgg6Eb3mESoLnMns6usXYbi5hy8EV+EK8=;
 b=EbQMKccGa0y/0DJb92UXFvygOMTa+t7FrVdqLSc/EayulCMLjSzwOSbM
 LGempU6gZF2VcK5ZV38VVEamlOeNMsCFsjXumW/MJHo01KH0kMkcutoWO
 mxGTpYMRq5wZ8xe9+NNnqhmjwBtLS9ppFW9cVFw8Wdi5PXWOMJiN2c9ph
 +qJrxzEN4nKoWBtkXSYh1oBIk3/+51pHIb0J39jk5SGHTg0VON6pIcHOO
 ihuaqRAclL5bRcl4pu/2xXJPp/H90oTwvC42nipik3wjWjanu7Wxg/CK2
 +qhVYeXCv+R+t2pPNerHcLoWwEj46U0Ju2t8hjXFouxGovvHR6VPn/inS w==;
X-CSE-ConnectionGUID: x8wiZsU/Q1OPLLQ+dC2dDA==
X-CSE-MsgGUID: oerzDmLOS7CirRt6rcBAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="73934699"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="73934699"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:58:11 -0700
X-CSE-ConnectionGUID: 0uNNQrbyREClEfXodS8H+Q==
X-CSE-MsgGUID: UYlDGjpESe+3/LTugFMghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="242523272"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2026 06:58:08 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 02/10] drm/xe/hw_fence: Synchronize fence irq before
 destroying the job
Date: Sun,  8 Mar 2026 19:25:28 +0530
Message-ID: <20260308135536.3852304-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308135536.3852304-1-raag.jadav@intel.com>
References: <20260308135536.3852304-1-raag.jadav@intel.com>
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

We may need to cancel and destroy jobs while they are in-flight.
Make sure the irq work is synchronized when we do it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v3: Cancel in-flight jobs before FLR
---
 drivers/gpu/drm/xe/xe_hw_fence.c  | 5 +++++
 drivers/gpu/drm/xe/xe_hw_fence.h  | 1 +
 drivers/gpu/drm/xe/xe_sched_job.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index ae8ed15b64c5..c4e2b8e2648f 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -106,6 +106,11 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
 	irq_work_queue(&irq->work);
 }
 
+void xe_hw_fence_irq_sync(struct xe_hw_fence_irq *irq)
+{
+	irq_work_sync(&irq->work);
+}
+
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 599492c13f80..7ad64a515ae3 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -17,6 +17,7 @@ void xe_hw_fence_module_exit(void);
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
+void xe_hw_fence_irq_sync(struct xe_hw_fence_irq *irq);
 
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name);
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 3927666fe556..d5f3f90e9061 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -175,6 +175,7 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_device *xe = job_to_xe(job);
 	struct xe_exec_queue *q = job->q;
 
+	xe_hw_fence_irq_sync(job->q->fence_irq);
 	xe_sched_job_free_fences(job);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
-- 
2.43.0

