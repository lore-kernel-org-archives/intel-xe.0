Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36726606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+dOrawy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D84112A28;
	Thu,  5 Nov 2026 23:32:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607F2112A28
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921560; x=1825457560;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Y2U1RQAi97TCH5StwLZjBqNo4gao7FElB69Jpw70JSA=;
 b=A+dOrawyRBWvgqd7SSR5xG72YqSegAYkBYrJScmL9TZdAOcESwCQKB0x
 vny0XufnzX8dMNj3p7Psr183ExY/PEI9BDa8pBLjr98YyimrBCnKVnibj
 ab3XA85A6jjoWE6+nXaJM2WRMOXYs+XYnqRuIA5PLQ4VhrYy5FtwCV96G
 27bpWPcwIgCnltMG2CI6TKwHMnPN9RwBa82prCb9WpQ08OPtrBMG7MgXP
 Jxf92pllVSxXhqYNUieArs6XWbS1xRy7g+Ayxw5qMqiLWtZO7d0gIQIva
 cLA/YhnBNky7vqGFqhZtZ12tNLfTyTx9Lk2Fi3n3zmZ3OR0ZWDLCOXBpk g==;
X-CSE-ConnectionGUID: ZyZD8qY6T6WtPVhlZR5C9A==
X-CSE-MsgGUID: zLz8GgseSquQzBRfFCGxyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769918"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:36 -0800
X-CSE-ConnectionGUID: kExRRK/wRryMQ8ZlitcYvw==
X-CSE-MsgGUID: gEV3FtM1TCSKftkiHBU2tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7187017"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:34 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:57 -0300
Subject: [PATCH v3 10/10] drm/xe: Implement Wa_16031259911
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-10-da6ec790aa29@intel.com>
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

Implement Wa_16031259911, which applies to graphics version 35.10 and
35.11.  The workaround definition instructs us to set the minimum idle
delay value to 2 times the memory read delay, and tells that using 1
unit of the IDLE_DELAY field covers that minimum.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e4366e25a210..8454c3023fee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -227,7 +227,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
 			count += LNCFCMOCS_REG_COUNT;
 
-		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
+		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
+		    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
 			count++; /* RING_IDLEDLY */
 	}
 
@@ -875,7 +876,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
+	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
+	    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
 		guc_mmio_regset_write_one(ads, regset_map,
 					  RING_IDLEDLY(hwe->mmio_base),
 					  count++);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 7950e118ee1d..7f304b9fe0e1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -621,6 +621,9 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	if (XE_GT_WA(gt, 14025941587))
 		min_idledly_ps = max(min_idledly_ps, 5000000);
 
+	if (XE_GT_WA(gt, 16031259911) && xe_gt_supports_multi_queue(gt, hwe->class))
+		min_idledly_ps = max(min_idledly_ps, idledly_units_ps);
+
 	if (XE_GT_WA(gt, 16023105232)) {
 		u64 maxcnt_units_ps = 640000;
 		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 0be1fcd38a7f..073b4a2f2de9 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -79,3 +79,4 @@
 		MEDIA_VERSION_RANGE(1301, 3503)
 16030224309	GRAPHICS_VERSION_RANGE(3510, 3511)
 14028709524	GRAPHICS_VERSION(3510)
+16031259911	GRAPHICS_VERSION_RANGE(3510, 3511)

-- 
2.56.0

