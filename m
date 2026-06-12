Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E570CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F78A10F609;
	Fri, 12 Jun 2026 17:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yy9XVDRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DCC10F611;
 Fri, 12 Jun 2026 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285836; x=1812821836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5RU21iK3/XztQL/lMPgOfVUMeFFbkTs2+txvUKY2Sc=;
 b=Yy9XVDRKaevsSD8IWq1Eok/pzWtJktYyj67h5peXKUvNZJLx7JkJiKjk
 0jjoCWnj4ulSqCacqZdMkEVrddJKeGDTObILVPDfJs/Sfrj+L5NtAd6J/
 OSWFyOD9EK9s/QwBf9yI7QT4g/q1n00Z0B/jFNjYOn5jRsRZCB1rDCqmK
 zYU04ZY0AXjfVNFhvHDd5T7AZ4EPByytoeV1QfddWkpOOrF/D7RWu/H4W
 oKGMA0nteokWkzVZRo8HsXn+Lg3CUWP+p4HWiqOSt8OdK9MoWScn6j+Su
 phELefbzspOx8MJCGXxXtEMEeoJ9Xuaau72QzJAmfvdZ4V43l0A3zXcsX g==;
X-CSE-ConnectionGUID: URpqcsbJTNmfbslB32vl8A==
X-CSE-MsgGUID: rCZAJcm9SHyeFbtG85IeOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81965745"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81965745"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:16 -0700
X-CSE-ConnectionGUID: wNS/4V93S16peM97pskOqw==
X-CSE-MsgGUID: 7LmHbUWmSbibIMWfJ32HnA==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/cdclk: Document CDCLK_CTL bits
Date: Fri, 12 Jun 2026 20:36:51 +0300
Message-ID: <20260612173653.7830-5-ville.syrjala@linux.intel.com>
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

Document which CDCLK_CTL bits are relevant for which platforms.
Saves me from having to look this up in the spec every time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_regs.h  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 6e0fe7669fa9..0c9db44da254 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2767,31 +2767,31 @@ enum skl_power_gate {
  */
 /* CDCLK_CTL */
 #define CDCLK_CTL			_MMIO(0x46000)
-#define  CDCLK_FREQ_SEL_MASK		REG_GENMASK(27, 26)
+#define  CDCLK_FREQ_SEL_MASK		REG_GENMASK(27, 26)  /* skl */
 #define  CDCLK_FREQ_450_432		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 0)
 #define  CDCLK_FREQ_540			REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 1)
 #define  CDCLK_FREQ_337_308		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 2)
 #define  CDCLK_FREQ_675_617		REG_FIELD_PREP(CDCLK_FREQ_SEL_MASK, 3)
-#define  MDCLK_SOURCE_SEL_MASK		REG_GENMASK(25, 25)
+#define  MDCLK_SOURCE_SEL_MASK		REG_GENMASK(25, 25) /* lnl+ */
 #define  MDCLK_SOURCE_SEL_CD2XCLK	REG_FIELD_PREP(MDCLK_SOURCE_SEL_MASK, 0)
 #define  MDCLK_SOURCE_SEL_CDCLK_PLL	REG_FIELD_PREP(MDCLK_SOURCE_SEL_MASK, 1)
-#define  BXT_CDCLK_CD2X_DIV_SEL_MASK	REG_GENMASK(23, 22)
+#define  BXT_CDCLK_CD2X_DIV_SEL_MASK	REG_GENMASK(23, 22) /* bxt+ */
 #define  BXT_CDCLK_CD2X_DIV_SEL_1	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 0)
 #define  BXT_CDCLK_CD2X_DIV_SEL_1_5	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 1)
 #define  BXT_CDCLK_CD2X_DIV_SEL_2	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 2)
 #define  BXT_CDCLK_CD2X_DIV_SEL_4	REG_FIELD_PREP(BXT_CDCLK_CD2X_DIV_SEL_MASK, 3)
-#define  BXT_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 20)
+#define  BXT_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 20) /* bxt/glk */
 #define  BXT_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, (pipe))
 #define  BXT_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(BXT_CDCLK_CD2X_PIPE_MASK, 3)
-#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19)
+#define  ICL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* icl */
 #define  ICL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, _PICK((pipe), 0, 1, 3) << 1)
 #define  ICL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(ICL_CDCLK_CD2X_PIPE_MASK, 7)
-#define  TGL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19)
+#define  TGL_CDCLK_CD2X_PIPE_MASK	REG_GENMASK(21, 19) /* tgl+ */
 #define  TGL_CDCLK_CD2X_PIPE(pipe)	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, (pipe) << 1)
 #define  TGL_CDCLK_CD2X_PIPE_NONE	REG_FIELD_PREP(TGL_CDCLK_CD2X_PIPE_MASK, 7)
-#define  CDCLK_DIVMUX_CD_OVERRIDE	REG_BIT(19)
-#define  BXT_CDCLK_SSA_PRECHARGE_ENABLE	REG_BIT(16)
-#define  CDCLK_FREQ_DECIMAL_MASK	REG_GENMASK(10, 0)
+#define  CDCLK_DIVMUX_CD_OVERRIDE	REG_BIT(19) /* pre-icl */
+#define  BXT_CDCLK_SSA_PRECHARGE_ENABLE	REG_BIT(16) /* bxt/glk */
+#define  CDCLK_FREQ_DECIMAL_MASK	REG_GENMASK(10, 0) /* pre-lnl */
 
 /* CDCLK_SQUASH_CTL */
 #define CDCLK_SQUASH_CTL		_MMIO(0x46008)
-- 
2.53.0

