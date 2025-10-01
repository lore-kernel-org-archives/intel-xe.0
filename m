Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4410ECCA474
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 08:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CF410E6EA;
	Wed,  1 Oct 2025 08:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+9IoTGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DE710E6E6;
 Wed,  1 Oct 2025 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759307956; x=1790843956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ina/RbUN5CmWLth0e4jlm8gZu+zuha/bDEg1tDZ/zXg=;
 b=i+9IoTGBOSoMEyX7B9kSM10pzsge7y0jVN8QjMlF63tbc+ulLVP1lWrk
 hke7rMVvORG3hpVvbNeJmuTrEe+C1u0ptfGLeUaRKbUGIwOwclQTQwixt
 +EelWDsZkU7evUFRM2omuOIoXeQK4Diw2jByFWdrI/+Gz6+8OAJ0EOe5d
 D9N8c7XeGKnLeTPrysVYCKTzumvfGY0DZmKP8VgqfAleNmzdFDXFpkXWq
 Ys7eJ5B4fWrMFcf/8MMEaKSrm5qETx5DwGfFZ4BJCQcmu9t85gK+1Zwuv
 jI8C0Ej7IXCIsgHG7yN5SmIHck5aAww2GRi45XBbt8lQkIqn/2m41H1m+ w==;
X-CSE-ConnectionGUID: 77BpVwGNTj6wh51XmdhiHA==
X-CSE-MsgGUID: qaJ01qBbQbeVfJJLel1ymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61742803"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61742803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:39:16 -0700
X-CSE-ConnectionGUID: 2YKUffnDS9+zeDtunnbPXg==
X-CSE-MsgGUID: 9yDN9Si4Tkm5baSEXvduSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179142874"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2025 01:39:14 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [RFC PATCH 31/39] drm/i915/display: Add .compare_hw_state
Date: Wed,  1 Oct 2025 11:28:31 +0300
Message-Id: <20251001082839.2585559-32-mika.kahola@intel.com>
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

Add .compare_hw_state function pointer for MTL+ platforms
to support dpll framework.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 3e27cc0004d5..0e356655ba03 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4432,6 +4432,15 @@ static void mtl_dump_hw_state(struct drm_printer *p,
 	intel_cx0pll_dump_hw_state(p, &dpll_hw_state->cx0pll);
 }
 
+static bool mtl_compare_hw_state(const struct intel_dpll_hw_state *_a,
+				 const struct intel_dpll_hw_state *_b)
+{
+	const struct intel_cx0pll_state *a = &_a->cx0pll;
+	const struct intel_cx0pll_state *b = &_b->cx0pll;
+
+	return intel_cx0pll_compare_hw_state(a, b);
+}
+
 __maybe_unused
 static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.dpll_info = mtl_plls,
@@ -4441,6 +4450,7 @@ static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.update_active_dpll = icl_update_active_dpll,
 	.update_ref_clks = icl_update_dpll_ref_clks,
 	.dump_hw_state = mtl_dump_hw_state,
+	.compare_hw_state = mtl_compare_hw_state,
 };
 
 /**
-- 
2.34.1

