Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9BCD98C8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5D10E639;
	Tue,  9 Jun 2026 20:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsJZt1fU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA95A10E629
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781036271; x=1812572271;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xFJtchOQDedEqcE3j/IgYc0++0fu7rADet+wh+z8m/o=;
 b=QsJZt1fUeaNr9aCHFVWNURuJF76vrgML11id5lgC8xqkNNoDM5qC+bF2
 q4O9i0UkJFLNWOTwww2h71zM9xZBmjbPanQGM8tAr+ZQh4dZ8IgvSzOEr
 mgp0nvoW1cwsXk/DESu0WRqiGVvg+8pFeMhRqlhr0w9MP4y+srYlZGinT
 4PEVZYS78SgP9PCGd/G8j6ErPLcXzEgVGLWO3Gf5bfJ6WJRkk45e5Lbgo
 BlwTy2t9kLr/5mlcvHdLGGFwGv6DVsYD7lTdYtgv0MKTKPVBPj75meQvg
 LLElokUMA1D0XUaAsxvVemWTWbgzEMxy1RQ1rVNzX8VOOW7lStokBu8gs A==;
X-CSE-ConnectionGUID: G/vNIyDcQ1eBB15+SQhWZQ==
X-CSE-MsgGUID: 47dUjEchTyeh/vkPicxngA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84383301"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="84383301"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:51 -0700
X-CSE-ConnectionGUID: GwuAHwG2TzGFbcAtKTNPZA==
X-CSE-MsgGUID: RheTFsQxQWqghRQx+79olw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="284027541"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.198])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 13:17:52 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 09 Jun 2026 17:17:36 -0300
Subject: [PATCH 4/9] drm/xe/step: Make xe_step_platform_get() independent
 from xe->info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-xe-probe-info-v1-4-21e83e188e60@intel.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Currently xe_step_platform_get() uses info fields from xe->info to
define the platform-level stepping value.

Because the platform-level stepping info depends on the PCI revid, it
should be defined as part of xe_probe_info_early() instead of being
directly probed inside xe_info_init_early().

Let's make sure that xe_step_platform_get() receives the necessary
data as parameters and does not depend on xe->info.  That will allow
us to move the call up to xe_probe_info_early() in an upcoming change.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c  | 2 +-
 drivers/gpu/drm/xe/xe_step.c | 9 +++++----
 drivers/gpu/drm/xe/xe_step.h | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 382df59260ae..c5c75fbfa0e2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -808,7 +808,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
 	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
-	xe_step_platform_get(xe, &xe->info.step);
+	xe_step_platform_get(xe->info.platform, xe->info.revid, &xe->info.step);
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index 49dc64f2b363..55c1996f689e 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -110,13 +110,14 @@ __diag_pop();
 
 /**
  * xe_step_platform_get - Determine platform-level stepping from PCI revid
- * @xe: Xe device
+ * @platform: The Xe platform
+ * @revid: The PCI revid
  * @step: Pointer to the step struct to update
  *
  * Convert the PCI revid into a platform-level stepping value and store that
  * in @step->platform.
  */
-void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
+void xe_step_platform_get(enum xe_platform platform, u8 revid, struct xe_step_info *step)
 {
 	/*
 	 * Not all platforms map PCI revid directly into our symbolic stepping
@@ -127,8 +128,8 @@ void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step)
 	 * checks.
 	 */
 
-	if (xe->info.platform == XE_NOVALAKE_P)
-		step->platform = STEP_A0 + xe->info.revid;
+	if (platform == XE_NOVALAKE_P)
+		step->platform = STEP_A0 + revid;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index c6cea95a3727..5a5845335740 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -10,9 +10,10 @@
 
 #include "xe_step_types.h"
 
+enum xe_platform;
 struct xe_device;
 
-void xe_step_platform_get(struct xe_device *xe, struct xe_step_info *step);
+void xe_step_platform_get(enum xe_platform platform, u8 revid, struct xe_step_info *step);
 
 void xe_step_pre_gmdid_get(struct xe_device *xe, struct xe_step_info *step);
 void xe_step_gmdid_get(struct xe_device *xe,

-- 
2.53.0

