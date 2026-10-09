Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F938CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 12:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155CF1120E2;
	Fri,  9 Oct 2026 12:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcT7eVM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD71120E2
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791548378; x=1823084378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RoNFFApzvEX+4QC4CynFtrUmtFCQ19EAI2KWPvWOoiU=;
 b=DcT7eVM/75n1q4r/lbzQv7j47J+wVBiZ6IlqfhzlI2MYEUeK56ZGRcoV
 Xy0qockDgbJz8Wrmeaok4qCs1wwR0SIvZlBb87qQGk+jiFy0Jc1M15N9a
 U+zJ8QUW+t+rgVVYLQxJu5wF7BT1QasxKTz+fFHWoudz7IX6+0LxpHaR3
 Oc3ZhpRRQmuuDZE715Jbjw6SoeCZ5gdzbYXl6owog1nzE5iYsPE5s+fsp
 gT+mfGFnCbfUxhzIB0NQJnpMAX4hP81qVTI0RVM3N2uNISXOQrNZImr+w
 E5wPdgg3uyoKrQAemyg+146Kb9pkglR3fNqJoX1VRaoWMuUDnoGb6cwdK w==;
X-CSE-ConnectionGUID: su9rDRXOSQCTzkhbjSABSw==
X-CSE-MsgGUID: M1vbHj3zSbGvkGOcUutZPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="231650"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="231650"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 05:19:37 -0700
X-CSE-ConnectionGUID: SHWhFdM3TPCMQFEwIYOTfQ==
X-CSE-MsgGUID: 8OEJeyTzSQa6iHa5IDmOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2097445"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 05:19:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v3 3/3] drm/xe/gt: Disable GT reset worker before engine
 teardown
Date: Fri,  9 Oct 2026 12:19:24 +0000
Message-ID: <20261009121921.818671-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
References: <20261009121921.818671-5-satyanarayana.k.v.p@intel.com>
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
still access hwe after hwe is freed.

Register a separate GT-level devres action right after
xe_hw_engines_init() that disables and drains the reset worker, so it
runs before any engine is torn down.

Fixes: 09c452d1171f ("drm/xe/gt: Synchronize GT reset with device unbind")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/xe/xe_gt.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 775c826b68b4..354cedc1e9b3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -630,6 +630,18 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
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
 	int err;
@@ -656,6 +668,11 @@ static int gt_init_with_all_forcewake(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	/* Disable worker before releasing HW engines */
+	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, gt_reset_worker_disable, gt);
+	if (err)
+		return err;
+
 	err = xe_uc_init_post_hwconfig(&gt->uc);
 	if (err)
 		return err;
@@ -706,12 +723,7 @@ static void xe_gt_fini(void *arg)
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
-- 
2.43.0

