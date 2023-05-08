Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D026C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B77F10E2DE;
	Mon,  8 May 2023 14:47:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEA10E2DB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557240; x=1715093240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AlLEkZowm6+Zbv5hVRYwBrguSq3Lvmcw53oOsMisAM=;
 b=Bj7SFPbSkyFB0BuW2GJhV3iHphkoF1IgBrInYDL6h8i8yOennu389JZW
 E/EPC1P+vCYK6HDCpMCWjVQ9dH7Vc/nNchrI3Rw2P1AGPwn980KTqMi68
 i1N+2nubCjowvIJys1MlnP+Y0Fratwz0iEJQNF+d5ZlXfsiW08UPErjGf
 BISGwrwD+DEx7rp4WBH0tN3luiIG11tEsbr2TKYGm62TEJ903a7mlhofS
 3Xh31P2ROu5H1hZcp0aLJQut6K/384tnEefSBgMUI3+EKdXvZGO4P7Kdy
 61vfWyyIcvD7NMGq49ji9DGZ+3jJdreb6PrmXHM5IygFD5ebIwoHW2Ke3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349697818"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349697818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="648908129"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="648908129"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:09 +0300
Message-Id: <20230508144618.162140-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 09/18] fixup! drm/i915/display: Remove all uncore
 mmio accesses in favor of intel_de
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Revert "drm/i915/display: Remove all uncore mmio accesses in favor of
intel_de". Remove the entire commit from history.

Use the compat glue layers for uncore and pcode.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/hsw_ips.c        |  7 +--
 drivers/gpu/drm/i915/display/intel_bios.c     | 19 ++++----
 drivers/gpu/drm/i915/display/intel_bw.c       | 34 +++++++-------
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 45 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_power.c    |  3 +-
 .../i915/display/intel_display_power_well.c   |  7 +--
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  9 ++--
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  9 ++--
 drivers/gpu/drm/i915/display/skl_watermark.c  | 22 ++++-----
 10 files changed, 81 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 825b24f3356f..8eca0de065b6 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -8,6 +8,7 @@
 #include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
