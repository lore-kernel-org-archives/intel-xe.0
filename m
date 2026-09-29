Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE5CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 10:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030DC10EE24;
	Tue, 29 Sep 2026 10:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjkaYwcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED97610EE24;
 Tue, 29 Sep 2026 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790678044; x=1822214044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=86jF1HuHT/DYqObJXhoXfJhVF9kvXxXWFwFEmktAK/0=;
 b=UjkaYwcHEEr3ybMBuc/aQQ7N62dp3ZtJzqOjpCZky+uAs3uQ4vcApRbX
 VSr18JUYToA3iPd8i+E+n203OCeZnNbUaT5ouakd4pSIeDao4MFrn4LzY
 Jl3mhhQOfOp/JJfVTEOlf7Wijv1uQVBCn3USfsx51+bEZTRVvSfOHnIFG
 9LcqU9PjMNewRiN4BgJzej5dDCBYs533BwRwuWqVaG2lxDYGd8/0KP87h
 V/dAvaUu9DVDu8X/B8RRAT3DO9OvZIhPsS2CyP18lCPirMeYw+jWjha/i
 RxKT+/eziMoHlbMrnB+vA9YNuBMf6qwqX7YpiY11qi3VETnG6Nj/qkVkk w==;
X-CSE-ConnectionGUID: 6w526nS7RnCp88OpGOPViA==
X-CSE-MsgGUID: 5qAXVw8ZT12+NcZ9HGRHjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101962653"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101962653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:34:03 -0700
X-CSE-ConnectionGUID: Lm3MaEIGTda3tMUe1kNLew==
X-CSE-MsgGUID: BRJMza2vRHSboWl/GFnZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="301615185"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:34:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Imre Deak <imre.deak@intel.com>
Subject: [CI] drm/{i915,
 xe}: make intel_dmc_suspend() part of display suspend/shutdown calls
Date: Tue, 29 Sep 2026 13:33:58 +0300
Message-ID: <20260929103358.642813-1-jani.nikula@intel.com>
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

Sending [1] one by one for CI to see if it breaks or not.

[1] https://lore.kernel.org/r/cover.1790089118.git.jani.nikula@intel.com
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

