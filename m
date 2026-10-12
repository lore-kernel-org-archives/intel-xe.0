Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF2ACA9ED6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D54410ECCE;
	Mon, 12 Oct 2026 05:51:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EF810ECCE
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791784264; x=1823320264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0XK8byDOawhERZtd+qXIFF8oXAorXxJEMtxfEOxgtM=;
 b=OE8AJYwXRV1Gpm3fT1/8VZhPmRJ7+g5I5mFGZRmIMVhm5/eVmEUk1xD+
 DhWbN3KbxEURVQRMaJyajFl2dbhV0eD+w/iMlcKVHSXG923XI+Vjt3QK+
 gJwAKRVPf/Xt+5JivkCkCO+TcBs/+06Ll+OE4yAdhY+6Yo9//7fKhcSf8
 d7GZgVGvTq15dJm2zMLlq9/nDtvKaSaO+M1eHnZlwfYhfc6kDzAWcDaG2
 pXTqtJTuiZ17ibOv63atJ2cSqdR+uFGbOIAI6L96YXIQ76eGc3Hs9LPkg
 QGrhesGpZSvjBAjscB57s4VYtOxBZrE2GhXNxO+zGFxpb+i6eskyafZWL Q==;
X-CSE-ConnectionGUID: LAJTUZhtSQW1WO1DCYbp+g==
X-CSE-MsgGUID: H3gxGUXdSOS+xvPGqBj/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="361487"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="361487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:51:03 -0700
X-CSE-ConnectionGUID: 5xJ+v1+cTB2Vcy6uyAOPDQ==
X-CSE-MsgGUID: hszk/cgJTEOzQ3smX5qPrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1271078"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2026 22:51:02 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v5 3/3] drm/xe/gt: Disable GT reset worker before engine
 teardown
Date: Mon, 12 Oct 2026 05:50:57 +0000
Message-ID: <20261012055053.964468-8-satyanarayana.k.v.p@intel.com>
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

During tear-down process, a reset queued from Guc timeout handler can
still access hwe after hwe is freed. Register a separate devm
action that disables and drains the reset worker, so it runs before
any engine is torn down.

Fixes: 09c452d1171f ("drm/xe/gt: Synchronize GT reset with device unbind")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Assisted-by: LLM
---
V3 -> V4:
- Fix race condition reported by LLM (Sashiko).
---
 drivers/gpu/drm/xe/xe_gt.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 775c826b68b4..bc9bf6f0b5a7 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -630,8 +630,21 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	return 0;
 }
 
+static void gt_reset_worker_disable(void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	if (disable_work_sync(&gt->reset.worker))
+		/*
+		 * If gt_reset_worker was halted from executing, take care of
+		 * releasing the rpm reference here.
+		 */
+		xe_pm_runtime_put(gt_to_xe(gt));
+}
+
 static int gt_init_with_all_forcewake(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
@@ -698,6 +711,11 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_init_hw(gt);
 
+	/* Last action registered here so devres drains resets before teardown */
+	err = devm_add_action_or_reset(xe->drm.dev, gt_reset_worker_disable, gt);
+	if (err)
+		return err;
+
 	return 0;
 }
 
@@ -706,12 +724,7 @@ static void xe_gt_fini(void *arg)
 	struct xe_gt *gt = arg;
 	int i;
 
-	if (disable_work_sync(&gt->reset.worker))
-		/*
-		 * If gt_reset_worker was halted from executing, take care of
-		 * releasing the rpm reference here.
-		 */
-		xe_pm_runtime_put(gt_to_xe(gt));
+	gt_reset_worker_disable(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -754,8 +767,10 @@ int xe_gt_init(struct xe_gt *gt)
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = gt_init_with_all_forcewake(gt);
-	if (err)
+	if (err) {
+		gt_reset_worker_disable(gt);
 		return err;
+	}
 
 	xe_gt_record_user_engines(gt);
 
-- 
2.43.0

