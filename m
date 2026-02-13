Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCCEEDF15E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284610E7F6;
	Fri, 13 Feb 2026 12:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL0SOLVs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653B910E306;
 Fri, 13 Feb 2026 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985584; x=1802521584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpnI6moiKHbK8vm/lRTJUUu/EN04b+qkZj+lotov9VA=;
 b=IL0SOLVsoWwr7drdFi/DkrsirSUDL3YBGge5UTkGBLxe+50OTy8ILrTY
 blq9s7Yp2jJVpLsWt7i6XBXWbisw03sfyC+wtc7OCBebRPZb0iD7a4LPk
 ak9lVf6yalaIEHO7a7qX44O6rkPzsewTaL4gLVp3nl9Fxp+FI8QojZjoD
 q+8netNN8yoiNXsCh/G6kUqhNPkROuz9frmJWEDSp+KTeSqKeXsF26ZMt
 fl+DJID/ycQ25jx5f8uhwKtaqy/xYDl+RLasH50US1Z8ok/mAK/BXTsyh
 D5V4UtwhYxxmlu47gFoAeRnDnsvYvAsPahvCLF8ApkRRgoBvh3ZRmdfib w==;
X-CSE-ConnectionGUID: YmRrFEJ2SKyimAG/xP6h3A==
X-CSE-MsgGUID: WnZRNL+6TBaXEFkgZiDCzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158109"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:23 -0800
X-CSE-ConnectionGUID: Br3e8KwSR/mDq53ZpdpXWA==
X-CSE-MsgGUID: 5s5X2GUNQ8CuEhV0mDpVuA==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:22 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 03/19] drm/i915/lt_phy: Add PLL information for xe3lpdp
Date: Fri, 13 Feb 2026 12:25:59 +0000
Message-ID: <20260213122615.1083654-4-mika.kahola@intel.com>
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

Start bringing in xe3lpdp as part of dpll framework. The work is
started by adding PLL information and related function hooks.

BSpec: 74304

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index f35a9252f4e1..4185c8e136da 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4571,6 +4571,25 @@ static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.compare_hw_state = mtl_compare_hw_state,
 };
 
+static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
+};
+
+static const struct dpll_info xe3plpd_plls[] = {
+	{ .name = "DPLL 0", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_DPLL0, },
+	{ .name = "DPLL 1", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_DPLL1, },
+	/* TODO: Add TBT */
+	{ .name = "TC PLL 1", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL1, },
+	{ .name = "TC PLL 2", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL2, },
+	{ .name = "TC PLL 3", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL3, },
+	{ .name = "TC PLL 4", .funcs = &xe3plpd_pll_funcs, .id = DPLL_ID_ICL_MGPLL4, },
+	{}
+};
+
+__maybe_unused
+static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
+	.dpll_info = xe3plpd_plls,
+};
+
 /**
  * intel_dpll_init - Initialize DPLLs
  * @display: intel_display device
-- 
2.43.0

