Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5A6CD6E54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D7F10FD33;
	Fri, 29 May 2026 11:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJiCcDCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8E10FD2E;
 Fri, 29 May 2026 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052689; x=1811588689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bhYRPd7OXlh5IdQ7cWJWYHfOiJkXx/KysActJv5MRY=;
 b=ZJiCcDCtl40lnlG+L1QcluVg3Xx+BThXygnS29Ms73sNaZ8+gHBhFjqH
 U2FW1wbFejhevHizp/kJXELFHpo5E8O5zk0rIR/TIxvcaHHFUjFgRneqq
 nZC5qVKTyi94ukQ3+ALrm71DD5PyJZN9ayubvi8fe/HO6aEce/9F8vRdD
 lY6fsyriPBaIcYOuv4DTVBE3FYT9nKmIEbbxngruBbX0ZU4vSqxOjl1JP
 kwXlT1b134aLwG1swx8nlZY2LlgMFXjgU2lND8QAXYe18UXr2G94ixdFQ
 b7iQW/+b88OjVsr8kNSE8m8qfn3zNEpI8ffQ9PD0m/3JgekTl2uAJBH6M g==;
X-CSE-ConnectionGUID: p5CEAU3oRNmzqPvNIEwceA==
X-CSE-MsgGUID: 8EewZ7qNRcK27q1gFhNWuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80629244"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="80629244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:49 -0700
X-CSE-ConnectionGUID: nEpox5KHQVKZcxaZHdPtKg==
X-CSE-MsgGUID: MhGa1w6fTV+wIJ/S4Vshlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="236470839"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 07/24] drm/xe/display: rename xe_display_pm_shutdown*() to
 xe_display_shutdown*()
Date: Fri, 29 May 2026 14:03:51 +0300
Message-ID: <ed6969b44d160d13d4f19d8fcd7c758f6157c27c.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The shutdown functions get called from the struct pci_driver .shutdown
hook, not through the struct dev_pm_ops hooks. Name accordingly,
dropping the "pm" from the name, even if shutdown has a lot of
similarities with suspend.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c |  4 ++--
 drivers/gpu/drm/xe/display/xe_display.h | 10 ++++++----
 drivers/gpu/drm/xe/xe_device.c          |  4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index d1c450a18713..3567b3018083 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -326,7 +326,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_dmc_suspend(display);
 }
 
-void xe_display_pm_shutdown(struct xe_device *xe)
+void xe_display_shutdown(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
@@ -400,7 +400,7 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	intel_dmc_wl_flush_release_work(display);
 }
 
-void xe_display_pm_shutdown_late(struct xe_device *xe)
+void xe_display_shutdown_late(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 60291cb154df..e5f9aed93206 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -29,15 +29,16 @@ int xe_display_init(struct xe_device *xe);
 void xe_display_register(struct xe_device *xe);
 void xe_display_unregister(struct xe_device *xe);
 
+void xe_display_shutdown(struct xe_device *xe);
+void xe_display_shutdown_late(struct xe_device *xe);
+
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir);
 void xe_display_irq_reset(struct xe_device *xe);
 void xe_display_irq_postinstall(struct xe_device *xe);
 
 void xe_display_pm_suspend(struct xe_device *xe);
-void xe_display_pm_shutdown(struct xe_device *xe);
 void xe_display_pm_suspend_late(struct xe_device *xe);
-void xe_display_pm_shutdown_late(struct xe_device *xe);
 void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
@@ -65,15 +66,16 @@ static inline int xe_display_init(struct xe_device *xe) { return 0; }
 static inline void xe_display_register(struct xe_device *xe) {}
 static inline void xe_display_unregister(struct xe_device *xe) {}
 
+static inline void xe_display_shutdown(struct xe_device *xe) {}
+static inline void xe_display_shutdown_late(struct xe_device *xe) {}
+
 static inline void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl) {}
 static inline void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir) {}
 static inline void xe_display_irq_reset(struct xe_device *xe) {}
 static inline void xe_display_irq_postinstall(struct xe_device *xe) {}
 
 static inline void xe_display_pm_suspend(struct xe_device *xe) {}
-static inline void xe_display_pm_shutdown(struct xe_device *xe) {}
 static inline void xe_display_pm_suspend_late(struct xe_device *xe) {}
-static inline void xe_display_pm_shutdown_late(struct xe_device *xe) {}
 static inline void xe_display_pm_resume_early(struct xe_device *xe) {}
 static inline void xe_display_pm_resume(struct xe_device *xe) {}
 static inline void xe_display_pm_runtime_suspend(struct xe_device *xe) {}
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d224861b6f6f..ec065b168bb9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1128,14 +1128,14 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
-	xe_display_pm_shutdown(xe);
+	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_shutdown(gt);
 
-	xe_display_pm_shutdown_late(xe);
+	xe_display_shutdown_late(xe);
 
 	if (!xe_driver_flr_disabled(xe)) {
 		/* BOOM! */
-- 
2.47.3

