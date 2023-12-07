Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F8CD11DF
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F5210F1C5;
	Fri, 22 Mar 2024 09:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFh08JuR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E821D10F1C5
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711099702; x=1742635702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j803p397JfFZkfp2Cfj7ASERRyd2nHuaLPLDah0opZk=;
 b=kFh08JuRAgZ5BEC80EJDV3J2N9pU1btpGBxuE5xP4CiF+gyQveVULSeD
 jHlgwmVfLpM/BO3Na9xtxakRP1V9CQ1apsofh3V0Xu5rKSCkZ08KgOjB/
 v4M45xHnTdp9+7eqrF/0lkLvE5cITRa1Mtf+5Lbdw0LKQzY9Xzr8JQePe
 Ljgo30TDERw6Gt4fqg5Skrd4CAPKyPbFyRIKOEuYntDMZK9Qosp08IRy5
 8C2wBvreczfzBcvXJreeQxtZqgJ3hlPl3VrFOi+CGXVxWaV4riOtSePD4
 5E2sIdNlNNjiE1/RbQ4zYcKi96hjGICxyrMfLlvj/jfl594Sa9x41fxn0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16774122"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16774122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19565562"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa005.jf.intel.com with ESMTP; 22 Mar 2024 02:28:15 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 1/2] drm/xe: prefer snprintf over sprintf
Date: Thu,  7 Dec 2023 06:58:39 +0530
Message-Id: <20231207012840.48432-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
References: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
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

Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)”

v2: Removed hard coded values abd used sizeof()

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c    |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c    |  4 ++--
 drivers/gpu/drm/xe/xe_hw_fence.c   |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8abdf3c17e1d..86150cafe0ff 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -129,7 +129,7 @@ void xe_debugfs_register(struct xe_device *xe)
 		if (man) {
 			char name[16];
 
-			sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
+			snprintf(name, sizeof(name), "vram%d_mm", mem_type - XE_PL_VRAM0);
 			ttm_resource_manager_create_debugfs(man, root, name);
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 730eb7d2a639..71bd52dfebcf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -225,22 +225,22 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance)
 {
 	switch (q->class) {
 	case XE_ENGINE_CLASS_RENDER:
-		sprintf(q->name, "rcs%d", instance);
+		snprintf(q->name, sizeof(q->name), "rcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		sprintf(q->name, "vcs%d", instance);
+		snprintf(q->name, sizeof(q->name), "vcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		sprintf(q->name, "vecs%d", instance);
+		snprintf(q->name, sizeof(q->name), "vecs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_COPY:
-		sprintf(q->name, "bcs%d", instance);
+		snprintf(q->name, sizeof(q->name), "bcs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_COMPUTE:
-		sprintf(q->name, "ccs%d", instance);
+		snprintf(q->name, sizeof(q->name), "ccs%d", instance);
 		break;
 	case XE_ENGINE_CLASS_OTHER:
-		sprintf(q->name, "gsccs%d", instance);
+		snprintf(q->name, sizeof(q->name), "gsccs%d", instance);
 		break;
 	default:
 		XE_WARN_ON(q->class);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 6b4dc2927727..3af85b2f6625 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -261,7 +261,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 
 	xe_gt_assert(gt, minor->debugfs_root);
 
-	sprintf(name, "gt%d", gt->info.id);
+	snprintf(name, sizeof(name), "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
 	if (IS_ERR(root)) {
 		drm_warn(&xe->drm, "Create GT directory failed");
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 2984680de3f9..bc1426f8d731 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -166,10 +166,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	}
 
 	if (xe_gt_is_media_type(gt)) {
-		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
+		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
 	} else {
-		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
+		snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-rc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_rc6_residency;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a5de3e7b0bd6..f872ef103127 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -130,7 +130,7 @@ void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 	ctx->irq = irq;
 	ctx->dma_fence_ctx = dma_fence_context_alloc(1);
 	ctx->next_seqno = XE_FENCE_INITIAL_SEQNO;
-	sprintf(ctx->name, "%s", name);
+	snprintf(ctx->name, sizeof(ctx->name), "%s", name);
 }
 
 void xe_hw_fence_ctx_finish(struct xe_hw_fence_ctx *ctx)
-- 
2.25.1

