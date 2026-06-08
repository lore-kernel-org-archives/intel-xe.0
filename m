Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B905ECD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 13:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7864210F3B6;
	Mon,  8 Jun 2026 13:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFuXZcB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C2D10F3B6;
 Mon,  8 Jun 2026 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780925108; x=1812461108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=90+OGpURpXUilNv4PiAZxQHU1o5EBbJSgeyu4BiXMbg=;
 b=LFuXZcB27+9s54b8GUE7kuexnD04LuWVb7RA2tz2Rv2izzdc2eedKeBb
 4i7mBt5O3GWTFxo1zNqe6c/cjekFT7gMrPWZ0k1xfMPjTQyFM6dFcFvga
 e6p9jFYItm8tRwslVS4PnLDPeb/EHxZ+A6+F8nNQM953Q4HYYDmzg40ML
 MoVpyXp36fucZcy45jL6zPM8Da7Z/bA1QXbUlfbsKlhbFCfzgEpfQgV1c
 mLtbDioFQq19f1LmgeR+/wqVnscGiAYtlHU8MalrokkUw5Xc2zHgasEf1
 HnL5ejJ5tHbPUWnd4JE1m+f1k9UiEwkuReb7pbtkeZi8IcO3D1J05qfWe g==;
X-CSE-ConnectionGUID: jUZ86IDlQ26LWdjh2sq6sQ==
X-CSE-MsgGUID: jBMmFdFhSnOlZThwuJIMag==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81634474"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81634474"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 06:25:07 -0700
X-CSE-ConnectionGUID: WPHVFntzSU2QzbqTx8/rqQ==
X-CSE-MsgGUID: 0Weiyyq4TDGWfZMokDVumA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244694459"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa010.jf.intel.com with ESMTP; 08 Jun 2026 06:25:07 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Skip generic pipe dpll_hw_state compare on
 LT PHY
Date: Mon,  8 Jun 2026 13:25:05 +0000
Message-ID: <20260608132505.1849158-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

LT PHY PLL readout is only partially reliable, and the LT PHY code
already documents that only a subset of the state can be read back
reliably after power gating.

The generic pipe-state verification compares dpll_hw_state as part of
intel_pipe_config_compare(), which can trigger false-positive
"pipe state doesn't match!" warnings on LT PHY platforms. DPLL-specific
verification already exists via intel_dpll_state_verify().

Skip the generic dpll_hw_state pipe-state compare on LT PHY platforms
and rely on the dedicated DPLL verification path instead.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2fa10f858279..85ad2bc4963d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5374,8 +5374,12 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	if (display->dpll.mgr)
 		PIPE_CONF_CHECK_P(intel_dpll);
 
-	/* FIXME convert everything over the dpll_mgr */
-	if (display->dpll.mgr || HAS_GMCH(display))
+	/*
+	 * LT PHY PLL readout is only partially reliable and the PLL state
+	 * is already verified via intel_dpll_state_verify(). Avoid false
+	 * positives from the generic pipe state comparison.
+	 */
+	if ((display->dpll.mgr || HAS_GMCH(display)) && !HAS_LT_PHY(display))
 		PIPE_CONF_CHECK_PLL(dpll_hw_state);
 
 	PIPE_CONF_CHECK_X(dsi_pll.ctrl);
-- 
2.43.0

