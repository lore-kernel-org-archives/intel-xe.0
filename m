Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776FDC41513
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72310EBFE;
	Wed, 22 May 2024 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kt4W4kaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4270810EE6B
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373335; x=1747909335;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jwZZNKmYn7IEVRWC8JOFnCwLDAy1rtEwnVpocgJPtVU=;
 b=Kt4W4kaf3C7BPpSqCaDxCGHfNVyIcZqT6DWQHV7Q+dLiMAKQ2MrupMmu
 fwPKANPWMlP2qOaKxNefO82IaAW0/pshBR4bBtkW5o5aLybGhG8A4xrFC
 K6BSkdDU4gNUC3aDKkD+yajiKB6USxezg8+S2W7HQpMKqfFoT5NbtxpSE
 Y0vtEukmeKncCkwLip8iHWHT0O0GOVTEwmA1f74A2xfiyJux5VSZx1fmp
 npOf3UU15xejSH2vBwidXGsFVZAxXuCjNsaukcGvOGHe2fBlgVa8CnUZ9
 bdSjMbcQm5Jj4jOVZqz/mU3JYPTWZhbqMB5KY/Dk0I606F6DT+OoorySR Q==;
X-CSE-ConnectionGUID: PWIJIpYiTdSEri0NzHgijA==
X-CSE-MsgGUID: rj0E05ULS8O3vpJqGKgZnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562703"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:15 -0700
X-CSE-ConnectionGUID: g5tbMhvjTsCRw9DEOmY/rw==
X-CSE-MsgGUID: LV48jr6CS4m93aHkJW2L9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195309"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 12/18] drm/xe/gt: break out gt_fini into sw vs hw state
Date: Wed, 22 May 2024 11:21:55 +0100
Message-ID: <20240522102143.128069-30-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

v2: Fix missing return

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3432fef56486..98c2228b51d0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -58,9 +58,17 @@
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
@@ -69,6 +77,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
 
+	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
+	if (err)
+		return ERR_PTR(err);
+
 	return gt;
 }
 
@@ -91,15 +103,9 @@ void xe_gt_sanitize(struct xe_gt *gt)
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
@@ -562,7 +568,7 @@ int xe_gt_init(struct xe_gt *gt)
 
 	xe_gt_record_user_engines(gt);
 
-	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
+	return 0;
 }
 
 void xe_gt_record_user_engines(struct xe_gt *gt)
-- 
2.45.1

