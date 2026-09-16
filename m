Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE11C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 10:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9029310E431;
	Wed, 16 Sep 2026 10:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kfm8XFk8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A110E25F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789553237; x=1821089237;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EQxSAmE4qc4Z9q/or8ecBqa6kArthdgY5Sr1Z4aNtUU=;
 b=Kfm8XFk8iip+1wJJoF3AecSU7pQGirgsA51511kI2bh/QVyUY3UOfRZn
 AbfAviyFsiujQUmM99JHIVMtiwGgLQ6tllJL5gsS5l4gxyP5QecXfh+F4
 ebnQ5JFtzgcr0syuEUUEA6kuf1cqolvt6ctjAzXSRND7c/gmb7PHtjiEj
 rejO1DuKxCOdHjoi+2tprIGE241GulgAxvnBzli34lmBO3UUpyarlqqCA
 AjKgPX6pwmXBu4k82IOau5nUhlGPNF1FvqgEJ6Inr6iBj6ugAZm6tYkb8
 3br90rOS5Gk4TItugcaTdMqB5zeCpLZgAeQ82M9hU3hy+Eul1JtBKQS1y A==;
X-CSE-ConnectionGUID: MhPgfl1MSVyLSS675ia4xA==
X-CSE-MsgGUID: nTsrg6f1S/Sat+Q+hCto7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="430908"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="430908"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:07:16 -0700
X-CSE-ConnectionGUID: 4q2wFFYLRRCpEcXZOxVtvg==
X-CSE-MsgGUID: WMR1VrygT2O1zOOJ3/TSbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272820143"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa008.jf.intel.com with ESMTP; 16 Sep 2026 03:07:15 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 shuicheng.lin@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: harden adjust_idledly() against divide-by-zero
 and overflow
Date: Wed, 16 Sep 2026 15:35:44 +0530
Message-ID: <20260916100545.779894-2-tilak.tirumalesh.tangudu@intel.com>
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

v3: Field-mask the RING_IDLEDLY write with REG_FIELD_PREP(IDLE_DELAY, ...)
    instead of writing the raw tick count, which could clobber
    INHIBIT_SWITCH_UNTIL_PREEMPTED and reserved bits. Split the
    inhibit-switch clear from the maxcnt clamp so a set inhibit bit no
    longer forces a needless delay overwrite when the delay itself is
    already valid. Use gt_to_xe(gt) instead of gt_to_xe(hwe->gt).

Fixes: d2de4410a88f ("drm/xe: Apply Wa_16023105232")
Cc: stable@vger.kernel.org
Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 010499766fce..d868af8e3301 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -592,22 +592,37 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
 	u32 maxcnt_units_ns = 640;
 	bool inhibit_switch = 0;
+	bool wa_applied = false;
+
+	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
+		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
+		if (!idledly_units_ps)
+			return;
 
-	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
 		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
 		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
 		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
-		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
+		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
 		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
 		maxcnt *= maxcnt_units_ns;
 
-		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
-			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
-						    idledly_units_ps);
-			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
+		/* Clear the inhibit switch without disturbing a valid delay. */
+		if (inhibit_switch)
+			wa_applied = true;
+
+		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
+			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
+			idledly = maxcnt ?
+				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
+						   idledly_units_ps) : 0;
+			wa_applied = true;
 		}
+
+		if (wa_applied)
+			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
+					REG_FIELD_PREP(IDLE_DELAY, idledly));
 	}
 }
 
-- 
2.46.0

