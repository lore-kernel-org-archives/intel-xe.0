Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD1EC021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBD110E37B;
	Fri, 14 Feb 2025 21:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2HlBJfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7B910E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568224; x=1771104224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieGcqk2uYPsPrDItxDGSVKlOwUCnD4yJsHWthfvlS+Q=;
 b=Z2HlBJfv+mc12oq33yC54m0DzMQMVvN88kRrQwqPlVTPc5rDsQFMMpsR
 bnEQaRqKgPGFGhp8D+A8tyE8DwByp5pTn0NHv4SeYU5FohNz/5SH9geWC
 i3rIX+BMFV2KUb5mux2BqAss4c7z4Yjam9h2dzCHWJVN+sEDtL0E0i2BD
 Gg/RDxqg2RUQ5CPJknBhhFaiWk3gyDqt5UvG644z6sGdpl5j7B7u7TXa5
 jTBxQQrqdbJN5vnSXn9OhX0RrlHTQfhdUXROpfQp9sVtmilBYHhiAsv2p
 48IascO/CFVXbMayf3aGLq8dHFGmnT4YEnSF16G96k9JyiyVOx6fD0aV1 Q==;
X-CSE-ConnectionGUID: OiZUT1chR4iijIwgatq66g==
X-CSE-MsgGUID: +CL+bSlPRiSuxXs0dw1Bbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447021"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:44 -0800
X-CSE-ConnectionGUID: KARuxzaCRM2uRTP+K0DJQQ==
X-CSE-MsgGUID: jIcD6/IdTg6bvs0Xda1PMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757035"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:44 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 5/9] drm/xe/display: Drop xe_display_driver_remove()
Date: Fri, 14 Feb 2025 13:23:09 -0800
Message-ID: <20250214212313.1767562-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

Handle it as part of xe_display_fini(). The error handling was already
calling it if a step after xe_display_init() failed. Just re-use the
same xe_display_fini() for driver remove.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 11 +----------
 drivers/gpu/drm/xe/display/xe_display.h |  1 -
 drivers/gpu/drm/xe/xe_device.c          |  8 ++------
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 5ad2c99a9ae74..b7c99b8df11f9 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -170,6 +170,7 @@ static void xe_display_fini(void *arg)
 	intel_hpd_poll_fini(xe);
 	intel_hdcp_component_fini(display);
 	intel_audio_deinit(display);
+	intel_display_driver_remove(display);
 }
 
 int xe_display_init(struct xe_device *xe)
@@ -211,16 +212,6 @@ void xe_display_unregister(struct xe_device *xe)
 	intel_display_driver_unregister(display);
 }
 
-void xe_display_driver_remove(struct xe_device *xe)
-{
-	struct intel_display *display = &xe->display;
-
-	if (!xe->info.probe_display)
-		return;
-
-	intel_display_driver_remove(display);
-}
-
 /* IRQ-related functions */
 
 void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 685dc74402fb8..46e14f8dee28a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -14,7 +14,6 @@ struct drm_driver;
 
 bool xe_display_driver_probe_defer(struct pci_dev *pdev);
 void xe_display_driver_set_hooks(struct drm_driver *driver);
-void xe_display_driver_remove(struct xe_device *xe);
 
 int xe_display_create(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 89802f98c4820..d88c0fddf0680 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -868,11 +868,11 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_pxp_init(xe);
 	if (err)
-		goto err_remove_display;
+		return err;
 
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
-		goto err_remove_display;
+		return err;
 
 	xe_display_register(xe);
 
@@ -899,8 +899,6 @@ int xe_device_probe(struct xe_device *xe)
 
 err_unregister_display:
 	xe_display_unregister(xe);
-err_remove_display:
-	xe_display_driver_remove(xe);
 
 	return err;
 }
@@ -911,8 +909,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	drm_dev_unplug(&xe->drm);
 
-	xe_display_driver_remove(xe);
-
 	xe_heci_gsc_fini(xe);
 }
 
-- 
2.48.1

