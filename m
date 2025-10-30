Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0093CCFA00
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 07:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467010E8FD;
	Thu, 30 Oct 2025 07:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoOX5BDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1328E10E8FB;
 Thu, 30 Oct 2025 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761809716; x=1793345716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lf18gOPqojXQ346HX0kCDu0OHMoJHioh7SJ1M0hxmBM=;
 b=OoOX5BDVHv7N6a+HZ41any3tv9UPmXXv4Sl+XmdCZykxNh/4R5jN7bLJ
 7ytFC5xq5oijgzIurnR9k9HWvyVr/QjFHyL3ZaPqKJFKRI1qIKGhg04wS
 wZzpQ7fZ0Og0NQEEFkPriOQS8s8IHvtwvVOuzZV+Hnz52nLqoXXCjMBSp
 sGOTcMfBi5VrwXcJPBUoa8urwrsFFUY+82lIhTWYOhQeXbfEJVi4Uoabb
 SIV6Z9p++kQW/h709goNEqZpnZCO3M67+c1ATAmdeNsFbJxelF9zBtp+a
 OffuuH5VXiFU3O5zc3QSBlMiSXh5VTIptyKa5I5lORa+J0USwg3BnZkGK w==;
X-CSE-ConnectionGUID: 9zbkk2cmQPeB5Lj6rha4dA==
X-CSE-MsgGUID: mGHuJdzaSKKhNUwtnBcl0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75063406"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75063406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 00:35:15 -0700
X-CSE-ConnectionGUID: GBmvbjpjTt2Lh17GPoJPdQ==
X-CSE-MsgGUID: 4XIv7PZNQiS1hRbgwSDO8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185075509"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa006.jf.intel.com with ESMTP; 30 Oct 2025 00:35:14 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 27/32] drm/i915/display: Add .crtc_get_dpll hook
Date: Thu, 30 Oct 2025 09:22:44 +0200
Message-Id: <20251030072249.155095-28-mika.kahola@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030072249.155095-1-mika.kahola@intel.com>
References: <20251030072249.155095-1-mika.kahola@intel.com>
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

Add .crtc_get_dpll function pointer to support MTL+
platforms.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 7a48d6f0db10..46ae05976191 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1693,6 +1693,7 @@ static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 
 static const struct intel_dpll_global_funcs mtl_dpll_funcs = {
 	.crtc_compute_clock = mtl_crtc_compute_clock,
+	.crtc_get_dpll = hsw_crtc_get_dpll,
 };
 
 static const struct intel_dpll_global_funcs dg2_dpll_funcs = {
-- 
2.34.1

