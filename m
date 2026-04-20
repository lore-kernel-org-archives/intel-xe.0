Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A915F5580A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 10:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E1110E4D3;
	Mon, 20 Apr 2026 10:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IryDj+e5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721E510E4D3;
 Mon, 20 Apr 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776681450; x=1808217450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VkpsHVlHvpstZwaCRQq9F1d23TnekY3gImYeCHN6pRA=;
 b=IryDj+e5BxEMRzegfk1e8wzK06PoCgeczQJ6jJpkKlL+IThtlY39lXOC
 /MZFWtbMIeritIln1uqiVD85rDbR6aCdbzRooqstEknwem2Hv1M21pE2X
 E+GNFFpDwywKHRb7dRdP3eXDJBUXzh0wyGzkP6OQ+Sd5hPhkxi3IyNnu2
 lXY2ftCzFX0bv8LAtQm+i/IpOJ44X9ke6nyfkH6AuWR02JNYbpkunOWIB
 xEv9TuHw0mnyZrWp+QeOb4Yp5FK76T1b+WKf0Uk9kwnWVdxUlnS2J8BSy
 ViJOXQh7vBevzcGPEWrBsM1npC2wo1Wz1IkvYDidKv3fHItqohs5wQq+H A==;
X-CSE-ConnectionGUID: c58sXKKmSq6Jkaw92ETMRQ==
X-CSE-MsgGUID: OtpJXXHuTUOMcPTTLDCe1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81464753"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="81464753"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:37:29 -0700
X-CSE-ConnectionGUID: jouDIEE+SJaoitE4Ra3fkg==
X-CSE-MsgGUID: S+ofeLPaR1mCMuTPsyALpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231554574"
Received: from vpanait-mobl.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.99])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:37:27 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v3 3/8] drm/i915/display: move CFL clock gating init to display
Date: Mon, 20 Apr 2026 13:30:45 +0300
Message-ID: <20260420103705.3453499-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420103705.3453499-1-luciano.coelho@intel.com>
References: <20260420103705.3453499-1-luciano.coelho@intel.com>
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
index 5f7910dbe164..b9bd23c2731e 100644
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

