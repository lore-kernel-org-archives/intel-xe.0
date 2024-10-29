Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF3D3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 20:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46E510E046;
	Tue, 29 Oct 2024 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIgabC0j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7E610E046
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 20:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730232128; x=1761768128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=468sX/FOgEN/UynwS6DAHtmu8XKcC/qEwOlebeOy44I=;
 b=MIgabC0jpLTP4aaDvdPkl6BLXHcX6osUaxDHd3Itcle5td2hCgSneKKU
 BKt6ejg+tiWS/cpZbOGzPE10mike/Ye2sLqmEZwUPUyshjDWhjarZ7q6x
 0GV74kU33vO8Xy/S4zAMie7iO0jeleOPaFVbhCvvzPnerp3DkTP6TRraV
 BHGJoU4ijM7phYyoWVLRh16pQvsL0naBEwe3Srdy6fUmkudiFHIVO9wYe
 raR0y8B94aTxH31nnsfOH/S2BOxWY2tVyXSVDoXld1t9IOKw8UfRxGDoa
 nA2SVKT3SWntmxvn2o/XqNLOcM+a69pcIlaeCpeXO1M8rFGP4M3elSmQ8 w==;
X-CSE-ConnectionGUID: 5hBS9s9oQBm7NwN2HQ/LyQ==
X-CSE-MsgGUID: xqOtazn+SDSRSArOercA/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33829729"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="33829729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 13:01:57 -0700
X-CSE-ConnectionGUID: zx3/hIX6R2uK4DSxnxD5Tw==
X-CSE-MsgGUID: kJ8yAe5ARMit+exCXcLgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82497738"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 13:01:57 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] Revert "drm/xe/xe_guc_ads: save/restore OA registers and
 allowlist regs"
Date: Tue, 29 Oct 2024 13:01:47 -0700
Message-ID: <20241029200147.1476513-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

This reverts commit 55858fa7eb2f163f7aa34339fd3399ba4ff564c6.

'55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and allowlist
regs")' was not properly reviewed and also causes dmesg asserts in
CI. Revert it.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3295
Fixes: 55858fa7eb2f ("drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a196c4fb90fc9..4e746ae98888f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -15,7 +15,6 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
-#include "regs/xe_oa_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
@@ -741,11 +740,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
 	}
 
-	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
-		guc_mmio_regset_write_one(ads, regset_map,
-					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
-					  count++);
-
 	/* Wa_1607983814 */
 	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
 		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
@@ -754,14 +748,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL0, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL1, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL2, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL3, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL4, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL5, count++);
-	guc_mmio_regset_write_one(ads, regset_map, EU_PERF_CNTL6, count++);
-
 	return count;
 }
 
-- 
2.41.0

