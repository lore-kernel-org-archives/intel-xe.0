Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAAAE7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 12:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3CC10E607;
	Mon, 16 Dec 2024 12:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXpcFkW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E37010E607
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734353595; x=1765889595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nTqPeGvz6WHxEV5XDseZ5G0tyImmSecKe4l/hinLgQM=;
 b=SXpcFkW/6dWh1F9lTSHDZQeNr6ORN38MgNm5vDFQWcpLAnGi4EBCFbpO
 ijsO30s1p4FmitnNxHlneOz8v/Gb8dcemLGrkPbaYjLEg7mQcHsL2wb4B
 4w2IY8nqj0qk6GPp+FZMErhwravyK+/zY/Z7hb2sIQ0n4f+Vkkqji97R1
 sorcNS/K0K2t8ZjvEK3DKhP6XDVnbWvzaNxM3kVDRNFAvNpts2Xt8xCij
 jvZkRVh5RCUExJrnSU5TX9nfNLUdlrBUeNhDqfJZhi03yFhrnKcxCAoIv
 qx7XvNiFG5g7lx/01rzD8WQzSCRRcTeCczg/3sX5J1ypdEY9lLbzvcKP1 A==;
X-CSE-ConnectionGUID: hPKp8MhTTTypANU4kdsDfA==
X-CSE-MsgGUID: XEKilwtjS4qoaiyLKV3/Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38509548"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="38509548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 04:53:15 -0800
X-CSE-ConnectionGUID: Jfl9dlwGSTWApWqmBtgtJw==
X-CSE-MsgGUID: g23E4bgaSau724OIQwVS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97987462"
Received: from sorvi2.fi.intel.com ([10.237.72.194])
 by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 04:53:13 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: UHBR rates for Thunderbolt
Date: Mon, 16 Dec 2024 14:44:22 +0200
Message-ID: <20241216124422.475693-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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

tbt-alt mode is missing uhbr rates 10G and 20G. This requires
requires pll clock rates 312.5 MHz and 625 MHz to be added,
respectively. The uhbr rates are supported only form PTL+
platforms.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 27 ++++++++++++++++---
 .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  4 +++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index cc734079c3b8..e0bd47e684c5 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3070,7 +3070,10 @@ int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder)
 
 	val = intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port));
 
-	clock = REG_FIELD_GET(XELPDP_DDI_CLOCK_SELECT_MASK, val);
+	if (DISPLAY_VER(display) >= 30)
+		clock = REG_FIELD_GET(XE3LPDP_DDI_CLOCK_SELECT_MASK, val);
+	else
+		clock = REG_FIELD_GET(XELPDP_DDI_CLOCK_SELECT_MASK, val);
 
 	drm_WARN_ON(display->drm, !(val & XELPDP_FORWARD_CLOCK_UNGATE));
 	drm_WARN_ON(display->drm, !(val & XELPDP_TBT_CLOCK_REQUEST));
@@ -3085,6 +3088,10 @@ int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder)
 		return 540000;
 	case XELPDP_DDI_CLOCK_SELECT_TBT_810:
 		return 810000;
+	case XELPDP_DDI_CLOCK_SELECT_TBT_312_5:
+		return 1000000;
+	case XELPDP_DDI_CLOCK_SELECT_TBT_625:
+		return 2000000;
 	default:
 		MISSING_CASE(clock);
 		return 162000;
@@ -3102,6 +3109,10 @@ static int intel_mtl_tbt_clock_select(int clock)
 		return XELPDP_DDI_CLOCK_SELECT_TBT_540;
 	case 810000:
 		return XELPDP_DDI_CLOCK_SELECT_TBT_810;
+	case 1000000:
+		return XELPDP_DDI_CLOCK_SELECT_TBT_312_5;
+	case 2000000:
+		return XELPDP_DDI_CLOCK_SELECT_TBT_625;
 	default:
 		MISSING_CASE(clock);
 		return XELPDP_DDI_CLOCK_SELECT_TBT_162;
@@ -3114,15 +3125,25 @@ static void intel_mtl_tbt_pll_enable(struct intel_encoder *encoder,
 	struct intel_display *display = to_intel_display(encoder);
 	enum phy phy = intel_encoder_to_phy(encoder);
 	u32 val = 0;
+	u32 mask;
 
 	/*
 	 * 1. Program PORT_CLOCK_CTL REGISTER to configure
 	 * clock muxes, gating and SSC
 	 */
-	val |= XELPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
+
+	if (DISPLAY_VER(display) >= 30) {
+		mask = XE3LPDP_DDI_CLOCK_SELECT_MASK;
+		val |= XE3LPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
+	} else {
+		mask = XELPDP_DDI_CLOCK_SELECT_MASK;
+		val |= XELPDP_DDI_CLOCK_SELECT(intel_mtl_tbt_clock_select(crtc_state->port_clock));
+	}
+
 	val |= XELPDP_FORWARD_CLOCK_UNGATE;
+
 	intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port),
-		     XELPDP_DDI_CLOCK_SELECT_MASK | XELPDP_FORWARD_CLOCK_UNGATE, val);
+		     mask | XELPDP_FORWARD_CLOCK_UNGATE, val);
 
 	/* 2. Read back PORT_CLOCK_CTL REGISTER */
 	val = intel_de_read(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port));
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
index c685479c9756..9870d61ca493 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
@@ -187,7 +187,9 @@
 #define   XELPDP_TBT_CLOCK_REQUEST			REG_BIT(19)
 #define   XELPDP_TBT_CLOCK_ACK				REG_BIT(18)
 #define   XELPDP_DDI_CLOCK_SELECT_MASK			REG_GENMASK(15, 12)
+#define   XE3LPDP_DDI_CLOCK_SELECT_MASK			REG_GENMASK(16, 12)
 #define   XELPDP_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XELPDP_DDI_CLOCK_SELECT_MASK, val)
+#define   XE3LPDP_DDI_CLOCK_SELECT(val)			REG_FIELD_PREP(XE3LPDP_DDI_CLOCK_SELECT_MASK, val)
 #define   XELPDP_DDI_CLOCK_SELECT_NONE			0x0
 #define   XELPDP_DDI_CLOCK_SELECT_MAXPCLK		0x8
 #define   XELPDP_DDI_CLOCK_SELECT_DIV18CLK		0x9
@@ -195,6 +197,8 @@
 #define   XELPDP_DDI_CLOCK_SELECT_TBT_270		0xd
 #define   XELPDP_DDI_CLOCK_SELECT_TBT_540		0xe
 #define   XELPDP_DDI_CLOCK_SELECT_TBT_810		0xf
+#define   XELPDP_DDI_CLOCK_SELECT_TBT_312_5		0x18
+#define   XELPDP_DDI_CLOCK_SELECT_TBT_625		0x19
 #define   XELPDP_FORWARD_CLOCK_UNGATE			REG_BIT(10)
 #define   XELPDP_LANE1_PHY_CLOCK_SELECT			REG_BIT(8)
 #define   XELPDP_SSC_ENABLE_PLLA			REG_BIT(1)
-- 
2.43.0

