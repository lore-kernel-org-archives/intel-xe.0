Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC57CD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E0A10F60B;
	Fri, 12 Jun 2026 17:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2UlX4Gx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FE110F60B;
 Fri, 12 Jun 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285832; x=1812821832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TGWYGoIN9rlkDJTuhQqjCD/mOQ3xxFFxHqw1h+cwzxk=;
 b=g2UlX4Gx+MlEtAwDJ3K6fMTBaPKuY7TQ/FyMDeOY6PhAEEUN3kxaB54I
 lDSKsDR4LD+FZJDrdg2onOlBUR4dL+jD0KweV3QV+zJoa3gY950ShkiX7
 MQt0pGIZCn9xU1RGk0YNKjXyH8Y8TspTleu5EqvKjK4jPge2vGfaieblN
 Ihy6Q4yBTPmKNz8YOkrR+JD/RurpkJyYtjLkaoSjzyAoDZnlILhFui6G5
 uHJpuY3zMECOhma2njvG5QPlvjz6d1FNSXgLm0rt+c/PaKiUjbK+uyZBM
 Ph+JOf2LzRsQUHF6dCMseyyn2zORlg3AY1DIMNJcJxmbJl3RNndbktPo4 w==;
X-CSE-ConnectionGUID: vaQqe1q9Tvyv4jAWEpWwWA==
X-CSE-MsgGUID: vHQEWoxMRY6Fd1LDkKaZgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107555879"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="107555879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:12 -0700
X-CSE-ConnectionGUID: //G0FeLqQmWKlyYjaz/mfA==
X-CSE-MsgGUID: wgEW1YrOQg2sv3notyXI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="242500682"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:10 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/cdclk Clean up CDCLK_CTL defines
Date: Fri, 12 Jun 2026 20:36:50 +0300
Message-ID: <20260612173653.7830-4-ville.syrjala@linux.intel.com>
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

Use the modern REG_BIT/REG_GENMASK stuff to define the
CDCLK_CTL bits.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4321f8b529da..6e0fe7669fa9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2769,7 +2769,7 @@ enum skl_power_gate {
 #define CDCLK_CTL			_MMIO(0x46000)
 #define  CDCLK_FREQ_SEL_MASK		REG_GENMASK(27, 26)
 #define  CDCLK_FREQ_450_432		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 0)
-#define  CDCLK_FREQ_540		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 1)
+#define  CDCLK_FREQ_540			REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 1)
 #define  CDCLK_FREQ_337_308		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 2)
 #define  CDCLK_FREQ_675_617		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 3)
 #define  MDCLK_SOURCE_SEL_MASK		REG_GENMASK(25, 25)
@@ -2780,15 +2780,18 @@ enum skl_power_gate {
 #define  BXT_CDCLK_CD2X_DIV_SEL_1_5	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 1)
 #define  BXT_CDCLK_CD2X_DIV_SEL_2	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 2)
 #define  BXT_CDCLK_CD2X_DIV_SEL_4	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 3)
-#define  BXT_CDCLK_CD2X_PIPE(pipe)	((pipe) << 20)
-#define  CDCLK_DIVMUX_CD_OVERRIDE	(1 << 19)
-#define  BXT_CDCLK_CD2X_PIPE_NONE	BXT_CDCLK_CD2X_PIPE(3)
-#define  ICL_CDCLK_CD2X_PIPE(pipe)	(_PICK(pipe, 0, 2, 6) << 19)
-#define  ICL_CDCLK_CD2X_PIPE_NONE	(7 << 19)
-#define  TGL_CDCLK_CD2X_PIPE(pipe)	BXT_CDCLK_CD2X_PIPE(pipe)
-#define  TGL_CDCLK_CD2X_PIPE_NONE	ICL_CDCLK_CD2X_PIPE_NONE
-#define  BXT_CDCLK_SSA_PRECHARGE_ENABLE	(1 << 16)
-#define  CDCLK_FREQ_DECIMAL_MASK	(0x7ff)
+#define  BXT_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 20)
+#define  BXT_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, (pipe))
+#define  BXT_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, 3)
+#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19)
+#define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, _PICK((pipe), 0, 1, 3) << 1)
+#define  ICL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, 7)
+#define  TGL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19)
+#define  TGL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, (pipe) << 1)
+#define  TGL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, 7)
+#define  CDCLK_DIVMUX_CD_OVERRIDE	REG_BIT(19)
+#define  BXT_CDCLK_SSA_PRECHARGE_ENABLE	REG_BIT(16)
+#define  CDCLK_FREQ_DECIMAL_MASK	REG_GENMASK(10, 0)
 
 /* CDCLK_SQUASH_CTL */
 #define CDCLK_SQUASH_CTL		_MMIO(0x46008)
-- 
2.53.0