+#include "intel_pcode.h"
 
 static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 {
@@ -33,8 +34,8 @@ static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 
 	if (IS_BROADWELL(i915)) {
 		drm_WARN_ON(&i915->drm,
-			    intel_de_pcode_write(i915, DISPLAY_IPS_CONTROL,
-						 val | IPS_PCODE_CONTROL));
+			    snb_pcode_write(&i915->uncore, DISPLAY_IPS_CONTROL,
+					    val | IPS_PCODE_CONTROL));
 		/*
 		 * Quoting Art Runyan: "its not safe to expect any particular
 		 * value in IPS_CTL bit 31 after enabling IPS through the
@@ -67,7 +68,7 @@ bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
 
 	if (IS_BROADWELL(i915)) {
 		drm_WARN_ON(&i915->drm,
-			    intel_de_pcode_write(i915, DISPLAY_IPS_CONTROL, 0));
+			    snb_pcode_write(&i915->uncore, DISPLAY_IPS_CONTROL, 0));
 		/*
 		 * Wait for PCODE to finish disabling IPS. The BSpec specified
 		 * 42ms timeout value leads to occasional timeouts so use 100ms
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 8176e9fe2864..75e69dffc5e9 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -31,7 +31,6 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-#include "intel_de.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_gmbus.h"
@@ -3039,16 +3038,16 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 	u16 vbt_size;
 	u32 *vbt;
 
-	static_region = intel_de_read(i915, SPI_STATIC_REGIONS);
+	static_region = intel_uncore_read(&i915->uncore, SPI_STATIC_REGIONS);
 	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	intel_de_write(i915, PRIMARY_SPI_REGIONID, static_region);
+	intel_uncore_write(&i915->uncore, PRIMARY_SPI_REGIONID, static_region);
 
-	oprom_offset = intel_de_read(i915, OROM_OFFSET);
+	oprom_offset = intel_uncore_read(&i915->uncore, OROM_OFFSET);
 	oprom_offset &= OROM_OFFSET_MASK;
 
 	for (count = 0; count < oprom_size; count += 4) {
-		intel_de_write(i915, PRIMARY_SPI_ADDRESS, oprom_offset + count);
-		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
+		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, oprom_offset + count);
+		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
 
 		if (data == *((const u32 *)"$VBT")) {
 			found = oprom_offset + count;
@@ -3060,9 +3059,9 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	/* Get VBT size and allocate space for the VBT */
-	intel_de_write(i915, PRIMARY_SPI_ADDRESS, found +
+	intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found +
 		   offsetof(struct vbt_header, vbt_size));
-	vbt_size = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
+	vbt_size = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
 	vbt_size &= 0xffff;
 
 	vbt = kzalloc(round_up(vbt_size, 4), GFP_KERNEL);
@@ -3070,8 +3069,8 @@ static struct vbt_header *spi_oprom_get_vbt(struct drm_i915_private *i915)
 		goto err_not_found;
 
 	for (count = 0; count < vbt_size; count += 4) {
-		intel_de_write(i915, PRIMARY_SPI_ADDRESS, found + count);
-		data = intel_de_read(i915, PRIMARY_SPI_TRIGGER);
+		intel_uncore_write(&i915->uncore, PRIMARY_SPI_ADDRESS, found + count);
+		data = intel_uncore_read(&i915->uncore, PRIMARY_SPI_TRIGGER);
 		*(vbt + store++) = data;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 171a341e1150..597d5816ad1b 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -11,11 +11,11 @@
 #include "intel_atomic.h"
 #include "intel_bw.h"
 #include "intel_cdclk.h"
-#include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "skl_watermark.h"
 #include "intel_mchbar_regs.h"
+#include "intel_pcode.h"
 
 /* Parameters for Qclk Geyserville (QGV) */
 struct intel_qgv_point {
@@ -44,7 +44,7 @@ static int dg1_mchbar_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u32 dclk_ratio, dclk_reference;
 	u32 val;
 
-	val = intel_de_read(dev_priv, SA_PERF_STATUS_0_0_0_MCHBAR_PC);
+	val = intel_uncore_read(&dev_priv->uncore, SA_PERF_STATUS_0_0_0_MCHBAR_PC);
 	dclk_ratio = REG_FIELD_GET(DG1_QCLK_RATIO_MASK, val);
 	if (val & DG1_QCLK_REFERENCE)
 		dclk_reference = 6; /* 6 * 16.666 MHz = 100 MHz */
@@ -52,18 +52,18 @@ static int dg1_mchbar_read_qgv_point_info(struct drm_i915_private *dev_priv,
 		dclk_reference = 8; /* 8 * 16.666 MHz = 133 MHz */
 	sp->dclk = DIV_ROUND_UP((16667 * dclk_ratio * dclk_reference) + 500, 1000);
 
-	val = intel_de_read(dev_priv, SKL_MC_BIOS_DATA_0_0_0_MCHBAR_PCU);
+	val = intel_uncore_read(&dev_priv->uncore, SKL_MC_BIOS_DATA_0_0_0_MCHBAR_PCU);
 	if (val & DG1_GEAR_TYPE)
 		sp->dclk *= 2;
 
 	if (sp->dclk == 0)
 		return -EINVAL;
 
-	val = intel_de_read(dev_priv, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR);
+	val = intel_uncore_read(&dev_priv->uncore, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR);
 	sp->t_rp = REG_FIELD_GET(DG1_DRAM_T_RP_MASK, val);
 	sp->t_rdpre = REG_FIELD_GET(DG1_DRAM_T_RDPRE_MASK, val);
 
-	val = intel_de_read(dev_priv, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR_HIGH);
+	val = intel_uncore_read(&dev_priv->uncore, MCHBAR_CH0_CR_TC_PRE_0_0_0_MCHBAR_HIGH);
 	sp->t_rcd = REG_FIELD_GET(DG1_DRAM_T_RCD_MASK, val);
 	sp->t_ras = REG_FIELD_GET(DG1_DRAM_T_RAS_MASK, val);
 
@@ -80,9 +80,9 @@ static int icl_pcode_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u16 dclk;
 	int ret;
 
-	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-				  ICL_PCODE_MEM_SS_READ_QGV_POINT_INFO(point),
-				  &val, &val2);
+	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+			     ICL_PCODE_MEM_SS_READ_QGV_POINT_INFO(point),
+			     &val, &val2);
 	if (ret)
 		return ret;
 
@@ -106,8 +106,8 @@ static int adls_pcode_read_psf_gv_point_info(struct drm_i915_private *dev_priv,
 	int ret;
 	int i;
 
-	ret = intel_de_pcode_read(dev_priv, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
-				  ADL_PCODE_MEM_SS_READ_PSF_GV_INFO, &val, NULL);
+	ret = snb_pcode_read(&dev_priv->uncore, ICL_PCODE_MEM_SUBSYSYSTEM_INFO |
+			     ADL_PCODE_MEM_SS_READ_PSF_GV_INFO, &val, NULL);
 	if (ret)
 		return ret;
 
@@ -154,11 +154,11 @@ int icl_pcode_restrict_qgv_points(struct drm_i915_private *dev_priv,
 		return 0;
 
 	/* bspec says to keep retrying for at least 1 ms */
-	ret = intel_de_pcode_request(dev_priv, ICL_PCODE_SAGV_DE_MEM_SS_CONFIG,
-				     points_mask,
-				     ICL_PCODE_REP_QGV_MASK | ADLS_PCODE_REP_PSF_MASK,
-				     ICL_PCODE_REP_QGV_SAFE | ADLS_PCODE_REP_PSF_SAFE,
-				     1);
+	ret = skl_pcode_request(&dev_priv->uncore, ICL_PCODE_SAGV_DE_MEM_SS_CONFIG,
+				points_mask,
+				ICL_PCODE_REP_QGV_MASK | ADLS_PCODE_REP_PSF_MASK,
+				ICL_PCODE_REP_QGV_SAFE | ADLS_PCODE_REP_PSF_SAFE,
+				1);
 
 	if (ret < 0) {
 		drm_err(&dev_priv->drm, "Failed to disable qgv points (%d) points: 0x%x\n", ret, points_mask);
@@ -177,9 +177,9 @@ static int mtl_read_qgv_point_info(struct drm_i915_private *dev_priv,
 	u32 val, val2;
 	u16 dclk;
 
-	val = intel_de_read(dev_priv,
+	val = intel_uncore_read(&dev_priv->uncore,
 				MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
-	val2 = intel_de_read(dev_priv,
+	val2 = intel_uncore_read(&dev_priv->uncore,
 				 MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
 	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
 	sp->dclk = DIV_ROUND_UP((16667 * dclk), 1000);
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e719bb8fc1f6..f6223d8f13b8 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -35,6 +35,7 @@
 #include "intel_display_types.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pci_config.h"
+#include "intel_pcode.h"
 #include "intel_psr.h"
 #include "vlv_sideband.h"
 
@@ -800,7 +801,7 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
-	ret = intel_de_pcode_write(dev_priv, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
+	ret = snb_pcode_write(&dev_priv->uncore, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"failed to inform pcode about cdclk change\n");
@@ -828,8 +829,8 @@ static void bdw_set_cdclk(struct drm_i915_private *dev_priv,
 			 LCPLL_CD_SOURCE_FCLK_DONE) == 0, 1))
 		drm_err(&dev_priv->drm, "Switching back to LCPLL failed\n");
 
-	intel_de_pcode_write(dev_priv, HSW_PCODE_DE_WRITE_FREQ_REQ,
-			     cdclk_config->voltage_level);
+	snb_pcode_write(&dev_priv->uncore, HSW_PCODE_DE_WRITE_FREQ_REQ,
+			cdclk_config->voltage_level);
 
 	intel_de_write(dev_priv, CDCLK_FREQ,
 		       DIV_ROUND_CLOSEST(cdclk, 1000) - 1);
@@ -1086,10 +1087,10 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	drm_WARN_ON_ONCE(&dev_priv->drm,
 			 IS_SKYLAKE(dev_priv) && vco == 8640000);
 
-	ret = intel_de_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
-				     SKL_CDCLK_PREPARE_FOR_CHANGE,
-				     SKL_CDCLK_READY_FOR_CHANGE,
-				     SKL_CDCLK_READY_FOR_CHANGE, 3);
+	ret = skl_pcode_request(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
+				SKL_CDCLK_PREPARE_FOR_CHANGE,
+				SKL_CDCLK_READY_FOR_CHANGE,
+				SKL_CDCLK_READY_FOR_CHANGE, 3);
 	if (ret) {
 		drm_err(&dev_priv->drm,
 			"Failed to inform PCU about cdclk change (%d)\n", ret);
@@ -1132,8 +1133,8 @@ static void skl_set_cdclk(struct drm_i915_private *dev_priv,
 	intel_de_posting_read(dev_priv, CDCLK_CTL);
 
 	/* inform PCU of the change */
-	intel_de_pcode_write(dev_priv, SKL_PCODE_CDCLK_CONTROL,
-			     cdclk_config->voltage_level);
+	snb_pcode_write(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
+			cdclk_config->voltage_level);
 
 	intel_update_cdclk(dev_priv);
 }
@@ -1898,18 +1899,18 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 14)
 		/* NOOP */;
 	else if (DISPLAY_VER(dev_priv) >= 11)
-		ret = intel_de_pcode_request(dev_priv, SKL_PCODE_CDCLK_CONTROL,
-					     SKL_CDCLK_PREPARE_FOR_CHANGE,
-					     SKL_CDCLK_READY_FOR_CHANGE,
-					     SKL_CDCLK_READY_FOR_CHANGE, 3);
+		ret = skl_pcode_request(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
+					SKL_CDCLK_PREPARE_FOR_CHANGE,
+					SKL_CDCLK_READY_FOR_CHANGE,
+					SKL_CDCLK_READY_FOR_CHANGE, 3);
 	else
 		/*
 		 * BSpec requires us to wait up to 150usec, but that leads to
 		 * timeouts; the 2ms used here is based on experiment.
 		 */
-		ret = intel_de_pcode_write_timeout(dev_priv,
-						   HSW_PCODE_DE_WRITE_FREQ_REQ,
-						   0x80000000, 150, 2);
+		ret = snb_pcode_write_timeout(&dev_priv->uncore,
+					      HSW_PCODE_DE_WRITE_FREQ_REQ,
+					      0x80000000, 150, 2);
 
 	if (ret) {
 		drm_err(&dev_priv->drm,
@@ -1932,8 +1933,8 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 		 * Display versions 14 and beyond
 		 */;
 	else if (DISPLAY_VER(dev_priv) >= 11)
-		ret = intel_de_pcode_write(dev_priv, SKL_PCODE_CDCLK_CONTROL,
-					   cdclk_config->voltage_level);
+		ret = snb_pcode_write(&dev_priv->uncore, SKL_PCODE_CDCLK_CONTROL,
+				      cdclk_config->voltage_level);
 	else
 		/*
 		 * The timeout isn't specified, the 2ms used here is based on
@@ -1941,10 +1942,10 @@ static void bxt_set_cdclk(struct drm_i915_private *dev_priv,
 		 * FIXME: Waiting for the request completion could be delayed
 		 * until the next PCODE request based on BSpec.
 		 */
-		ret = intel_de_pcode_write_timeout(dev_priv,
-						   HSW_PCODE_DE_WRITE_FREQ_REQ,
-						   cdclk_config->voltage_level,
-						   150, 2);
+		ret = snb_pcode_write_timeout(&dev_priv->uncore,
+					      HSW_PCODE_DE_WRITE_FREQ_REQ,
+					      cdclk_config->voltage_level,
+					      150, 2);
 
 	if (ret) {
 		drm_err(&dev_priv->drm,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 719e08d06a98..960f31a75e39 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -98,6 +98,7 @@
 #include "intel_panel.h"
 #include "intel_pch_display.h"
 #include "intel_pch_refclk.h"
+#include "intel_pcode.h"
 #include "intel_pipe_crc.h"
 #include "intel_plane_initial.h"
 #include "intel_pps.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 4a5e90c71554..177c85c598a4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -19,6 +19,7 @@
 #include "intel_dmc.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pch_refclk.h"
+#include "intel_pcode.h"
 #include "intel_pps_regs.h"
 #include "intel_snps_phy.h"
 #include "skl_watermark.h"
@@ -1210,7 +1211,7 @@ static u32 hsw_read_dcomp(struct drm_i915_private *dev_priv)
 static void hsw_write_dcomp(struct drm_i915_private *dev_priv, u32 val)
 {
 	if (IS_HASWELL(dev_priv)) {
-		if (intel_de_pcode_write(dev_priv, GEN6_PCODE_WRITE_D_COMP, val))
+		if (snb_pcode_write(&dev_priv->uncore, GEN6_PCODE_WRITE_D_COMP, val))
 			drm_dbg_kms(&dev_priv->drm,
 				    "Failed to write to D_COMP\n");
 	} else {
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 45ca3cc1dcee..41eabdf3e871 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -20,6 +20,7 @@
 #include "intel_dpio_phy.h"
 #include "intel_dpll.h"
 #include "intel_hotplug.h"
+#include "intel_pcode.h"
 #include "intel_pps.h"
 #include "intel_tc.h"
 #include "intel_vga.h"
@@ -474,8 +475,8 @@ static void icl_tc_cold_exit(struct drm_i915_private *i915)
 	int ret, tries = 0;
 
 	while (1) {
-		ret = intel_de_pcode_write_timeout(i915, ICL_PCODE_EXIT_TCCOLD, 0,
-						   250, 1);
+		ret = snb_pcode_write_timeout(&i915->uncore, ICL_PCODE_EXIT_TCCOLD, 0,
+					      250, 1);
 		if (ret != -EAGAIN || ++tries == 3)
 			break;
 		msleep(1);
@@ -1730,7 +1731,7 @@ tgl_tc_cold_request(struct drm_i915_private *i915, bool block)
 		 * Spec states that we should timeout the request after 200us
 		 * but the function below will timeout after 500us
 		 */
-		ret = intel_de_pcode_read(i915, TGL_PCODE_TCCOLD, &low_val, &high_val);
+		ret = snb_pcode_read(&i915->uncore, TGL_PCODE_TCCOLD, &low_val, &high_val);
 		if (ret == 0) {
 			if (block &&
 			    (low_val & TGL_PCODE_EXIT_TCCOLD_DATA_L_EXIT_FAILED))
diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.c b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
index 5b500cf53b51..62b93d097e44 100644
--- a/drivers/gpu/drm/i915/display/intel_dpio_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.c
@@ -399,10 +399,11 @@ static void _bxt_ddi_phy_init(struct drm_i915_private *dev_priv,
 	 * The flag should get set in 100us according to the HW team, but
 	 * use 1ms due to occasional timeouts observed with that.
 	 */
-	if (intel_de_wait_for_register_fw(dev_priv,
-					  BXT_PORT_CL1CM_DW0(phy),
-					  PHY_RESERVED | PHY_POWER_GOOD,
-					  PHY_POWER_GOOD, 1))
+	if (intel_wait_for_register_fw(&dev_priv->uncore,
+				       BXT_PORT_CL1CM_DW0(phy),
+				       PHY_RESERVED | PHY_POWER_GOOD,
+				       PHY_POWER_GOOD,
+				       1))
 		drm_err(&dev_priv->drm, "timeout during PHY%d power on\n",
 			phy);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b4f3489b9201..0c2ddbef5cfe 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -25,6 +25,7 @@
 #include "intel_hdcp.h"
 #include "intel_hdcp_gsc.h"
 #include "intel_hdcp_regs.h"
+#include "intel_pcode.h"
 
 #define KEY_LOAD_TRIES	5
 #define HDCP2_LC_RETRY_CNT			3
@@ -335,7 +336,7 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	 * Mailbox interface.
 	 */
 	if (DISPLAY_VER(dev_priv) == 9 && !IS_BROXTON(dev_priv)) {
-		ret = intel_de_pcode_write(dev_priv, SKL_PCODE_LOAD_HDCP_KEYS, 1);
+		ret = snb_pcode_write(&dev_priv->uncore, SKL_PCODE_LOAD_HDCP_KEYS, 1);
 		if (ret) {
 			drm_err(&dev_priv->drm,
 				"Failed to initiate HDCP key load (%d)\n",
@@ -347,9 +348,9 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	}
 
 	/* Wait for the keys to load (500us) */
-	ret = __intel_de_wait_for_register(dev_priv, HDCP_KEY_STATUS,
-					   HDCP_KEY_LOAD_DONE, HDCP_KEY_LOAD_DONE,
-					   10, 1, &val);
+	ret = __intel_wait_for_register(&dev_priv->uncore, HDCP_KEY_STATUS,
+					HDCP_KEY_LOAD_DONE, HDCP_KEY_LOAD_DONE,
+					10, 1, &val);
 	if (ret)
 		return ret;
 	else if (!(val & HDCP_KEY_LOAD_STATUS))
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index f7b32823a9a9..0008676217b2 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -82,9 +82,9 @@ intel_sagv_block_time(struct drm_i915_private *i915)
 		u32 val = 0;
 		int ret;
 
-		ret = intel_de_pcode_read(i915,
-					  GEN12_PCODE_READ_SAGV_BLOCK_TIME_US,
-					  &val, NULL);
+		ret = snb_pcode_read(&i915->uncore,
+				     GEN12_PCODE_READ_SAGV_BLOCK_TIME_US,
+				     &val, NULL);
 		if (ret) {
 			drm_dbg_kms(&i915->drm, "Couldn't read SAGV block time!\n");
 			return 0;
@@ -151,8 +151,8 @@ static void skl_sagv_enable(struct drm_i915_private *i915)
 		return;
 
 	drm_dbg_kms(&i915->drm, "Enabling SAGV\n");
-	ret = intel_de_pcode_write(i915, GEN9_PCODE_SAGV_CONTROL,
-				   GEN9_SAGV_ENABLE);
+	ret = snb_pcode_write(&i915->uncore, GEN9_PCODE_SAGV_CONTROL,
+			      GEN9_SAGV_ENABLE);
 
 	/* We don't need to wait for SAGV when enabling */
 
@@ -184,10 +184,10 @@ static void skl_sagv_disable(struct drm_i915_private *i915)
 
 	drm_dbg_kms(&i915->drm, "Disabling SAGV\n");
 	/* bspec says to keep retrying for at least 1 ms */
-	ret = intel_de_pcode_request(i915, GEN9_PCODE_SAGV_CONTROL,
-				     GEN9_SAGV_DISABLE,
-				     GEN9_SAGV_IS_DISABLED, GEN9_SAGV_IS_DISABLED,
-				     1);
+	ret = skl_pcode_request(&i915->uncore, GEN9_PCODE_SAGV_CONTROL,
+				GEN9_SAGV_DISABLE,
+				GEN9_SAGV_IS_DISABLED, GEN9_SAGV_IS_DISABLED,
+				1);
 	/*
 	 * Some skl systems, pre-release machines in particular,
 	 * don't actually have SAGV.
@@ -3364,7 +3364,7 @@ static void skl_read_wm_latency(struct drm_i915_private *i915, u16 wm[])
 
 	/* read the first set of memory latencies[0:3] */
 	val = 0; /* data0 to be programmed to 0 for first set */
-	ret = intel_de_pcode_read(i915, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
+	ret = snb_pcode_read(&i915->uncore, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
 	if (ret) {
 		drm_err(&i915->drm, "SKL Mailbox read error = %d\n", ret);
 		return;
@@ -3377,7 +3377,7 @@ static void skl_read_wm_latency(struct drm_i915_private *i915, u16 wm[])
 
 	/* read the second set of memory latencies[4:7] */
 	val = 1; /* data0 to be programmed to 1 for second set */
-	ret = intel_de_pcode_read(i915, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
+	ret = snb_pcode_read(&i915->uncore, GEN9_PCODE_READ_MEM_LATENCY, &val, NULL);
 	if (ret) {
 		drm_err(&i915->drm, "SKL Mailbox read error = %d\n", ret);
 		return;
-- 
2.39.2

