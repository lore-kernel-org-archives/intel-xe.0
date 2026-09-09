Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F027C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F92610F228;
	Wed,  9 Sep 2026 16:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcBKNve6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4478A10F227
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970814; x=1820506814;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=O1kT9jkSJtbu2keLL1CCSYW2mVjXF5kwXITGIydhX1A=;
 b=LcBKNve6qkqWwJ3ukrtleB3REWsLxGV4cTXgS5/AImpQlzj8yzLr56We
 U/MgeLIpiviiTdrtErrv5KfmkGpyglRzfb3YCUlm57khGf85rmb4bx33Z
 QzReg55huuFwi6xPkoNvWYNeshZRT0ZURIXUkjWWzFcruSe0YOcOLpaa1
 cdaNBvOXQDFFggr9qp/GQyCwimT1YYxW/hH3MNJTHt11BvBvC50KSlqlb
 GEtJttIg8v+VYDY5vm8BnE9CCRKEFeb5hH7X5Jq82Y+Q1pXvKBUrt6maa
 f14sQSuZr5F4E/dKiLuAaGGXq4tPFWnzVvKts0sRkR4jLVPM1AJWKYEX7 w==;
X-CSE-ConnectionGUID: CJiW+nHGQfal5Yyo2a+KDA==
X-CSE-MsgGUID: xwOjrJDOQWCjA0USWmsaOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91920622"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91920622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:20:14 -0700
X-CSE-ConnectionGUID: zb1x0p5aTBujrj9f0uNViQ==
X-CSE-MsgGUID: rWnKyLlMSS6jGUlYW/Q5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273339994"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2026 09:20:12 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com, gustavo.sousa@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: harden adjust_idledly() against divide-by-zero
 and overflow
Date: Wed,  9 Sep 2026 21:48:43 +0530
Message-ID: <20260909161844.125147-2-tilak.tirumalesh.tangudu@intel.com>
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

Warn and return early if timestamp_base is 0 (the unknown-crystal path).
Do the conversions in u64 via the *_ULL() helpers so they cannot wrap.
Clamp with a floor (DIV_ROUND_DOWN_ULL) so the programmed delay stays
strictly below maxcnt, and guard the maxcnt == 0 case with a zero delay
while still writing RING_IDLEDLY so INHIBIT_SWITCH_UNTIL_PREEMPTED is
cleared.

Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
Cc: stable@vger.kernel.org
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..c86890e09b55 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -594,18 +594,26 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	bool inhibit_switch = 0;
 
 	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
+		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. */
+		if (!idledly_units_ps) {
+			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
+			return;
+		}
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

