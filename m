Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1C9C3DA6D
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4E10E97E;
	Thu, 15 May 2025 22:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbsPjFPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317B10E977
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747347518; x=1778883518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wDaQodbmpMEYa2NtjxwCN+IICvIlQ0Ubz4oavan0aV4=;
 b=GbsPjFPk5k8hyxrxjKRAJd5btxGdvvF3qXrd9ujfdFEG59NY8iKzlxjO
 8hmsyBYXMNoda+X/7J1VflegmaGW+vb8qqJR/VGwMSPr4oHmp46rUi54N
 J9FCBeYiYyVkeIDoiUQqFcsIdDTMTuGVTpqK7av0nGFHPQnJPBJfnmEXf
 XxQLBcmHeLq1d7i2OQp87ZmLGZMk0+8xsGh8jF/S+2GGnv6HhBzXIcpVN
 DxiWlSGzs1OR3x3+jWXOg5HXuN6EoKFmMjbQAxC4N8xiEVpxSQDv5QE0f
 PqHlCRhv1/F9fi9frQMZH6E/LRa6jJQR5aBFDQAWQGB+fGz1/UmibkiCu Q==;
X-CSE-ConnectionGUID: 48VRNY9lQOmapsj0OksppQ==
X-CSE-MsgGUID: 8tD+RqjoSnyl2JBH1bxvgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49237275"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="49237275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:18:37 -0700
X-CSE-ConnectionGUID: QOe6oUxpSVa5JCbOY2jViQ==
X-CSE-MsgGUID: F+VJh+ylRQO6PtcTwvIEvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208";a="138242873"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 15 May 2025 15:18:36 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/7] drm/xe: Block reset while recovering from VF migration
Date: Fri, 16 May 2025 00:18:24 +0200
Message-Id: <20250515221827.1493032-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515221827.1493032-1-tomasz.lis@intel.com>
References: <20250515221827.1493032-1-tomasz.lis@intel.com>
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

Resetting GuC during recovery could interfere with the recovery
process. Such reset might be also triggered without justification,
due to migration taking time, rather than due to the workload not
progressing.

Doing GuC reset during the recovery would cause exit of RESFIX state,
and therefore continuation of GuC work while fixups are still being
applied. To avoid that, reset needs to be blocked during the recovery.

This patch blocks the reset during recovery. Reset request in that
time range will be dropped.

In case a reset procedure already started while the recovery is
triggered, there isn't much we can do - we cannot wait for it to
finish as it involves waiting for hardware, and we can't be sure
at which exact point of the reset procedure the GPU got switched.
Therefore, the rare cases where migration happens while reset is
in progress, are still dangerous. Resets are not a part of the
standard flow, and cause unfinished workloads - that will happen
during the reset interrupted by migration as well, so it doesn't
diverge that much from what normally happens during such resets.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++++--
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6f280333de13..69ccfb2e1cff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1761,7 +1761,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
-int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+/**
+ * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
+ * @guc: the &xe_guc struct instance
+ */
+int xe_guc_submit_reset_block(struct xe_guc *guc)
 {
 	int ret;
 
@@ -1774,6 +1778,24 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	 */
 	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
 	smp_wmb();
+
+	return ret;
+}
+
+/**
+ * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
+ * @guc: the &xe_guc struct instance
+ */
+void xe_guc_submit_reset_unblock(struct xe_guc *guc)
+{
+	atomic_dec(&guc->submission_state.stopped);
+}
+
+int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+{
+	int ret;
+
+	ret = xe_guc_submit_reset_block(guc);
 	wake_up_all(&guc->ct.wq);
 
 	return ret;
@@ -1849,7 +1871,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&guc->submission_state.lock);
-	atomic_dec(&guc->submission_state.stopped);
+	xe_guc_submit_reset_unblock(guc);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
 		/* Prevent redundant attempts to start parallel queues */
 		if (q->guc->id != index)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index f1cf271492ae..2c2d2936440d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,8 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+int xe_guc_submit_reset_block(struct xe_guc *guc);
+void xe_guc_submit_reset_unblock(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index f0d6abedd126..ad863be4783e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -150,9 +150,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
+	int ret = 0;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_guc_submit_pause(&gt->uc.guc);
+		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
+	}
+
+	if (ret)
+		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
 }
 
 /**
@@ -170,8 +176,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
 	/* make sure interrupts on the new HW are properly set */
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_guc_submit_reset_unblock(&gt->uc.guc);
 		xe_guc_submit_unpause(&gt->uc.guc);
+	}
 }
 
 /**
-- 
2.25.1

