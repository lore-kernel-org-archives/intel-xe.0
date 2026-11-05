Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A0606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=frXpFPbE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5186112A14;
	Thu,  5 Nov 2026 23:32:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC3112A14
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921552; x=1825457552;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KY6u/4jEGhTPoqYDdolXyHf2BMxEWNhn15OB7Cg7HSY=;
 b=frXpFPbEsWjoIwaLmVakNjDTExX9RUe3CUNN3ge1fwIOqQb1LO/QVJMl
 UMykDNfMY05g7lfxXrZeBRYAestmqqVWQeTKaHfVNiLkafHT4kKhkphr0
 pQ+NTLVuY0bQ4Q4wMAzUsteNzuMuDxRqYXvo1TQkTSbSIWp+FxNZehqXz
 dBHIpj+pgi0gBg0cKVgRMR18kg3Ak71izqNvdnZQFILDCmaU7sI9pqu5/
 tEAozAY6NE9IgBTN9mWwdeJpRWecYd735XVw/TMahGcKsCwrz53cpgrHH
 RiBqVKRsfzOMC6vh/yJsi66H15lVGkv3+DXKD6Rvs7Q699v1Z9w9YwKLV g==;
X-CSE-ConnectionGUID: NRaMPPPSTgG3ZHFyF9li8w==
X-CSE-MsgGUID: U3RwGAlcSw2ZH8sEVDvc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769910"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769910"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:30 -0800
X-CSE-ConnectionGUID: pC9iSkVcRrG45ppZXnFdnA==
X-CSE-MsgGUID: mqVG+RBlS4anevQJJ5wLmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7186992"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:28 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:53 -0300
Subject: [PATCH v3 06/10] drm/xe: Drop early and redundant workaround
 checks in adjust_idledly()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-6-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
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

With the latest change, adjust_idledly() now only touches hardware
when necessary and has workaround-specific logic well scoped into
individual "if" statements.  The early workaround checks are now
redundant and can be dropped.  Do that.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 108 +++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 32d33c70e7f4..08bd8754ad09 100644
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
-			u64 maxcnt_units_ps = 640000;
-			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+	if (XE_GT_WA(gt, 16023105232)) {
+		u64 maxcnt_units_ps = 640000;
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

