Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C6CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2D710E611;
	Tue, 30 Sep 2025 22:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaK2FTga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C0110E568
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272992; x=1790808992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vT22HvH38gWZHdWeokmNOeVioZP6nOpad/feplPfU1k=;
 b=NaK2FTgawmS3kpSqLWCKjArTnmxJU2ZtQTSZXw2CSKJNiXi2hh/Zt7NA
 6xVUhucoJvzSGgJkeMw/XxeL2POgvhyqOEJbSCo5oqcVun86lgqIbljLf
 sSSSTCAy10cAbh/EyiOPXzKgacElnME/d2a4ChucP1VPbb9p+mIC5LtDm
 iTvtyQo9uR/bXGUxRUL2svlA7+f3oYEcawHxZ8a3Ttv0Qp9moYxjURCfw
 F16Ew2cNRkhMfsNJ0Nznu0T4jIhX9dPTZbjEPOe7tD/SkTBMvXUn3aj1i
 gnnOc6Jn8U7H2UndSj5xYcWVlWYkapE+FE3o4xbd5pund3ioN9qwDFPbV g==;
X-CSE-ConnectionGUID: gaFQWOaxThOEw1uDDs6tcA==
X-CSE-MsgGUID: tw0+gc/ZQlyHga/DTmw13A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397742"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: v++d93BMQmKXfrbMFAEpgw==
X-CSE-MsgGUID: lp64ItC2REKeXxwLUmf4tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229437"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 02/23] drm/xe: Drop GT parameter to
 xe_display_irq_postinstall()
Date: Tue, 30 Sep 2025 15:56:19 -0700
Message-ID: <20250930225618.140071-27-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

