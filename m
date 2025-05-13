Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF05EC3ABD9
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 22:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8909110E5FC;
	Tue, 13 May 2025 22:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDbe5SQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422C10E5FB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 May 2025 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747176603; x=1778712603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1ElNYo05NeoUV8UXchcW5wD0kA0Axh3P3yebzq+j9B8=;
 b=eDbe5SQn3aiEREcoI6TnQo+LeDfQ/mvB5EGXT99ZcyChEbEHdv3mOGnC
 haHJycJVv81a/rPGHCFdk05Kj+HGc5mOKz8U2o4hd5zcLwuN5sYgVr7zM
 shKOzh3z5pyp4zvw9rJVYpMiTzV+YjnMYdGPdFywqkSzBdHUG73lrdxGt
 j2VOM7k1gMq+99lOlpOoHIgPt7lpapcx7xWYeRh8eqj+3OjVy90AKnr8O
 wqTupsd/w9BBxgSzBlQNskLZfdzJ8BA3WkMEC2wCNL1FXH8vJ5g0PkVln
 15n6ORj0kxH2/n1G30QngsgFXamH36qhncIPyEZPW1WhnBqc/OPO4cvIZ Q==;
X-CSE-ConnectionGUID: wEaZKn7qT+yFD1HJEjwMGg==
X-CSE-MsgGUID: xF78PRYzRFClf3C0PjEXOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52860515"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="52860515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 15:50:03 -0700
X-CSE-ConnectionGUID: 4+3b+bZtSXaYht9Igjs8LA==
X-CSE-MsgGUID: IeLimQjgS6mORftieHy38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="142789396"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 13 May 2025 15:50:01 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 4/7] drm/xe: Block reset while recovering from VF migration
Date: Wed, 14 May 2025 00:49:49 +0200
Message-Id: <20250513224952.701343-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513224952.701343-1-tomasz.lis@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
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
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++++--
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 8c119d4009b0..c485272829a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1764,7 +1764,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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
 
@@ -1777,6 +1781,24 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
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
@@ -1852,7 +1874,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
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
index 69c1f41908d1..ab91ac68ef5f 100644
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
@@ -168,8 +174,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
 	unsigned int id;
 
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

