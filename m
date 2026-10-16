Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D215CCA464
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 09:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9310E201;
	Fri, 16 Oct 2026 09:24:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1B21126D7;
 Fri, 16 Oct 2026 09:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792142647; x=1823678647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eaHX/w+MUTjV7PXNB7CrKQe1nM5ja10HGSzuFdFI+sY=;
 b=B4Ro4LDCQPF04K38Gm/vS+XPMiDtqXgpRZuNWIYMEx/Hvp08LvXZtIXU
 J/zgK9vQltbuTsR5YuQCSQWbe5bH+XhgAtItedVIjyghzl+Sur/JciUdO
 X6VZxlH2zTpsEUqk6KvfQagq4ZUlqAwIbZn8Vqq1qwA40Wr5V2oykI+p5
 VoJuzrgNR1QI8wExvrbU6lOFFoQDIvBu1oYY6fnIMQakjOVSFcrAn8SuG
 5hN2Vkh9ZH0oKMmd0ZuZcTjumTL8jE3MENlFhZ6qPGHoECsBfX14EJyrU
 HU+leOdvXK5/+cAGvEegyGyITw99+spJOWnjrJ2E5/SYdF01N6lvBT0/v A==;
X-CSE-ConnectionGUID: pOFjar4nRqqnQBHwbJzXdA==
X-CSE-MsgGUID: QDbJEDooSG6M1rA6v/aZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="822038"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="822038"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 02:24:07 -0700
X-CSE-ConnectionGUID: EXr/VyUNSxevA6zk44+7/A==
X-CSE-MsgGUID: Ti4OF5dFTDW7UILOBU7Ibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3695144"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa013.fm.intel.com with ESMTP; 16 Oct 2026 02:24:06 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, suraj.kandpal@intel.com,
 Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 1/1] drm/i915/cx0: convert the PLL power save W/A to the
 display W/A framework
Date: Fri, 16 Oct 2026 09:24:00 +0000
Message-ID: <20261016092400.3112502-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016092400.3112502-1-mika.kahola@intel.com>
References: <20261016092400.3112502-1-mika.kahola@intel.com>
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

Replace the open-coded DISPLAY_VER() check for W/A 14022081154 in
intel_cx0_pll_power_save_wa() with INTEL_DISPLAY_WA_14022081154.

Drop the port A note from the comment while at it. It only holds for
PTL, on WCL port B is a C10 PHY too.

No functional change.

BSpec: 74151
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c    | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index b83f0afaa9b5..1b5a5dcb041b 100644
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
@@ -3703,8 +3704,7 @@ int intel_cx0pll_calc_port_clock(struct intel_encoder *encoder,
  * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
  * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
  * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
- * power state to save power. For PTL the workaround is needed only for port A. Port B
- * is not connected.
+ * power state to save power.
  *
  * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
  *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
@@ -3715,7 +3715,7 @@ void intel_cx0_pll_power_save_wa(struct intel_display *display)
 {
 	struct intel_encoder *encoder;
 
-	if (DISPLAY_VER(display) != 30)
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14022081154))
 		return;
 
 	for_each_intel_encoder(display->drm, encoder) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 888676693f5e..c8f65b55530f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -111,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
+	case INTEL_DISPLAY_WA_14022081154:
+		return DISPLAY_VER(display) == 30;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_14026643300:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 425a300840aa..acb45fa59aef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -33,6 +33,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
+	INTEL_DISPLAY_WA_14022081154,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
-- 
2.43.0

