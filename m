Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5FECD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1C610EBE6;
	Tue, 12 May 2026 18:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wu/5Phi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8AB10EBDF
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610840; x=1810146840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wPdGMfBpevMU8SzK6O9Zn2wqHkHjbkxuhnz3M8hgSTQ=;
 b=Wu/5Phi5icThfQswf/7MD3x37ucyB7FMe/A4pIlsaAEacLrjT4rSB/BN
 epRYnyKie4/YN7gr4N0l7YKDZ+IYynbYpU+eN1svoP/kVXrJlwDuo6DuZ
 0KxiZZfzp2QzH3Kii9ZO0G5iB+jg1oDEj4O9V2O3cdEl7xxqT6eV26zxN
 Bftckt+mayGhsdmrg+cMIHVV7RTA2+HSCsz46aPwcOgxhuZiPsVi2II3F
 ZwO8KgkeRW5DV+G0MbqiW+sLgg1HFgfAKw4llJdjTU5CLlPikoQ9lYS/z
 RRVi95g5yal8AHupq8MZ1jG8LDwesfokMomumRlc+lczo+Bw7JuxVknTV A==;
X-CSE-ConnectionGUID: wqWg2SneS0GWl28XUR4q5g==
X-CSE-MsgGUID: KG+8jygkQBKoWin47a3IYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425730"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:59 -0700
X-CSE-ConnectionGUID: 4XkXbQ4cRU2JkJSBxwGttA==
X-CSE-MsgGUID: PSN7ctZDSX6OrI9/nEoY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791098"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 5/7] drm/xe/display: Add macro with display driver features
Date: Tue, 12 May 2026 20:33:40 +0200
Message-ID: <20260512183342.3374-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

Instead of updating drm_driver.driver_features in the runtime, we
can use macro which value depends on the CONFIG_DRM_XE_DISPLAY.

And if display support is later disabled by the xe_modparam then we
will clear related bits in the drm_device.driver_features instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 4 +---
 drivers/gpu/drm/xe/display/xe_display.h | 2 ++
 drivers/gpu/drm/xe/xe_device.c          | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 7e7d476da8ce..7e5382fc161d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -84,13 +84,11 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
 	if (!xe_modparam.probe_display)
 		return;
-
-	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 }
 
 static void unset_display_features(struct xe_device *xe)
 {
-	xe->drm.driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
+	xe->drm.driver_features &= ~XE_DISPLAY_DRIVER_FEATURES;
 }
 
 static void xe_display_fini_early(void *arg)
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index deec0232532e..d2b105d5f2a1 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -44,12 +44,14 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
 
+#define XE_DISPLAY_DRIVER_FEATURES	(DRIVER_MODESET | DRIVER_ATOMIC)
 #define XE_DISPLAY_DRIVER_OPS						\
 	.fbdev_probe = PTR_IF(IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION),	\
 			      xe_display_driver_fbdev_probe)
 
 #else
 
+#define XE_DISPLAY_DRIVER_FEATURES	0
 #define XE_DISPLAY_DRIVER_OPS \
 	.fbdev_probe = NULL
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3bca4c1d1d5f..c053e4d2692f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -393,6 +393,7 @@ bool xe_is_xe_file(const struct file *file)
 
 static struct drm_driver regular_driver = {
 	.driver_features =
+	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
@@ -425,6 +426,7 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
 
 static struct drm_driver admin_only_driver = {
 	.driver_features =
+	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_GEM_GPUVA,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
-- 
2.47.1

