Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF779CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622B110E501;
	Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXuYrrql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BF810E501
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386200; x=1791922200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvFSzSDAsomW3Ecy3xfK+RqKpWckHMimbcbLOP/HFv0=;
 b=nXuYrrql+VaNqZFqlKmlk/3nf5csZHqrXYJ4DajHtsxsFvxAUd77E7ij
 YRiDPof3m55/OJPONj8xZf246tutG7EbIAY1P4ynjANTEGMRyG6TAd2hb
 4WQJnSMvftXuiOu7ljZUBBwCSRm5HuiYM2cmVSxj2Q9EGCeFqg3oS+YLe
 3frZSs9W56L6oE/E+wxRmTAyMHkhYuktqpKhFhzGwmtHo9GaD5bamn1Lf
 Kdk507pVRPks0FzDfeQLn9QnpoV3/WB/GLEkN5p7fA6lFuF6oP5isopRs
 3cwU4bvpboFh/tZNlo2tOE824r4IJHZZiGyWxDOUnqAgeycop/2x/3xOs g==;
X-CSE-ConnectionGUID: 9b7soX4bTqap3xgVvU05Dw==
X-CSE-MsgGUID: ezsaTkD1SwOMYdZ6nSqxPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800525"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
X-CSE-ConnectionGUID: rHXFa2XXTP2yztbifPcdBg==
X-CSE-MsgGUID: xNYfftAJQxi5FWWi3S73BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707520"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 02/23] drm/xe: Drop GT parameter to
 xe_display_irq_postinstall()
Date: Mon, 13 Oct 2025 13:09:45 -0700
Message-ID: <20251013200944.2499947-27-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 5 ++---
 drivers/gpu/drm/xe/display/xe_display.h | 4 ++--
 drivers/gpu/drm/xe/xe_irq.c             | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 5f4044e63185..47619bb8dc10 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -227,15 +227,14 @@ void xe_display_irq_reset(struct xe_device *xe)
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
index af519414a429..9b938f1edaf5 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -657,7 +657,7 @@ static void xe_irq_postinstall(struct xe_device *xe)
 			xe_memirq_postinstall(&tile->memirq);
 	}
 
-	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
+	xe_display_irq_postinstall(xe);
 	xe_i2c_irq_postinstall(xe);
 
 	/*
-- 
2.51.0

