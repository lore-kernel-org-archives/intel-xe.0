Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43431C4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 19:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367D10E3CC;
	Tue, 21 Jul 2026 19:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OliCgAwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1251E10EB1F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 19:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784661047; x=1816197047;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=O3m1+Se9QR0nusLZ0Nh1gXzZRNeLFv2Q4+tz1EiXwbw=;
 b=OliCgAwDvWB4mUzqwR61VoMcGAuhufGaGUd5OsJvkg2xGVqeFArJZqpO
 +rmtNUsyJGFq07RC76pA/B+TUdg4SYn1KFfeuswtW5NaBQo3sY8Jh7UQ3
 slwkwYb+jrtk0Lau8zL1rZlaVW+yoPN1+jqf4mSlprNoqIfd6VGCardRf
 ESuYHw3vgQouU5n11C94aF6c6txP6YZgsojGnG33+pjmH1h8DaX5UIXON
 p9t9xGI+oPNmyaFtblCyFsTdq1ee0njGH41INxw2ZhWoiBHuG/jz72Wjk
 xfTJ12gIJ7gGk8OhLDiASJ5zAQg4Ib1xgUiigCHkkPl5Ddj6apFztgDu6 g==;
X-CSE-ConnectionGUID: xutOQ0FsQcqiTt4nYy2Tjw==
X-CSE-MsgGUID: A0Lp3MdaQEuUF2BcItr2Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85295085"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85295085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:46 -0700
X-CSE-ConnectionGUID: Vmg5OuzkRz+iH3wwW6OgEQ==
X-CSE-MsgGUID: rh2dlN7DRgidYaNcEBWziQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="282374159"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:10:46 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 16:10:20 -0300
Subject: [PATCH 2/3] Revert "drm/xe/nvlp: Implement Wa_14026539277"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-2-09fa102f3084@intel.com>
References: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-09fa102f3084@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ----
 drivers/gpu/drm/xe/xe_gt.c                | 39 -------------------------------
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 3 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 08251c7a1a4b..155cc19f097e 100644
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
index dfdacc0f6de9..2f14795e61f4 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -12,7 +12,6 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
-#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
@@ -455,35 +454,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
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
@@ -609,15 +579,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
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

