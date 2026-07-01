Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F8C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 09:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D641410EE80;
	Wed,  1 Jul 2026 09:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ff6pee6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEF210EE81;
 Wed,  1 Jul 2026 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782897313; x=1814433313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E3k66GSFlr8fb7IkP31WxEbjaeBk34jf4PHXxS9LSJc=;
 b=ff6pee6zrc/+kpIFC2BIS/meOSsAJiVcMpPzh1K5aLSkIaZnRs4Bx3XE
 mAQ3JUJMDYMf6IOu3ElogrsO+RaahwbYKpZ3/bdsluKc/zFih6zIK/cRz
 mTeH+yL9kRZvw9L6B0KeiCXXHX7ksvDtLBVKd9zmoUb2jbEYa6hMVavCv
 Jy5LYqQD+Z6PHA2Sx0Cpd192/+CU4B1Pq2NdpPVxb9eOMViOIVB0VF2cZ
 uYTLBuEOw/rEzGiQfIaL7BS7O+jBgxkV7a9Evh1DdkD4PtshiFflXO1qY
 Dthqo7RSVC/aJ2tlzvfy2l/DOh5sxaFhXEX1HI9MhdxHoQJmLZfxZkFVA w==;
X-CSE-ConnectionGUID: 06jvQsE8TIKgAbweCy1yzw==
X-CSE-MsgGUID: DY+AXpADTn+r4h73YFOZ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83679071"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="83679071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 02:15:13 -0700
X-CSE-ConnectionGUID: 2tFDe4TMTk+0dBWlMrIP6g==
X-CSE-MsgGUID: o5nyf1beQVeWAcy7uESUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="275735726"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 02:15:12 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 2/2] drm/i915/ltphy: Fix SSC Enablement bit in
 PORT_CLOCK_CTL
Date: Wed,  1 Jul 2026 14:45:03 +0530
Message-Id: <20260701091503.1302226-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701091503.1302226-1-suraj.kandpal@intel.com>
References: <20260701091503.1302226-1-suraj.kandpal@intel.com>
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

According to Bspec we only need to write SSC Enable PLL A bit
and leave PLL B bit alone in PORT_CLOCK_CTL Register.

Fixes: 3383ba2479f7 ("drm/i915/ltphy: Enable SSC during port clock programming")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 956181f80d35..8fc6d230493f 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1223,11 +1223,7 @@ intel_lt_phy_program_port_clock_ctl(struct intel_encoder *encoder,
 	else
 		val |= XELPDP_DDI_CLOCK_SELECT_PREP(display, XELPDP_DDI_CLOCK_SELECT_MAXPCLK);
 
-	 /* DP2.0 10G and 20G rates enable MPLLA*/
-	if (port_clock == 1000000 || port_clock == 2000000)
-		val |= XELPDP_SSC_ENABLE_PLLA;
-	else
-		val |= ltpll->ssc_enabled ? XELPDP_SSC_ENABLE_PLLB : 0;
+	val |= ltpll->ssc_enabled ? XELPDP_SSC_ENABLE_PLLA : 0;
 
 	intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port),
 		     XELPDP_LANE1_PHY_CLOCK_SELECT | XELPDP_FORWARD_CLOCK_UNGATE |
-- 
2.34.1

