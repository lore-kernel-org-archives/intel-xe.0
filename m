Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF972C5B570
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 02:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E044F10EA50;
	Tue, 11 Aug 2026 02:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JM8R+uM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72110EA3F;
 Tue, 11 Aug 2026 02:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786417031; x=1817953031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CW8EtTjjKdBAh255LYrcmAl35V8dRQkUFK3Dm+XSiBk=;
 b=JM8R+uM5bUwdfn8qjug30Jgy9r4z6hJ6eHR1WEdSUKwETXUgNeJ8GhE+
 H2UhQ+o1a/7mfHUC0jDbgH5nCv1bRdv306LDzrcODESx3ZgyEXzIGJY4C
 DMauVT3vvq7rqRQO9R3FY0jbrAsyXH8yYrQPoZygi57TGC8vfIAC48B7I
 Ho81VMUnMdxcxzq6JR9buOnjlzx9eBp/LUBbIu/cJESiobkomQayeyI8t
 6xxV1brVI4MjzcaBJ9i3ucPXkhKC6Ln7swlLX2U5oJJNftgw9i/co2Emx
 t4P98Eom+3wXDWtTRqMfk/nPx+SBpOULjn75jWNLKRceK/cPgAsIa14Dm w==;
X-CSE-ConnectionGUID: Pt0rr0LSSieYMAK//et+xw==
X-CSE-MsgGUID: ZjlCPGlIQbWyPBdr0VDolQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87061779"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87061779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 19:57:11 -0700
X-CSE-ConnectionGUID: KmOdMK6bTsaeuLn5I3OXRQ==
X-CSE-MsgGUID: v12tVFsjTQaoCIRevpSnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="266696800"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Aug 2026 19:57:09 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/3] drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI clock
 frequency
Date: Tue, 11 Aug 2026 08:26:58 +0530
Message-Id: <20260811025658.2376173-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811025658.2376173-1-suraj.kandpal@intel.com>
References: <20260811025658.2376173-1-suraj.kandpal@intel.com>
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

DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to
be modified.
On silicon DDI_CLK_VALFREQ is a scratch register with no
functional impact, so the bug is not observed.
Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
kHz

Fixes: 5ec58d714935 ("drm/i915/lt_phy: Add .enable_clock hook on DDI")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 8fc6d230493f..86492651b01d 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1976,7 +1976,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 		 * Change. We handle this step in bxt_set_cdclk().
 		 */
 		/* 10. Program DDI_CLK_VALFREQ to match intended DDI clock frequency. */
-		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
+		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
+			       intel_ddi_link_symbol_clock(encoder, port_clock));
 
 		/* 11. Program PORT_CLOCK_CTL[PCLK PLL Request LN0] = 1. */
 		intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, port),
@@ -2023,7 +2024,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 			     lane_phy_pulse_status,
 			     lane_phy_pulse_status);
 	} else {
-		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
+		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
+			       intel_ddi_link_symbol_clock(encoder, port_clock));
 	}
 
 	/*
-- 
2.34.1

