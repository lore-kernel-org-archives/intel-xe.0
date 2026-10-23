Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CA8606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JO5cQaa+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3807710E5FE;
	Fri, 23 Oct 2026 10:35:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D79D10E5FE;
 Fri, 23 Oct 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792751726; x=1824287726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N36xCmO0rcyh1MOc1TE1+0RxkagMFW6Mx5dgM0euEfU=;
 b=JO5cQaa+j328pTMCVC+dKQ9hfsdc/M6HYmuTpoY6lVDl0sU9lCoPBpLQ
 RtPW7FAYGgN5ZaSA0VOimJ9+Bq8VUTTk/KvBkFXXj/aT2rWtEVdReRZwr
 0G8XWvJcTWW9h2CcVCz022GB5ZxI4lDqu/JKwapBBipD6gajTcR8UBZ3p
 0Cz01MdCaM3fPFYCu7K65QfQMYJDlvY1Ve9hHGId8hW4P6gea23PV45Cr
 oGB5Q0fyTPHJt7rGzRb2ssUZyB8whtk4L7rhXeaNxpiEBvCPMKSI7boCs
 VU1NJDvLLN26j5Y8IiLILa67MWL6ck36HI7c3BIp2hXixKAkWU2o9jkYy A==;
X-CSE-ConnectionGUID: 10Aq7GSoTUuzH+I4XmFq5g==
X-CSE-MsgGUID: MOxb7ggKS42u4k7lc2GnOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1515071"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1515071"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:35:25 -0700
X-CSE-ConnectionGUID: NQf2VEVVRCOYAaNk4xNrPg==
X-CSE-MsgGUID: tPW6Pr0pRt+M89KYUlvx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5451307"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 03:35:23 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3] drm/i915/cx0: convert the PLL power save W/A to the display
 W/A framework
Date: Fri, 23 Oct 2026 10:35:21 +0000
Message-ID: <20261023103521.720686-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the open-coded DISPLAY_VER() check for W/A 14022081154 in
intel_cx0_pll_power_save_wa() with INTEL_DISPLAY_WA_14022081154.

Drop the port A note from the comment while at it. It only holds for
PTL, on WCL port B is a C10 PHY too.

No functional change.

BSpec: 74151
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c    | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 814615fe9951..d13bb3b2750a 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -19,6 +19,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dp.h"
 #include "intel_dpll.h"
 #include "intel_hdmi.h"
@@ -3705,8 +3706,7 @@ int intel_cx0pll_calc_port_clock(struct intel_encoder *encoder,
  * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
  * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
  * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
- * power state to save power. For PTL the workaround is needed only for port A. Port B
- * is not connected.
+ * power state to save power.
  *
  * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
  *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
@@ -3717,7 +3717,7 @@ void intel_cx0_pll_power_save_wa(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
 
-	if (DISPLAY_VER(display) != 30)
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14022081154))
 		return;
 
 	for_each_intel_encoder(display->drm, encoder) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index e6f84dffdeb7..cc0b28d524f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -111,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_14021768792:
 		return display->platform.battlemage &&
 			IS_DISPLAY_STEP(display, STEP_C0, STEP_FOREVER);
+	case INTEL_DISPLAY_WA_14022081154:
+		return DISPLAY_VER(display) == 30;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_14026643300:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 0b43c2144dcc..2086c7da710d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -35,6 +35,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14021768792,
+	INTEL_DISPLAY_WA_14022081154,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
-- 
2.43.0

