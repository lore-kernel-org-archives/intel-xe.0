Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0FEDF151
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 10:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDE310E7D6;
	Fri, 13 Feb 2026 10:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGd9Bkr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2788F10E7DD;
 Fri, 13 Feb 2026 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770978325; x=1802514325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8A/bZqMlpWE+nc1ekIe3WmPN6kBT2aGp+QFjoDnBA/M=;
 b=fGd9Bkr6TX1TY7jIKSyyoM7DrT+1wpf1pew2jeQRmCWPXrOn/m4eg/MP
 +mhWPR3DQQc7f+knd4e0qOPANLjf/4RlkPJAB/evPLe2AZ2HgX6gh5yqU
 xv5/iRznJwQZbmallLA5xfuCa/G/eHVFaoPLpTqul83uAisXb/hROOBTL
 0u1zSMFCk9JmKtUf0hYMlWjcbX8/e2um3QB2n+fgTSQ+1Y1qGYHrxfwjp
 /iODTZ6THbrdHI1f36Cfze7J+lubI3MrUTCgLTjftIWhgUASDM3vRGymp
 t9EJzSpm2/3yBEJy96G4Rh3X03SjrWNbMlHDTPUyJ5XlukwXJlgusZWA2 A==;
X-CSE-ConnectionGUID: z27u45D7R2eh6V0TSk5OOg==
X-CSE-MsgGUID: q+HrOShXQ7aPZR5es3aODA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72150689"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72150689"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:25 -0800
X-CSE-ConnectionGUID: sgOXx0WkSkG03y9ubQRuUQ==
X-CSE-MsgGUID: FX76+zm8RzCpqXSW1ovg9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212919666"
Received: from abityuts-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:25:24 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 08/16] drm/i915/display: convert W/As in
 intel_display_device.c to new framework
Date: Fri, 13 Feb 2026 12:23:36 +0200
Message-ID: <20260213102500.406925-9-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260213102500.406925-1-luciano.coelho@intel.com>
References: <20260213102500.406925-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_display_wa.c     | 3 +++
 drivers/gpu/drm/i915/display/intel_display_wa.h     | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index e79913a858b3..dcfeafadb97a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -19,6 +19,7 @@
 #include "intel_display_reg_defs.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_fbc.h"
 #include "intel_step.h"
 
@@ -1773,7 +1774,7 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
 		display_runtime->port_mask |= BIT(PORT_F);
 
 	/* Wa_14011765242: adl-s A0,A1 */
-	if (display->platform.alderlake_s && IS_DISPLAY_STEP(display, STEP_A0, STEP_A2))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011765242))
 		for_each_pipe(display, pipe)
 			display_runtime->num_scalers[pipe] = 0;
 	else if (DISPLAY_VER(display) >= 11) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index f51e5a86164b..2934331d905f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -91,6 +91,9 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VER(display) == 13;
 	case INTEL_DISPLAY_WA_14011508470:
 		return (IS_DISPLAY_VERx100(display, 1200, 1300));
+	case INTEL_DISPLAY_WA_14011765242:
+		return display->platform.alderlake_s &&
+			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index a9346e763112..b781a3c6d803 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -35,6 +35,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011503030,
 	INTEL_DISPLAY_WA_14011503117,
 	INTEL_DISPLAY_WA_14011508470,
+	INTEL_DISPLAY_WA_14011765242,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
-- 
2.51.0

