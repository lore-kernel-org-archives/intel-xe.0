Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B4CCED250
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 10:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843FA10E1B3;
	Mon, 17 Nov 2025 10:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLpyZ2O6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D3710E37F;
 Mon, 17 Nov 2025 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763377168; x=1794913168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yd/3eWVsl0gXx1vFlzTJIz5Qtc+RdM5mE8g6C/FT1O0=;
 b=fLpyZ2O6nIvmvTtkX4JGoe1OrTVd1VUfJ65/098CivZwBAmtpw86s+yo
 0u1VpF/gSqJuXlYx8Vlv4HlZfhVoWHPsR0NoK+gDaVZbQlUSAzGLHHdIM
 vBlo6JKlBOIsXOHFicYcIU4G+OBzJyXUDZfix6RSM9ysjZjwo6FNkG4vC
 cOCqSiDY53xc+TDtZwE7/8jPt+nGOzOyIqbA0sxoE21iVB2bv+JDfwfWG
 OgVBllskuau/U2ZRn68qEZUrFeWzBDFTvIi3zhA8S+AeurcFjrrlkyrK6
 i66wz16bdSGGfmbcPeOtOxv2UEzPa5fdFFvXFMyXHsulKgrGaYHc8iP9X w==;
X-CSE-ConnectionGUID: Bl5QCLpVSie6vzSZUfyxwg==
X-CSE-MsgGUID: eNBT4MBHS+SzWCuMT0kVqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76475405"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="76475405"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:59:28 -0800
X-CSE-ConnectionGUID: NEQrnHp9R9C58NY9OfWQEw==
X-CSE-MsgGUID: ms3SXaULQtGdafO1HQVFKg==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2025 02:59:27 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 20/32] drm/i915/cx0: Add MTL+ .put_dplls hook
Date: Mon, 17 Nov 2025 12:45:50 +0200
Message-Id: <20251117104602.2363671-21-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117104602.2363671-1-mika.kahola@intel.com>
References: <20251117104602.2363671-1-mika.kahola@intel.com>
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

Add .put_dplls function pointer to support MTL+ platforms
on dpll framework. Reuse ICL function pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 313cb244d5d6..c45f18201ee8 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4448,6 +4448,7 @@ static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.dpll_info = mtl_plls,
 	.compute_dplls = mtl_compute_dplls,
 	.get_dplls = mtl_get_dplls,
+	.put_dplls = icl_put_dplls,
 };
 
 /**
-- 
2.34.1

