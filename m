Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2FCC7EE33
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401C110E82B;
	Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A6310E817
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119455; x=1716655455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3o+pBLqD984YbY1RSNlENDCRAJhYLBpMGW2ejnjsA8Q=;
 b=FelGm/u8ryXBQDqygYAgOa1N/JFoUXZ8GALUC/PL51TqPIraA4M2MKbQ
 0NuRjOyhtRojS3aTKOePPcC5kZ+ctBYB+JAUcMkJE3hobutDdh4+xT3j9
 HjEerTK93E49RtGEVzcrP/2qXwJIunk/rtLNjCvnU1HGtP6VAobfYWodL
 cfQvapTOhIYFwW6JnAJbJHdh6MentxgNBhA7qAqNvd71+gOir4FBlgwez
 4tT2rR2k0VxUY/dWtFA2pucBhTUSnkZ5v32UhHmffzW5ugWDfS5I0fhdK
 0BQEDkBuzF3Ooq8pKUz2DD4RbTQYYRL4y4XMC6nNxLKp1CV/NqEEsggWY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628394"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628394"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151501"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151501"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:55 -0700
Message-Id: <20230526164358.86393-19-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 18/21] drm/xe/guc: Port
 Wa_16015675438/Wa_18020744125 to xe_wa
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

Wa_16015675438 and Wa_18020744125 apply to DG2 using the same action and
conditions. Add both to the oob rules so they are both reported as
active. Note that previously they were not checking by platform or IP
version, hence making them not future-proof.  Those workarounds should
only be active in PVC and DG2, besides the check for "no render engine".

v2: From current WA database, Wa_16015675438 applies to all DG2
    subplatforms except G11. Migrate condition to use subplatform and
    remove G11 from the match (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 4 ++--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1291f71348db..cc58a2092236 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -164,8 +164,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
-	/* Wa_16015675438, Wa_18020744125 */
-	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
+	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
+	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
 	/* Wa_1509372804 */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ac3715e215f2..ae0de4d5d687 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -7,3 +7,7 @@
 22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
 		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
 22012727685	SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
+16015675438	PLATFORM(PVC)
+		SUBPLATFORM(DG2, G10)
+		SUBPLATFORM(DG2, G12)
+18020744125	PLATFORM(PVC)
-- 
2.40.1

