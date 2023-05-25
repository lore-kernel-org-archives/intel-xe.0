Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC7C7EE32
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6C110E785;
	Thu, 25 May 2023 21:35:09 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B819F10E777
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9l62sdEAnTwNZIw6ixonmmxRJZO/5KHJ16eWS0T+d/w=;
 b=BxJVTXLzCV2K7/ylbTjkASJxs/1abTbTKeL8HzMIUyeM5pygb0UxL273
 KjkiHVmF+jYRK6Rxh/ALTKoent9jmPj+/Nsix3nEuF75kCe4tYSX0zUju
 SqnsLBgtoG4yLHmWdKCCR0fS6NRLfruPqUcgXav2olmA+XvsMi9nKyhIt
 7fHLECe1JseMlrdyGNwzihwwNrBWXK3j2crszyh2nTFRroI0on+Ncvmgi
 VqR0MFje6hUAXfYjueYAIpZ7QI/anJQ7FQNpw7J/EXYLbPastitBCcW3B
 7NB+EiB9LVt3mwkbLAyEZy1IGPuycA4Wfoe6FXTywIwISDB8f/acaLXGb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377916"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377916"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970768"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970768"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:02 -0700
Message-Id: <20230525213407.3907094-17-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 16/21] drm/xe/guc: Port Wa_16011777198 to xe_wa
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

Port Wa_16011777198 to xe_wa so it's reported as active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 5 +----
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 54aaf6e6b577..5eccc4b67381 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -158,10 +158,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (GRAPHICS_VERx100(xe) < 1270)
 		flags |= GUC_WA_PRE_PARSER;
 
-	/* Wa_16011777198 */
-	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
-	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
-				STEP_B0))
+	if (XE_WA(gt, 16011777198))
 		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 77ac4a4a3296..3d4304b7111e 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -2,3 +2,5 @@
 16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
 22011391025	PLATFORM(DG2)
 14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
+16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
+		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
-- 
2.40.1

