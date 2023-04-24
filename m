Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED711C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C8210E3F1;
	Mon, 24 Apr 2023 16:51:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3D10E1BF
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355114; x=1713891114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N2JFugeiDaAPUNdr2CsxkNley8Mwc85Mhwcc5tATVUs=;
 b=mTPRHT2SFq3n05NQ4f3Jlht+b+Q0z0v/C8btBekHmtGMbAht7Nxe8avq
 VCBMB7U+M/ZFLczqShU5lZglOxqTc4I+i189qSTDGHExLDwbAbE1e/jHN
 2UPt0j2RDqOqPw3uNpFACUFMLnCSKc8xJsMnWG0Xm8MwA464luO6pn0sw
 pGSN9RqlesmDxilFataYbwOhC5Uv6UXXipFnfq+jHwuEtU1Lag+sZP6eh
 BBcA3K4+XTFJUChwsos9lWwDig6uIGpx6PAYu/HrXJ7/8Y4qmgwAySEcU
 n+vujSJP+mcFqQqJhFjoEDUKpbk3HgMZZbnoAlXai6+srraGrvUnQHTfZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704245"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704245"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785405"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785405"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:52 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:26 -0700
Message-Id: <20230424165135.132494-7-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/15] drm/i915/display: rename
 intel_display_driver_* functions
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Follow the usual naming conventions.

v2:
- Also rename references in comments (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/6ff7b76018bf4cf611037d7bf027c975cddfe2af.1681465222.git.jani.nikula@intel.com
(cherry picked from commit 86a1758d751de03e8f3d8810fe22eaf571798871)
---
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 .../drm/i915/display/intel_display_driver.c   | 16 ++++++------
 .../drm/i915/display/intel_display_driver.h   | 14 +++++------
 drivers/gpu/drm/i915/i915_driver.c            | 25 ++++++++++---------
 drivers/gpu/drm/i915/i915_irq.c               |  2 +-
 5 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f77c867d7a791..d1eb24214bc0b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -835,7 +835,7 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 		 * so need a full re-initialization.
 		 */
 		intel_pps_unlock_regs_wa(i915);
-		intel_modeset_init_hw(i915);
+		intel_display_driver_init_hw(i915);
 		intel_clock_gating_init(i915);
 		intel_hpd_init(i915);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 3b709dc4423ad..f357feaa00a8e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -74,7 +74,7 @@ bool intel_display_driver_probe_defer(struct pci_dev *pdev)
 	return false;
 }
 
-void intel_modeset_init_hw(struct drm_i915_private *i915)
+void intel_display_driver_init_hw(struct drm_i915_private *i915)
 {
 	struct intel_cdclk_state *cdclk_state;
 
@@ -172,7 +172,7 @@ static void intel_plane_possible_crtcs_init(struct drm_i915_private *dev_priv)
 }
 
 /* part #1: call before irq install */
-int intel_modeset_init_noirq(struct drm_i915_private *i915)
+int intel_display_driver_probe_noirq(struct drm_i915_private *i915)
 {
 	int ret;
 
@@ -248,7 +248,7 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
 }
 
 /* part #2: call after irq install, but before gem init */
-int intel_modeset_init_nogem(struct drm_i915_private *i915)
+int intel_display_driver_probe_nogem(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	enum pipe pipe;
@@ -283,7 +283,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 	intel_fdi_pll_freq_update(i915);
 
 	intel_update_czclk(i915);
-	intel_modeset_init_hw(i915);
+	intel_display_driver_init_hw(i915);
 	intel_dpll_update_ref_clks(i915);
 
 	intel_hdcp_component_init(i915);
@@ -320,7 +320,7 @@ int intel_modeset_init_nogem(struct drm_i915_private *i915)
 }
 
 /* part #3: call after gem init */
-int intel_modeset_init(struct drm_i915_private *i915)
+int intel_display_driver_probe(struct drm_i915_private *i915)
 {
 	int ret;
 
@@ -384,7 +384,7 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 }
 
 /* part #1: call before irq uninstall */
-void intel_modeset_driver_remove(struct drm_i915_private *i915)
+void intel_display_driver_remove(struct drm_i915_private *i915)
 {
 	if (!HAS_DISPLAY(i915))
 		return;
@@ -404,7 +404,7 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
 }
 
 /* part #2: call after irq uninstall */
-void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
+void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 {
 	if (!HAS_DISPLAY(i915))
 		return;
@@ -438,7 +438,7 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 }
 
 /* part #3: call after gem init */
