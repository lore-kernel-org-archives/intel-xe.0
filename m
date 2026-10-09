Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C50CA601E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 14:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0D510EA66;
	Fri,  9 Oct 2026 14:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUID7Oom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79E210E9DB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791557956; x=1823093956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K0XK8byDOawhERZtd+qXIFF8oXAorXxJEMtxfEOxgtM=;
 b=XUID7OomZiJPbzHlv818XB5fAYVtF88+Lk9qYroJGwj8jXXnrMqF0sOa
 nXMdn/q3oPNgIrvg/+yffkJvEpXT79stLCpOza9BWuGKQ8VOauJaIYZls
 f/jbDzCT45uJAVelMzWKnHSwSXp/iRxa1muW99Bl9RLft+dxDRwc+Axpk
 wFYt+4lR0o6NAUYNpAJLMPQhcjkgf/gRsQFxULqafRrnmpBmBCB/1erU8
 dp004Z1ovltANSDFWnii/9QNaKBG5CQXy5nxcPOPEuZWjHla6vjqRctyS
 GyM+zTtop8XmlPtSgjyTv/axhBK1/lakYjc9fm4oshcas7ZeffWQ0V+R6 Q==;
X-CSE-ConnectionGUID: JGKkMkrvS52B435vsEKgaQ==
X-CSE-MsgGUID: oE7dJ6W1QF2hbJhLKMCOyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="251627"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="251627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 07:59:16 -0700
X-CSE-ConnectionGUID: gOmAwjqNT8SHtzUh70ik5A==
X-CSE-MsgGUID: sAIJpZ+9TeSf1HOMgxSHwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="305969"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa002.jf.intel.com with ESMTP; 09 Oct 2026 07:59:14 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v4 3/3] drm/xe/gt: Disable GT reset worker before engine
 teardown
Date: Fri,  9 Oct 2026 14:59:10 +0000
Message-ID: <20261009145906.886719-8-satyanarayana.k.v.p@intel.com>
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

