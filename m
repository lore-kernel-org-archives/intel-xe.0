Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443DEC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CE610E598;
	Tue, 25 Apr 2023 19:26:38 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F4310E137
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450795; x=1713986795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbpF0Vel2i5/4oqsAiMaClrzn93OKKfkqraCyvyS7L0=;
 b=GDIcBoMfF0oyvhL8Jw0wY+JkvA789xt8Lyt8hZb+QL6aEahhjW+fo2Cw
 opida0nwTDFxcWgcCtzKrLDHMoGTnwju7xRQHm7B+0arupC5ejVH7vmvf
 rI4rb6qvceE/aXuI/pLLRMvbcucP1XYa3IkvY2nHEXoxC7PN7lfUqbubF
 unVBUzO0IbDKCJ327SBJdfsbAyTc2PJYW/66QB/jJjfWAwQ6GZeXGJ1hE
 DoJMJqonCCfmotIvZh1H0iQ8DhWsmEL2bKP5+Qa3uhLLOULreKfQ50sVf
 rH3uUvJ6tNaHntB/Jml06rRfEKlitP+Fn7Rx253OUL1+P8/DlnWfiiZ4P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100791"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100791"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990461"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990461"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:32 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:12 -0700
Message-Id: <20230425192624.168640-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/15] drm/i915/display: move
 intel_modeset_probe_defer() to intel_display_driver.[ch]
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

High level display functionality only called from driver top level code.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/831ed4d0356b51526704269038a6d2d72739e779.1681465222.git.jani.nikula@intel.com
(cherry picked from commit ff2c80be1a002ae268ee78e3cf183b89c1aef77c)
---
 drivers/gpu/drm/i915/display/intel_display.c  | 25 -------------------
 drivers/gpu/drm/i915/display/intel_display.h  |  1 -
 .../drm/i915/display/intel_display_driver.c   | 25 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   |  4 +++
 drivers/gpu/drm/i915/i915_pci.c               |  1 +
 5 files changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 226710bcec7a2..d22b3a2b180f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -31,7 +31,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
-#include <linux/vga_switcheroo.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
@@ -40,7 +39,6 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 
@@ -8888,29 +8886,6 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
 	intel_bios_driver_remove(i915);
 }
 
-bool intel_modeset_probe_defer(struct pci_dev *pdev)
-{
-	struct drm_privacy_screen *privacy_screen;
-
-#ifdef I915
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (vga_switcheroo_client_probe_defer(pdev))
-		return true;
-#endif
-
-	/* If the LCD panel has a privacy-screen, wait for it */
-	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
-	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
-		return true;
-
-	drm_privacy_screen_put(privacy_screen);
-
-	return false;
-}
-
 bool intel_scanout_needs_vtd_wa(struct drm_i915_private *i915)
 {
 	return DISPLAY_VER(i915) >= 6 && i915_vtd_active(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 6fa33ff74928c..66c24295f884e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -529,7 +529,6 @@ void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state);
 void intel_update_watermarks(struct drm_i915_private *i915);
 
 /* modesetting */
-bool intel_modeset_probe_defer(struct pci_dev *pdev);
 void intel_modeset_init_hw(struct drm_i915_private *i915);
 int intel_modeset_init_noirq(struct drm_i915_private *i915);
 int intel_modeset_init_nogem(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index d4a1893e9218a..312564aee684b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -7,8 +7,10 @@
  * details here.
  */
 
+#include <linux/vga_switcheroo.h>
 #include <acpi/video.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_drv.h"
@@ -19,6 +21,29 @@
 #include "intel_fbdev.h"
 #include "intel_opregion.h"
 
+bool intel_modeset_probe_defer(struct pci_dev *pdev)
+{
+	struct drm_privacy_screen *privacy_screen;
+
+#ifdef I915
+	/*
+	 * apple-gmux is needed on dual GPU MacBook Pro
+	 * to probe the panel if we're the inactive GPU.
+	 */
+	if (vga_switcheroo_client_probe_defer(pdev))
+		return true;
+#endif
+
+	/* If the LCD panel has a privacy-screen, wait for it */
+	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
+	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
+		return true;
+
+	drm_privacy_screen_put(privacy_screen);
+
+	return false;
+}
+
 void intel_display_driver_register(struct drm_i915_private *i915)
 {
 	if (!HAS_DISPLAY(i915))
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 4f6deef5a23ff..4c18792fcafd1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -6,8 +6,12 @@
 #ifndef __INTEL_DISPLAY_DRIVER_H__
 #define __INTEL_DISPLAY_DRIVER_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
+struct pci_dev;
 
+bool intel_modeset_probe_defer(struct pci_dev *pdev);
 void intel_display_driver_register(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 621730b6551c6..15a38059bacb6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -27,6 +27,7 @@
 #include <drm/i915_pciids.h>
 
 #include "display/intel_display.h"
+#include "display/intel_display_driver.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_sa_media.h"
 
-- 
2.40.0

