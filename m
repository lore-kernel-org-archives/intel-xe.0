Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02ABC7EE24
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5191C10E3B1;
	Thu,  4 May 2023 07:33:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAD510E3AE
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXl+Yrzo5ooVBqBMU9lHcmk8SisrMODGInLx3RgCTIw=;
 b=MYCV1Qkx4pgI1FpmsJASQ8RwdMQ48zX9gR32QsaPodKZWVMWO7g1OiwW
 +OCLOKFb8UMha5tntzX0L9OLBla2cfDGHkTnqqmXyhwgCxGCjE5vebX0K
 BEXr7P4aq7hC9d6IgWcOeKkvZ0SBqhrNjl/dfk1XJelpGVlbD9Ai0DLrf
 nZK5RqVs7VTcEfpgQ5tB6kw+JtN2gt5c9GffAIoSWmTTqPSXpnIDSGtc5
 z//Fe0z/H2poDJT0KZgp4msBIVtZojBDPhsUULe6LiOvxATfPmuCThzZU
 9Upx2ebrp2KWNz86DdYwrxg0RNlXV7CL2mhNo9wWrh68X25JPA86HLH26 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323832"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323832"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439433"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439433"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:46 -0700
Message-Id: <20230504073250.1436293-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/7] drm/xe/guc: Remove special handling for PVC
 A*
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

The rest of the driver doesn't really support PVC before B0 stepping.
Drop the special handling in xe_guc.c.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 89d20faced19..62b4fcf84acf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -143,8 +143,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 
 	/* Wa_16011759253 */
 	/* Wa_22011383443 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0) ||
-	    IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_B0))
+	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
 		flags |= GUC_WA_GAM_CREDITS;
 
 	/* Wa_14014475959 */
@@ -164,11 +163,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 
 	/*
 	 * Wa_2201180203
-	 * GUC_WA_PRE_PARSER causes media workload hang for PVC A0 and PCIe
-	 * errors. Disable this for PVC A0 steppings.
 	 */
-	if (GRAPHICS_VER(xe) <= 12 &&
-	    !IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_B0))
+	if (GRAPHICS_VER(xe) <= 12)
 		flags |= GUC_WA_PRE_PARSER;
 
 	/* Wa_16011777198 */
@@ -180,9 +176,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	/*
 	 * Wa_22012727170
 	 * Wa_22012727685
-	 *
-	 * This WA is applicable to PVC CT A0, but causes media regressions. 
-	 * Drop the WA for PVC.
 	 */
 	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
 	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
@@ -194,10 +187,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
 	/* Wa_1509372804 */
-	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_C0))
+	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
-
 	return flags;
 }
 
-- 
2.40.1

