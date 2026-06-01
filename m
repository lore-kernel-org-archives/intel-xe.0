Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBCBCD6E4C
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF63112F74;
	Mon,  1 Jun 2026 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wiohujfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2694112F58;
 Mon,  1 Jun 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301872; x=1811837872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1CU6pTGG3CvDErA/fvdp7fOTsmA8oXHKJ5sjuZImh0=;
 b=Wiohujfh8Nbg3034BT7xPhh35Jeio6hBbaygneHXrauqAsEAvIwMs4+4
 zjrmWrvDbeC9VMcceNn6rvIyDYM5G4may2Yw+NaotCCcW3293ayQ4FDhy
 eS7+JnGgNUv2hVseqCvIztF18P/mEjGg9QEEdPXarp1dbPxmWAIYp8jS8
 UjJVwH5ZpIngbzEjvg0kVo2nT8xhSry8rX9PyBjNLUCDmT5entZT1Br5w
 IroEOZ5t1Cse/JR4YAC6sAyC229sdrdxt3CytiaC4hge5qeankCdoqkV3
 HL2+k3K6a6IUn2YaybsMjVJ6exf0g9Ct9YSYg0i0HY8SZ7Dy2YZDT0x94 Q==;
X-CSE-ConnectionGUID: hvj3UoYXSiCdNI8fqps5oQ==
X-CSE-MsgGUID: Vz9IMvSNTAC/yvIJ/MGNoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80786207"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80786207"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:17:47 -0700
X-CSE-ConnectionGUID: njqr/4P6R+ya77jlFSPkOA==
X-CSE-MsgGUID: /SxAA+I4RUOyTKsnOHDoYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="248602119"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy) ([10.245.245.124])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 01:17:46 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 4/4] drm/i915/display: remove unnecessary PHY_NONE
 definition
Date: Mon,  1 Jun 2026 11:14:35 +0300
Message-ID: <20260601081730.3146922-5-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601081730.3146922-1-luciano.coelho@intel.com>
References: <20260601081730.3146922-1-luciano.coelho@intel.com>
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

PHY_NONE is not really used, but we define it and, thus, need to check
for it in a few places we use phy.  The only potential places where
phy may become PHY_NONE, is in intel_port_to_phy(), where it derives
from port, which can be PORT_NONE.  Many of its callers don't check
for PHY_NONE, which can cause unknown behavior.  Additionally, this
can only happen if the encoder used has PORT_NONE, which should not be
the case either, without unexpected consequences.

Remove the PHY_NONE definition entirely and add a couple of WARNs at
the relevant places, just to be sure.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c           | 10 ++++++----
 drivers/gpu/drm/i915/display/intel_display.h           |  2 --
 .../gpu/drm/i915/display/intel_display_power_well.c    |  6 +++++-
 drivers/gpu/drm/i915/display/intel_hti.c               |  3 ---
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 8e269b71f18e..341408951dc8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1810,9 +1810,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 /* Prefer intel_encoder_is_combo() */
 bool intel_phy_is_combo(struct intel_display *display, enum phy phy)
 {
-	if (phy == PHY_NONE)
-		return false;
-	else if (display->platform.alderlake_s)
+	if (display->platform.alderlake_s)
 		return phy <= PHY_E;
 	else if (display->platform.dg1 || display->platform.rocketlake)
 		return phy <= PHY_D;
@@ -1866,7 +1864,7 @@ bool intel_phy_is_snps(struct intel_display *display, enum phy phy)
 	 * For DG2, and for DG2 only, all four "combo" ports and the TC1 port
 	 * (PHY E) use Synopsis PHYs. See intel_phy_is_tc().
 	 */
-	return display->platform.dg2 && phy > PHY_NONE && phy <= PHY_E;
+	return display->platform.dg2 && phy <= PHY_E;
 }
 
 /* Prefer intel_encoder_to_phy() */
@@ -1884,6 +1882,10 @@ enum phy intel_port_to_phy(struct intel_display *display, enum port port)
 		 port == PORT_D)
 		return PHY_A;
 
+	if (drm_WARN(display->drm, port < 0,
+		     "PHY is invalid if port < 0 (%d), assuming PHY_A\n"), port)
+		return PHY_A;
+
 	return PHY_A + port - PORT_A;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 1963dbc80221..c55692e8aa27 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -136,8 +136,6 @@ enum tc_port {
 };
 
 enum phy {
-	PHY_NONE = -1,
-
 	PHY_A = 0,
 	PHY_B,
 	PHY_C,
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 04bd0dde5bed..daea2452a19e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -325,7 +325,11 @@ static enum phy icl_aux_pw_to_phy(struct intel_display *display,
 {
 	struct intel_encoder *encoder = icl_aux_pw_to_encoder(display, power_well);
 
-	return encoder ? intel_encoder_to_phy(encoder) : PHY_NONE;
+	if (drm_WARN(display->drm, !encoder,
+		     "PHY is invalid if encoder is NULL, assuming PHY_A\n"))
+		return PHY_A;
+
+	return intel_encoder_to_phy(encoder);
 }
 
 static bool icl_aux_pw_is_tc_phy(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_hti.c b/drivers/gpu/drm/i915/display/intel_hti.c
index dc454420c134..56602240ceff 100644
--- a/drivers/gpu/drm/i915/display/intel_hti.c
+++ b/drivers/gpu/drm/i915/display/intel_hti.c
@@ -23,9 +23,6 @@ void intel_hti_init(struct intel_display *display)
 
 bool intel_hti_uses_phy(struct intel_display *display, enum phy phy)
 {
-	if (drm_WARN_ON(display->drm, phy == PHY_NONE))
-		return false;
-
 	return display->hti.state & HDPORT_ENABLED &&
 		display->hti.state & HDPORT_DDI_USED(phy);
 }
-- 
2.53.0

