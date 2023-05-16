Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B13AC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 22:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B8D10E37E;
	Tue, 16 May 2023 22:20:29 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234C10E37D
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684275627; x=1715811627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azce3nFARi4j6s8zga3SL4cluCUv4H/5hFitYewH2I4=;
 b=oBwa8RsI7IY8M+OqStGq1saq8hQF2zGI+SWywV6FUI8Ay5FXGEOZNTlO
 36voPWX6Len3BJ0WtxvAvXRHsq6Ku2RaFhX7ExTqIDDCJNnWMr7iJ1Ftq
 EY/0ByV/HlxwsSYPPhirCStsk0w3R/fCBjnc0v3n0U3Vi1eUsFckbtd3I
 rQ7wSbU0WuTAu+VHn4x1gp9lQZRksdJfHnE566v/oRyqO9AY8jnnNJI/z
 OoJCakaIwhGGK93AJqtOLUe+1aPd+U8gvm9w8vianiZNyO7feoSAZnbsq
 audy1orSMmbadxWX7xQ7ZDopCwc1Fi26wJlcUGBTeY/NdJBa9ERFsW7ng g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="415013393"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="415013393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="766530877"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; d="scan'208";a="766530877"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 15:20:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 15:19:50 -0700
Message-Id: <20230516221950.3512818-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516221950.3512818-1-lucas.demarchi@intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 9/9] drm/xe/guc: Port workarounds to OOB infra
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let xe_guc.c start using XE_WA() for workarounds. The one missing
workaround is left with a "FIXME" since it's not properly implemented
yet.

Also, some changes were made to a few workarounds:

	- Wa_22011383443 not implemented due to being an early PVC
	  stepping. Wa_16011759253 that has the same condition is the
	  one covering DG2.

	- Wa_22011391025 and Wa_14012197797 were split in 2, since they
	  cover different steppings and we do want to report both as
	  implemented. The latter may eventually be removed due to being
	  early DG2 steppings, but the former should remain.

	- Wa_22012727170 and Wa_22012727685 were split in 2 so both of
	  them can be reported as active, regardless if they (currently)
	  have the same rules.

	- Wa_16015675438 and Wa_18020744125 were not checking by
	  platform or IP version, hence making them not future-proof.
	  Those workarounds should only be active in PVC and DG2,
	  besides the check for "no render engine".

DG2 system used for test:
	XE_DG2 G12 56b2:0001 dgfx:1 gfx:Xe_HPG (12.55) media:Xe_HPM (12.55) ...
	Stepping = (G:A1, M:A1, D:C0, B:**)

Output is as expected for the current OOB workarounds:

	$ cat /sys/kernel/debug/dri/0/workarounds
	...
	OOB Workarounds
		14014475959
		22011391025
		14012197797
		16015675438
		16016323070

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  2 +-
 drivers/gpu/drm/xe/xe_guc.c        | 43 ++++++++----------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules | 16 +++++++++++
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index fcf04951a309..07af0d022263 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -38,7 +38,7 @@ $(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	@mkdir -p $(@D)
 	$(call cmd,wa_oob)
 
-$(obj)/xe_wa.o:  $(XE_WA_OOB)
+$(obj)/xe_wa.o $(obj)/xe_guc.o: $(XE_WA_OOB)
 
 # Please keep these build lists sorted!
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1b5d0b6ad180..252a4bfe6d63 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -5,6 +5,7 @@
 
 #include "xe_guc.h"
 
+#include "generated/xe_wa_oob.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
@@ -20,6 +21,7 @@
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
 #include "xe_uc_fw.h"
+#include "xe_wa.h"
 #include "xe_wopcm.h"
 
 #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
@@ -136,29 +138,16 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 flags = 0;
 
-	/* Wa_22012773006:gen11,gen12 < XeHP */
-	if (GRAPHICS_VER(xe) >= 11 &&
-	    GRAPHICS_VERx100(xe) < 1250)
+	if (XE_WA(xe, 22012773006))
 		flags |= GUC_WA_POLLCS;
 
-	/* Wa_16011759253 */
-	/* Wa_22011383443 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
+	if (XE_WA(xe, 16011759253))
 		flags |= GUC_WA_GAM_CREDITS;
 
-	/* Wa_14014475959 */
-	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
-	    xe->info.platform == XE_DG2)
+	if (XE_WA(xe, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	/*
-	 * Wa_14012197797
-	 * Wa_22011391025
-	 *
-	 * The same WA bit is used for both and 22011391025 is applicable to
-	 * all DG2.
-	 */
-	if (xe->info.platform == XE_DG2)
+	if (XE_WA(xe, 22011391025) || XE_WA(xe, 14012197797))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
@@ -169,27 +158,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (GRAPHICS_VERx100(xe) < 1270)
 		flags |= GUC_WA_PRE_PARSER;
 
-	/* Wa_16011777198 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_B0))
+	if (XE_WA(xe, 16011777198))
 		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
 
-	/*
-	 * Wa_22012727170
-	 * Wa_22012727685
-	 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_FOREVER))
+	if (XE_WA(xe, 22012727170) || XE_WA(xe, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	/* Wa_16015675438, Wa_18020744125 */
-	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
+	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
+	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	/* Wa_1509372804 */
-	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
+	if (XE_WA(xe, 1509372804))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
 	return flags;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e69de29bb2d1..060ff25496a7 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -0,0 +1,16 @@
+22012773006	GRAPHICS_VERSION_RANGE(1100, 1250)
+16011759253	SUBPLATFORM(DG2, G10), STEP(A0, B0)
+14014475959	PLATFORM(METEORLAKE), STEP(A0, B0)
+		PLATFORM(DG2)
+22011391025	PLATFORM(DG2)
+14012197797	PLATFORM(DG2), STEP(A0, B0)
+16011777198	SUBPLATFORM(DG2, G10), STEP(A0, C0)
+		SUBPLATFORM(DG2, G11), STEP(A0, B0)
+22012727170	SUBPLATFORM(DG2, G10), STEP(A0, C0)
+		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
+22012727685	SUBPLATFORM(DG2, G10), STEP(A0, C0)
+		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
+16015675438	PLATFORM(PVC)
+		PLATFORM(DG2)
+16016323070	PLATFORM(PVC)
+1509372804	PLATFORM(PVC), STEP(B0, C0)
-- 
2.40.1

