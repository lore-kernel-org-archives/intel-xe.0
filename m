Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A555DC48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 07:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E4810E14A;
	Thu, 29 Feb 2024 07:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8k9VmPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAC510E14A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709190484; x=1740726484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t3/4UcfKiu2/U+9xUSCcYi5tS1UTrg8Gj8INIOsQt3A=;
 b=A8k9VmPF6aw2WpSegkCNaaSzxN0BE/iGx9Cr1FUGjgm0Cqy0UFKcly23
 f6nW5NI6gSlySgYBRe08VN6ePX2UVeHlA8UmsO4oR2gkwor4/1JedpzfB
 DSLS7g1/seiVoUD4PdFlU3fAd8/RSDF4tSm6oseXb6nJopGguP0TwFf1r
 L+0secA3bHO3vqf6c519t+cEa2zF3JedXUvsxEL55JBgrbJolzRrXbVUV
 hsWzKQz3S5nGQLU42KWfXJNjNWh9B13kYPb1VG1jehAXj+dWZR2imgkYe
 nJKh2a5iwWGyUtE8E+5Jvv5UrfNnEj0azxGiPHDMn+ROKUsrap2/QA8m9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29073967"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="29073967"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8149840"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa006.jf.intel.com with ESMTP; 28 Feb 2024 23:08:03 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH V1 2/3] drm/xe/xelpg: Extend some workarounds to graphics
 version 12.74
Date: Thu, 29 Feb 2024 12:38:05 +0530
Message-Id: <20240229070806.3402641-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
References: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

A handful of Xe_LPG workarounds are also relevant to graphics version
12.74 as well. Extend the graphics version range for these workarounds
accordingly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 drivers/gpu/drm/xe/xe_wa.c            | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 44570d888355..9d0c715142b9 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -71,6 +71,7 @@ static const struct platform_test_case cases[] = {
 	SUBPLATFORM_CASE(DG2, G12, A1),
 	GMDID_CASE(METEORLAKE, 1270, A0, 1300, A0),
 	GMDID_CASE(METEORLAKE, 1271, A0, 1300, A0),
+	GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
 };
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a0264eedd443..bcc285f45a1e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -173,11 +173,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
 	{ XE_RTP_NAME("14018575942"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
 	},
 	{ XE_RTP_NAME("22016670082"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
 	},
 
@@ -397,7 +397,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	/* Xe_LPG */
 
 	{ XE_RTP_NAME("14017856879"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
 	},
@@ -537,7 +537,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	/* Xe_LPG */
 
 	{ XE_RTP_NAME("18019271663"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
 	{ XE_RTP_NAME("14019877138"),
-- 
2.34.1

