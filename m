Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A80C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C710E90A;
	Thu, 16 Jan 2025 09:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G09d2cQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A1B10E90A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737018810; x=1768554810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YydWihJdmSfoGmkt7uA5wO8BVYsF20/t9rTHJVtDl9I=;
 b=G09d2cQA7nrdZts92i2GR+NxN54tDRpVr8NJI0XlnG3QhFPiLvHmaYb3
 9Nk7rBuqImAoNqB4vj5QIFwCIuoFDsYNegkauog81mkyPD+y3zwvjQd4Q
 RH2PONWy5qmgtvVa/EPE2i7mBeGWQMh20uV7cpus+nIgYhmUg4zbilNWL
 q1tyYVSl9Hw0ulz9UTERwuOq/mT5Uwp4YQ0FY0/1oPXCjDhagjBdF2+Ky
 jkWdFUG160nJPGvQypNx5lH3QF5GZEDO8IfUxuhnBOAlwPcPPrqxWyqV9
 57105lmLq/5XiijJtakpnbikivayQgSR7ZvSyQIkSxTWdhVNI2Yu6jFyP w==;
X-CSE-ConnectionGUID: MZjevGRfRI2h5mZIlt/uWQ==
X-CSE-MsgGUID: fi3Opk8DS7+VS4Ax1Mj0dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37424002"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="37424002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:30 -0800
X-CSE-ConnectionGUID: c3JFuxCkSuWWizsRaxuZ9w==
X-CSE-MsgGUID: 8tM9CvJCSOOJ+S5K5sONCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110399441"
Received: from aradhyab-desk.iind.intel.com ([10.145.169.55])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:13:28 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v2 2/2] drm/xe/oa: Refactor Wa_18013179988 and Wa_14015568240
Date: Thu, 16 Jan 2025 14:40:04 +0530
Message-Id: <20250116091004.3060996-3-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
References: <20250116091004.3060996-1-aradhya.bhatia@intel.com>
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

Refactor Wa_18013179988 and Wa_14015568240, to use the cleaner and
newer workaround-check implementation, and drop the use of the platform
based switch selection.

While at it, fix the lineage number for the MTL.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c         | 14 ++++++--------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  3 +++
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index eeb96b5f49e2..3736e4cd10f7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -12,6 +12,8 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
@@ -35,6 +37,7 @@
 #include "xe_sched_job.h"
 #include "xe_sriov.h"
 #include "xe_sync.h"
+#include "xe_wa.h"
 
 #define DEFAULT_POLL_FREQUENCY_HZ 200
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
@@ -1854,22 +1857,17 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
 	u32 reg, shift;
 
 	/*
-	 * Wa_18013179988:dg2
+	 * Wa_18013179988:dg2/mtl
 	 * Wa_14015568240:pvc
-	 * Wa_14015846243:mtl
 	 */
-	switch (gt_to_xe(gt)->info.platform) {
-	case XE_DG2:
-	case XE_PVC:
-	case XE_METEORLAKE:
+	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
 		xe_pm_runtime_get(gt_to_xe(gt));
 		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 		xe_pm_runtime_put(gt_to_xe(gt));
 
 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
 		return gt->info.reference_clock << (3 - shift);
-
-	default:
+	} else {
 		return gt->info.reference_clock;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 536b91cc4d3f..b79b78d5feba 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -44,3 +44,6 @@ no_media_l3	MEDIA_VERSION(3000)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 16021333562	GRAPHICS_VERSION_RANGE(1200, 1300)
 14016712196	GRAPHICS_VERSION_RANGE(1255, 1274)
+14015568240	GRAPHICS_VERSION_RANGE(1255, 1260)
+18013179988	GRAPHICS_VERSION(1255)
+		GRAPHICS_VERSION_RANGE(1270, 1300)
-- 
2.34.1

