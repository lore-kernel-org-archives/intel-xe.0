Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA25C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 07:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFE910E66D;
	Mon, 25 Mar 2024 07:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLL+Kefs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631D210E086
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711353565; x=1742889565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+HLsnDYeQVO809WtjBA7IMMKypHzIV97sYT3p2ipMw=;
 b=HLL+Kefs6k5Vh9rNUEzawbEYKm0rp+nIIEtl0JMI7JtR5TBOXme4eRec
 m4iTG/+ty7AP6GBlmKSsL6BGyrHVcdW3eOHL1Di2YcEIdD9bKmUgGqC7t
 +pEEUH8ZJcR1T06U9Y0DfqMKGS5mlYlgeT+kyoo3/0sS/xKa+rgfWKr15
 +myzOrr8BpKnGUJc7ggYKVQj0yBIymRrW7HvvJBLR7Ygb2upkO2banNB6
 ivDtgQ55AG/bvScN7+G7fygytKE9mGM1LpSnn8/L9xrSfpE+q24qItBUh
 oZ0t7fSR1gNUGj9T7+TFEjXB/iz1ML3Rl0NQu+clNoZav42hJGYb0ntxj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199052"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15525053"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa009.jf.intel.com with ESMTP; 25 Mar 2024 00:59:24 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 1/2] drm/xe: prefer snprintf over sprintf
Date: Sun, 10 Dec 2023 05:29:48 +0530
Message-Id: <20231209235949.54524-2-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
References: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
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

since the sprintf() function lacks built-in protection against buffer
overflows using the snprintf() function.

v2: Removed hard coded values and used sizeof()

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
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

