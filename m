Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BA8F5A8BB
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 20:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9481710EB4D;
	Mon, 20 Apr 2026 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNmwAfF5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06510EB4F;
 Mon, 20 Apr 2026 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776716593; x=1808252593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Snk3kMtAIzKNQsmJQZNvT5r1uII64kC/R8OMh0BmAQ=;
 b=YNmwAfF50moErovE+11jDXRP0Yb8Hhr5tOXDqGOuQ5mhOhO93YsrBdBE
 m+zEcn4YNUdEhvV3aNPQUwQQ6MlbYENkn0xarCST8S58dyrpjx6/4P24F
 a0KgXMur3aQelGaM6uVZz17ZguBzyZeVZpOWMpYp9fila6fu2nITokFko
 fqKhfIyU54n4rpFXk34LSmyqAMj74s3X+CbaO2Xb2lceJkunjqEMEix2o
 U79i6VOwvTosr0YuJ5iWExkqdahuGln7dmNHsBM0m5b/XtGFbdQyah2MI
 F4q2Gi+0PyLINacBwrnZ23WTh7VBDiicUIkklbMXFCDbAOwQFPztPURTC w==;
X-CSE-ConnectionGUID: djbeUDMbQSewaV9XUuwkqg==
X-CSE-MsgGUID: x8ceL5nuQvOi4FyTAtNK1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77765252"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="77765252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 13:23:13 -0700
X-CSE-ConnectionGUID: bYY5DBYySpCDAskVkClbuw==
X-CSE-MsgGUID: eVcv/EdnRsWEJFCb9cqWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="231736575"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 13:23:11 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v4 3/8] drm/i915/display: move CFL clock gating init to display
Date: Mon, 20 Apr 2026 23:22:11 +0300
Message-ID: <20260420202252.3846880-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420202252.3846880-1-luciano.coelho@intel.com>
References: <20260420202252.3846880-1-luciano.coelho@intel.com>
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

Move the CFL/CML-specific display clock gating programming into
display intel_display_clock_gating.c, to remove more dependencies from
i915 to display registers.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../gpu/drm/i915/display/intel_display_clock_gating.c    | 9 +++++++++
 .../gpu/drm/i915/display/intel_display_clock_gating.h    | 1 +
 drivers/gpu/drm/i915/intel_clock_gating.c                | 6 +-----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index 508735212d6b..82ea21d7377d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -26,3 +26,12 @@ void intel_display_kbl_init_clock_gating(struct intel_display *display)
 	 */
 	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
 }
+
+void intel_display_cfl_init_clock_gating(struct intel_display *display)
+{
+	/*
+	 * WaFbcTurnOffFbcWatermark:cfl
+	 * Display WA #0562: cfl
+	 */
+	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index 8c21217de66a..63960f1e80fc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -10,5 +10,6 @@ struct intel_display;
 
 void intel_display_skl_init_clock_gating(struct intel_display *display);
 void intel_display_kbl_init_clock_gating(struct intel_display *display);
+void intel_display_cfl_init_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c446e4ac92f1..80d7f057cb81 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -307,11 +307,7 @@ static void cfl_init_clock_gating(struct drm_i915_private *i915)
 	/* WAC6entrylatency:cfl */
 	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
 
-	/*
-	 * WaFbcTurnOffFbcWatermark:cfl
-	 * Display WA #0562: cfl
-	 */
-	intel_uncore_rmw(&i915->uncore, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS);
+	intel_display_cfl_init_clock_gating(i915->display);
 }
 
 static void kbl_init_clock_gating(struct drm_i915_private *i915)
-- 
2.53.0

