Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A07CAC5B9
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4771710E9C1;
	Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kumzE+AU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439BA10E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844006; x=1790380006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8dXHBUp96QwBXu41qc+Gd5EsepZ7X3ZGNlOu7Gx6Euo=;
 b=kumzE+AUP3ou+5n7zQWTJ/br4H2x5sn1mK1lNQ4mBGH7pERbVa9rAKPE
 Ni0l/XN/PviYyg0xitutrTcxfIZVIBpGr5c575sfn1fB7f33520lSalOa
 RUlQQCvYc6jOVWB2F0bGjiXEb9MKrvCCfgBUKMyVrWjZAlaUNFTgmb11W
 ng+/JBrbjgKlFMi1I8s8gkP2FJcYQyfTwYfdX15AilUelC1496iyAh8Ta
 VZZRmGg0SlfWLUS53J3YYByhe8Wgb/7rhrDRhfwBhQTKgW/JlpgtdpuYk
 I45L/6ps2xxx4b65wkRe2b2C/DAKjkTyOdfOAMDj1N+vuy8hV5vephIPD A==;
X-CSE-ConnectionGUID: yC5EOtn0TUaHwbmCerfizg==
X-CSE-MsgGUID: 9G+HOOC0SIq7dAqqpDl7sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817664"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: LMPll2ltTuyoNBtQ2ohsNg==
X-CSE-MsgGUID: YmmIsRsSQgCxSDv/hbWkdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852950"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 02/22] drm/xe: Drop GT parameter to
 xe_display_irq_postinstall()
Date: Thu, 25 Sep 2025 16:46:30 -0700
Message-ID: <20250925234628.2112163-26-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

Display interrupt handling has no relation to GT(s) on the platforms
supported by the Xe driver.  We only call xe_display_irq_postinstall
with the first tile's primary GT, so the single condition that uses the
GT pointer within the function always evaluates to true.  Drop the
unnecessary parameter and the condition.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 5 ++---
 drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c             | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 19e691fccf8c..f5101f267c18 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -223,15 +223,14 @@ void xe_display_irq_reset(struct xe_device *xe)
 	gen11_display_irq_reset(display);
 }
 
-void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
+void xe_display_irq_postinstall(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
 	if (!xe->info.probe_display)
 		return;
 
-	if (gt->info.id == XE_GT0)
-		gen11_de_irq_postinstall(display);
+	gen11_de_irq_postinstall(display);
 }
 
 static bool suspend_to_idle(void)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index e533aa4750bc..76db95c25f7e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -26,7 +26,7 @@ void xe_display_unregister(struct xe_device *xe);
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
-void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt);
+void xe_display_irq_postinstall(struct xe_device *xe);
 
 void xe_display_pm_suspend(struct xe_device *xe);
 void xe_display_pm_shutdown(struct xe_device *xe);
@@ -55,7 +55,7 @@ static inline void xe_display_unregister(struct xe_device *xe) {}
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
 static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
-static inline void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt) {}
+static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
 static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 870edaf69388..5018a116852f 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -656,7 +656,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
 			xe_memirq_postinstall(&tile->memirq);
 	}
 
-	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
+	xe_display_irq_postinstall(xe);
 
 	/*
 	 * ASLE backlight operations are reported via GUnit GSE interrupts
-- 
2.51.0

