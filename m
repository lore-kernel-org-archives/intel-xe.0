Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190CAFED2E4
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79F10E99F;
	Thu, 12 Mar 2026 08:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeoVesfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485D010E99C;
 Thu, 12 Mar 2026 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302822; x=1804838822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0XfH3gNbS0OIgTJeJ8X55IRND/V+OrE+d413+HCwUCI=;
 b=aeoVesfB/nHMwCJpTTdJ3p6Ie1qUSSmYBhOST+jsYzaH9P/K3J1c9pB1
 2wip4f+i1mqtjysvrMarsgTN6X7V42YvS2SPGhpzmb3xdfiXz0b5z+A+r
 zHa+lZS4Eecc4QFO66KhihcoZLedDXi/lAp5Glu5cmbXP1UzJxz4Xq3Aa
 AirTprpxFz/z3yO50RWcnBNwqEZGN8TJ++NGfuw0mwvFn0p+HTXiIF9wb
 zTpENDWJV4JKOrAIlb/sg+cCI4eQnf2Te44gvTazF2RJde4pl4VPROsUY
 NCjBWWjF+2QC+QHHqsSsRzJ3oKV+ogPGnQ5LStaVTLKmTbgjP/e0yQSK3 A==;
X-CSE-ConnectionGUID: 4dpft/I5T5OFeRfDmalraw==
X-CSE-MsgGUID: EuEv7U37T8SN1UaqWjNjJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013716"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013716"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:02 -0700
X-CSE-ConnectionGUID: 7OwAQ6U/Rt6B5RlAshw+8Q==
X-CSE-MsgGUID: Uqf2r0mkSYC3g+cvA8ay1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206778"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:01 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 02/24] drm/i915/lt_phy: Add check if PLL is enabled
Date: Thu, 12 Mar 2026 08:06:35 +0000
Message-ID: <20260312080657.2648265-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add check for PLL enabling and return early if
PLL is not enabled.

v2: Use PCLK PLL ACK bit to check if PLL is enabled (Suraj)
v3: Check only if PCLK PLL ACK bit for lane 0 is enabled (Suraj)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index f768804122c1..e1c95f58b6ae 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2176,6 +2176,14 @@ intel_lt_phy_pll_compare_hw_state(const struct intel_lt_phy_pll_state *a,
 	return false;
 }
 
+static bool intel_lt_phy_pll_is_enabled(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	return intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port)) &
+			     XELPDP_LANE_PCLK_PLL_ACK(0);
+}
+
 void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 				       const struct intel_crtc_state *crtc_state,
 				       struct intel_lt_phy_pll_state *pll_state)
@@ -2185,6 +2193,9 @@ void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 	struct ref_tracker *wakeref;
 	int i, j, k;
 
+	if (!intel_lt_phy_pll_is_enabled(encoder))
+		return;
+
 	pll_state->tbt_mode = intel_tc_port_in_tbt_alt_mode(enc_to_dig_port(encoder));
 	if (pll_state->tbt_mode)
 		return;
-- 
2.43.0

