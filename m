Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E51C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 05:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928A810E4F1;
	Thu,  3 Sep 2026 05:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Irh2ASkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962210E4F1
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 05:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788414396; x=1819950396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XA38ZHeiOfSJEtkmIm8/dcTUm5DcyboSU56nyzm4fug=;
 b=Irh2ASkC7ON8X06J1F/dDQAu++QlgNvPuTCbw52kRofBb32ptGOvlvkj
 7+rNKzFV15PWEqHL+YswAdQzLaDVJfHf9OijEeCUomKqTjc+R7dsJAjKu
 IccVXy+yo4jaDxL0+103u/brSV2oAeg0HFKnG4nO7u4hGmyv862zKEQsg
 +ANU+e5dqbb5iJ2GBAV2Rnuag8YDDdxxy/xVnznz0xm2NBJvsTmdHR55N
 4Wjfjzdhwf4L4Xux8W/6+hPlHwHvoImYNlV0hWypjXvaK/YQ9JKR9xh8N
 tbBrXxu2OJwbvDE+2eLc/0ss/hd8E3acR8f823T6mWgoGolZyeBojr//J w==;
X-CSE-ConnectionGUID: 9yuxv+YPRV2STTR5m45AAg==
X-CSE-MsgGUID: jcGCKdO3Ryiw6DOoNmFnDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100398819"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="100398819"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:35 -0700
X-CSE-ConnectionGUID: ZnbJAYtaRhiwa8suBw/84g==
X-CSE-MsgGUID: JiTELu6wQPe9gy9nAdoH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263447034"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 22:46:32 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v7 4/4] drm/xe/gt: Report GT reset failure using SIGID
Date: Thu,  3 Sep 2026 11:16:10 +0530
Message-ID: <20260903054610.3640788-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903054610.3640788-1-arvind.yadav@intel.com>
References: <20260903054610.3640788-1-arvind.yadav@intel.com>
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

Route the GT reset failure log through the structured SIGID logging helper.

Failure to complete the full graphics reset means GT reset did not finish
as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
the reset errno value to the helper.

Also update the message to describe the actual failure. The driver does not
clear GRDOM_FULL directly. The reset should complete and clear it within
the timeout.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
v7:
 - Added a GRDOM_RESET_TIMEOUT_MS constant for the GT reset timeout.
   (Michal)

v6:
 - Corrected the GT reset timeout in the log message to 5 ms.
   (sashiko)

v5:
 - Kept this patch limited to the GT reset failure path. (Michal)
 - Improved the GRDOM_FULL failure message to describe that full graphics
   reset did not complete. (Michal)

 drivers/gpu/drm/xe/xe_gt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 478e047031f4..775c826b68b4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -70,6 +70,8 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+#define GRDOM_RESET_TIMEOUT_MS	5
+
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
@@ -828,10 +830,13 @@ static int do_gt_reset(struct xe_gt *gt)
 	xe_gsc_wa_14015076503(gt, true);
 
 	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
-	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
+	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0,
+			     GRDOM_RESET_TIMEOUT_MS * USEC_PER_MSEC,
+			     NULL, false);
 	if (err)
-		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
-			  ERR_PTR(err));
+		xe_log_err(gt, GT, err,
+			   "full graphics reset not completed in %u ms\n",
+			   GRDOM_RESET_TIMEOUT_MS);
 
 	xe_gsc_wa_14015076503(gt, false);
 
-- 
2.43.0

