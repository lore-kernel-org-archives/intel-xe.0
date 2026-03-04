Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0A0EF8FE5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7353110E9FA;
	Wed,  4 Mar 2026 13:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BI93f0bG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CE610E9F8;
 Wed,  4 Mar 2026 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630074; x=1804166074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t1jQcObCcH2Ju+ak5HWnL88ivLpZd5+RuuJ6SPRbC1I=;
 b=BI93f0bG0ywrALtz/v4dTLmeUElrtHBmXvMJpq5v8JwrpbZlSZXfVKsq
 iiIfzg0yDJp2Xm9mZZ6vVCf0clyx8jtFlswMb852XuGiM6Gm3Js+8vabh
 2q5giKWV6kLhFa855IiLCpwcbbsdSCnXxwznZobyC/9+T3srpJN+vn96J
 ZrK+QhjWit7NSTp5Sw8gBJpjc5NB5kXfmbCPThu8OkEPTJZELuvXoV5Q7
 tyxDE4IiXziURzKjelOlOoLJeO6+74eNsWSpKGFnBbcD3I1/gjBNZMM4P
 bfNzXot7q1kmQPo5GIXQSYSU6uZyXme7muZqFxmnToRoOA0EnQQd5sCVi g==;
X-CSE-ConnectionGUID: nCkZdlMmTwecaIDr0Phdow==
X-CSE-MsgGUID: MSIwqH0nQouhMiQAMen9ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293462"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293462"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:34 -0800
X-CSE-ConnectionGUID: dtEASHxKSqevfK5CDY4pkA==
X-CSE-MsgGUID: jFrXoXf/TyaamL49QrPvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350775"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:33 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 07/24] drm/i915/lt_phy: Add xe3plpd .get_dplls hook
Date: Wed,  4 Mar 2026 13:14:06 +0000
Message-ID: <20260304131423.1017821-8-mika.kahola@intel.com>
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

Add .get_dplls function pointer for xe3plpd platforms
to support dpll framework. Reuse the ICL function
pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 58c24e2164ca..9aa8eb0a7d4a 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4653,6 +4653,7 @@ __maybe_unused
 static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.dpll_info = xe3plpd_plls,
 	.compute_dplls = xe3plpd_compute_dplls,
+	.get_dplls = mtl_get_dplls,
 };
 
 /**
-- 
2.43.0

