Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D834EC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF110F229;
	Wed,  9 Sep 2026 16:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2h48L1M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4473110F227
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970816; x=1820506816;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SBEQgCzmGRBJNU4FGrLRgbJLh7owmiufCQ9KJmT8MVk=;
 b=a2h48L1MJXrR+vZ/U43ieTvHtmaL39uXj/EjFCyV6sCEzGmUtzJHGEJ3
 Ax/XCvgxI1kv7fHtXcGYigJe+ArSi8NjP6rwrjBw9PxcCEYY8zOnGrPBd
 5fw+G20TE64YosutY37krOFm45hsZ0KzZ5VXnT+B3UZMPzmF+Y5aFa2te
 uHYzjGBgPgHZ23xKP6b1yzK9f9+cbHywo6lL9kaZGC7zWXstEAHYAuWy1
 Y1gA/KGk4mFQq3XE5DJku5R7oZeSb8EAo0RzgAk9GlWNEZgzJhXnmHpO1
 J88uiYEE5XA7eg/wmKxzW8qcIBdbySl2WOL8Do18koaDDSZXKG9Uh9NiQ w==;
X-CSE-ConnectionGUID: /9gLaUQHRM+0+SOYWaATDg==
X-CSE-MsgGUID: 2iXIEFDKQDurC3GEfDsQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91920625"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91920625"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:20:16 -0700
X-CSE-ConnectionGUID: 7BFyESX2Sz6MaSjJbavAjw==
X-CSE-MsgGUID: wHk5euBWSR+tXi3zkXAAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273340000"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2026 09:20:14 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com, gustavo.sousa@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Wed,  9 Sep 2026 21:48:44 +0530
Message-ID: <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 69 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 60 insertions(+), 13 deletions(-)

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
index c86890e09b55..37cd7fe38c2b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -588,33 +588,78 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
-	u32 idledly, maxcnt;
+	u32 idledly, idledly_reg_val, maxcnt;
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
-	bool inhibit_switch = 0;
+	bool inhibit_switch = false;
+	bool wa_applied = false;
+	bool clamped_below_maxcnt = false;
+
+	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
+	    XE_GT_WA(gt, 14025941587)) {
+		u32 mincnt_idledly_ns = 5000;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
 		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. */
 		if (!idledly_units_ps) {
 			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
 			return;
 		}
 
-		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
-		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
+		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
 		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
-			idledly = maxcnt ?
-				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
-						   idledly_units_ps) : 0;
-			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
+		/*
+		 * Wa_14025941587 is applied before Wa_16023105232, which has
+		 * higher priority; the two are not expected to conflict.
+		 */
+		if (XE_GT_WA(gt, 14025941587) &&
+		    idledly < mincnt_idledly_ns) {
+			idledly = mincnt_idledly_ns;
+			wa_applied = true;
+		}
+
+		if (XE_GT_WA(gt, 16023105232) &&
+		    xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
+			/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
+			idledly = maxcnt ? maxcnt - 1 : 0;
+			clamped_below_maxcnt = true;
+			wa_applied = true;
+			/* inhibit_switch override to keep
+			 * semantics of Wa_16023105232
+			 */
+			if (inhibit_switch)
+				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		}
+
+		if (wa_applied) {
+			u32 idledly_ticks;
+
+			/*
+			 * Wa_16023105232 requires idledly < maxcnt, so floor
+			 * that clamp; otherwise round up to guarantee the
+			 * Wa_14025941587 minimum survives tick quantization.
+			 */
+			if (clamped_below_maxcnt)
+				idledly_ticks = DIV_ROUND_DOWN_ULL((u64)idledly * 1000,
+								   idledly_units_ps);
+			else
+				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
+								 idledly_units_ps);
+
+			idledly_reg_val &= ~IDLE_DELAY;
+			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
+			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
+				  hwe->name, idledly, maxcnt,
+				  !!inhibit_switch, gt->info.timestamp_base);
+			xe_mmio_write32(&gt->mmio,
+					RING_IDLEDLY(hwe->mmio_base),
+					idledly_reg_val);
 		}
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