-void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
+void intel_display_driver_remove_nogem(struct drm_i915_private *i915)
 {
 	intel_dmc_fini(i915);
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
index 947b666575ee2..aab498617b90e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.h
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -12,14 +12,14 @@ struct drm_i915_private;
 struct pci_dev;
 
 bool intel_display_driver_probe_defer(struct pci_dev *pdev);
-void intel_modeset_init_hw(struct drm_i915_private *i915);
-int intel_modeset_init_noirq(struct drm_i915_private *i915);
-int intel_modeset_init_nogem(struct drm_i915_private *i915);
-int intel_modeset_init(struct drm_i915_private *i915);
+void intel_display_driver_init_hw(struct drm_i915_private *i915);
+int intel_display_driver_probe_noirq(struct drm_i915_private *i915);
+int intel_display_driver_probe_nogem(struct drm_i915_private *i915);
+int intel_display_driver_probe(struct drm_i915_private *i915);
 void intel_display_driver_register(struct drm_i915_private *i915);
-void intel_modeset_driver_remove(struct drm_i915_private *i915);
-void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915);
-void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915);
+void intel_display_driver_remove(struct drm_i915_private *i915);
+void intel_display_driver_remove_noirq(struct drm_i915_private *i915);
+void intel_display_driver_remove_nogem(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
 
 #endif /* __INTEL_DISPLAY_DRIVER_H__ */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 4ae8b12189a87..f6aa48d92e050 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -755,7 +755,7 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
  * @ent: matching PCI ID entry
  *
  * The driver probe routine has to do several things:
- *   - drive output discovery via intel_modeset_init()
+ *   - drive output discovery via intel_display_driver_probe()
  *   - initialize the memory manager
  *   - allocate initial config memory
  *   - setup the DRM framebuffer with the allocated memory
@@ -793,7 +793,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret < 0)
 		goto out_cleanup_mmio;
 
-	ret = intel_modeset_init_noirq(i915);
+	ret = intel_display_driver_probe_noirq(i915);
 	if (ret < 0)
 		goto out_cleanup_hw;
 
@@ -801,7 +801,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_cleanup_modeset;
 
-	ret = intel_modeset_init_nogem(i915);
+	ret = intel_display_driver_probe_nogem(i915);
 	if (ret)
 		goto out_cleanup_irq;
 
@@ -811,7 +811,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	intel_pxp_init(i915);
 
-	ret = intel_modeset_init(i915);
+	ret = intel_display_driver_probe(i915);
 	if (ret)
 		goto out_cleanup_gem;
 
@@ -831,14 +831,14 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_gem_driver_release(i915);
 out_cleanup_modeset2:
 	/* FIXME clean up the error path */
-	intel_modeset_driver_remove(i915);
+	intel_display_driver_remove(i915);
 	intel_irq_uninstall(i915);
-	intel_modeset_driver_remove_noirq(i915);
+	intel_display_driver_remove_noirq(i915);
 	goto out_cleanup_modeset;
 out_cleanup_irq:
 	intel_irq_uninstall(i915);
 out_cleanup_modeset:
-	intel_modeset_driver_remove_nogem(i915);
+	intel_display_driver_remove_nogem(i915);
 out_cleanup_hw:
 	i915_driver_hw_remove(i915);
 	intel_memory_regions_driver_release(i915);
@@ -874,16 +874,16 @@ void i915_driver_remove(struct drm_i915_private *i915)
 
 	intel_gvt_driver_remove(i915);
 
-	intel_modeset_driver_remove(i915);
+	intel_display_driver_remove(i915);
 
 	intel_irq_uninstall(i915);
 
-	intel_modeset_driver_remove_noirq(i915);
+	intel_display_driver_remove_noirq(i915);
 
 	i915_reset_error_state(i915);
 	i915_gem_driver_remove(i915);
 
-	intel_modeset_driver_remove_nogem(i915);
+	intel_display_driver_remove_nogem(i915);
 
 	i915_driver_hw_remove(i915);
 
@@ -1224,7 +1224,7 @@ static int i915_drm_resume(struct drm_device *dev)
 	 *
 	 * drm_mode_config_reset() needs AUX interrupts.
 	 *
-	 * Modeset enabling in intel_modeset_init_hw() also needs working
+	 * Modeset enabling in intel_display_driver_init_hw() also needs working
 	 * interrupts.
 	 */
 	intel_runtime_pm_enable_interrupts(dev_priv);
@@ -1234,7 +1234,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	i915_gem_resume(dev_priv);
 
-	intel_modeset_init_hw(dev_priv);
+	intel_display_driver_init_hw(dev_priv);
+
 	intel_clock_gating_init(dev_priv);
 	intel_hpd_init(dev_priv);
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index aa31829183315..0906ffaa0219c 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -4134,7 +4134,7 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
 	/*
 	 * FIXME we can get called twice during driver probe
 	 * error handling as well as during driver remove due to
-	 * intel_modeset_driver_remove() calling us out of sequence.
+	 * intel_display_driver_remove() calling us out of sequence.
 	 * Would be nice if it didn't do that...
 	 */
 	if (!dev_priv->irq_enabled)
-- 
2.40.0

