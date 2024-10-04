Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F87CFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 06:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6543610E246;
	Fri,  4 Oct 2024 06:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOCqylug";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C451B10E246
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728024309; x=1759560309;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=21iqK4j5i7ZSOKQ7Ii2+i7QpRfnirpIHJa1ddgLYZ30=;
 b=iOCqylug9K8XxftssbWWqtR2/Ewsq8FRW+/QCohyP+EEGEfzcrxxAEtp
 Iyh2iB+j0nCMMMRlsHz8cMtZ3DYayBl7kY9X9maB4wjJLJgoj8aXJJVWf
 sVonXciojPZeQwTj757SgMD2s00hSwfYrQvOXBlw9gq+quxDM8AxUwIVS
 osB1hFf2tDcLCYfwGew26/O9G/XT1D9x/W3MqjHCT5Tl3HKUfAS8ZoiA4
 ESYkpWuZ8ePt4+hTjcGOx2LQeasFM6JQo7v4pe563vgsEkv6LkkMceR5A
 j2QWfnRScTVSQJFonnraeZtmBg7lNYtMmwC3xFaUfJKirHi55vaM8ZtCs A==;
X-CSE-ConnectionGUID: 9DufzPDVSEy5Fo5/kHo/Gw==
X-CSE-MsgGUID: +HmH1VYWSfCEMdF8HQ+pGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27372152"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="27372152"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 23:45:09 -0700
X-CSE-ConnectionGUID: TVSQP0LeTMOmNnZ26bVyiQ==
X-CSE-MsgGUID: V56NAfLlShuiUUxyDovGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; d="scan'208";a="74619415"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 23:45:07 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI TESTING ONLY v2] Revert "platform/x86:intel/pmc: Enable the
 ACPI PM Timer to be turned off when suspended"
Date: Fri,  4 Oct 2024 09:45:00 +0300
Message-ID: <20241004064500.1312177-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

This reverts commit e86c8186d03a6ba018e881ed45f0962ad553e861.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/platform/x86/intel/pmc/adl.c  |  2 --
 drivers/platform/x86/intel/pmc/cnp.c  |  2 --
 drivers/platform/x86/intel/pmc/core.c | 45 ---------------------------
 drivers/platform/x86/intel/pmc/core.h |  8 -----
 drivers/platform/x86/intel/pmc/icl.c  |  2 --
 drivers/platform/x86/intel/pmc/mtl.c  |  2 --
 drivers/platform/x86/intel/pmc/spt.c  |  2 --
 drivers/platform/x86/intel/pmc/tgl.c  |  2 --
 8 files changed, 65 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
index 9d9c07f44ff6..e7878558fd90 100644
--- a/drivers/platform/x86/intel/pmc/adl.c
+++ b/drivers/platform/x86/intel/pmc/adl.c
@@ -295,8 +295,6 @@ const struct pmc_reg_map adl_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ADL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_modes = ADL_LPM_NUM_MODES,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index 513c02670c5a..dd72974bf71e 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -200,8 +200,6 @@ const struct pmc_reg_map cnp_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index ecb47f8b4f83..d6c0f88f8c7b 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -11,7 +11,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/acpi_pmtmr.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1258,38 +1257,6 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
 	return val == 1;
 }
 
-/*
- * Enable or disable ACPI PM Timer
- *
- * This function is intended to be a callback for ACPI PM suspend/resume event.
- * The ACPI PM Timer is enabled on resume only if it was enabled during suspend.
- */
-static void pmc_core_acpi_pm_timer_suspend_resume(void *data, bool suspend)
-{
-	struct pmc_dev *pmcdev = data;
-	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_reg_map *map = pmc->map;
-	bool enabled;
-	u32 reg;
-
-	if (!map->acpi_pm_tmr_ctl_offset)
-		return;
-
-	guard(mutex)(&pmcdev->lock);
-
-	if (!suspend && !pmcdev->enable_acpi_pm_timer_on_resume)
-		return;
-
-	reg = pmc_core_reg_read(pmc, map->acpi_pm_tmr_ctl_offset);
-	enabled = !(reg & map->acpi_pm_tmr_disable_bit);
-	if (suspend)
-		reg |= map->acpi_pm_tmr_disable_bit;
-	else
-		reg &= ~map->acpi_pm_tmr_disable_bit;
-	pmc_core_reg_write(pmc, map->acpi_pm_tmr_ctl_offset, reg);
-
-	pmcdev->enable_acpi_pm_timer_on_resume = suspend && enabled;
-}
 
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
@@ -1486,7 +1453,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	struct pmc_dev *pmcdev;
 	const struct x86_cpu_id *cpu_id;
 	int (*core_init)(struct pmc_dev *pmcdev);
