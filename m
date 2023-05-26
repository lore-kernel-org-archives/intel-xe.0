Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89727C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55010E820;
	Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C65C10E81A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119455; x=1716655455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9kId1hcLMipjIYjl/7YBFED/sYP65ucPHn866xW2O+o=;
 b=Wjez6WlUyu2oiWrrI1fVA1UpgORehcORxTr66P8y+4oUa16P9SuPDPfG
 GP6roUWwgo9/VlRp3LLMILg08dY1hbCF1/AQ+s1ZbZmtJpi5mtgv03xgj
 Bu66a0fUQA27Ez5k97ZSnettu4eES5BHdgNDK55C0kwWDsMQdhQhqjJzn
 ac/LwvrtAf213puzDMJ+bRvHK/rIrDAnITLs/laFGTyG5REH6vp8qV+R5
 Z+ZAFqEG6c7FAjHtLc33kQbrIEnAvk2H32U56n7iKw3nNWfc1MGOtrcZZ
 pFAvUSpy6x4iwR6IdOphfGGt/Pcxvh6klZXZRQ1zJAoxd2XYZgKg4lffF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628392"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628392"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151497"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151497"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:54 -0700
Message-Id: <20230526164358.86393-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 17/21] drm/xe/guc: Port
 Wa_22012727170/Wa_22012727685 to xe_wa
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
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_22012727170 and Wa_22012727685 apply to DG2 using the same action and
conditions. Add both to the oob rules so they are both reported as
active.

Do not Wa_22012727170 to PVC and MTL since only early A* steppings are
affected.

v2: Remove DG2_G10 from Wa_22012727685 to match current WA database
    (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 8 +-------
 drivers/gpu/drm/xe/xe_wa_oob.rules | 3 +++
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 5eccc4b67381..1291f71348db 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -161,13 +161,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 16011777198))
 		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
 
-	/*
-	 * Wa_22012727170
-	 * Wa_22012727685
-	 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_FOREVER))
+	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
 	/* Wa_16015675438, Wa_18020744125 */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 3d4304b7111e..ac3715e215f2 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -4,3 +4,6 @@
 14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
 16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
 		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
+22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
+		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
+22012727685	SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
-- 
2.40.1

