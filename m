Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEDEEDF154
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7510E7E7;
	Fri, 13 Feb 2026 12:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsCQdXKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA0D10E7E8;
 Fri, 13 Feb 2026 12:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985582; x=1802521582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fJb7VUxi9eeHKV0b9gjSOIvSrM9l55V2szgW7AEchig=;
 b=YsCQdXKS0lscxJNxrwYqfHeo0/UGtINYbSFs3y2jnCg+Gqm3cT6QiaEF
 VgfTpalWDhoUOox/T6oix7jZtlYbw5b/4B7Nffoqrwj9iC8B5QZCaQVuD
 6RmEReBm8VZPscAI1Ge+Su+WxxMpMHECJAuCizEw5QMXBeHdn1jPAGswQ
 h7M7valuFsVz4bSJQMxwAlJepnAFPNXdMg9Gfk/UcmO+tj0ZCsyL84og2
 kE+A7S468C3DqnjOlxoObKp06nbj82k5P36NVN0MzTNqkkbBWgsNzR/xk
 x0Gcg9IA008KrNN9+x7sgQqQn29E70pk8d79bvoZV4nAoQjMk1zQbKVfF w==;
X-CSE-ConnectionGUID: XcrhiU6mTmyFdKBfF7XiKA==
X-CSE-MsgGUID: TFA2PY/yQ+mzAyizDckp3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158104"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:21 -0800
X-CSE-ConnectionGUID: +tORlSTpTSyOyZ/DG7t/XQ==
X-CSE-MsgGUID: 8lUM9+SfTHGC3vhHcwpb7w==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:20 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 01/19] drm/i915/lt_phy: Dump missing PLL state parameters
Date: Fri, 13 Feb 2026 12:25:57 +0000
Message-ID: <20260213122615.1083654-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213122615.1083654-1-mika.kahola@intel.com>
References: <20260213122615.1083654-1-mika.kahola@intel.com>
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

Dump missing PLL structure members ssc_enabled, ttbt_mode,
addr_msb and addr_lsb to enhance debugging. Readout addr_msb
and addr_lsb from HW for HW/SW state comparison.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 27ad8407606b..9647afcea897 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2142,7 +2142,13 @@ void intel_lt_phy_dump_hw_state(struct intel_display *display,
 {
 	int i, j;
 
-	drm_dbg_kms(display->drm, "lt_phy_pll_hw_state:\n");
+	drm_dbg_kms(display->drm, "lt_phy_pll_hw_state: ssc enabled: %d, tbt mode: %d\n",
+		    hw_state->ssc_enabled, hw_state->tbt_mode);
+
+	for (i = 0; i <= 12; i++)
+		drm_dbg_kms(display->drm, "addr [%d] msb = 0x%.4x, lsb = 0x%.4x\n",
+			    i, hw_state->addr_msb[i], hw_state->addr_lsb[i]);
+
 	for (i = 0; i < 3; i++) {
 		drm_dbg_kms(display->drm, "config[%d] = 0x%.4x,\n",
 			    i, hw_state->config[i]);
@@ -2197,6 +2203,9 @@ void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 	pll_state->config[2] = intel_lt_phy_read(encoder, lane, LT_PHY_VDR_2_CONFIG);
 
 	for (i = 0; i <= 12; i++) {
+		pll_state->addr_msb[i] = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_MSB(i));
+		pll_state->addr_lsb[i] = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_X_ADDR_LSB(i));
+
 		for (j = 3, k = 0; j >= 0; j--, k++)
 			pll_state->data[i][k] =
 				intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0,
-- 
2.43.0

