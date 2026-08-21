Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43555C5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABBA10F3BD;
	Fri, 21 Aug 2026 21:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q05CWNt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E9210F3B1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787348232; x=1818884232;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gvrahhlcIZR56gwg9+GKJ/hu8R12qwgxHa/+1t3mo9Q=;
 b=Q05CWNt06HKEMMlZ9fulWjEK8ZS+8rC8sAwlqlcU+GTZ1lfQsH1Hfpui
 Ol+j0AdwP3IZCMjhSWY/YSrVXe5PlVReDjGTVF1qbKRnvn0DyC7ARC3uO
 1X2OkS7t+A5yJ3g8vfxAxRhAe0yRtGFX6Npgmq9XJk9JUXwhjp2+TD+Ep
 wdu/XB08JOgjaTD5w5Jmg7mTi/vLGJG9ziyHeldTcNoW7X/uVDjs60h2v
 bBRwN5rT5ZbkCgIfK/+uPJd00LFgtbi/h6FB6T+cx3HfUer5dPR1SMpRx
 ecv6MBXG0jNNd1CRUk3hjxTESxYWamq1r4TXFNO0bZku9I1VMLKg20Wkj A==;
X-CSE-ConnectionGUID: FTVF5ejkSg2egOyXeHL6fg==
X-CSE-MsgGUID: qYqQhvH3RoKqxkHYYvxkCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91776299"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="91776299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:12 -0700
X-CSE-ConnectionGUID: quAwqoXjSWCtEBQosapv+g==
X-CSE-MsgGUID: C5FBlmioRPSMwRHT0vWUlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266502739"
Received: from arnabgho-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.173])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:37:10 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Aug 2026 18:36:48 -0300
Subject: [PATCH v3 2/3] Revert "drm/xe/nvlp: Implement Wa_14026539277"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-wa_14026539277-v3-2-1f98c2af12f6@intel.com>
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
In-Reply-To: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.15-dev
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

This reverts commit 0919b266456d81e71277c5963d4e806e85b65232.

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  So let's revert the
current implementation; a follow-up change will add the proper
handling for this workaround.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ----
 drivers/gpu/drm/xe/xe_gt.c                | 39 -------------------------------
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 3 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 48c515d91882..0ec01488d6db 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -456,10 +456,6 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
-#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
-#define   CECTRL				REG_GENMASK(2, 1)
-#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
-
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
 #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6805e0d3bf21..eab8492836ea 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -12,7 +12,6 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
-#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
@@ -456,35 +455,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
-static void wa_14026539277(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 val;
-
-	/*
-	 * FIXME: We currently can't use FUNC(xe_rtp_match_not_sriov_vf) in the
-	 * rules for Wa_14026539277 due to xe_wa_process_device_oob() being
-	 * called before xe_sriov_probe_early(); and we can't move the call to
-	 * the former to happen after the latter because MMIO read functions
-	 * already depend on a device OOB workaround.  This needs to be fixed by
-	 * allowing workaround checks to happen at different stages of driver
-	 * initialization.
-	 */
-	if (IS_SRIOV_VF(xe))
-		return;
-
-	if (!XE_DEVICE_WA(xe, 14026539277))
-		return;
-
-	if (!xe_gt_is_main_type(gt))
-		return;
-
-	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
-	val &= ~CECTRL;
-	val |= CECTRL_CENODATA_ALWAYS;
-	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
-}
-
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
@@ -610,15 +580,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
-	/*
-	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
-	 * as an entry in gt_was[]) for two reasons: it is actually a device
-	 * workaround that happens to involve programming a GT register; and it
-	 * needs to be applied early to avoid getting the hardware in a bad
-	 * state before we have a chance to do the necessary programming.
-	 */
-	wa_14026539277(gt);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425..356b4707dafe 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -3,7 +3,6 @@
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
-14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)

-- 
2.55.0

