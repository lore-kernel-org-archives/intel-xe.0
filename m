Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6DBC4450A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 14:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93CC10F0D1;
	Wed, 15 Jul 2026 14:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPqkc7AT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2C110F0D1;
 Wed, 15 Jul 2026 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784124822; x=1815660822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qDFIQ49RFGU38zjGiqt49/Uuks398IxFftHgviLP6dU=;
 b=lPqkc7ATKvEFtMdUNP1Q4Zb1US1UJr2vU6JhBgKaheKLUcCzsduQ2qXz
 Lpg/w4Y8tdfWlzVy1LdDEbyWKZNsrmeH33vQomY/j2van0NmXq3Us3aiW
 P5RQdqoCWzsRhnRMzks71X17YJN0KAzdze1uqim+smy0G6wjSWCMAz9ur
 bprutw20Uc1dSb8WzmsY+Tf+PMQKnEyEG5YYs8D2EaCieAbIPu+VD1ger
 hVfaG8O93K0DrmORO7OZcjKmZw1dms32d90AB5y74oMcEY9m+gJhqlpdN
 WvWreiTTtOjXvtStBaq+Xsk+7rRkb07RRecPASmAb74hNJwPWPh+aEXwA w==;
X-CSE-ConnectionGUID: WFdLODuZTp+nAyW+PbNLew==
X-CSE-MsgGUID: oLWDpM8kTBCCOVZkFU5sVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="110310298"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="110310298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 07:13:42 -0700
X-CSE-ConnectionGUID: o7fscxxAT5yknsnxB4LIxA==
X-CSE-MsgGUID: j7ATkMURROKbaXgIYz7bUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="260008535"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 07:13:40 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, suraj.kandpal@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 1/2] drm/i915/xe3p/dram: Interpret 0xF populated-channel count as
 16
Date: Wed, 15 Jul 2026 20:02:42 +0530
Message-ID: <20260715143243.4141208-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715143243.4141208-1-uma.shankar@intel.com>
References: <20260715143243.4141208-1-uma.shankar@intel.com>
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

Wa_16030862157:
Interpret 0xF populated-channel count as 16
The register MEM_SS_INFO_GLOBAL [Number of populated channels] field
definition is updated with an encoding for 16 channels.

For 16-channel configuration, program 1111b. A programmed value of 1111b
must be interpreted as 16 channels for memory bandwidth calculations.

The MEM_SS_INFO_GLOBAL populated-channel field is only 4 bits and cannot
encode 16, so on Xe3p the BIOS programs the saturated field value (0xf)
to indicate the fully-populated 16-channel config (4 memory controllers
x 4 channels). Interpret it as 16 and let the bandwidth math handle the
larger channel count.

v2: Limit the WA only till NVL (Suraj)
    Logical separation of WA (Vinod)

WA: 16030862157, 16030875223
Bspec: 69131, 79482

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c |  2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
 drivers/gpu/drm/i915/display/intel_dram.c       | 14 +++++++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index b4c49816f7eb..3662e0f17c69 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -140,6 +140,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 						STEP_A0, STEP_B0);
 	case INTEL_DISPLAY_WA_16029024088:
 		return DISPLAY_VER(display) >= 35;
+	case INTEL_DISPLAY_WA_16030862157:
+		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_18034343758:
 		return DISPLAY_VER(display) == 20 ||
 			(display->platform.pantherlake &&
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 92b3980bea84..338b32e4162d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -54,6 +54,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_16025596647,
 	INTEL_DISPLAY_WA_16029024088,
+	INTEL_DISPLAY_WA_16030862157,
 	INTEL_DISPLAY_WA_18034343758,
 	INTEL_DISPLAY_WA_22010178259,
 	INTEL_DISPLAY_WA_22010947358,
diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
index f103f7cba018..0763d0bfd98e 100644
--- a/drivers/gpu/drm/i915/display/intel_dram.c
+++ b/drivers/gpu/drm/i915/display/intel_dram.c
@@ -13,6 +13,7 @@
 #include "intel_display_core.h"
 #include "intel_display_utils.h"
 #include "intel_display_regs.h"
+#include "intel_display_wa.h"
 #include "intel_dram.h"
 #include "intel_mchbar.h"
 #include "intel_parent.h"
@@ -794,7 +795,18 @@ static int xelpdp_get_dram_info(struct intel_display *display, struct dram_info
 
 	dram_info->num_channels = REG_FIELD_GET(MTL_N_OF_POPULATED_CH_MASK, val);
 	dram_info->num_qgv_points = REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
-	/* PSF GV points not supported in D14+ */
+
+	/*
+	 * Wa_16030862157
+	 * MEM_SS_INFO_GLOBAL populated-channel field is only 4 bits and
+	 * cannot encode 16, so on Xe3p the BIOS programs the saturated field
+	 * value (0xf) to indicate the fully-populated 16-channel config (4
+	 * memory controllers x 4 channels). Interpret it as 16.
+	 */
+
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_16030862157) &&
+	    dram_info->num_channels == REG_FIELD_MAX(MTL_N_OF_POPULATED_CH_MASK))
+		dram_info->num_channels = 16;
 
 	if (DISPLAY_VER(display) >= 35)
 		dram_info->ecc_impacting_de_bw = REG_FIELD_GET(XE3P_ECC_IMPACTING_DE, val);
-- 
2.50.1

