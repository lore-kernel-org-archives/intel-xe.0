Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E70C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3553A10E07E;
	Fri,  3 Mar 2023 10:52:41 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5A410E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840759; x=1709376759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NtspOSAne8VpjmB0wKUtdsRvfmF9FHM+VVDYJEne5OM=;
 b=k4lOrYVXkCyJj/q5u2fg7cgP3mHJ1Qjhcgv9evpB13d9wLaKhabIxsfv
 5kISxqnxD+0pH40iOwnvBMcxq6fbVcW/AEmvFSWwM96Rn0uLmusuvhzap
 eNk9X04yJaFOJoc7H48KLdEu1d2oqdsVRmHg4qUhKfYiGV+jCQ0KmTNHo
 QNYVuw0OK2RNW1iuCedDi7RkOi6jXK9HWFA1enNMW3whgavpG2lh+bvxP
 7q4WZxqUENadj/kwONnvY0Qws85gqI7bMZl219fO2sOYC1Pp1U2sOHTBy
 jwdLTuHUzDg2Iw3UpZfTnn+HUfdgKaKvhXJeX1gD02zpZL45NfjH4KklP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337332391"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="337332391"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004542647"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004542647"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:16 +0200
Message-Id: <20230303105222.3550161-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/8] drm/i915/display: drop redundant display/
 from includes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Already done in upstream i915 by commit cfc10489828a ("drm/i915/display:
drop redundant display/ from #includes").

Note: This would be dropped when rebasing against upstream.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 48 ++++++++++----------
 drivers/gpu/drm/i915/display/intel_psr.c     |  2 +-
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5a0a8179b0dc..81c50b6f1b5e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -45,32 +45,32 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 
-#include "display/intel_audio.h"
-#include "display/intel_backlight.h"
-#include "display/intel_ddi.h"
-#include "display/intel_display_debugfs.h"
-#include "display/intel_display_power.h"
-#include "display/intel_dp.h"
-#include "display/intel_dp_mst.h"
-#include "display/intel_dpll.h"
-#include "display/intel_dpll_mgr.h"
-#include "display/intel_drrs.h"
-#include "display/intel_dsb.h"
-#include "display/intel_dsi.h"
-#include "display/intel_fb.h"
-#include "display/intel_gmbus.h"
-#include "display/intel_hdmi.h"
-#include "display/intel_lvds.h"
-#include "display/intel_snps_phy.h"
-#include "display/intel_vdsc.h"
-#include "display/intel_vrr.h"
+#include "intel_audio.h"
+#include "intel_backlight.h"
+#include "intel_ddi.h"
+#include "intel_display_debugfs.h"
+#include "intel_display_power.h"
+#include "intel_dp.h"
+#include "intel_dp_mst.h"
+#include "intel_dpll.h"
+#include "intel_dpll_mgr.h"
+#include "intel_drrs.h"
+#include "intel_dsb.h"
+#include "intel_dsi.h"
+#include "intel_fb.h"
+#include "intel_gmbus.h"
+#include "intel_hdmi.h"
+#include "intel_lvds.h"
+#include "intel_snps_phy.h"
+#include "intel_vdsc.h"
+#include "intel_vrr.h"
 
 #ifdef I915
-#include "display/intel_crt.h"
-#include "display/intel_dvo.h"
-#include "display/intel_overlay.h"
-#include "display/intel_sdvo.h"
-#include "display/intel_tv.h"
+#include "intel_crt.h"
+#include "intel_dvo.h"
+#include "intel_overlay.h"
+#include "intel_sdvo.h"
+#include "intel_tv.h"
 
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_object.h"
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index bc998b526d88..195ddafdb522 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -24,7 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 
-#include "display/intel_dp.h"
+#include "intel_dp.h"
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-- 
2.39.1

