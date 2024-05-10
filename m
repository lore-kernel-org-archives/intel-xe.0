Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41551C25B77
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F144B10EF01;
	Fri, 10 May 2024 18:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifT5ssBa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B662E10EF01
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364765; x=1746900765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JHpobf998QVRNgntKUndQwzJnOCbeSRSIJFrg7pbyy0=;
 b=ifT5ssBarqadoTwWq5myAvFd60xIV9bO2NMCkZxXkA3ejzZj/1AsPdAY
 HsjVRldAbc+fORVS4+rCXS/3qNBgVplWv3SWaSg31UlhBCnNnGqHdfLLv
 SIC1fF3wWrjuuCpptz94jkkhZ1bP1nSKKJg++7R99Qa74fz1tMSMQ+yCg
 lAJxFThiP4Y77xfsk7bv7RYE5xj6qT2UPb5TaVQj5NJnHOz5PlPEXuMGK
 22bm9y0t9QYOZeZM/AO007nodpZgt/N59W6Y0M15BDHDVbyPlYcwxge09
 AU440R2X8vgfkH0eRJo3wyFY3paEFQDocevvgqOWlwJVT84Kc0zqB+rCm w==;
X-CSE-ConnectionGUID: 8riajQ/ASmu8ew+MIyMDjQ==
X-CSE-MsgGUID: z+GAmj0uQ8yzrk3/FfpKGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844606"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:45 -0700
X-CSE-ConnectionGUID: D0hpDLPvTO+7y8/A0cpSVw==
X-CSE-MsgGUID: Gcw2JitOQNCSGGL7ZsuhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544118"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 14/20] drm/xe/gt: break out gt_fini into sw vs hw state
Date: Fri, 10 May 2024 19:12:27 +0100
Message-ID: <20240510181212.264622-36-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Have a cleaner separation between hw vs sw.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 36c7b1631fa6..3f1826b783ad 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -57,9 +57,17 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+static void gt_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	destroy_workqueue(gt->ordered_wq);
+}
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_gt *gt;
+	int err;
 
 	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
 	if (!gt)
@@ -68,6 +76,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
 
+	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
+	if (err)
+		return ERR_PTR(err);
+
 	return gt;
 }
 
@@ -90,15 +102,9 @@ void xe_gt_sanitize(struct xe_gt *gt)
  */
 void xe_gt_remove(struct xe_gt *gt)
 {
-	xe_uc_remove(&gt->uc);
-}
-
-static void gt_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_gt *gt = arg;
 	int i;
 
-	destroy_workqueue(gt->ordered_wq);
+	xe_uc_remove(&gt->uc);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -567,7 +573,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 }
 
 static int do_gt_reset(struct xe_gt *gt)
-- 
2.45.0