-	const struct pmc_reg_map *map;
 	struct pmc *primary_pmc;
 	int ret;
 
@@ -1545,11 +1511,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 	pm_report_max_hw_sleep(FIELD_MAX(SLP_S0_RES_COUNTER_MASK) *
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
-	map = primary_pmc->map;
-	if (map->acpi_pm_tmr_ctl_offset)
-		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
-							 pmcdev);
-
 	device_initialized = true;
 	dev_info(&pdev->dev, " initialized\n");
 
@@ -1559,12 +1520,6 @@ static int pmc_core_probe(struct platform_device *pdev)
 static void pmc_core_remove(struct platform_device *pdev)
 {
 	struct pmc_dev *pmcdev = platform_get_drvdata(pdev);
-	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_reg_map *map = pmc->map;
-
-	if (map->acpi_pm_tmr_ctl_offset)
-		acpi_pmtmr_unregister_suspend_resume_callback();
-
 	pmc_core_dbgfs_unregister(pmcdev);
 	pmc_core_clean_structure(pdev);
 }
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 75fd593a7b0f..b9d3291d0bf2 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -68,8 +68,6 @@ struct telem_endpoint;
 #define SPT_PMC_LTR_SCC				0x3A0
 #define SPT_PMC_LTR_ISH				0x3A4
 
-#define SPT_PMC_ACPI_PM_TMR_CTL_OFFSET		0x18FC
-
 /* Sunrise Point: PGD PFET Enable Ack Status Registers */
 enum ppfear_regs {
 	SPT_PMC_XRAM_PPFEAR0A = 0x590,
@@ -150,8 +148,6 @@ enum ppfear_regs {
 #define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
 #define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
 
-#define SPT_PMC_BIT_ACPI_PM_TMR_DISABLE		BIT(1)
-
 /* Cannonlake Power Management Controller register offsets */
 #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
 #define CNP_PMC_PM_CFG_OFFSET			0x1818
@@ -355,8 +351,6 @@ struct pmc_reg_map {
 	const u8  *lpm_reg_index;
 	const u32 pson_residency_offset;
 	const u32 pson_residency_counter_step;
-	const u32 acpi_pm_tmr_ctl_offset;
-	const u32 acpi_pm_tmr_disable_bit;
 };
 
 /**
@@ -432,8 +426,6 @@ struct pmc_dev {
 	u32 die_c6_offset;
 	struct telem_endpoint *punit_ep;
 	struct pmc_info *regmap_list;
-
-	bool enable_acpi_pm_timer_on_resume;
 };
 
 enum pmc_index {
diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
index cbbd44054468..71b0fd6cb7d8 100644
--- a/drivers/platform/x86/intel/pmc/icl.c
+++ b/drivers/platform/x86/intel/pmc/icl.c
@@ -46,8 +46,6 @@ const struct pmc_reg_map icl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
 	.etr3_offset = ETR3_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
index 91f2fa728f5c..c7d15d864039 100644
--- a/drivers/platform/x86/intel/pmc/mtl.c
+++ b/drivers/platform/x86/intel/pmc/mtl.c
@@ -462,8 +462,6 @@ const struct pmc_reg_map mtl_socm_reg_map = {
 	.ppfear_buckets = MTL_SOCM_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.lpm_num_maps = ADL_LPM_NUM_MAPS,
 	.ltr_ignore_max = MTL_SOCM_NUM_IP_IGN_ALLOWED,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index 2cd2b3c68e46..ab993a69e33e 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -130,8 +130,6 @@ const struct pmc_reg_map spt_reg_map = {
 	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
 	.pm_vric1_offset = SPT_PMC_VRIC1_OFFSET,
 };
diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index 371b4e30f142..e0580de18077 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -197,8 +197,6 @@ const struct pmc_reg_map tgl_reg_map = {
 	.ppfear_buckets = ICL_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
-	.acpi_pm_tmr_ctl_offset = SPT_PMC_ACPI_PM_TMR_CTL_OFFSET,
-	.acpi_pm_tmr_disable_bit = SPT_PMC_BIT_ACPI_PM_TMR_DISABLE,
 	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
 	.lpm_num_maps = TGL_LPM_NUM_MAPS,
 	.lpm_res_counter_step_x2 = TGL_PMC_LPM_RES_COUNTER_STEP_X2,
-- 
2.45.2

