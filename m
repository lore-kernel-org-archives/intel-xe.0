Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B146EDF154
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 12:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA2010E812;
	Fri, 13 Feb 2026 12:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XI+i1fgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159D810E80D;
 Fri, 13 Feb 2026 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770985594; x=1802521594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sv9muotCym1RjQDqZsMfmzvj4QKOvHFfGIuls01EKTA=;
 b=XI+i1fgBjUirA46kk/MIEb9+82axMsfEFmWXPjnpcxZGOCsRGMeqwhqa
 0fmfY+c0ng6U3NxcV7gWMrij8s4sVWXQzLoudG0XGnFgg3oiHuTN3u5xq
 7Yytj6q/mjr3ZvF1v2YVDT+2tDotrx4ZdS3M2lIulzOXY5EHZKsN0aTyB
 e8RFzg4eAh8mVMCLbVTs31v9k2aLy3Skk1Ku1fM5SLtmJ5WeoEnDN3iBE
 NHD8I/a8Rl+MZTo4TRn6sbm7SLsM0wdLuMhdkeoCez+eSAp4U7DAipYHi
 +BRrh3fsTAgf1eKMT/D8jOPunQIDcx8ziJhWqgR0cY+qeb03TaxfVg7i7 A==;
X-CSE-ConnectionGUID: J0ERzPhoSiagNnmeGQI8sQ==
X-CSE-MsgGUID: neYjEauiTGuIdQig41KMGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72158124"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72158124"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 04:26:34 -0800
X-CSE-ConnectionGUID: uKjYYu5BSDybe4cQWxnogg==
X-CSE-MsgGUID: 0AkY59q8RbuMO/bySaYJVg==
X-ExtLoop1: 1
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2026 04:26:33 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 13/19] drm/i915/lt_phy: Add xe3plpd .crtc_get_dpll
Date: Fri, 13 Feb 2026 12:26:09 +0000
Message-ID: <20260213122615.1083654-14-mika.kahola@intel.com>
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

Add .crtc_get_dpll function pointer to support xe3plpd
platform.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 88f11cb8c5e1..abc85ee9b832 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1691,6 +1691,7 @@ static int i8xx_crtc_compute_clock(struct intel_atomic_state *state,
 
 static const struct intel_dpll_global_funcs xe3plpd_dpll_funcs = {
 	.crtc_compute_clock = xe3plpd_crtc_compute_clock,
+	.crtc_get_dpll = hsw_crtc_get_dpll,
 };
 
 static const struct intel_dpll_global_funcs mtl_dpll_funcs = {
-- 
2.43.0

