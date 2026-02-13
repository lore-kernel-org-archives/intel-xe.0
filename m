Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B45EDF15B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F5910E811;
	Fri, 13 Feb 2026 12:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXLMAYui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FE710E7FD;
 Fri, 13 Feb 2026 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985589; x=1802521589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmLAelV73dJNjbmFJ/SDImItzeG8zZpcYxIgLGtvJtQ=;
 b=EXLMAYui0LCiANFMwpQYRhn5OCpBcmwFKLfLs9jKTLQm3osII94ZtVq5
 6tHgXSUQLwu6Lpnd7++ZvDnqh2Y0ULgqzgLrWgqCA9Prfh0cG2+EdUnBg
 GqM7eSEDdBJTRdVMpluCbspvhZV8rUC2XnzDN3SrKvHcuCf0UUeYqIC81
 d/NMxBkTrQMGMd2igcv5/qoY64Q2HBa9EMIZsGKqYfN3PmvgBLYKQazFn
 zWw1PU303DoH1oGdFnNBi8B43MFZz6SH9T7nrjRwD317KpmKJBvcjt4Dy
 j1Lu5si/NGwdkhHsYrTJ8wS9YwoJl29k6fq5WLVS39LrSSL5BS1xqj0zr Q==;
X-CSE-ConnectionGUID: M2mPmF8kQGiNFQpj4e6aIg==
X-CSE-MsgGUID: Yf0y/DHORESy7jnPMopQsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158115"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158115"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:29 -0800
X-CSE-ConnectionGUID: xz1RVHmsSLSyEZL3CnVz1A==
X-CSE-MsgGUID: vG0hb8nLQkS5Y5U/YgaQpQ==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:27 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 08/19] drm/i915/lt_phy: Add xe3plpd .update_dpll_ref_clks hook
Date: Fri, 13 Feb 2026 12:26:04 +0000
Message-ID: <20260213122615.1083654-9-mika.kahola@intel.com>
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

Add .update_dpll_ref_clks function pointer to xe3plpd
platform to support dpll framework. Reuse ICL
function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index c1ed44b23bba..b50f02303356 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4656,6 +4656,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.get_dplls = mtl_get_dplls,
 	.put_dplls = icl_put_dplls,
 	.update_active_dpll = icl_update_active_dpll,
+	.update_ref_clks = icl_update_dpll_ref_clks,
 };
 
 /**
-- 
2.43.0

