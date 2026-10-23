Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5660A606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jgo29NI4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1859310E709;
	Fri, 23 Oct 2026 21:10:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F04C10E11E
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789835; x=1824325835;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=i6bIzq5tV9NISH/JjZkvrS9XGMKNRmtFrz/vwpfmZV0=;
 b=jgo29NI4V1DdiaWmePbr7hQd+Is7TFefFSnl2lc16AxId/i1v5t09NXP
 jUIF+mH4HRSGJUzbRg0HyPkmVGlcIKCh1FgPyEoV8/BxJTgo5L4UBmycy
 Zp5gF0iNIPZQGFQ/Y8SBC0gJEPbrKqZ8IyQuBDwFSes7RHMfrUHPJAJDg
 OcMZVaJAvBGhDQum/eJJ1tuwZ2caaol4wc4ublvdJ68gmkN0v5QBQbMvv
 5fchpK0pzkyONGj5/RwaGrbvM3iI+bg806SpGecPFF17yGNtpMTw2/OqY
 yDYqac/VTdBYwhR0YDm22t1ex/6Bz5JGlKGx8vZVu+8y/W+hgb+TLuM4l w==;
X-CSE-ConnectionGUID: Sr3DIAaFQ12AlIr7QYh3lA==
X-CSE-MsgGUID: qP+jHXKvQIW7PcfLpgoFTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562588"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:34 -0700
X-CSE-ConnectionGUID: VnC/dFuMSgG1dB71RT2Jjg==
X-CSE-MsgGUID: RfQFlqDZSN6KT6t1SQbzkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804752"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:32 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:32 -0300
Subject: [PATCH 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-4-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
In-Reply-To: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The function adjust_idledly() currently does the following adjustments
to the IDLEDLY register:

- Wa_14025941587 defines a minimum value for the idle delay.

- Wa_16023105232 defines a maximum value for the idle delay and also
  unsets INHIBIT_SWITCH_UNTIL_PREEMPTED.

We have an upcoming workaround that will also define a minimum idle
delay.

Let's reorganize the logic in adjust_idledly() in a way to make it
easier to reason about and also easier to extend.

Do that by having the workaround-specific logic only responsible for
defining min_idledly_ps or max_idledly_ps, and then keeping the logic of
how to apply them to the register field (with the right rounding up or
down) separate.

This separation drops the helper function idledly_floor_ticks(), the
clamped_below_maxcnt variable, and the extra quantization check,
arguably making the code easier to follow.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 100 ++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index f8019fdf8257..0c9b510e7cac 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -596,99 +596,81 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
-static u32 idledly_floor_ticks(u64 idledly_ps, u32 idledly_units_ps)
-{
-	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
-}
-
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
-	u32 idledly_reg_val, maxcnt_reg_val;
+	u32 idledly_reg_val;
+	u32 idledly;
 	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
-	u32 maxcnt_units_ps = 640000;
 	u64 idledly_ps, idledly_hw_ps;
-	u64 maxcnt_ps;
+	u64 min_idledly_ps = 0;
+	u64 max_idledly_ps = -1;
 	bool inhibit_switch = false;
 	bool wa_applied = false;
-	bool clamped_below_maxcnt = false;
 
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
-		u32 mincnt_idledly_ps = 5000000;
-
 		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
 		if (!idledly_units_ps)
 			return;
 
 		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
+		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
+		idledly_ps = idledly * idledly_units_ps;
 		idledly_hw_ps = idledly_ps;
 
-		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
-		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
-
-		/*
-		 * Wa_14025941587 is applied before Wa_16023105232, which takes
-		 * priority if the two ever conflict (not expected in practice).
-		 */
-		if (XE_GT_WA(gt, 14025941587) &&
-		    idledly_ps < mincnt_idledly_ps) {
-			idledly_ps = mincnt_idledly_ps;
-			wa_applied = true;
-		}
+		if (XE_GT_WA(gt, 14025941587))
+			min_idledly_ps = max(min_idledly_ps, 5000000);
 
 		if (XE_GT_WA(gt, 16023105232)) {
+			u32 maxcnt_units_ps = 640000;
+			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+
+			max_idledly_ps = min_t(u64,
+					       max_idledly_ps,
+					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
+
 			/* Clear the inhibit switch without disturbing a valid delay. */
 			if (inhibit_switch) {
 				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
 				wa_applied = true;
 			}
+		}
 
-			/* Warn only on the value read from hardware. */
-			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
+		/*
+		 * min_idledly_ps is applied before max_idledly_ps, which takes
+		 * priority if the two ever conflict (not expected in practice).
+		 */
+		if (idledly_ps < min_idledly_ps) {
+			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
+			idledly_ps = idledly * idledly_units_ps;
+			wa_applied = true;
+		}
 
-			if (idledly_ps >= maxcnt_ps) {
-				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
-				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
-				clamped_below_maxcnt = true;
-				wa_applied = true;
+		if (idledly_ps >= max_idledly_ps) {
+			if (max_idledly_ps) {
+				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
+				idledly_ps = idledly * idledly_units_ps;
+			} else {
+				idledly = 0;
+				idledly_ps = 0;
 			}
+
+			wa_applied = true;
 		}
 
-		if (wa_applied) {
-			u32 idledly_ticks;
-
-			/*
-			 * Wa_16023105232 requires idledly < maxcnt, so floor
-			 * that clamp; otherwise round up to guarantee the
-			 * Wa_14025941587 minimum survives tick quantization.
-			 */
-			if (clamped_below_maxcnt)
-				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
-			else
-				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
-
-			/*
-			 * Tick quantization can still push the rounded-up value
-			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
-			 * priority even in that case.
-			 */
-			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
-			    (u64)idledly_ticks * idledly_units_ps >= maxcnt_ps) {
-				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
-					  hwe->name, idledly_ticks, maxcnt_ps);
-				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
-				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
-			}
+		/* Warn only if the value read from *hardware* exceeds the maximum. */
+		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
 
+		if (wa_applied) {
 			idledly_reg_val &= ~IDLE_DELAY;
-			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
-			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
-				  hwe->name, idledly_ps, maxcnt_ps,
+			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
+
+			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
+				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
 				  !!inhibit_switch, gt->info.timestamp_base);
 			xe_mmio_write32(&gt->mmio,
 					RING_IDLEDLY(hwe->mmio_base),

-- 
2.56.0

