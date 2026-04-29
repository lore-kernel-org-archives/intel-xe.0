Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DEFF8864
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 09:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD46110EEFE;
	Wed, 29 Apr 2026 09:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCAVIpHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E544310EEEC;
 Wed, 29 Apr 2026 09:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777454810; x=1808990810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xuTpxP6/qQZ9U91AQtcLeeVNOEcvSU9qscjcGQrTWRE=;
 b=KCAVIpHX1k5dOfgsIn7fgMqwFajDmq6PlZBxawG3hZN/xsmg+WzwrLgT
 VSleb7vFIHtA7PqnGpMjnyHdpv617ongPpdB8uFDWiW3IknlwOYEoo9tg
 7jRKKOE8c1PeBcfBk4ZSYB+rKIdXslipMqTGzfJF/E31vnt3QmRt0Piaq
 IhLzv7PMe1iZ+QC4/yAJsy59lutmA+hQnFaIH2ddM1PmLP6ObF597D5d9
 vappfSK1iRExoZMHiXEz15gkEE1l99SGZY71SXwhE8lGKGvvhL/Vla3pC
 6z4pW8lhuVY+m9Mw5mz7TSJzEC4jxG0zViXzGJSoNc5J/1axd8Ns7/9kR A==;
X-CSE-ConnectionGUID: bihV5QMjSzGaoF2kZy84tw==
X-CSE-MsgGUID: BhvfC6qaRoqxlyD50CcLMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95946297"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="95946297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:26:50 -0700
X-CSE-ConnectionGUID: Gw4PR31/Q9ua+xzvcckl/g==
X-CSE-MsgGUID: ye32xNjOTzWaK9FSojTxYA==
X-ExtLoop1: 1
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 02:26:48 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v3 02/13] drm/i915/display: Switch DC3Co enable from
 standalone bit to DC level encoding
Date: Wed, 29 Apr 2026 14:56:56 +0530
Message-ID: <20260429092707.485696-3-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260429092707.485696-1-dibin.moolakadan.subrahmanian@intel.com>
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

