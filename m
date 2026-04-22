Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E316FA1FD0
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41AA10EA4A;
	Wed, 22 Apr 2026 16:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5r5BLhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645710EA2C;
 Wed, 22 Apr 2026 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875168; x=1808411168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuTpxP6/qQZ9U91AQtcLeeVNOEcvSU9qscjcGQrTWRE=;
 b=P5r5BLhSAa8k+mRZLBNqSMGr4AcVWL6W7n3ID9MtqgHllr/jzQM3VFE3
 L4LkG4xnc//bMWLxBxedLqztHIIVehYlpdyEvNcbINzbmyIp3XCm+JgH2
 G32QRje+lRNMt0VIK05AfcaK1cQLJmazqcgXdIYG0ZFRh17pIHbQd1f1u
 bsn1oRYSueuj2C6Stuvf/6RpvK25DYn1RQlFs6UGDdFiRPw6dJ9h+uTcR
 uhoYq7tSo3ZVqAj7dGh1TeoZsqVVESTfzemekBIVs1qd/Q/f3VKaGucsY
 k5SukwvcCyf/ONHOodwc/HbhgVt/2L5FLgutU6dD/MLjsASEnX1RegNpu w==;
X-CSE-ConnectionGUID: lG/uD6WuQcS6rk7hoGk/2A==
X-CSE-MsgGUID: SsZequr6R7S4nlkemQ1Csg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247594"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247594"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:08 -0700
X-CSE-ConnectionGUID: guLeTZK3T7yxTRaN/Wkxuw==
X-CSE-MsgGUID: wx9kRWFpQN+kVfsZenYtLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816105"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:06 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 02/13] drm/i915/display: Switch DC3Co enable from
 standalone bit to DC level encoding
Date: Wed, 22 Apr 2026 21:56:10 +0530
Message-ID: <20260422162622.1869831-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
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

On platforms prior to xe3, DC3CO was controlled via a standalone enable
bit. Starting with xe3, DC3CO is encoded as part of the existing
DC_STATE_EN_UPTO_DC* field.

No functional change, as DC3CO is not enabled on platforms prior to xe3.

Changes in v2:
- Update commit header (Uma Shankar)

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c      | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_regs.h       | 2 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c             | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 80ecf373fb19..77c32492caa1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -267,7 +267,7 @@ sanitize_target_dc_state(struct intel_display *display,
 	static const u32 states[] = {
 		DC_STATE_EN_UPTO_DC6,
 		DC_STATE_EN_UPTO_DC5,
-		DC_STATE_EN_DC3CO,
+		DC_STATE_EN_UPTO_DC3CO,
 		DC_STATE_DISABLE,
 	};
 	int i;
@@ -999,10 +999,10 @@ static u32 get_allowed_dc_mask(struct intel_display *display, int enable_dc)
 
 	switch (requested_dc) {
 	case 4:
-		mask |= DC_STATE_EN_DC3CO | DC_STATE_EN_UPTO_DC6;
+		mask |= DC_STATE_EN_UPTO_DC3CO | DC_STATE_EN_UPTO_DC6;
 		break;
 	case 3:
-		mask |= DC_STATE_EN_DC3CO | DC_STATE_EN_UPTO_DC5;
+		mask |= DC_STATE_EN_UPTO_DC3CO | DC_STATE_EN_UPTO_DC5;
 		break;
 	case 2:
 		mask |= DC_STATE_EN_UPTO_DC6;
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index a7c5290edec1..b5e6437c3d8d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -772,7 +772,7 @@ static u32 gen9_dc_mask(struct intel_display *display)
 	mask = DC_STATE_EN_UPTO_DC5;
 
 	if (DISPLAY_VER(display) >= 12)
-		mask |= DC_STATE_EN_DC3CO | DC_STATE_EN_UPTO_DC6
+		mask |= DC_STATE_EN_UPTO_DC3CO | DC_STATE_EN_UPTO_DC6
 					  | DC_STATE_EN_DC9;
 	else if (DISPLAY_VER(display) == 11)
 		mask |= DC_STATE_EN_UPTO_DC6 | DC_STATE_EN_DC9;
@@ -1022,7 +1022,7 @@ static void bxt_verify_dpio_phy_power_wells(struct intel_display *display)
 static bool gen9_dc_off_power_well_enabled(struct intel_display *display,
 					   struct i915_power_well *power_well)
 {
-	return ((intel_de_read(display, DC_STATE_EN) & DC_STATE_EN_DC3CO) == 0 &&
+	return ((intel_de_read(display, DC_STATE_EN) & DC_STATE_EN_UPTO_DC3CO) == 0 &&
 		(intel_de_read(display, DC_STATE_EN) & DC_STATE_EN_UPTO_DC5_DC6_MASK) == 0);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index dada8dc27ea4..2ad211da9157 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -3039,13 +3039,13 @@ enum skl_power_gate {
 /* GEN9 DC */
 #define DC_STATE_EN			_MMIO(0x45504)
 #define  DC_STATE_DISABLE		0
-#define  DC_STATE_EN_DC3CO		REG_BIT(30)
 #define  DC_STATE_DC3CO_STATUS		REG_BIT(29)
 #define  HOLD_PHY_CLKREQ_PG1_LATCH	REG_BIT(21)
 #define  HOLD_PHY_PG1_LATCH		REG_BIT(20)
 #define  DC_STATE_EN_UPTO_DC5		(1 << 0)
 #define  DC_STATE_EN_DC9		(1 << 3)
 #define  DC_STATE_EN_UPTO_DC6		(2 << 0)
+#define  DC_STATE_EN_UPTO_DC3CO		(3 << 0)
 #define  DC_STATE_EN_UPTO_DC5_DC6_MASK   0x3
 
 #define  DC_STATE_DEBUG                  _MMIO(0x45520)
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index ddf1a1f1ebc3..13192531cd49 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -260,7 +260,7 @@ static bool intel_dmc_wl_check_range(struct intel_display *display,
 	 * the DMC and requires a DC exit for proper access.
 	 */
 	switch (dc_state) {
-	case DC_STATE_EN_DC3CO:
+	case DC_STATE_EN_UPTO_DC3CO:
 		ranges = xe3lpd_dc3co_dmc_ranges;
 		break;
 	case DC_STATE_EN_UPTO_DC5:
-- 
2.43.0

