Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C3C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 22:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262D710ED50;
	Wed,  6 Mar 2024 22:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ny96thi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759E10ED4F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 22:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709765632; x=1741301632;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rYnF2/2p02ap01w/cSrsPGKGyaAqo/2aSf1mc5SMhDY=;
 b=ny96thi75/ea99oIHwsd//D/UeX7pr9jvhARGospN8ZnuoCXGQs6ygrC
 v6e/Coh8fZu8aR3CBDVs3AG4fX2tyIXqtZBI8XcyZLlCvVvJ61+kSxA5E
 sbYpAyBMw/sqMxS2S60Bh8ysNr32MuqOB7RpOi95lZl6cY9RDaX5Eoiqk
 0pKJXKMLSNHVtm3+0IrV4kTQixW+R6DA0/WnPqP2T2IntLzUzXzsVC0WY
 QIMY5GSRrHqobDCFUFB8m11/bP7Nxvb8/LshjPO/qQhmTInepiGYSzsp0
 i/dOf1o4gNdnblnlPeyHrB58kLMx7bLFfDJZEu54FG5hwFbA7AMpJEawl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15057387"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15057387"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 14:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14396192"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 14:53:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: jani.saarinen@intel.com,
	suresh.kumar.kurmi@intel.com
Subject: [PATCH topic/core-for-CI] platform/x86/intel/pmc/lnl: Remove SSRAM
 support
Date: Wed,  6 Mar 2024 14:53:50 -0800
Message-ID: <20240306225350.1910423-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: "David E. Box" <david.e.box@linux.intel.com>

A recent PMC firmware change in Lunar Lake caused the pmc_core driver to
fail to probe. This is due to a change in the GUID for PMC telemetry coming
from the SSRAM device. Until a final release is ready this value may
change again. In the meantime, disable the SSRAM support for Lunar Lake so
the driver can load and provide some basic functionality.

Fixes: 3748dfdae2a6 ("platform/x86/intel/pmc: Add Lunar Lake M support to intel_pmc_core driver")
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/r/20240227190134.1592072-2-david.e.box@linux.intel.com
[ topic/core-for-CI: currently this is blocking test on LNL. Patch is
  going through the platform-drivers-x86 tree:
  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-ilpo&id=728720381879e9e0bc68ff9edca52261c1f5bc31

  Once proved to work, migrate this comment to gitlab and follow the
  proper way to add patches in topic/core-for-CI. ]
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/platform/x86/intel/pmc/lnl.c | 40 ++++------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/lnl.c b/drivers/platform/x86/intel/pmc/lnl.c
index abad17cdd3d7..068d72504683 100644
--- a/drivers/platform/x86/intel/pmc/lnl.c
+++ b/drivers/platform/x86/intel/pmc/lnl.c
@@ -13,21 +13,6 @@
 
 #include "core.h"
 
-#define SOCM_LPM_REQ_GUID	0x11594920
-
-#define PMC_DEVID_SOCM	0xa87f
-
-static const u8 LNL_LPM_REG_INDEX[] = {0, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 20};
-
-static struct pmc_info lnl_pmc_info_list[] = {
-	{
-		.guid	= SOCM_LPM_REQ_GUID,
-		.devid	= PMC_DEVID_SOCM,
-		.map	= &lnl_socm_reg_map,
-	},
-	{}
-};
-
 const struct pmc_bit_map lnl_ltr_show_map[] = {
 	{"SOUTHPORT_A",		CNP_PMC_LTR_SPA},
 	{"SOUTHPORT_B",		CNP_PMC_LTR_SPB},
@@ -490,7 +475,6 @@ const struct pmc_reg_map lnl_socm_reg_map = {
 	.lpm_sts = lnl_lpm_maps,
 	.lpm_status_offset = MTL_LPM_STATUS_OFFSET,
 	.lpm_live_status_offset = MTL_LPM_LIVE_STATUS_OFFSET,
-	.lpm_reg_index = LNL_LPM_REG_INDEX,
 };
 
 #define LNL_NPU_PCI_DEV		0x643e
@@ -517,33 +501,19 @@ static int lnl_resume(struct pmc_dev *pmcdev)
 int lnl_core_init(struct pmc_dev *pmcdev)
 {
 	int ret;
-	int func = 2;
-	bool ssram_init = true;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_SOC];
 
 	lnl_d3_fixup();
 
 	pmcdev->suspend = cnl_suspend;
 	pmcdev->resume = lnl_resume;
-	pmcdev->regmap_list = lnl_pmc_info_list;
-	ret = pmc_core_ssram_init(pmcdev, func);
-
-	/* If regbase not assigned, set map and discover using legacy method */
-	if (ret) {
-		ssram_init = false;
-		pmc->map = &lnl_socm_reg_map;
-		ret = get_primary_reg_base(pmc);
-		if (ret)
-			return ret;
-	}
 
-	pmc_core_get_low_power_modes(pmcdev);
+	pmc->map = &lnl_socm_reg_map;
+	ret = get_primary_reg_base(pmc);
+	if (ret)
+		return ret;
 
-	if (ssram_init) {
-		ret = pmc_core_ssram_get_lpm_reqs(pmcdev);
-		if (ret)
-			return ret;
-	}
+	pmc_core_get_low_power_modes(pmcdev);
 
 	return 0;
 }
-- 
2.43.0

