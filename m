Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505A6C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 11:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FFE10FB8A;
	Tue, 15 Sep 2026 11:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzLCCuFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138BE10FB86
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789470885; x=1821006885;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9YhwiTCQTqgbHV/Q1Cl+WbcDVg3jGMjgtv+wTaghcMc=;
 b=EzLCCuFQslW6EZjx9/+K3lEs2Yb7jwgh/m6zrMUd13IFH1A0a+TvYVnT
 5tnFNpKjpSmktSYLB3IHpsMSrj452BDIbG3U3S4KP6roXc2lpmN1sYsT5
 ems+3pAKdwltxXXqSb4+sq0fk5IJZFJjHcT0IgkpZWFI7cO2TuksQILYH
 jZR/X4+cRkWn2Ms94YlPmeqvOUOP704Vt72yged13NRYnpFgT1wTauVfu
 CzL+5ouBjv4l2AeBBZ/IxUlJr8QsOswBETvQTmui0KNODfl5UAL9WYjZh
 XaAyj6tov3nIl+9VwzuGKRCmv1b/mv1X1asplzEGi1qdC2ZAdU57HRL3g g==;
X-CSE-ConnectionGUID: xuM6GTkKTbSLm2XRNmRgOA==
X-CSE-MsgGUID: a6loYnbRRGCyEpJGY9TNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89856150"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89856150"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 04:14:45 -0700
X-CSE-ConnectionGUID: XivjlayXQFWmHyx+MWivhA==
X-CSE-MsgGUID: uJkD3wmoR329jpA23Nor3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1204423"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa011.fm.intel.com with ESMTP; 15 Sep 2026 04:14:44 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: harden adjust_idledly() against divide-by-zero
 and overflow
Date: Tue, 15 Sep 2026 16:43:13 +0530
Message-ID: <20260915111314.564847-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260915111314.564847-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260915111314.564847-1-tilak.tirumalesh.tangudu@intel.com>
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

adjust_idledly() has several corner-case issues flagged during review:

  1. If xe_gt_clock_init() failed to recognise the crystal clock,
     gt->info.timestamp_base is 0, which makes idledly_units_ps also 0.
     The subsequent DIV_ROUND_CLOSEST(..., idledly_units_ps) is then a
     divide-by-zero and panics the kernel.

  2. The tick-to-ns conversions are done in u32:
        idledly * idledly_units_ps, (maxcnt - 1) * 1000
     Both overflow u32 before DIV_ROUND_CLOSEST() sees them.

  3. If IDLE_WAIT_TIME reads back as 0, maxcnt evaluates to 0 and
     the maxcnt - 1 clamp wraps to 0xFFFFFFFF in u32.

  4. The register only stores whole ticks, so the clamped ns value has
     to be converted to ticks and back. DIV_ROUND_CLOSEST() can round
     that conversion up past maxcnt:

       maxcnt = 640 ns, one tick = 666664 ps

       clamp:        maxcnt - 1        = 639 ns
       ns -> ticks:  639000 / 666664   = 0.958 -> rounds to 1 tick
       tick -> ns:    1 * 666664 / 1000 = 667 ns

     667 ns is programmed into RING_IDLEDLY, but 667 >= maxcnt (640),
     so xe_gt_WARN_ON() fires again on every subsequent init.

Return early if timestamp_base is 0 (the unknown-crystal path).
Do the conversions in u64 via the *_ULL() helpers so they cannot wrap.
Clamp with a floor (DIV_ROUND_DOWN_ULL) so the programmed delay stays
strictly below maxcnt, and guard the maxcnt == 0 case with a zero delay
while still writing RING_IDLEDLY so INHIBIT_SWITCH_UNTIL_PREEMPTED is
cleared.

v2: Drop the redundant warn on the timestamp_base == 0 path;
    xe_gt_clock_init() already warns on an unrecognised crystal clock.
    Keep the early return to avoid the divide-by-zero. - Vinay

Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
Cc: stable@vger.kernel.org
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..e5e761c33fa6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -594,18 +594,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	bool inhibit_switch = 0;
 
 	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
+		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
+		if (!idledly_units_ps)
+			return;
+
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
 		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
 		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
-		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
+		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
 		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
-						    idledly_units_ps);
+			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
+			idledly = maxcnt ?
+				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
+						   idledly_units_ps) : 0;
 			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
 		}
 	}
-- 
2.46.0

