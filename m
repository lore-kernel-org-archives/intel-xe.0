Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014AFD0651
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67F510E8F0;
	Wed, 11 Mar 2026 14:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKr7lXJ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4710E8C4;
 Wed, 11 Mar 2026 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238752; x=1804774752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3hlJjYU7JzQ4StmdeGU1C+mhJhQQ/f7gBeBVaMUURJ0=;
 b=EKr7lXJ5w1SlutdVStc1zzlslUkoCv3+bryCGAsViYm2F0pq/gF+la+H
 zKhePMwzvTQoAHLFpmX57U3OmOHrkxssdW6vB9XRrcWkEJrfm/Vgkd6z7
 N2PdDmbI0tGVJ6Xknpao5wcdP434v1sQGsACI2Uwqm3SPgQHwCKJlytfL
 2XRqa2Eph8Qo4YPjiGfUySaMtJSY0BaoS3FDLjCU79JZJt+rPvbBNaOTb
 cpsr0Sv+M126TAsXkbftEiv81C9mnK+q0/G/kMmzKmpf066dA/PDF9mKv
 FXuPebCBO5YskWTEmyFQqrM0y9VweQIcxoM1pofbDWcihz6NqV5Lclp6u w==;
X-CSE-ConnectionGUID: MoJtsIqjSx+d78L8BP4HHg==
X-CSE-MsgGUID: m6/Z7HQWSIOy4S9SmhfZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775169"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775169"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:12 -0700
X-CSE-ConnectionGUID: tIBqdsMCRYu3PVSREmIpTg==
X-CSE-MsgGUID: xQVSpF0sT2G6cTWhOEDKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730380"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:10 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 03/24] drm/i915/lt_phy: Add PLL information for xe3plpd
Date: Wed, 11 Mar 2026 14:18:44 +0000
Message-ID: <20260311141905.2526418-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
References: <20260311141905.2526418-1-mika.kahola@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

