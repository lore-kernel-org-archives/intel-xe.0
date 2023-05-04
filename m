Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68216C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417BC10E3B5;
	Thu,  4 May 2023 07:33:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4F410E3AD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7m4GYEgrhSJ18vZ24FIbqO9yo5dXRnCZh2MP4CZsXrM=;
 b=cNezo4M6yL28MdeitQEOo3/9VEVK06leNf4AHd5KAi0XUTTv+C6plDfl
 n4CihoXUGnbjjSt6JaNoGvJc/Slx0gjCEv+XSVqEkdz3AO2UAfz9sxZzs
 TGzfPJEg3DiQOEINCvaDNb3j668Q2u0qkxbtxNYZrzQqyI5hb1qp9t2tX
 ZwpahyyVbcDKmR73ZIHoYPWbrLmMcK3sbktdWrUggv+Fka1zpac1diNZw
 OVViMMiMO0vZgBzbA05mNIGpfCCSKdLLhoroMphEOePkTz00JHHD8djdO
 C/5fOGItvO1QfwokBbbxMWs+IryjPkPKzC1Hv51AO7UiHsmuNZvwKv61q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323834"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439446"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439446"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:50 -0700
Message-Id: <20230504073250.1436293-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe/guc: Port workarounds to OOB infra
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let xe_guc.c start using XE_WA() for workarounds. One workaround
couldn't be converted due to no support for function hook checks.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 40 +++++++++++++------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index f7d32b744247..eea5ed015282 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -19,7 +19,9 @@
 #include "xe_guc_submit.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_rtp.h"
 #include "xe_uc_fw.h"
+#include "xe_wa.h"
 #include "xe_wopcm.h"
 
 #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
@@ -136,29 +138,22 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 flags = 0;
 
-	/* Wa_22012773006:gen11,gen12 < XeHP */
-	if (GRAPHICS_VER(xe) >= 11 &&
-	    GRAPHICS_VERx100(xe) < 1250)
+	if (XE_WA(xe, "22012773006", GRAPHICS_VERSION_RANGE(1100, 1250)))
 		flags |= GUC_WA_POLLCS;
 
-	/* Wa_16011759253 */
-	/* Wa_22011383443 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
+	if (XE_WA(xe, "16011759253, 22011383443",
+		  SUBPLATFORM(DG2, G10), STEP(A0, B0)))
 		flags |= GUC_WA_GAM_CREDITS;
 
-	/* Wa_14014475959 */
-	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
-	    xe->info.platform == XE_DG2)
+	if (XE_WA(xe, "14014475959[mtl]", PLATFORM(METEORLAKE), STEP(A0, B0)) ||
+	    XE_WA(xe, "14014475959[dg2]", PLATFORM(DG2)))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
 	/*
-	 * Wa_14012197797
-	 * Wa_22011391025
-	 *
 	 * The same WA bit is used for both and 22011391025 is applicable to
 	 * all DG2.
 	 */
-	if (xe->info.platform == XE_DG2)
+	if (XE_WA(xe, "14012197797, 22011391025", PLATFORM(DG2)))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
@@ -169,27 +164,20 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (GRAPHICS_VERx100(xe) < 1270)
 		flags |= GUC_WA_PRE_PARSER;
 
-	/* Wa_16011777198 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_B0))
+	if (XE_WA(xe, "16011777198[dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
+	    XE_WA(xe, "16011777198[dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, B0)))
 		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
 
-	/*
-	 * Wa_22012727170
-	 * Wa_22012727685
-	 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_FOREVER))
+	if (XE_WA(xe, "22012727170, 22012727685 [dg2_g10]", SUBPLATFORM(DG2, G10), STEP(A0, C0)) ||
+	    XE_WA(xe, "22012727170, 22012727685 [dg2_g11]", SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
 	/* Wa_16015675438, Wa_18020744125 */
+	/* FIXME: currently there is no support for gt checks in XE_WA() */
 	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	/* Wa_1509372804 */
-	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
+	if (XE_WA(xe, "1509372804", PLATFORM(PVC), STEP(B0, C0)))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
 	return flags;
-- 
2.40.1

