Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA4CCA476
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 08:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CBB10E6D4;
	Wed,  1 Oct 2025 08:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gL5PCzpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE5A10E6D6;
 Wed,  1 Oct 2025 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759307945; x=1790843945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMThjY7sgMMI5QURybPoqUIzQj6QsMvwe+IHqBeg0uI=;
 b=gL5PCzpdX+v1yGojg5NKN7MJFeYsH1d8wAF5StCmW8kIE/Ew0N2eVWfv
 KGO1sJMEgn02fSYN99LMtzl/5+WFdJA/LPaNscDkyQz4Kgpw/XWmi/hGq
 Xt6PngAurn++R8crXCwjTSBJ+jaem14XDl+BTIhkw1yy+2iduMr5DMsIt
 WZr5fSFV6uSZ7KP6p/gzCI7emCSsBSeszU6BiSXcljawXwq5ZITbzdj1F
 g/NjOsxy8qTNfFFuA1ygbTVr76GYwX3qgc8BiF0V+C9gBQ3WPiROZTjcU
 kHtdAzgNB3yfIkEwTij9Pob6jj8Bk3T4UueymWEYNnMRJhHnq2ZKig76f A==;
X-CSE-ConnectionGUID: yIX6EjO8QBK5eLtyDucHmA==
X-CSE-MsgGUID: g7lJAzPWSReaAHbTr3RjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61742771"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61742771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:39:05 -0700
X-CSE-ConnectionGUID: gqirB03iR9SQ9VQNZv+tBA==
X-CSE-MsgGUID: K8DMym6xQx+rgCf+Jrl6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179142726"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2025 01:39:03 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [RFC PATCH 23/39] drm/i915/display: PLL information for MTL+
Date: Wed,  1 Oct 2025 11:28:23 +0300
Message-Id: <20251001082839.2585559-24-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001082839.2585559-1-mika.kahola@intel.com>
References: <20251001082839.2585559-1-mika.kahola@intel.com>
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

