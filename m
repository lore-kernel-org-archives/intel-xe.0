Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF3EDF159
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCD410E7FE;
	Fri, 13 Feb 2026 12:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtuTYBk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAC710E7FD;
 Fri, 13 Feb 2026 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985588; x=1802521588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qg1bHFb+S8DTGt24fiCvOK9ZyoP1nDho+eTjjhbQw5c=;
 b=WtuTYBk8P5Q3tmfOVb4CHgHN8akdO4gYeFnOTeCYNqUI2EdApOPDhSNs
 /doToDoZjwRgfL7+HUitwRbBjB+3f156XQrLSjU+zyuy9+doHyCw8Rktb
 m1iBFASwZTw/IgfxAHyKlv4u9dlGIa18Xm1q90hVbAXV30Oy63O7bD0b3
 pOquKnyb1Enup8JaJ1NimFHkFWQlo+y/qu9bVJHMpiPRx7BBBjuiNk33U
 GfwqUjtjTaJv4+WoOq0ddsPmv10CbbIClONaj98pTeBqwkGy1rhG/RZ1O
 UPi3VKBMt+LDl57AET6t/tGz38BBbY0TP8+cla7t+0H5ncpxJQLxcfcUf g==;
X-CSE-ConnectionGUID: eIYIO2dXRqiFi16tPYR+aQ==
X-CSE-MsgGUID: o6bX5Av0QCierekBiuS91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158114"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:28 -0800
X-CSE-ConnectionGUID: RrD1k2gRQoO+9xE3VP78Sg==
X-CSE-MsgGUID: H5oX+UPqQCq+/cAmBfUecg==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:26 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 07/19] drm/i915/lt_phy: Add xe3plpdp .update_active_dpll hook
Date: Fri, 13 Feb 2026 12:26:03 +0000
Message-ID: <20260213122615.1083654-8-mika.kahola@intel.com>
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

Add .update_active_dpll function pointer to support
dpll framework for xe3plpd platform. Reuse ICL function
pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index af2613eeaf92..c1ed44b23bba 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4655,6 +4655,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.compute_dplls = xe3plpd_compute_dplls,
 	.get_dplls = mtl_get_dplls,
 	.put_dplls = icl_put_dplls,
+	.update_active_dpll = icl_update_active_dpll,
 };
 
 /**
-- 
2.43.0

