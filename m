Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C82CD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D7F10F61F;
	Fri, 12 Jun 2026 17:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moP/hXUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C1710F61F;
 Fri, 12 Jun 2026 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285846; x=1812821846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=77cQtP8xjX1Zcrmk/9xSBD1oeSbgCX2SNxxuPa/vYzc=;
 b=moP/hXUqSI2ex1UImtBDrq/ad8mXHUjfpyzgBKyDqojUe1bosjO3QUDM
 Vq+4qftIQU4KJBvAX5kTL2T1WiXgkBBOUFIQcEyggZEonwwBoJnwzn6IJ
 jaYXBcxdlbUJrvxYoNTk1CAlxXePXnUF/r+UDxRevl4Fxjreo2i7lFZqJ
 d8hKxxMl7JlNdIMdTYXNIxlX1TCf3Qs8X8BQWOHQVXYz6wVReNaEGjlgp
 0Dy4mgHRjjnQy2mBvWm9oilXqEtFlKw11OwstFL1y9jgh8E5XlQT8+4st
 M5pwpEytf6NKgRI6iVMa3ZMT/0Z8Ml6fpMVddjW6qYZfmpC8rzUA+DIxX Q==;
X-CSE-ConnectionGUID: R+6TbOPCSKKp5KBn2BerBA==
X-CSE-MsgGUID: 41jeMtgFTPirOgeoOW6S5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99697778"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="99697778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:25 -0700
X-CSE-ConnectionGUID: jTxDTDkvQnGZagugS7Ta9A==
X-CSE-MsgGUID: T299LPAqTJS+VskLAHy8dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="270540282"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:24 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915/cdclk: Use the TGL+ CD2x pipe select bits also
 on ICL
Date: Fri, 12 Jun 2026 20:36:53 +0300
Message-ID: <20260612173653.7830-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
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

Turns out both CDCLK_CTL pipe select 0b110 (what Bspec lists for
pipe C on ICL) and 0b100 (what BSpec lists for pipe C on TGL+)
actually select pipe C on ICL. So we can get rid of the weird
ICL special case and just use the simpler TGL+ definition of
the pipe select bits.

This was reverse engineered with a hacked up intel_display_poller.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c        | 11 ++---------
 drivers/gpu/drm/i915/display/intel_display_regs.h |  7 ++-----
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 8db79758187d..d3c5e3438d19 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1946,9 +1946,7 @@ static void adlp_cdclk_pll_crawl(struct intel_display *display, int vco)
 
 static u32 bxt_cdclk_cd2x_pipe_mask(struct intel_display *display)
 {
-	if (DISPLAY_VER(display) >= 12)
-		return TGL_CDCLK_CD2X_PIPE_MASK;
-	else if (DISPLAY_VER(display) >= 11)
+	if (DISPLAY_VER(display) >= 11)
 		return ICL_CDCLK_CD2X_PIPE_MASK;
 	else
 		return BXT_CDCLK_CD2X_PIPE_MASK;
@@ -1956,12 +1954,7 @@ static u32 bxt_cdclk_cd2x_pipe_mask(struct intel_display *display)
 
 static u32 bxt_cdclk_cd2x_pipe(struct intel_display *display, enum pipe pipe)
 {
-	if (DISPLAY_VER(display) >= 12) {
-		if (pipe == INVALID_PIPE)
-			return TGL_CDCLK_CD2X_PIPE_NONE;
-		else
-			return TGL_CDCLK_CD2X_PIPE(pipe);
-	} else if (DISPLAY_VER(display) >= 11) {
+	if (DISPLAY_VER(display) >= 11) {
 		if (pipe == INVALID_PIPE)
 			return ICL_CDCLK_CD2X_PIPE_NONE;
 		else
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 0c9db44da254..62c103fb1c8d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2783,12 +2783,9 @@ enum skl_power_gate {
 #define  BXT_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 20) /* bxt/glk */
 #define  BXT_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, (pipe))
 #define  BXT_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, 3)
-#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* icl */
-#define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, _PICK((pipe), 0, 1, 3) << 1)
+#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* icl+ */
+#define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, (pipe) << 1)
 #define  ICL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, 7)
-#define  TGL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* tgl+ */
-#define  TGL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, (pipe) << 1)
-#define  TGL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, 7)
 #define  CDCLK_DIVMUX_CD_OVERRIDE	REG_BIT(19) /* pre-icl */
 #define  BXT_CDCLK_SSA_PRECHARGE_ENABLE	REG_BIT(16) /* bxt/glk */
 #define  CDCLK_FREQ_DECIMAL_MASK	REG_GENMASK(10, 0) /* pre-lnl */
-- 
2.53.0

