Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9B3C98328
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 06:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1561310E797;
	Mon, 28 Sep 2026 06:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWG5rO+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFAD10E797;
 Mon, 28 Sep 2026 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790575939; x=1822111939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3u3nVrjL6T1VCqx3eY9XonJ8BPDsUH3Ksoo11vukONo=;
 b=iWG5rO+kTXg1VDKq155kxLRLgfuCQOwtbfsc1o+GB7uDRog4YoEIiuzd
 csz9ol+acJqt4RuaHKWKkKL3oxyJ4UMSEg4W0cE2mlV1qZgRxbXQsq4QB
 S5gbQTkgpKIWDQaXVPm0XcwrMSW0wAUHVK0107rW9gZMC0J4yTSpngMMl
 WJj0YqxYJjW6XUSjKkIzSqnRmrQLDtX3I7Js2ZfidYsMNl6vzYDJheVPU
 9KzJrmtGTf47xStEFlwvZYtaDZfgmNh6BzTgeMJQVwoqwwuMJ6ij3Qoqk
 lvhzoYTemlHMo2dYI4FZ7jwvKnfrJdR/4JVk3HDHU15QfLJXGcXLZs+70 A==;
X-CSE-ConnectionGUID: axw16GhBSUibDTcuJt8KJQ==
X-CSE-MsgGUID: r+TCTn3ASUKIoQHj7Fc7nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="93979560"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="93979560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 23:12:18 -0700
X-CSE-ConnectionGUID: fADz1LgYTsO0ILk8tfaMrw==
X-CSE-MsgGUID: iQJiNFvLREaMjjhpmEMDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="312874146"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 23:12:17 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.comm,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/pps: Don't block DC states while the VDD override is
 held
Date: Mon, 28 Sep 2026 11:42:11 +0530
Message-Id: <20260928061211.2764543-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

intel_pps_vdd_on_unlocked() takes the AUX power domain and holds it until
edp_panel_vdd_schedule_off() drops it, panel_power_cycle_delay * 5 ms after
the last AUX transfer. That is seconds on a typical panel.
The AUX domains now block DC states on Xe3p_LPD, so that reference keeps
DC_off up for all of it. DC3co arms with a 1 ms put delay and never gets a
window, and its residency counter does not increment.
Nothing in the panel power sequence needs DC states off for as long as the
override is held. Take AUX IO instead, which powers up the same well
without blocking DC states, the same split intel_ddi_main_link_aux_domain()
makes for PSR. AUX transfers still take the DC state blocking domain around
each transfer.

Bspec: 49277
Fixes: 2827c44f148c ("drm/i915/xe3plpd: Map AUX power domains to DC_off")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pps.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index d4c98b150fa2..bdbaa10bce23 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -11,6 +11,7 @@
 #include "g4x_dp.h"
 #include "intel_de.h"
 #include "intel_display_jiffies.h"
+#include "intel_display_power.h"
 #include "intel_display_power_well.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -734,6 +735,18 @@ static  u32 ilk_get_pp_control(struct intel_dp *intel_dp)
 	return control;
 }
 
+static enum intel_display_power_domain
+intel_pps_vdd_power_domain(struct intel_dp *intel_dp)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+
+	if (DISPLAY_VER(display) >= 35 && !intel_encoder_is_tc(&dig_port->base))
+		return intel_display_power_aux_io_domain(display, dig_port->aux_ch);
+
+	return intel_aux_power_domain(dig_port);
+}
+
 /*
  * Must be paired with intel_pps_vdd_off_unlocked().
  * Must hold pps_mutex around the whole on/off sequence.
@@ -760,7 +773,7 @@ bool intel_pps_vdd_on_unlocked(struct intel_dp *intel_dp)
 
 	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
 	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
-							    intel_aux_power_domain(dig_port));
+							    intel_pps_vdd_power_domain(intel_dp));
 
 	pp_stat_reg = _pp_stat_reg(intel_dp);
 	pp_ctrl_reg = _pp_ctrl_reg(intel_dp);
@@ -862,7 +875,7 @@ static void intel_pps_vdd_off_sync_unlocked(struct intel_dp *intel_dp)
 	}
 
 	intel_display_power_put(display,
-				intel_aux_power_domain(dig_port),
+				intel_pps_vdd_power_domain(intel_dp),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
 }
 
@@ -1064,7 +1077,7 @@ void intel_pps_off_unlocked(struct intel_dp *intel_dp)
 
 	/* We got a reference when we enabled the VDD. */
 	intel_display_power_put(display,
-				intel_aux_power_domain(dig_port),
+				intel_pps_vdd_power_domain(intel_dp),
 				fetch_and_zero(&intel_dp->pps.vdd_wakeref));
 }
 
@@ -1336,7 +1349,7 @@ static void pps_vdd_init(struct intel_dp *intel_dp)
 		    pps_name(intel_dp));
 	drm_WARN_ON(display->drm, intel_dp->pps.vdd_wakeref);
 	intel_dp->pps.vdd_wakeref = intel_display_power_get(display,
-							    intel_aux_power_domain(dig_port));
+							    intel_pps_vdd_power_domain(intel_dp));
 }
 
 bool intel_pps_have_panel_power_or_vdd(struct intel_dp *intel_dp)
-- 
2.34.1

