Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED201C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 10:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821EA10E25F;
	Wed, 16 Sep 2026 10:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enKHfM4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 904AC10E25F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789553238; x=1821089238;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eYhPCn5ZYUlZ2okn1eEEMbr7xctRhACtSY0Qc6Ip2+Q=;
 b=enKHfM4FGNkLCoBgIsqTwkmEnxR+/RZukvK+cwPYYUen2u6ItdBbgejx
 hXvS4lYTEbQHA+83AGiDnF17MRGHY3LKO2chLcFbEzLS8JmuiREm+cjF+
 NFPy5hR/QWPBgC+0n4sJhH1g4NWvRzDcT5tkSXSVTVGxGAVhTRdvenjvK
 yA/JogupMUM5C8XfrjtNR4LrVZDNRQLb2qPeSV/Y5/BAv6r4KcvgIQiBm
 jLyZiPoSMMKlLHOdntkeYXK5o0/Esx0KG3hsr7akMe8B17rZLE5wcA2pA
 bloYyjZgHtJOLumEzxJo3qdgFI/DxdTCLLHvxSBfARH9I4d3AZgP9IaEn w==;
X-CSE-ConnectionGUID: xXZea6tqTL+DfeyMOLo/vw==
X-CSE-MsgGUID: VCYdWrwYRsKEpX2/oTj2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="430909"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="430909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:07:18 -0700
X-CSE-ConnectionGUID: M7HusDyhSQ23ug613e/jUw==
X-CSE-MsgGUID: jPTM+CcuTZSr038GzEQyxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272820148"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 16 Sep 2026 03:07:16 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 shuicheng.lin@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Wed, 16 Sep 2026 15:35:45 +0530
Message-ID: <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Avoid programming the IDLEDLY timer to less than 5 microseconds.
Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
and Media Versions 13.01 to 35.03

v2: Use xe_rtp_match_not_sriov_vf, move to local variable
    Remove warn and other knits            - Matt R

v3: Add verbose comment - Tejas

v4: Restore IDLE_DLY register on engine reset.
    Add it to GUC save-restore list. -Vivek

v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay

v6: Avoid clearing inhibit switch - Bala
    Refactor code accordingly by adding idle_reg_val.

v7: Rebased with the divide-by-zero/overflow guards living in
    a separate hardening patch.

v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
    maxcnt == 0 guard from the hardening patch. Round up
    (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
    so the tick-quantized delay cannot round back below 5 us.

v9: Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
    read from hardware instead of the Wa_14025941587-bumped value,
    so it no longer fires on the driver's own floor. Re-check the
    rounded-up tick value against maxcnt and floor it if tick
    quantization pushed it back to/above maxcnt, logging via
    xe_gt_dbg since this is the driver's own value, not a hardware
    anomaly.

Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 93 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 79 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index ff8eee3831aa..58a3f6293ce4 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	if (XE_GT_WA(hwe->gt, 16023105232))
+	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
 		guc_mmio_regset_write_one(ads, regset_map,
 					  RING_IDLEDLY(hwe->mmio_base),
 					  count++);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d868af8e3301..9680d2a5adec 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -585,44 +585,103 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
+static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
+{
+	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
+}
+
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
-	u32 idledly, maxcnt;
+	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
-	bool inhibit_switch = 0;
+	bool inhibit_switch = false;
 	bool wa_applied = false;
+	bool clamped_below_maxcnt = false;
+
+	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
 
-	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
 		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
 		if (!idledly_units_ps)
 			return;
 
-		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
-		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
+		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
 		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
+		idledly_hw = idledly;
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		/* Clear the inhibit switch without disturbing a valid delay. */
-		if (inhibit_switch)
+		/*
+		 * Wa_14025941587 is applied before Wa_16023105232, which takes
+		 * priority if the two ever conflict (not expected in practice).
+		 */
+		if (XE_GT_WA(gt, 14025941587) &&
+		    idledly < mincnt_idledly_ns) {
+			idledly = mincnt_idledly_ns;
 			wa_applied = true;
+		}
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
-			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
-			idledly = maxcnt ?
-				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
-						   idledly_units_ps) : 0;
-			wa_applied = true;
+		if (XE_GT_WA(gt, 16023105232)) {
+			/* Clear the inhibit switch without disturbing a valid delay. */
+			if (inhibit_switch) {
+				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
+				wa_applied = true;
+			}
+
+			/* Warn only on the value read from hardware. */
+			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
+
+			if (idledly >= maxcnt) {
+				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
+				idledly = maxcnt ? maxcnt - 1 : 0;
+				clamped_below_maxcnt = true;
+				wa_applied = true;
+			}
 		}
 
-		if (wa_applied)
-			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
-					REG_FIELD_PREP(IDLE_DELAY, idledly));
+		if (wa_applied) {
+			u32 idledly_ticks;
+
+			/*
+			 * Wa_16023105232 requires idledly < maxcnt, so floor
+			 * that clamp; otherwise round up to guarantee the
+			 * Wa_14025941587 minimum survives tick quantization.
+			 */
+			if (clamped_below_maxcnt)
+				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
+			else
+				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
+								 idledly_units_ps);
+
+			/*
+			 * Tick quantization can still push the rounded-up value
+			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
+			 * priority even in that case.
+			 */
+			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
+			    (u64)idledly_ticks * idledly_units_ps >= (u64)maxcnt * 1000) {
+				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%u, so flooring\n",
+					  hwe->name, idledly_ticks, maxcnt);
+				idledly = maxcnt ? maxcnt - 1 : 0;
+				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
+			}
+
+			idledly_reg_val &= ~IDLE_DELAY;
+			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
+			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
+				  hwe->name, idledly, maxcnt,
+				  !!inhibit_switch, gt->info.timestamp_base);
+			xe_mmio_write32(&gt->mmio,
+					RING_IDLEDLY(hwe->mmio_base),
+					idledly_reg_val);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index dd69ad07f7a9..3001155f8d09 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -72,3 +72,5 @@
 16029897822	MEDIA_VERSION(3500)
 		GRAPHICS_VERSION(3510)
 14027054324	GRAPHICS_VERSION(3511)
+14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
+		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.46.0

