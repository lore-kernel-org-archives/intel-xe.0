Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C47CCDE004
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D519410EF54;
	Wed, 24 Jun 2026 14:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtUf+x5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB87E10EF3C;
 Wed, 24 Jun 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782311839; x=1813847839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9d5aBMKM9HyODEvqG7y9fDMXwNOueC0bn01i7/v+0/w=;
 b=QtUf+x5/xv49sQEvbZe2wiJCOW5ZT2EG1p8+X41TwMHtWuOFCSg5xhwn
 gGCBihOQ89xh89Kmex7S5fk3BwILpnF9nAqnWBw1UiMRNOdqIq8xKBSXh
 ymarWpbppW2kHdIfTTTPdRw02AU18S9VMvFoht7glN6oQRZVQPtv+43XK
 Fsld20exlWDOlg/I8jAsSXZ9Sy21zzUvmlhW0EKm30HbfFJXY64xCOYgR
 ZCPArDdTsQURkiKsllgfUo64f4u188ZPUIjk1iW68X2TjLaGY4Phqfy43
 Ptn2EUOrFXezrOCKG0zOzBJwbXuv9KUCGt/Bi2YBza6fHpKekr3RjD1UW w==;
X-CSE-ConnectionGUID: bAwVLgN4RXqOZcHZ1iwO/Q==
X-CSE-MsgGUID: Ojy7xgiBSqy5GNIfxEhpqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86920313"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86920313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 07:37:16 -0700
X-CSE-ConnectionGUID: s/F/K8MlQ8GB+pWKZeO/5w==
X-CSE-MsgGUID: Q4ITNLW3S9qNIY2CjDkFYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="253799053"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:37:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 3/8] drm/i915: move some display runtime suspend operations
 earlier
Date: Wed, 24 Jun 2026 17:36:50 +0300
Message-ID: <04fe087d7c600de96cdeeb9358827e839624a3e2.1782311749.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782311749.git.jani.nikula@intel.com>
References: <cover.1782311749.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In preparation for abstracting display runtime suspend/resume calls,
relocate opregion adapter notification and hotplug poll enable slightly
earlier. Even though this is intended to be a non-functional change, do
it as a separate step to pinpoint any issues here.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 54 ++++++++++++++++--------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 51b8bd751376..73616cb6ce7c 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1541,11 +1541,39 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 
 	intel_display_power_runtime_suspend(display);
 
+	/*
+	 * FIXME: We really should find a document that references the arguments
+	 * used below!
+	 */
+	if (IS_BROADWELL(dev_priv)) {
+		/*
+		 * On Broadwell, if we use PCI_D1 the PCH DDI ports will stop
+		 * being detected, and the call we do at i915_pm_runtime_resume()
+		 * won't be able to restore them. Since PCI_D3hot matches the
+		 * actual specification and appears to be working, use it.
+		 */
+		intel_opregion_notify_adapter(display, PCI_D3hot);
+	} else {
+		/*
+		 * current versions of firmware which depend on this opregion
+		 * notification have repurposed the D1 definition to mean
+		 * "runtime suspended" vs. what you would normally expect (D3)
+		 * to distinguish it from notifications that might be sent via
+		 * the suspend path.
+		 */
+		intel_opregion_notify_adapter(display, PCI_D1);
+	}
+
+	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv))
+		intel_hpd_poll_enable(display);
+
 	ret = vlv_suspend_complete(dev_priv);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Runtime suspend failed, disabling it (%d)\n", ret);
 
+		intel_opregion_notify_adapter(display, PCI_D0);
+
 		intel_display_power_runtime_resume(display);
 
 		for_each_gt(gt, dev_priv, i)
@@ -1577,34 +1605,8 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 	if (root_pdev)
 		pci_d3cold_disable(root_pdev);
 
-	/*
-	 * FIXME: We really should find a document that references the arguments
-	 * used below!
-	 */
-	if (IS_BROADWELL(dev_priv)) {
-		/*
-		 * On Broadwell, if we use PCI_D1 the PCH DDI ports will stop
-		 * being detected, and the call we do at i915_pm_runtime_resume()
-		 * won't be able to restore them. Since PCI_D3hot matches the
-		 * actual specification and appears to be working, use it.
-		 */
-		intel_opregion_notify_adapter(display, PCI_D3hot);
-	} else {
-		/*
-		 * current versions of firmware which depend on this opregion
-		 * notification have repurposed the D1 definition to mean
-		 * "runtime suspended" vs. what you would normally expect (D3)
-		 * to distinguish it from notifications that might be sent via
-		 * the suspend path.
-		 */
-		intel_opregion_notify_adapter(display, PCI_D1);
-	}
-
 	assert_forcewakes_inactive(&dev_priv->uncore);
 
-	if (!IS_VALLEYVIEW(dev_priv) && !IS_CHERRYVIEW(dev_priv))
-		intel_hpd_poll_enable(display);
-
 	drm_dbg(&dev_priv->drm, "Device suspended\n");
 	return 0;
 }
-- 
2.47.3

