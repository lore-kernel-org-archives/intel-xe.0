Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643A2C4451B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jul 2026 15:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274D10E4A3;
	Fri, 17 Jul 2026 15:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWzXoTVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A62210E4A8;
 Fri, 17 Jul 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784303477; x=1815839477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J7eQbM20VXnFtd0Jfy7syfTRRv40inaMU0GfURfu1F8=;
 b=RWzXoTVBOgyamM9s2uMhXTFvUfgPHj3re43BcPi1aPtQtoGUtSu+ELD0
 kXCbWX5hTK5gY2B2oV0yaiw6Ga/3fbKXRGa0MFOZ3bnqfI3atlqN+kZKY
 loLdSRyqS7EXxKmHjVZVEUNIiCSYHSA5hCGPwnZMM+gk0wOxhyU0/Gm55
 wBrxGc2kOOIO4JZ185SInsKsHcdj8T0rB0jh/PQUYy+r9zaCgniapwftd
 MTm3JjYav0QOtFZOkRvYbKMk+4iBB+vocyhtVOStB5tUAuiLXF2MaCMgN
 Uh21Zo1a1CdF6DEVcOYNaMrssUME4hk0ErWE36oPH+Lbr5zImiFHb15Ad g==;
X-CSE-ConnectionGUID: gR+NDJ1rQ72n+MeqdDY4dQ==
X-CSE-MsgGUID: DqBtjA0jR2uFOizMXeY9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88877297"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="88877297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:51:16 -0700
X-CSE-ConnectionGUID: siHJJkb6QC+AcBAy9ophpw==
X-CSE-MsgGUID: t8UGqKOmRs2H1TN5+lBLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286886619"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.241])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 08:51:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/cdclk: Introduce has_cd2x_pipe_select()
Date: Fri, 17 Jul 2026 18:51:07 +0300
Message-ID: <20260717155107.17801-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
References: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We have several open coded checks for the platform's
cd2x pipe select capability, each written slightly
differently. Move it all into a common
has_cd2x_pipe_select() helper.

No functional changes as the previous 'DISPLAY_VER < 30'
checks were in codepaths that already exclude pre-bxt
platforms, and intel_cdclk_can_cd2x_update() already
rejects PTL+ via the later HAS_CDCLK_SQUASH() check.

Also update the docs for the register bitfield while at it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c        | 12 ++++++++----
 drivers/gpu/drm/i915/display/intel_display_regs.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 9e5e15b0c4d1..75ada941d113 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2177,6 +2177,11 @@ static bool pll_enable_wa_needed(struct intel_display *display)
 		display->cdclk.hw.vco > 0;
 }
 
+static bool has_cd2x_pipe_select(struct intel_display *display)
+{
+	return IS_DISPLAY_VER(display, 10, 20) || display->platform.broxton;
+}
+
 static u32 bxt_cdclk_ctl(struct intel_display *display,
 			 const struct intel_cdclk_config *cdclk_config,
 			 enum pipe pipe)
@@ -2190,7 +2195,7 @@ static u32 bxt_cdclk_ctl(struct intel_display *display,
 
 	val = bxt_cdclk_cd2x_div_sel(display, cdclk, vco, waveform);
 
-	if (DISPLAY_VER(display) < 30)
+	if (has_cd2x_pipe_select(display))
 		val |= bxt_cdclk_cd2x_pipe(display, pipe);
 
 	/*
@@ -2381,7 +2386,7 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * dividers both syncing to an active pipe, or asynchronously
 	 * (PIPE_NONE).
 	 */
-	if (DISPLAY_VER(display) < 30) {
+	if (has_cd2x_pipe_select(display)) {
 		cdctl &= ~bxt_cdclk_cd2x_pipe_mask(display);
 		cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
 	}
@@ -2579,8 +2584,7 @@ static bool intel_cdclk_can_cd2x_update(struct intel_display *display,
 					const struct intel_cdclk_config *a,
 					const struct intel_cdclk_config *b)
 {
-	/* Older hw doesn't have the capability */
-	if (DISPLAY_VER(display) < 10 && !display->platform.broxton)
+	if (!has_cd2x_pipe_select(display))
 		return false;
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 0f5018482497..1faca3cdaceb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2788,7 +2788,7 @@ enum skl_power_gate {
 #define  BXT_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 20) /* bxt/glk */
 #define  BXT_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, (pipe))
 #define  BXT_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, 3)
-#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* icl+ */
+#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* icl-lnl */
 #define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, (pipe) << 1)
 #define  ICL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, 7)
 #define  CDCLK_DIVMUX_CD_OVERRIDE	REG_BIT(19) /* pre-icl */
-- 
2.54.0

