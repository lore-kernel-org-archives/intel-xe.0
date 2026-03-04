Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1043EEF8FE4
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E0510E9EC;
	Wed,  4 Mar 2026 13:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0Gd9g6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2810E9E1;
 Wed,  4 Mar 2026 13:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630070; x=1804166070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kfxhtKokPy0PIl4TqTI16Q2TNsRkQQTfs90afOWBv2w=;
 b=W0Gd9g6IzOj869IS3ih8dMSGrWo1CQ5RcE7a07s9cuk1blj/TKK8oHNi
 YOIMIfdtRuuzsWQI8neCAI4mmUQlwhLrQJ/0k6lXztfyNHKadY3a8Jx5p
 5Xb2ZwRajCNsrNbRLRFfl1pocjxyqtqgRXoIbtgPnXnrlT7ce1N6jW3jn
 ctAAoVc3peTKSEZOm5U1Y2wXSXbn991Mi9oID3CR4QcsG2aDjD+62jQu7
 TYMDNIOieJLtY55kLPzwRVQ+yOi+9gnwUZSdJcLv2S3bVFGm2BYVqLUg7
 /a30oUxIfZLm9kjfp2RYXYJsCVQgCe/1+8KZwlz8BXvQPrSGgrEigm5Wi w==;
X-CSE-ConnectionGUID: 2D9eTy9QRamh7skrdDWi+w==
X-CSE-MsgGUID: h59ZP1VTTkyhSG4VYkYiPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293453"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:29 -0800
X-CSE-ConnectionGUID: pYCQygu4SP2RSzUMH10A2A==
X-CSE-MsgGUID: YQ7vUJTKSkGJO8OYSTrqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350749"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:29 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 03/24] drm/i915/lt_phy: Add PLL information for xe3plpd
Date: Wed,  4 Mar 2026 13:14:02 +0000
Message-ID: <20260304131423.1017821-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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

Start bringing in xe3plpd as part of dpll framework. The work is
started by adding PLL information and related function hooks.

v2: Fix xe3plpd type (Suraj)
    Remove empty line between BSpec link and Signed-off-by (Suraj)

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

