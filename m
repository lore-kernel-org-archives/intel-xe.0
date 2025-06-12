Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AA8C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1750710E7C7;
	Thu, 12 Jun 2025 10:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYtdDm5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC3E10E781
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723900; x=1781259900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JcntX2XEQl+cDOAD1xuoMG+fdpuGGSsl4/4okq/Pz/Q=;
 b=CYtdDm5WrNUeytfd3GKBt3jRrl4vkYQfPM+pp/9Yeo4K/h9F4V+r1c5K
 FMrFM96SOxZUPGnJajSEt1aOb4Z93NXUSlrzqtV78yT+WEMUiYxujvGBI
 CPmXrq1F5QrpzveFF1qPsyn4SXn/mrvvrgSnygW2zYCvCe61csbMpqF7t
 THqRlIrzNzyityHw4PQfVQqSt6C2E+S1MiJxyFnYjiSKUbm3gNIQdzgJT
 Kssw/8z2ImDJqEJRZ1JH6aBshWR36uSTlkQCKFXVqSF+Q69MdNdS/4Mad
 u8EkZgIygPxuPRBGlzL7riJZZ/MeccasOTmBJ1AzawH9JacHvZg982/qn Q==;
X-CSE-ConnectionGUID: X5U1O2Y1RWaGfjOlEPz4DA==
X-CSE-MsgGUID: qZPreg+RSx61b2Gg3k4E5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608607"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:24:59 -0700
X-CSE-ConnectionGUID: XjNYuPTeQEe+r3lgCs7ijw==
X-CSE-MsgGUID: guhXxDxyRjeVaoZs39wQqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152382766"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 03:24:57 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 4/8] drm/xe: Block reset while recovering from VF migration
Date: Thu, 12 Jun 2025 12:24:45 +0200
Message-Id: <20250612102449.1412058-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612102449.1412058-1-tomasz.lis@intel.com>
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
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
time range will be stalled, and unblocked only after GuC goes out
of RESFIX state.

In case a reset procedure already started while the recovery is
triggered, there isn't much we can do - we cannot wait for it to
finish as it involves waiting for hardware, and we can't be sure
at which exact point of the reset procedure the GPU got switched.
Therefore, the rare cases where migration happens while reset is
in progress, are still dangerous. Resets are not a part of the
standard flow, and cause unfinished workloads - that will happen
during the reset interrupted by migration as well, so it doesn't
diverge that much from what normally happens during such resets.

v2: Introduce a new atomic for reset blocking, as we cannot reuse
  `stopped` atomic (that could lead to losing a workload).

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c         | 10 +++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  3 +++
 drivers/gpu/drm/xe/xe_guc_types.h  |  6 +++++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++--
 5 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 858b5398c01b..96647c5801cc 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -41,6 +41,7 @@
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_submit.h"
 #include "xe_hw_fence.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_irq.h"
@@ -810,6 +811,11 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+static int gt_wait_reset_unblock(struct xe_gt *gt)
+{
+	return xe_guc_wait_reset_unblock(&gt->uc.guc);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -824,6 +830,10 @@ static int gt_reset(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset started\n");
 
+	err = gt_wait_reset_unblock(gt);
+	if (!err)
+		xe_gt_warn(gt, "reset block failed to get lifted");
+
 	xe_pm_runtime_get(gt_to_xe(gt));
 
 	if (xe_fault_inject_gt_reset()) {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 61a1aac7a976..0d6d9e07fc48 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1772,6 +1772,42 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
+/**
+ * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
+ * @guc: the &xe_guc struct instance
+ */
+int xe_guc_submit_reset_block(struct xe_guc *guc)
+{
+	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
+}
+
+/**
+ * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
+ * @guc: the &xe_guc struct instance
+ */
+void xe_guc_submit_reset_unblock(struct xe_guc *guc)
+{
+	atomic_and(0, &guc->submission_state.reset_blocked);
+	/* we are going to wake workers, make sure they all see the value */
+	smp_wmb();
+	wake_up_all(&guc->ct.wq);
+}
+
+static int guc_submit_reset_is_blocked(struct xe_guc *guc)
+{
+	return atomic_read(&guc->submission_state.reset_blocked);
+}
+
+/**
+ * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
+ * @guc: the &xe_guc struct instance
+ */
+int xe_guc_wait_reset_unblock(struct xe_guc *guc)
+{
+	return wait_event_timeout(guc->ct.wq,
+				  !guc_submit_reset_is_blocked(guc), HZ * 5);
+}
+
 int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index f1cf271492ae..45b978b047c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,9 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+int xe_guc_submit_reset_block(struct xe_guc *guc);
+void xe_guc_submit_reset_unblock(struct xe_guc *guc);
+int xe_guc_wait_reset_unblock(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 1fde7614fcc5..c7b9642b41ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -85,6 +85,12 @@ struct xe_guc {
 		struct xarray exec_queue_lookup;
 		/** @submission_state.stopped: submissions are stopped */
 		atomic_t stopped;
+		/**
+		 * @submission_state.reset_blocked: reset attempts are blocked;
+		 * blocking reset in order to delay it may be required if running
+		 * an operation which is sensitive to resets.
+		 */
+		atomic_t reset_blocked;
 		/** @submission_state.lock: protects submission state */
 		struct mutex lock;
 		/** @submission_state.enabled: submission is enabled */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index d52a16127735..a4175a2b185b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -163,9 +163,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
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
@@ -187,8 +193,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
 	 */
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

