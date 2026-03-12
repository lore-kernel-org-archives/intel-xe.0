Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C88AFED2E4
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0774E10E99F;
	Thu, 12 Mar 2026 08:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULvrXoOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97E010E9B5;
 Thu, 12 Mar 2026 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302835; x=1804838835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=037Y2KiSjtmX5GaPyw0N96HUIDZcZA3KIvlgBX6ju9k=;
 b=ULvrXoODizM8NVrnUyH4ENjbQo3yH3lryU+McoaYKfGDzEurbUVNuJR/
 7miuPPQZ0dMVuwlnot3TMZlVMgBCehfWwSDosL9gdG3QIIUsRwRprBmKn
 E/5lhoJdsWQ7KJ0h+O83d4yci4IYYCPuQYXRSMnEkHiXmwD8Dm2m9vkb3
 sadfyDd3W7zOIAAK3pHzy4qhNluRrMZNe4Le2DM6FiweGFzp/Ks/IlgOK
 vLPBSqLomkSH41zz2KlwrND7PFQwY9xHFp8KnO3eHc/Tmh/3eeDwd3COR
 OwLTTXJ1JPdwlMU8x6jtsSPKREC8U/NGtnhjBQYhznW7P+NP4qX2vdQgP A==;
X-CSE-ConnectionGUID: Po6/DJ2aQsCe3Rf4oSAF4Q==
X-CSE-MsgGUID: 4xLjSOM6S2OwHd2mhd0LXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013729"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:14 -0700
X-CSE-ConnectionGUID: yQF/2XLdQTmtXRgtJcnR/g==
X-CSE-MsgGUID: kfuRlhDhSiOBQFiJRxpufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206848"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:13 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 12/24] drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
Date: Thu, 12 Mar 2026 08:06:45 +0000
Message-ID: <20260312080657.2648265-13-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add .compare_hw_state function pointer for xe3plpd platform
to support dpll framework.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 26b78063dd94..c1d7d9909544 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4655,6 +4655,15 @@ static void xe3plpd_dump_hw_state(struct drm_printer *p,
 	intel_lt_phy_dump_hw_state(p, &dpll_hw_state->ltpll);
 }
 
+static bool xe3plpd_compare_hw_state(const struct intel_dpll_hw_state *_a,
+				     const struct intel_dpll_hw_state *_b)
+{
+	const struct intel_lt_phy_pll_state *a = &_a->ltpll;
+	const struct intel_lt_phy_pll_state *b = &_b->ltpll;
+
+	return intel_lt_phy_pll_compare_hw_state(a, b);
+}
+
 __maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
@@ -4664,6 +4673,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.update_active_dpll = icl_update_active_dpll,
 	.update_ref_clks = icl_update_dpll_ref_clks,
 	.dump_hw_state = xe3plpd_dump_hw_state,
+	.compare_hw_state = xe3plpd_compare_hw_state,
 };
 
 /**
-- 
2.43.0

