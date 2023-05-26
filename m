Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EDBC7EE3A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E412B10E833;
	Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E405910E817
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119455; x=1716655455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HKZXFldiqTjtmf+lmS22NxwHO4NnxgyybPYv9wNJgQ=;
 b=bmSQRhd5aCgv9V8NFNRG40Wq58it5uiQR3V0ifkAH6g4Uq6iHkUF21wH
 uughZzaq0idgMnxREp7fMsIRLa4ZgFxeoZHXlKriO4glBdYW0PLUlphnd
 u6WOHIjtRSU1niaLNllUIMjAOtcjUYZNVz8uxVa5EVQgQ34CVh2q+YCBw
 Vd3CZgJyiI4ZJ3Gm+cv0iCanA1UQHru0zDVHLNJxoFzv5Vota1+NTxOx1
 01pfc4D+kJ7fT57PUSTO6uki9gK0bCqMIGYxRmtz1Iv0dCpGK+y0upLYi
 YOeHFr59cMNw2cmbghexc8iaPQhSxjdIcgKJBR4rOfubhkrcpixRXQTtK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628395"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628395"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151505"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151505"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:56 -0700
Message-Id: <20230526164358.86393-20-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 19/21] drm/xe/guc: Port Wa_1509372804 to xe_wa
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

Port Wa_1509372804 to xe_wa so it's reported as active.

v2: Match workaround database, starting from A0 stepping (Matt Roper)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 3 +--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cc58a2092236..3ed460d3b6ca 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -168,8 +168,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
-	/* Wa_1509372804 */
-	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
+	if (XE_WA(gt, 1509372804))
 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
 
 	return flags;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ae0de4d5d687..5bfc64ecb368 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -11,3 +11,4 @@
 		SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
 18020744125	PLATFORM(PVC)
+1509372804	PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
-- 
2.40.1

