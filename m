Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345F4606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QnDW/5L6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A3810E6FF;
	Fri, 23 Oct 2026 21:10:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9929A10E701
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789839; x=1824325839;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hThykAktyd9Jy8VGjlaJPlK1ROiXuLRYM4mrCsd0XEM=;
 b=QnDW/5L68f5kj6kjgpUmzRmzONaIMlzJRUNpbs3OxfqN1dxtRxyubLnL
 BKsXzAsukuRdl6W7ClLIFSwcw8gHuPWzJgxLKRqihKornCOWJmiRiwLc5
 XquPK9dp/86TSptyLtBkW0WXpxURDMoyKDEXob3o/BKHRBaIkCaqs8CO3
 3aiXRYM6NitXkfgqY/fwqbmvPBEMyVR//dy8p0G+rJ/wNG8jXYccUtSi2
 rNJQb8FLERJFPAQpjGB9pmpSRo7vB+3dRD4Yoo/SAsrW6RH0zu7kEQYA5
 ORYAQ/K3OZQI4jMeo3MFDD8cmQBzb7DFui7ShD9dBs2h82bmzvajkwmWd w==;
X-CSE-ConnectionGUID: r0ZFLlFCQ5C4eBqS3Hhbdg==
X-CSE-MsgGUID: mUvE/3I7QIebhMrUxoNDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562591"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562591"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:36 -0700
X-CSE-ConnectionGUID: W6YXd91jSomgoW88JjRL1w==
X-CSE-MsgGUID: N2pwy4feSkOgD/3zkA46aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804775"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:35 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:34 -0300
Subject: [PATCH 06/10] drm/xe: Drop early and redundant workaround checks
 in adjust_idledly()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-6-b0453f79c4e1@intel.com>
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

With the latest change, adjust_idledly() now only touches hardware
when necessary and has workaround-specific logic well scoped into
individual "if" statements.  The early workaround checks are now
redundant and can be dropped.  Do that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 108 +++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9f0fd10afd4e..ffd6ef9f96f4 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -611,77 +611,75 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
-	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
-		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
-		if (!idledly_units_ps)
-			return;
+	/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
+	if (!idledly_units_ps)
+		return;
 
-		if (XE_GT_WA(gt, 14025941587))
-			min_idledly_ps = max(min_idledly_ps, 5000000);
+	if (XE_GT_WA(gt, 14025941587))
+		min_idledly_ps = max(min_idledly_ps, 5000000);
 
-		if (XE_GT_WA(gt, 16023105232)) {
-			u32 maxcnt_units_ps = 640000;
-			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+	if (XE_GT_WA(gt, 16023105232)) {
+		u32 maxcnt_units_ps = 640000;
+		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
 
-			max_idledly_ps = min_t(u64,
-					       max_idledly_ps,
-					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
+		max_idledly_ps = min_t(u64,
+				       max_idledly_ps,
+				       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
 
-			clear_inhibit_switch = true;
-		}
+		clear_inhibit_switch = true;
+	}
 
-		/* No applicable workaround found. */
-		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
-			return;
+	/* No applicable workaround found. */
+	if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
+		return;
 
-		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+	idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
 
-		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
-			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
-			wa_applied = true;
-		}
+	if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
+		idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
+		wa_applied = true;
+	}
+
+	idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
+	idledly_ps = idledly * idledly_units_ps;
+	idledly_hw_ps = idledly_ps;
 
-		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
+	/*
+	 * min_idledly_ps is applied before max_idledly_ps, which takes
+	 * priority if the two ever conflict (not expected in practice).
+	 */
+	if (idledly_ps < min_idledly_ps) {
+		idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
 		idledly_ps = idledly * idledly_units_ps;
-		idledly_hw_ps = idledly_ps;
+		wa_applied = true;
+	}
 
-		/*
-		 * min_idledly_ps is applied before max_idledly_ps, which takes
-		 * priority if the two ever conflict (not expected in practice).
-		 */
-		if (idledly_ps < min_idledly_ps) {
-			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
+	if (idledly_ps >= max_idledly_ps) {
+		if (max_idledly_ps) {
+			idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
 			idledly_ps = idledly * idledly_units_ps;
-			wa_applied = true;
+		} else {
+			idledly = 0;
+			idledly_ps = 0;
 		}
 
-		if (idledly_ps >= max_idledly_ps) {
-			if (max_idledly_ps) {
-				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
-				idledly_ps = idledly * idledly_units_ps;
-			} else {
-				idledly = 0;
-				idledly_ps = 0;
-			}
-
-			wa_applied = true;
-		}
+		wa_applied = true;
+	}
 
-		/* Warn only if the value read from *hardware* exceeds the maximum. */
-		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
+	/* Warn only if the value read from *hardware* exceeds the maximum. */
+	xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
 
-		if (wa_applied) {
-			idledly_reg_val &= ~IDLE_DELAY;
-			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
+	if (wa_applied) {
+		idledly_reg_val &= ~IDLE_DELAY;
+		idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
 
-			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
-				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
-				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
-				  gt->info.timestamp_base);
-			xe_mmio_write32(&gt->mmio,
-					RING_IDLEDLY(hwe->mmio_base),
-					idledly_reg_val);
-		}
+		xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
+			  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
+			  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
+			  gt->info.timestamp_base);
+		xe_mmio_write32(&gt->mmio,
+				RING_IDLEDLY(hwe->mmio_base),
+				idledly_reg_val);
 	}
 }
 

-- 
2.56.0

