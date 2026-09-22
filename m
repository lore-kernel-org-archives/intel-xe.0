Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2951C98307
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD5B10E731;
	Tue, 22 Sep 2026 15:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7kfUjY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41BA10E49A;
 Tue, 22 Sep 2026 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790089265; x=1821625265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZRgy5sMS0KSjk/unZbs6ZwS7MqMtOaudlgAF6SfgGY=;
 b=b7kfUjY8MVNgHM+qF3loNLjBi5d8PTayWnYaG3fHzAxFB1bLtCsr2YZI
 cInEKx6VqBOeY1uZd7RIKgGtAlMKsDoCRHl0ILiwRm9NetjT4rW1c8qpo
 3/Dg7v5g3HteXG78p9buTDdgIU2gFbhJy5ihs9X0+wq6cu4pwFhLKWbMg
 MI6wUSN+1TKVI98+jFaWuuORQsGgWjUhRuk2AD9qYfE9juJrug+97yflB
 8Nt3SOIQoIuaI1SujHaLQWHKE9X8fr6XhM2CpKq1shknxKyItxktTfIfO
 hs3ciow8br3Dm/MvpG9x0qvxpsf8RtHExOIa1gmrToNHz8vlijffGg7vb w==;
X-CSE-ConnectionGUID: kAlR6W12R6WQxpfy9kIFIA==
X-CSE-MsgGUID: HCBWfQO0Q3WGtJ2hVzoKEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101287206"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101287206"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:02 -0700
X-CSE-ConnectionGUID: JoN3dBP6Tx6kMCdFFwlcfw==
X-CSE-MsgGUID: 65Gn82y0Ttewizl9D4kxGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299427843"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 1/4] drm/{i915,
 xe}: make intel_dmc_suspend() part of display suspend/shutdown calls
Date: Tue, 22 Sep 2026 18:00:49 +0300
Message-ID: <0b8cb03babd960025f8948124a9d99358d8cc0f3.1790089118.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790089118.git.jani.nikula@intel.com>
References: <cover.1790089118.git.jani.nikula@intel.com>
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
index 7b25c0814674..184a5a237880 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -178,8 +178,6 @@ void xe_display_shutdown(struct xe_device *xe)
 	intel_display_driver_shutdown(display);
 
 	intel_opregion_suspend(display, PCI_D3cold);
-
-	intel_dmc_suspend(display);
 }
 
 void xe_display_shutdown_late(struct xe_device *xe)
@@ -256,8 +254,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	intel_display_driver_pm_suspend(display);
 
 	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
-
-	intel_dmc_suspend(display);
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
-- 
2.47.3

