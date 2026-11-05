Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76C606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YOG8oBul
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B6112A15;
	Thu,  5 Nov 2026 23:32:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AED112A15
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921547; x=1825457547;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=h6t4nIiYRLLEStz+fI3bYcbhzNNPJ4dRguEePG7xlS4=;
 b=YOG8oBulS5f4tLj5b1nXN1+LCDgrBByaWnPVZTkfDKHFa1LdIhYxvS2Q
 Q7xBqKS9JY6T90oEcHMsVtXs8hbTb+9mGLGt06w9TE53+44lNE4c8RWNZ
 Dmu9UJ/EO5BO2etFwziN3it2gmFKquOTLWpoiy48RsyElJi8gdAhhy92I
 X16WoCKe7N3aAgHZOqdkYjOUrP21ZDSUVOISTN7m6VCSbwQ7PtfUXFkg7
 8h4sugWaBEdw4oyxNjPMfOe7kV6z+uZBZSLTQlJ6W0aoHuOSjNnXULzs7
 obaFW14RCWgkj6g+TB3aIDEY+d4CCSUqcrvfBoA1rTeIedLXUD3gyaBBa Q==;
X-CSE-ConnectionGUID: An1yzcxzQpWH3cWddF9tgg==
X-CSE-MsgGUID: g6t7enxVR7GEa0H8a8LYJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769907"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:26 -0800
X-CSE-ConnectionGUID: ETEMcj6zSb+Syu/aAhOUcw==
X-CSE-MsgGUID: 4VuCoVZURRGGsnCJNPYXlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7186960"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:23 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:50 -0300
Subject: [PATCH v3 03/10] drm/xe: Use picosecond as common unit in
 adjust_idledly()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-3-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Because gt->info.timestamp_base is given in picoseconds, we lose
precision when calculating the current idle delay in nanoseconds.
Let's avoid that by using picosecond as the common unit of time in
adjust_idledly().

A good side effect of this is that we avoid issuing some integer
divisions.

v2:
  - Change idledly_units_ps and maxcnt_units_ps to u64 to avoid 32-bit
    multiplication overflow. (Sashiko, Matt)

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 55 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 50e8c5103bdc..eb99284af3cc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -596,17 +596,19 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
-static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
+static u32 idledly_floor_ticks(u64 idledly_ps, u64 idledly_units_ps)
 {
-	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
+	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
 }
 
 static void adjust_idledly(struct xe_hw_engine *hwe)
 {
 	struct xe_gt *gt = hwe->gt;
-	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
-	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
-	u32 maxcnt_units_ns = 640;
+	u32 idledly_reg_val, maxcnt_reg_val;
+	u64 idledly_units_ps = 8 * gt->info.timestamp_base;
+	u64 maxcnt_units_ps = 640000;
+	u64 idledly_ps, idledly_hw_ps;
+	u64 maxcnt_ps;
 	bool inhibit_switch = false;
 	bool wa_applied = false;
 	bool clamped_below_maxcnt = false;
@@ -615,29 +617,27 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 		return;
 
 	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
-		u32 mincnt_idledly_ns = 5000;
+		u32 mincnt_idledly_ps = 5000000;
 
 		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
 		if (!idledly_units_ps)
 			return;
 
 		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
-		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
-
 		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
-		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
-		idledly_hw = idledly;
-		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
-		maxcnt *= maxcnt_units_ns;
+		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
+		idledly_hw_ps = idledly_ps;
+
+		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
 
 		/*
 		 * Wa_14025941587 is applied before Wa_16023105232, which takes
 		 * priority if the two ever conflict (not expected in practice).
 		 */
 		if (XE_GT_WA(gt, 14025941587) &&
-		    idledly < mincnt_idledly_ns) {
-			idledly = mincnt_idledly_ns;
+		    idledly_ps < mincnt_idledly_ps) {
+			idledly_ps = mincnt_idledly_ps;
 			wa_applied = true;
 		}
 
@@ -649,11 +649,11 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 			}
 
 			/* Warn only on the value read from hardware. */
-			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
+			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
 
-			if (idledly >= maxcnt) {
+			if (idledly_ps >= maxcnt_ps) {
 				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
-				idledly = maxcnt ? maxcnt - 1 : 0;
+				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
 				clamped_below_maxcnt = true;
 				wa_applied = true;
 			}
@@ -668,10 +668,9 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 			 * Wa_14025941587 minimum survives tick quantization.
 			 */
 			if (clamped_below_maxcnt)
-				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
+				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
 			else
-				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
-								 idledly_units_ps);
+				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
 
 			/*
 			 * Tick quantization can still push the rounded-up value
@@ -679,17 +678,17 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 			 * priority even in that case.
 			 */
 			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
-			    (u64)idledly_ticks * idledly_units_ps >= (u64)maxcnt * 1000) {
-				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%u, so flooring\n",
-					  hwe->name, idledly_ticks, maxcnt);
-				idledly = maxcnt ? maxcnt - 1 : 0;
-				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
+			    idledly_ticks * idledly_units_ps >= maxcnt_ps) {
+				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
+					  hwe->name, idledly_ticks, maxcnt_ps);
+				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
+				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
 			}
 
 			idledly_reg_val &= ~IDLE_DELAY;
 			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
-			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
-				  hwe->name, idledly, maxcnt,
+			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
+				  hwe->name, idledly_ps, maxcnt_ps,
 				  !!inhibit_switch, gt->info.timestamp_base);
 			xe_mmio_write32(&gt->mmio,
 					RING_IDLEDLY(hwe->mmio_base),

-- 
2.56.0

