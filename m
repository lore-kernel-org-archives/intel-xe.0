Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B784D606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CCu3yBeW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0261122BB;
	Fri, 27 Nov 2026 06:10:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082291122BE;
 Fri, 27 Nov 2026 06:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759815; x=1827295815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z78jhf57wer2bXeVNv0GKQ8ZWJCZCSl5EIMYwKfLb0E=;
 b=CCu3yBeW2oHBS0L2vubC9POtiQ3hr5G2anYvS1XOk6sDNo7tEIgtPSSh
 AUv3a2PoyppyysTADDt4Qd9CcKXLE7arycu0HNKXpIejzYpDOZuxIhoOR
 5aDrJr9S3XrXucB9CsBaqb6W574AuXYiAMkAgTLEWG5OhBhWuCnQqGa7f
 VtrUBGA6CtnbkA+tKnuFyuKlXwM27E9a6niswXCDkYH6pXxh8XD24vo0M
 Iwt6H10bQInjQENeK1RO7Hir26o5+39Q6NVmUh4K1qWaWnYSbwp3iy3RM
 1w7k8FYX1NbUrclIDESyt41zZXFw1y/39GFlJZqxiH7pRgJYfZebdswtA Q==;
X-CSE-ConnectionGUID: 6WJwd+NcSHODzr+HKOZLzg==
X-CSE-MsgGUID: TlqfQu4uR9amgL9KtlOI1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578278"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578278"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:10:14 -0800
X-CSE-ConnectionGUID: zIxc4TFFTH6GCHd4MTFibw==
X-CSE-MsgGUID: szxUpFt5QGugley91/W4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361983"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:10:12 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 17/18] drm/i915/display: Use pipelock on PTL
Date: Fri, 27 Nov 2026 11:39:23 +0530
Message-Id: <20261127060924.1648295-18-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
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

The pipelock fields of TRANS_DDI_FUNC_CTL2 are there since Xe3, so PTL
can sync the tiles of a tiled display with pipelock, the same way as
NVL. Enable it on PTL as well, which replaces port sync there.
PTL uses the C10/C20 PHYs, so also keep SSC off for pipelock tiles in
the CX0 PLL code.

Bspec: 69965, 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Check for a DP connector before the pipelock check (Sashiko)

 drivers/gpu/drm/i915/display/intel_cx0_phy.c        | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index d13bb3b2750a..1d8906b5bcdf 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -25,6 +25,7 @@
 #include "intel_hdmi.h"
 #include "intel_lt_phy.h"
 #include "intel_panel.h"
+#include "intel_pipelock.h"
 #include "intel_psr.h"
 #include "intel_snps_hdmi_pll.h"
 #include "intel_tc.h"
@@ -1992,6 +1993,11 @@ static void intel_cx0pll_update_ssc(struct intel_encoder *encoder,
 	if (is_dp) {
 		if (intel_panel_use_ssc(display)) {
 			struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+			if (intel_dp->attached_connector &&
+			    intel_pipelock_connector_possible(intel_dp->attached_connector))
+				return;
+
 			pll_state->ssc_enabled =
 				(intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
 		}
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 769a634f5a7e..5c76516ec115 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -193,7 +193,7 @@ struct intel_display_platforms {
 #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
 #define HAS_PEAK_BW_THRESHOLD(__display)	(DISPLAY_VER(__display) >= 30)
 #define HAS_PIPEDMC(__display)		(DISPLAY_VER(__display) >= 12)
-#define HAS_PIPELOCK(__display)		(DISPLAY_VER(__display) >= 35)
+#define HAS_PIPELOCK(__display)		(DISPLAY_VER(__display) >= 30)
 #define HAS_PIXEL_NORMALIZER(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_PMDEMAND(__display)		(DISPLAY_VER(__display) >= 14)
 #define HAS_PORT_SYNC(__display)	(IS_DISPLAY_VER(__display, 9, 30))
-- 
2.34.1

