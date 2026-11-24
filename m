Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804B5606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLnvJAo6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6D10F677;
	Tue, 24 Nov 2026 14:18:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC48810F66B;
 Tue, 24 Nov 2026 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795529910; x=1827065910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Et4nNQPygyFXTSb5ejdPvxBoUQ2kk+hA7ZZH7G95BB0=;
 b=QLnvJAo6ZhoZlGBo7sfgRLqin93FVUKzACnSQWEW/yqGNUSCfEhWYhlT
 qQY+KOL7BFn4Hg25ytm8jIRYBQ3kFtjSqCXqiSUdWZtHnLHHSTyy3gtHS
 FreXrNpwX+ExNiBlaDGUDb1VDvJlIjlk/YcZgFukJ45bceWHVAdInjM8P
 TQs0JXoR9+gx+Qqc8ml40EjOT85Tww6MJ8m6ZjVFrHdYDyOw/QVVwq+BG
 I0T6iJyxmt+Q7m0RwfZYMUHTdSCYowStntNzbyrNFijWj+N23R3Wgl82q
 857TjGRh5stiHFgnAQSrphDcPNFFnfL1bnx7149SzVJV1r+rtO/dHwwji g==;
X-CSE-ConnectionGUID: MngqucDVQa+MjTyyCIUJUA==
X-CSE-MsgGUID: kczp2iAmRHqeYvfsg3Zd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389696"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4389696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 06:14:56 -0800
X-CSE-ConnectionGUID: 414q7kylSfSqtd+PgyeBIQ==
X-CSE-MsgGUID: DNpSwC+uRgqcuwlshySzUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11569633"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 06:13:05 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 3/3] drm/i915/cmtg: Include flip queue exec time in the DC3co
 exit latency
Date: Tue, 24 Nov 2026 14:13:00 +0000
Message-ID: <20261124141300.2600962-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124141300.2600962-1-mika.kahola@intel.com>
References: <20261124141300.2600962-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pipe DMC may have a flip queue entry to execute on DC3co exit. Add
its execution time to the DC5 exit latency in CMTG_HW_GB.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 3c0f5b2fb2e70..75bdf0d1846fb 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -18,6 +18,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_flipq.h"
 #include "intel_vrr.h"
 #include "intel_vrr_regs.h"
 
@@ -397,6 +398,7 @@ static void intel_cmtg_set_hwgb(const struct intel_crtc_state *crtc_state)
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 breakeven_gb;
 	u32 dc5_exit_latency;
+	u32 exit_latency_us = DC3CO_EXIT_LATENCY_US;
 	u32 line_time_us = 75;	/* Max default initialization value */
 	u32 val;
 
@@ -406,8 +408,15 @@ static void intel_cmtg_set_hwgb(const struct intel_crtc_state *crtc_state)
 	/* Break Even Guardband - DC3co Entry Latency / linetime */
 	breakeven_gb = DIV_ROUND_UP(DC3CO_ENTRY_LATENCY_US, line_time_us);
 
-	/* DC5 Exit Latency - DC3co Exit Latency / linetime */
-	dc5_exit_latency = DIV_ROUND_UP(DC3CO_EXIT_LATENCY_US, line_time_us);
+	/*
+	 * The pipe DMC may need to execute a flip queue entry on DC3co exit,
+	 * so include the flip queue execution time in the exit latency.
+	 */
+	if (intel_flipq_supported(display))
+		exit_latency_us += intel_flipq_exec_time_us(display);
+
+	/* DC5 Exit Latency - (DC3co Exit Latency + flip queue exec time) / linetime */
+	dc5_exit_latency = DIV_ROUND_UP(exit_latency_us, line_time_us);
 
 	val = REG_FIELD_PREP(CMTG_HW_GB_BREAKEVEN_MASK, breakeven_gb) |
 	      REG_FIELD_PREP(CMTG_HW_GB_DC5_EXIT_LATENCY_MASK, dc5_exit_latency) |
-- 
2.43.0

