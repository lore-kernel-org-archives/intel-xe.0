Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1086C112583A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C027010E900;
	Wed, 11 Mar 2026 14:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGFSZing";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A64410E3CA;
 Wed, 11 Mar 2026 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238764; x=1804774764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=037Y2KiSjtmX5GaPyw0N96HUIDZcZA3KIvlgBX6ju9k=;
 b=RGFSZingQn5PjN5z5WdrhtOIYYZQ8t+aWZIbGEbzBJrq2qVEjOoGDJO6
 WNbjcxv45c3NK51ksmWCsWH4CGzI6QZstrsI8jMrJZnfDuroT9bj8Wd3d
 KpKMFXKMC1mecCXsJAGLQmkqp/7Zgk1QAyW3EGFvWFbWXumgFOKPxls8x
 bjr6ydcf+503b42vYM4Jg8etC7tQh0U/leKj2qU5TFxs2hwtQ8L5sfsL6
 DqGiLTJV2PxLyQncRCDT8C74vzMkvfa1DQIdSLGQ3gAQEuqvLIYKw57xM
 LU1ZCsoLiVBM5so6c4uFVZZ+3sjgjWyByxm0EGuwYcV85JqahGoNbVwR4 Q==;
X-CSE-ConnectionGUID: yY2tm0DQSpea+CADzF5CMA==
X-CSE-MsgGUID: 8NAJRZseT3+EDT2NMUmmfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775223"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775223"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:23 -0700
X-CSE-ConnectionGUID: suyPQTmnR1O5wE/wEkJUkA==
X-CSE-MsgGUID: BDZhM/clRxW8ykvDcQf/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730498"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:22 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 12/24] drm/i915/lt_phy: Add xe3plpd .compare_hw_state hook
Date: Wed, 11 Mar 2026 14:18:53 +0000
Message-ID: <20260311141905.2526418-13-mika.kahola@intel.com>
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

