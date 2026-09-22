Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4852CC98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 15:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32AB10E6FD;
	Tue, 22 Sep 2026 15:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKsb3RLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A4010E6FD;
 Tue, 22 Sep 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790089317; x=1821625317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4lbVu2uVq7P0iFybAczittMQcuWH0zGpBCmTr+7Lh7w=;
 b=gKsb3RLfhc+ygTUE1iVqEqK/W1a7APkyOOy2eXvJAppVYAqoREVK11CG
 6fYLhka7V+W8v4zqNmrfpk4UT7wxTORF6UIl/t8sgLSmRiSw67MLwfc9X
 dK2IO+xOb3ZVOpf7pgzzqA7nCgzls3VAE/+ObPu9LAYVM83PJtDqCKmO3
 0YubUCD1NAoueZEGrGahdhchg5rzvjz9ZGfSEuJrtrBOXqx47DVmL3jYN
 KBAtQWR5MvcEmjLqCRUt62TVITPZjUnfa19T6tDCrDBR4iCTnV9+vVev6
 xRKZMz6oaPRvDWWsFwcwOlh8Hc91UAhWKYAzFINRDMfRU0E9TAzWLULJ0 w==;
X-CSE-ConnectionGUID: KZcL6K79RES10EaFPJjnTg==
X-CSE-MsgGUID: oxBIxZiyRfKDTCikimxOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90817885"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90817885"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:07 -0700
X-CSE-ConnectionGUID: iB5M12n/Q2KmpI7PbFQ4pg==
X-CSE-MsgGUID: 7mUm0v2GQdaTGjS9/V+iXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="271741235"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:01:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 2/4] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
Date: Tue, 22 Sep 2026 18:00:50 +0300
Message-ID: <050b935fa3fd85101ea0241b60a2e7893d3ad546.1790089118.git.jani.nikula@intel.com>
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

Try to unify the suspend paths and behaviour by moving the
intel_opregion_suspend() calls to
intel_display_driver_pm_suspend_late().

This is a change in the suspend sequences. The idea behind adding this
to intel_display_driver_pm_suspend_late() is primarily based on not
having to pass the s2idle parameter to more functions than that.

This also changes behaviour for i915 hibernation, going for PCI_D3cold
instead of PCI_D1 on hibernate. It's probably the correct thing to do
anyway, I don't think it should matter all that much, but fingers
crossed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_driver.c | 2 ++
 drivers/gpu/drm/i915/i915_driver.c                  | 4 ----
 drivers/gpu/drm/xe/display/xe_display.c             | 3 ---
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 77009dca7d0d..abab457bce3a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -783,6 +783,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
 	if (!HAS_DISPLAY(display))
 		return;
 
+	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
+
 	intel_display_power_suspend_late(display, s2idle);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 9e047c27a153..293099fe6639 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1075,7 +1075,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_display *display = dev_priv->display;
-	pci_power_t opregion_target_state;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
@@ -1089,9 +1088,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	i9xx_display_sr_save(display);
 
-	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
-	intel_opregion_suspend(display, opregion_target_state);
-
 	dev_priv->suspend_count++;
 
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 184a5a237880..b013ec00b75d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -246,14 +246,11 @@ static bool suspend_to_idle(void)
 void xe_display_pm_suspend(struct xe_device *xe)
 {
 	struct intel_display *display = xe->display;
-	bool s2idle = suspend_to_idle();
 
 	if (!xe->info.probe_display)
 		return;
 
 	intel_display_driver_pm_suspend(display);
-
-	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
 }
 
 void xe_display_pm_suspend_late(struct xe_device *xe)
-- 
2.47.3

