Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAE0CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A2C10FCDD;
	Wed, 14 Oct 2026 10:53:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688C610E642;
 Wed, 14 Oct 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791975196; x=1823511196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gCgnwhPfg9/fZfCK8azVmkw7zmOIhGK+boJDJBSwMaE=;
 b=bAqjS8eWDgaMYbOW1+BY2YaRbACBRF7ThqWamFp7hZU6voVIxKPnZUhI
 cGAo+bN9Cj8lnztUT6KAYYBvGzh0t8m9orug9o78eZpYf9OO0yY8iq2BL
 dLp5NfjfNlsO/SF/ubBiWba/MczH5QLo1kfkBnE4NbaX+RzVffEJ6CsWT
 aHWZU2dKzKO+I2nmAXTa/Yev/m1lh12dKH3/0zMq/UpN1riINhIN2D3uS
 +1U7Vd8LuID8I2aZnmFgq5F3NF96DtYWz4X76Ovy3P3jhvwDGEO3m6nFN
 SI31iZ1wM7y/7f8FB5Lo7oY+Nyc86fviIE7Vdq+xxTkQO99jpTFIimY6T Q==;
X-CSE-ConnectionGUID: USDU+rn1S8eOXAFdOGXy+w==
X-CSE-MsgGUID: Tv+3a44WRcSbdnBDWVeqLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="596806"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="596806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:53:15 -0700
X-CSE-ConnectionGUID: jPp2xXPgT7ucg3FhHRP+GQ==
X-CSE-MsgGUID: U8q2BLcqR8eqwxLXnZWfzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1416947"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 14 Oct 2026 03:53:13 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on LT
 PHY platforms
Date: Wed, 14 Oct 2026 10:53:06 +0000
Message-ID: <20261014105306.2761683-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014105306.2761683-1-mika.kahola@intel.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
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

W/A 14022081154 covers PTL+, but only the C10 PHY sequence was ever
implemented. Port A is an LT PHY on display ver 35, so
intel_dpll_power_save_wa() had nothing to run there and the PHY was
left in the reset power state that blocks S0ix.

Add the LT PHY sequence and dispatch on the PHY type. The PLL state is
calculated from the eDP tables at RBR as the C10 sequence does, so the
throwaway state it brings the PLL up with is marked as eDP.

BSpec: 74151
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  5 +++-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index e899b2eb0871..9f34574775da 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -5245,7 +5245,10 @@ void intel_dpll_power_save_wa(struct intel_display *display)
 		if (!intel_encoder_is_dig_port(encoder))
 			continue;
 
-		intel_cx0_pll_power_save_wa(encoder);
+		if (HAS_LT_PHY(display))
+			intel_lt_phy_pll_power_save_wa(encoder);
+		else
+			intel_cx0_pll_power_save_wa(encoder);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index e05fd23b8a65..d286d33a03ea 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2313,6 +2313,35 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
 
 }
 
+/*
+ * WA 14022081154
+ * LT PHY part of the sequence, see intel_dpll_power_save_wa().
+ */
+void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_dpll_hw_state hw_state = {};
+	int port_clock = 162000;
+	int lane_count = 4;
+	int err;
+
+	if (intel_lt_phy_pll_is_enabled(encoder))
+		return;
+
+	err = intel_lt_phy_pll_calc_state_from_table(encoder, xe3plpd_lt_edp_tables,
+						     true, true, port_clock, lane_count,
+						     &hw_state.ltpll);
+	if (drm_WARN_ON(display->drm, err))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "[ENCODER:%d:%s] Applying power saving workaround on disabled PLL\n",
+		    encoder->base.base.id, encoder->base.name);
+
+	intel_lt_phy_pll_enable(encoder, &hw_state);
+	intel_lt_phy_pll_disable(encoder);
+}
+
 static void intel_lt_phy_pll_verify_clock(struct intel_display *display,
 					  int precomputed_clock,
 					  const char *pll_state_name,
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 368ceedb1e0a..a918012b71e8 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -47,6 +47,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      struct intel_dpll *pll,
 			      const struct intel_dpll_hw_state *dpll_hw_state);
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
+void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder);
 void intel_lt_phy_verify_plls(struct intel_display *display);
 
 #endif /* __INTEL_LT_PHY_H__ */
-- 
2.43.0

