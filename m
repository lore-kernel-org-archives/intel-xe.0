Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2982D116EA
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 05:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20B10E0B8;
	Sat, 29 Nov 2025 05:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwqIC3fa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092B410E0B8
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764394107; x=1795930107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Lyor+OyAul0MvYMjasx3NKa097GH684Sbl6oF2tbVc0=;
 b=jwqIC3fa81I5i7UOdtiGiJfOPbCftV7QK45aeK4DWplLOohnhEodXm7s
 t8zUMsbhOh5v9X9UcFPWbEMCPKTxRdX3pTw2EifWtb6FXHKWwais15f6V
 apkqpmuHepV8NQGh5s1Tx1SMKz3J4tsHbZKsWmoWf32VKlyq50hKs17XU
 y/C7qDk+eHWJgvnri6Hc5AyyHBmFd0Q02X4xY3jPXI/yf17wKi0dE5ZiB
 G6QPMBF2LX9zhveAESCBOzmRizqBh6u8jPJOsoDcuPYYO6ojgIyYduF5y
 dWzEuvOx7LXFjIcROJpd15G5l0dfWEtcz3j76+FvQjoSlMXqq8Wr/P7cS Q==;
X-CSE-ConnectionGUID: mZsd9P23SUiGpMEPsJ83Dw==
X-CSE-MsgGUID: goiod4gFRRSDc6JIW/AC3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="84013627"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; d="scan'208";a="84013627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 21:28:26 -0800
X-CSE-ConnectionGUID: Ch0/h9S9Rx2nvPGU964wHw==
X-CSE-MsgGUID: WnoXJpyGQQKvNocZ2DKiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; d="scan'208";a="198068831"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa004.jf.intel.com with ESMTP; 28 Nov 2025 21:28:26 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Apply Wa_14020316580 in xe_gt_idle_enable_pg()
Date: Fri, 28 Nov 2025 21:25:48 -0800
Message-Id: <20251129052548.70766-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Wa_14020316580 was getting clobbered by power gating init code
later in the driver load sequence. Move the Wa so that
it applies correctly.

Fixes: 7cd05ef89c9d ("drm/xe/xe2hpm: Add initial set of workarounds")
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c    | 8 ++++++++
 drivers/gpu/drm/xe/xe_wa.c         | 8 --------
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 3ca7bd7c9bcd..c1c9bec3c487 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_wa_oob.h>
 #include "xe_force_wake.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -16,6 +17,7 @@
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 
 /**
  * DOC: Xe GT Idle
@@ -144,6 +146,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
 	}
 
+	if (XE_GT_WA(gt, 14020316580))
+		gtidle->powergate_enable &= ~(VDN_HCP_POWERGATE_ENABLE(0) |
+					      VDN_MFXVDENC_POWERGATE_ENABLE(0) |
+					      VDN_HCP_POWERGATE_ENABLE(2) |
+					      VDN_MFXVDENC_POWERGATE_ENABLE(2));
+
 	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3764abca3d4f..e32dd2fde6f1 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -270,14 +270,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
-	{ XE_RTP_NAME("14020316580"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301)),
-	  XE_RTP_ACTIONS(CLR(POWERGATE_ENABLE,
-			     VDN_HCP_POWERGATE_ENABLE(0) |
-			     VDN_MFXVDENC_POWERGATE_ENABLE(0) |
-			     VDN_HCP_POWERGATE_ENABLE(2) |
-			     VDN_MFXVDENC_POWERGATE_ENABLE(2))),
-	},
 	{ XE_RTP_NAME("14019449301"),
 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index fb38eb3d6e9a..7ca7258eb5d8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -76,3 +76,4 @@
 
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
+14020316580    MEDIA_VERSION(1301)
-- 
2.38.1

