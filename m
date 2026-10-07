Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C047DCA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 13:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A037C10E5A7;
	Wed,  7 Oct 2026 13:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5pBEx7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7413610E1BE;
 Wed,  7 Oct 2026 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791380767; x=1822916767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6reivc1cjcdS6A2H9elivNVKq/l2kWZ/7Ke/ldARydw=;
 b=H5pBEx7Faok+8R6zvhswoaIab5iqkrdoUC2LodxJpawyyNHfIsUsxeYB
 UJ+hGlYjDxNsyoks+VdnIiHmAnQbm6lAWACxutRmXqmnjyVwdJtmcdjom
 Qr8UF7BScsUaJwaXmjGbVdAjgM4mQ5aNco6T7jB70ncUjo3SolbokpNSv
 xXSeYDe25LxRi5ukvM2pASuJNEmj4AVkkBLCg8YUuLEhTGk9rTX6cU20L
 uNixBXcw3hyz8BiKZpqEXkxFaVWU2tfGcO4mON2Ajyd+uq4gRzM4eTDy2
 bptsPUxrC32hjscR+NWOmL34jobNbFND5Km8T6d167G1ixTRDGJraPlfe Q==;
X-CSE-ConnectionGUID: hj4rdeCIS+mUVlEiLmzb8g==
X-CSE-MsgGUID: 3+RXhv16SoK5linQxfDkpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="42443"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="42443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:46:06 -0700
X-CSE-ConnectionGUID: FUy7PAdAQUuu6easqp0zCw==
X-CSE-MsgGUID: PSJ3Y/4oTvuwucoWk91eqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="280734375"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:46:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Imre Deak <imre.deak@intel.com>
Subject: [CI try #2] drm/{i915,
 xe}: make intel_dmc_suspend() part of display suspend/shutdown calls
Date: Wed,  7 Oct 2026 16:46:01 +0300
Message-ID: <20261007134601.2433046-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Move the intel_dmc_suspend() calls from i915 and xe suspend and shutdown
hooks all the way down to a shared location in
__intel_display_driver_pm_suspend().

This is a change in the suspend/shutdown sequences, but hopefully one
without problems. The main change is moving intel_dmc_suspend() before
irq suspend.

Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
 drivers/gpu/drm/xe/display/xe_display.c             | 4 ----
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 70d112fd4287..77009dca7d0d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -768,6 +768,8 @@ static int __intel_display_driver_pm_suspend(struct intel_display *display, bool
 
 	intel_encoder_suspend_all(display);
 
+	intel_dmc_suspend(display);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce6d20958320..9e047c27a153 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1024,8 +1024,6 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 
 	intel_irq_suspend(i915);
 
-	intel_dmc_suspend(display);
-
 	i915_gem_suspend(i915);
 
 	/*
@@ -1096,8 +1094,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	dev_priv->suspend_count++;
 
-	intel_dmc_suspend(display);
-
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
 	i915_gem_drain_freed_objects(dev_priv);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 506f26e9c59a..aab416485e3e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -170,8 +170,6 @@ void xe_display_shutdown(struct xe_device *xe)
 	intel_display_driver_shutdown(display);
 
 	intel_opregion_suspend(display, PCI_D3cold);
-
-	intel_dmc_suspend(display);
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
@@ -248,8 +246,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_display_driver_pm_suspend(display);
 
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
-
-	intel_dmc_suspend(display);
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
-- 
2.47.3

