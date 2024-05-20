Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76521C41513
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5C910E7B6;
	Mon, 20 May 2024 15:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGHm/E34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2310E6E3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219951; x=1747755951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpNnqewLijh25QGkEwnorRsnKuIOMrVv4fTD5A/BlW4=;
 b=JGHm/E34049ooMAuKGU5xczbkoMZek1ODl525qM8dF+J5PlMHaYk/g7r
 0evadcclhkGRCYuaXyw4nkW/qdQRV51zyoCLnnGmxYfTzsjAn0MH9MBcn
 rJeet1JIVRyAAr9n3Lirol27t422+AG9LKhLfZiYITmuVYYKwgdRdt2eZ
 hRGLfpGXHpGpsoWuKxSu2ggSz0gFVOVDq47i8aSB8zborYh/bwtXRllrY
 yezot6hhMS42ptTdYn6vuQs6LzVZfWVlU95yuUnPOGn38h7rdzuW+Iuzv
 M9azcRcvmkPicBDlWG2CJpyoMH2utKAaDKNesGSHHLWKwKOty9FWyqj7Z g==;
X-CSE-ConnectionGUID: 0R+U+TmtSOenVyQCl14YSQ==
X-CSE-MsgGUID: QfrVoTX5TDGYE0PksqnvLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873211"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873211"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:49 -0700
X-CSE-ConnectionGUID: C2QSc1poRIeleWaBfFErQQ==
X-CSE-MsgGUID: wL7VR4GTR/Sc4/YKKXhOZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610504"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 12/18] drm/xe/gt: break out gt_fini into sw vs hw state
Date: Mon, 20 May 2024 16:43:01 +0100
Message-ID: <20240520154249.52888-30-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index e69a03ddd255..1abcc94f4b33 100644
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
@@ -560,7 +566,6 @@ int xe_gt_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 }
 
 static int do_gt_reset(struct xe_gt *gt)
-- 
2.45.1

