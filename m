Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56048606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TvcCqur4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7D910E5A5;
	Fri, 30 Oct 2026 12:22:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0310D1127F8;
 Fri, 30 Oct 2026 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793362932; x=1824898932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S5LLvXegYO028zSm9r3w+jM3XirBfkzD2TmT0l9bdTc=;
 b=TvcCqur4VFoBSA+qaHPrdiMB6w/HqOzql2qTtXV/wM2OlSQQGhzMWqlC
 F0MJuSJd7c6IyQnMcCba75fnwhbUVtzzT6kXDN8OKzcdSAJMEFx0Zb7Pt
 st/x1vwj3OXHT9PmStGIZ65sLZzBdjeCXRyYemmgubmflyWfxGoxfCG9t
 /zxJ6wczTQChpBTGln2kwz/njfp4ryJyJ7ZSAcESUH4s4wfnz+6yMqsme
 Fsu2Fx2YmG6M50yDDfxCwF41YyUfb2O+wlcREW3Z2JcgzWPtVSQsfgKk7
 A9ZIMFn6fBGCmHhgcQhfmUo2dqVf1zmbtRnU2VdiVMgyptnB5ghfcbgKD Q==;
X-CSE-ConnectionGUID: 9IFVZZa4TCq/JBhzrJWtqQ==
X-CSE-MsgGUID: i4izZW1rQ4GNIsxLe7oM1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2118689"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2118689"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:22:11 -0700
X-CSE-ConnectionGUID: IwGn0O9OQAG4YgEdGFTiOQ==
X-CSE-MsgGUID: fjy8cUF4QF+BDyKCFJdU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5516969"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 05:22:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have crept
 back
Date: Fri, 30 Oct 2026 14:22:07 +0200
Message-ID: <20261030122207.2835113-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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

Display code should use intel_reg_t instead of i915_reg_t. It's
currently just a typedef around i915_reg_t, but this will change in the
future.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h       | 2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 5d3aeaf6a70f..d0a239a36980 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -136,7 +136,7 @@ intel_de_rmw_fw(struct intel_display *display, intel_reg_t reg, u32 clear, u32 s
 
 static inline u64
 intel_de_read64_2x32_volatile_fw(struct intel_display *display,
-				 i915_reg_t lower_reg, i915_reg_t upper_reg)
+				 intel_reg_t lower_reg, intel_reg_t upper_reg)
 {
 	u32 old_upper, upper, lower;
 	int loop = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index bfd6f0a19725..07a66db583dd 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4798,7 +4798,7 @@ static bool dg2_mpllb_get_hw_state(struct intel_display *display,
 {
 	struct intel_encoder *encoder = dg2_get_intel_encoder(display, pll);
 	enum phy phy;
-	i915_reg_t enable_reg;
+	intel_reg_t enable_reg;
 	struct ref_tracker *wakeref;
 	bool ret = false;
 	u32 val;
-- 
2.47.3

