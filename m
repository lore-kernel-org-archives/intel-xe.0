Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C471CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 14:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45810E6EE;
	Wed,  1 Oct 2025 14:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jn76JpAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DA210E6EE
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759329679; x=1790865679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JXnAYNaZINbbBszjl7X6GpsXC49tsDW5i1pWXLdCziE=;
 b=Jn76JpACVKjln+jVYrUBlRDtxqztjR+ZjPDLKPyrJ9QAxPMHkz+5GNVU
 GkGtbgLCicixoymHD6BAkxoS3DN1Vl6d+EnFH3FTY+7+k9nsZKeU5xdVm
 93Hldg6mi9nptn8JMry6691pPhoupMw/MX1ynXoezTcIlIJhWtw7U7xbu
 ZePzTqGpSBo+Lmhl8zTD26tAaUzB1a/2nOGyvTGPKhH4oFwBvSTbO+VX+
 t47j+7+/JgtB18nQi7T7vQAlwKs/fDUqQbBvq72wO8+6BrROKNp5Olv28
 Yf1D/j5vMYTELwuqImW6zY7PCEfQz6CbDzu3IOIXiAnXWFZaiHbSIChDc w==;
X-CSE-ConnectionGUID: lyaRMR3sTYunfxniJ1+csw==
X-CSE-MsgGUID: T70BdTa/SrSBucYAzphSKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60820431"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60820431"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:41:19 -0700
X-CSE-ConnectionGUID: lL6qqhX7QACB1hJrYqSu4A==
X-CSE-MsgGUID: d2k320InTnyXB3EXQ+9/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="184078172"
Received: from jkhalil-mobl.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.85])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:41:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Detect GT workqueue allocation failure
Date: Wed,  1 Oct 2025 16:40:51 +0200
Message-ID: <20251001144051.202040-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The allocation of the per-GT workqueue may fail and we shouldn't
ignore that.  While around use drm managed allocation function
to drop our custom fini action.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
It looks that besides many changes in the surrounding code, we
were ignoring that failure from the very beginning, but maybe
it still deserves

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
---
 drivers/gpu/drm/xe/xe_gt.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e0ad7e5b5df..b77572a19548 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -65,29 +65,19 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-static void gt_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_gt *gt = arg;
-
-	destroy_workqueue(gt->ordered_wq);
-}
-
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
+	struct drm_device *drm = &tile_to_xe(tile)->drm;
 	struct xe_gt *gt;
-	int err;
 
-	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
+	gt = drmm_kzalloc(drm, sizeof(*gt), GFP_KERNEL);
 	if (!gt)
 		return ERR_PTR(-ENOMEM);
 
 	gt->tile = tile;
-	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
-						 WQ_MEM_RECLAIM);
-
-	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
-	if (err)
-		return ERR_PTR(err);
+	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
+	if (IS_ERR(gt->ordered_wq))
+		return ERR_CAST(gt->ordered_wq);
 
 	return gt;
 }
-- 
2.47.1

