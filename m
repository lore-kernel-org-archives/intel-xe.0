Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B11C7EE21
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8A210E627;
	Tue, 25 Apr 2023 19:26:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298CD10E514
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450812; x=1713986812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ODxPrlLZLH77ZGich0MVfCyjQthdNlYlGdH0wDsRiBw=;
 b=eRThhi3pW9mRxVGH0Spqfr0qr29oElUTjkn+2qIVq0Oer97E+RXRH9A2
 DHUs6cwkpIREjaKCvjwl/Js3DUqhRoDZWJk0X8Kvg/W0Tvl03jQGPPoTH
 wTWCAPRP3JLjA+AT9IIomxtVrnWvoZeSyr1RKXiSw6ljGgaajTQDXSS/V
 EiMuhfPhmp2yZaEaBU0b5AO39MLa0LtdeaS5orQyEZd1iUXJeSViyrTBb
 cvXKJ6F746xb7Wdm8tOd6wSmT62VXIh3/HYZeJtcOspG+sxcNWBHr8zYK
 rIX6N6LQXJoBXJSTZkXNJjuo9JIpe33OTp+bom/4QRVK9ihYlz6ImMx8q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331100869"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331100869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782990490"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="782990490"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:26:44 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:26:19 -0700
Message-Id: <20230425192624.168640-11-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425192624.168640-1-jose.souza@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/15] drm/i915/display: add
 intel_display_driver_early_probe()
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

Add intel_display_driver_early_probe() as the early probe call to
replace intel_init_display_hooks(). The latter will be "demoted" to
setting up hooks in intel_display.c only.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/0b02311e5343527b501b44671d2188f2a1b30a7d.1681465222.git.jani.nikula@intel.com
(cherry picked from commit 62bb6b4920ce9d9a7cc365c4e1cc13134cd1cc24)
---
 drivers/gpu/drm/i915/display/intel_display.c       | 11 -----------
 .../gpu/drm/i915/display/intel_display_driver.c    | 14 ++++++++++++++
 .../gpu/drm/i915/display/intel_display_driver.h    |  1 +
 drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f227244b0811f..cda0f3c3fbaed 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8078,15 +8078,6 @@ static const struct intel_display_funcs i9xx_display_funcs = {
  */
 void intel_init_display_hooks(struct drm_i915_private *dev_priv)
 {
-	if (!HAS_DISPLAY(dev_priv))
-		return;
-
-	intel_color_init_hooks(dev_priv);
-	intel_init_cdclk_hooks(dev_priv);
-	intel_audio_hooks_init(dev_priv);
-
-	intel_dpll_init_clock_hook(dev_priv);
-
 	if (DISPLAY_VER(dev_priv) >= 9) {
 		dev_priv->display.funcs.display = &skl_display_funcs;
 	} else if (HAS_DDI(dev_priv)) {
@@ -8099,8 +8090,6 @@ void intel_init_display_hooks(struct drm_i915_private *dev_priv)
 	} else {
 		dev_priv->display.funcs.display = &i9xx_display_funcs;
 	}
-
-	intel_fdi_init_hook(dev_priv);
 }
 
 int intel_initial_commit(struct drm_device *dev)
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 0e391066d6d3b..92c624f6d2ae7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -32,6 +32,7 @@
 #include "intel_display_types.h"
 #include "intel_dmc.h"
 #include "intel_dp.h"
+#include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
@@ -171,6 +172,19 @@ static void intel_plane_possible_crtcs_init(struct drm_i915_private *dev_priv)
 	}
 }
 
+void intel_display_driver_early_probe(struct drm_i915_private *i915)
+{
+	if (!HAS_DISPLAY(i915))
+		return;
+
+	intel_color_init_hooks(i915);
+	intel_init_cdclk_hooks(i915);
+	intel_audio_hooks_init(i915);
+	intel_dpll_init_clock_hook(i915);
+	intel_init_display_hooks(i915);
+	intel_fdi_init_hook(i915);
+}
+
 /* part #1: call before irq install */
 int intel_display_driver_probe_noirq(struct drm_i915_private *i915)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 84e7977f265ac..c276a58ee3293 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -15,6 +15,7 @@ struct pci_dev;
 
 bool intel_display_driver_probe_defer(struct pci_dev *pdev);
 void intel_display_driver_init_hw(struct drm_i915_private *i915);
+void intel_display_driver_early_probe(struct drm_i915_private *i915);
 int intel_display_driver_probe_noirq(struct drm_i915_private *i915);
 int intel_display_driver_probe_nogem(struct drm_i915_private *i915);
 int intel_display_driver_probe(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index da3bcd9d7a0d0..decaff25c36cf 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -254,7 +254,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	intel_detect_pch(dev_priv);
 
 	intel_irq_init(dev_priv);
-	intel_init_display_hooks(dev_priv);
+	intel_display_driver_early_probe(dev_priv);
 	intel_clock_gating_hooks_init(dev_priv);
 
 	intel_detect_preproduction_hw(dev_priv);
-- 
2.40.0

