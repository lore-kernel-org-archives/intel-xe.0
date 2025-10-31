Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D37CCFA05
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 10:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C78810EB7B;
	Fri, 31 Oct 2025 10:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g54xVEpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC20C10EB62;
 Fri, 31 Oct 2025 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761907683; x=1793443683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMThjY7sgMMI5QURybPoqUIzQj6QsMvwe+IHqBeg0uI=;
 b=g54xVEpvTNW7BEb1Gh/06zGN+x7907klMmT30toX9OMRKwMGpcqYmK9K
 4rOs0xzRD8lpSrDc6MbM/1UqVd0zUM29s6ynvIsVmJ1QPwMQ5BgwDhT4w
 G2RKuntsZty1zf6BJ9H8jYUXctY3GvXmOMNEonCp2JlyKuvk8fFWNPrsg
 di2a/h6fTD7zhDAQ5Naxwgg2xhHSSCkmx9tSTD8CMlCHJWxjVJuRI0EHV
 qP1bak4970KK0krgNv+4Od0EVYEGZxPqE5cw1I1EoLDmYp6/jAkFS0yGF
 wCq1NgMG9a/VnrMyqqBikpY/HBCyupxjwmx/63yh8NixrPddkY/d/tROb Q==;
X-CSE-ConnectionGUID: HwLCr3ydTdqhbvNGxRJGgg==
X-CSE-MsgGUID: n/ZTbzGWQuejVjassVk+5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64217569"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64217569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:48:03 -0700
X-CSE-ConnectionGUID: p4DMg0kiR0W3dw91ewVCUg==
X-CSE-MsgGUID: KyQD83uEQnG4CK8eKD9a5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="223441381"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa001.jf.intel.com with ESMTP; 31 Oct 2025 03:48:02 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [CI 16/32] drm/i915/display: PLL information for MTL+
Date: Fri, 31 Oct 2025 12:35:33 +0200
Message-Id: <20251031103549.173208-17-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031103549.173208-1-mika.kahola@intel.com>
References: <20251031103549.173208-1-mika.kahola@intel.com>
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

To add MTL+ platforms as part of PLL framework, let's
start by adding PLL information and functions.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 303f03b420ae..a9d9b7113f12 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4306,6 +4306,25 @@ static const struct intel_dpll_mgr adlp_pll_mgr = {
 	.compare_hw_state = icl_compare_hw_state,
 };
 
+static const struct intel_dpll_funcs mtl_pll_funcs = {
+};
+
+static const struct dpll_info mtl_plls[] = {
+	{ .name = "DPLL 0", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_DPLL0, },
+	{ .name = "DPLL 1", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_DPLL1, },
+	/* TODO: Add TBT PLL */
+	{ .name = "TC PLL 1", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_MGPLL1, },
+	{ .name = "TC PLL 2", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_MGPLL2, },
+	{ .name = "TC PLL 3", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_MGPLL3, },
+	{ .name = "TC PLL 4", .funcs = &mtl_pll_funcs, .id = DPLL_ID_ICL_MGPLL4, },
+	{}
+};
+
+__maybe_unused
+static const struct intel_dpll_mgr mtl_pll_mgr = {
+	.dpll_info = mtl_plls,
+};
+
 /**
  * intel_dpll_init - Initialize DPLLs
  * @display: intel_display device
-- 
2.34.1

