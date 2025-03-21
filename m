Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42D4C35FFF
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 10:53:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DE010E791;
	Fri, 21 Mar 2025 10:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao/UzpSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463C10E0BC;
 Fri, 21 Mar 2025 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742554403; x=1774090403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Owf0H/vM2DN6YmOzER1r3LXsgpUAp/3UsaScAS1tnSA=;
 b=Ao/UzpSGCDJcAaX6t0erUCX+7E9NezjtAvzSDIAYUetIBCGNcTd/vOwg
 t8HvcbMqHPo2ioK3JKlAi5H2SUzra5jYBADVw6tT3GXTKS4kBFsRDNHok
 NV0wUwB05LcBLlGcx6SfEAQYG6U4e2Vyzi/iwZvDD+MatL6ghGoMP9YZk
 qC3qV7CFCaShZL8DhLetRe+BnHBTf72XrzTCsVDIBsF76XJWjEYsed1ID
 RszLeKdgAw+aTV8HM8oLnLnerD5Q4rGJgBwheXZdQsPvE7gVjjm6fHx3A
 7BBsExdKoNR91mwY5pfzcyolCFcQotyxjsJeVYPgOvXXv/WU8yg8OmIyL Q==;
X-CSE-ConnectionGUID: 0I44S5DJQ6e0PTdnwQ4qjw==
X-CSE-MsgGUID: /l0vLAkgRPC72Ac/7NtD+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54483901"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="54483901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:53:23 -0700
X-CSE-ConnectionGUID: edAZMGQ8S/Cc/N445S5jAw==
X-CSE-MsgGUID: Li5Wfs63SYmoFuKuwHulvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123830035"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:53:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 05/12] drm/i915/dsi: convert intel_dsi_dcs_backlight.c to
 struct intel_display
Date: Fri, 21 Mar 2025 12:52:49 +0200
Message-Id: <19ed78f51ac153016fbe60c49037bef840a9cc1b.1742554320.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1742554320.git.jani.nikula@intel.com>
References: <cover.1742554320.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Going forward, struct intel_display is the main display device data
pointer. Convert intel_dsi_dcs_backlight.c to struct intel_display.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
index 049443245310..b3c453bf7d5c 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.c
@@ -24,9 +24,10 @@
  */
 
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
-#include "i915_drv.h"
+#include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_dsi.h"
 #include "intel_dsi_dcs_backlight.h"
@@ -162,7 +163,7 @@ static void dcs_enable_backlight(const struct intel_crtc_state *crtc_state,
 static int dcs_setup_backlight(struct intel_connector *connector,
 			       enum pipe unused)
 {
-	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_display *display = to_intel_display(connector);
 	struct intel_panel *panel = &connector->panel;
 
 	if (panel->vbt.backlight.brightness_precision_bits > 8)
@@ -172,7 +173,7 @@ static int dcs_setup_backlight(struct intel_connector *connector,
 
 	panel->backlight.level = panel->backlight.max;
 
-	drm_dbg_kms(&i915->drm,
+	drm_dbg_kms(display->drm,
 		    "[CONNECTOR:%d:%s] Using DCS for backlight control\n",
 		    connector->base.base.id, connector->base.name);
 
-- 
2.39.5

