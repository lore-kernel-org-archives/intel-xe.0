Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309E6CD6E53
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD6F10FD56;
	Fri, 29 May 2026 11:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keeig0Mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE88910FD70;
 Fri, 29 May 2026 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052749; x=1811588749;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LCQtkyJZY38vNC5UwPmd7xfQ3z4d6nLwkcIWEdnoAC0=;
 b=keeig0MfhyjPh0mc0iubk7jziRSTjNa01Z8QVP80z58+P3XMwSImVSK5
 MBqzsuv7jsG3QnFmaBy8PIteT09oyyxcYo1mVZ5HwwLhhG5E4kEAYTMnC
 tV3v1ahXtQcZeLImlEXkm/wbHws8CqA10phPbMqaG0o4lhnUeHMAPOode
 SC9eRygLRjl4hqxmH3IZX5ASJb5xq95UvipEVb5xgibgOKeQ7T7S0V+mU
 3d+pL5tOH9uZZ9VQ0Ls17YGGCgmqYcayQxxhblezaVlIjX0HP4PHRjeYX
 48sjGry+kzqNw0WkZvi6Kmxdx05touTk18GXGBRZ5WTOPEz420xuioMdD g==;
X-CSE-ConnectionGUID: yN/IBoYmT4SVbHvIHf+avg==
X-CSE-MsgGUID: WBhe5ulsQmeedlDtZY897w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92015090"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92015090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:05:49 -0700
X-CSE-ConnectionGUID: JrTGvNmTQ0KddcmFnvXAfw==
X-CSE-MsgGUID: 5OgSFebeTR2qehx6W8GQ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="280942307"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:05:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 20/24] drm/{i915, xe}: move intel_opregion_suspend() to
 intel_display_driver_pm_suspend_late()
Date: Fri, 29 May 2026 14:04:04 +0300
Message-ID: <ab953d87a5c4233a713b65aba9e45148bd77dbaa.1780051905.git.jani.nikula@intel.com>
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
index 6cac36157bea..1525ff7a1dc2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -770,6 +770,8 @@ void intel_display_driver_pm_suspend_late(struct intel_display *display, bool s2
 	if (!HAS_DISPLAY(display))
 		return;
 
+	intel_opregion_suspend(display, s2idle ? PCI_D1 : PCI_D3cold);
+
 	intel_display_power_suspend_late(display, s2idle);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 40fc15017486..7d0f98cbf5d9 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1096,7 +1096,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_display *display = dev_priv->display;
-	pci_power_t opregion_target_state;
 
 	disable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
@@ -1110,9 +1109,6 @@ static int i915_drm_suspend(struct drm_device *dev)
 
 	i9xx_display_sr_save(display);
 
-	opregion_target_state = suspend_to_idle(dev_priv) ? PCI_D1 : PCI_D3cold;
-	intel_opregion_suspend(display, opregion_target_state);
-
 	dev_priv->suspend_count++;
 
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 9416405667d8..73891b36341b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -266,14 +266,11 @@ static bool suspend_to_idle(void)
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

