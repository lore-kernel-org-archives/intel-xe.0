Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C4A109C057
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 18:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B978F10E834;
	Wed, 25 Mar 2026 18:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7ks/CZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761C110E834;
 Wed, 25 Mar 2026 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774464829; x=1806000829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gOu9ys1SMM++xLWZhWPNplbw7UZi88H9A+VkBrYVcK0=;
 b=R7ks/CZ8nlYVtv+CP8CuUXCXnYoEPh55m3WP1WijWoDj8EQPcONEdPsX
 85dFosBJBlUpYpJuJxajmP62ATjKCLWw/WTnRaDh2zJw0U+jjOGOZA3eG
 lyseGtVU+Q+AbqDuUxnmdby0jVtOXpUCGoBUNP6mapgUMBUf2A5nVdY97
 bXeyVGHLGwDva0PEiKdvFb8sqB754MlzCVhS+db78EyOSq4lZlfIbuiio
 F/o1xpTel9gIHOmPAsdvG++bCo+T01SyaoWrF8mrTojwD60pTrIOLwqED
 pS+5K5oac8ENx7sfiynmThcKgnuk/NCJdq3HPDXCYTSwLbF2kVJ6Kq9Xv A==;
X-CSE-ConnectionGUID: QTrquzlERymj/KGnWiOefw==
X-CSE-MsgGUID: xn+samTGRNO3O/vTb3h96w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75399912"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75399912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:53:49 -0700
X-CSE-ConnectionGUID: SKBAMN4sSxmF6OvNLBTx5A==
X-CSE-MsgGUID: 8eRMBdOqRuGAQco0Wg3Cww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221872393"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:53:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/12] drm/i915/qgv: Use intel_de_read() for MTL_MEM_SS_INFO*
 reads
Date: Wed, 25 Mar 2026 20:53:30 +0200
Message-ID: <20260325185342.11482-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The MTL_MEM_SS_INFO* are just regular display registers. Use
intel_de_read() to access them.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c   | 6 +++---
 drivers/gpu/drm/i915/display/intel_dram.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 07b4531a4376..18b80147ddc7 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -9,6 +9,7 @@
 
 #include "intel_bw.h"
 #include "intel_crtc.h"
+#include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -211,12 +212,11 @@ static int icl_pcode_restrict_qgv_points(struct intel_display *display,
 static int mtl_read_qgv_point_info(struct intel_display *display,
 				   struct intel_qgv_point *sp, int point)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
 	u32 val, val2;
 	u16 dclk;
 
-	val = intel_uncore_read(uncore, MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
-	val2 = intel_uncore_read(uncore, MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
+	val = intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_LOW(point));
+	val2 = intel_de_read(display, MTL_MEM_SS_INFO_QGV_POINT_HIGH(point));
 	dclk = REG_FIELD_GET(MTL_DCLK_MASK, val);
 	sp->dclk = DIV_ROUND_CLOSEST(16667 * dclk, 1000);
 	sp->t_rp = REG_FIELD_GET(MTL_TRP_MASK, val);
diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
index bd281d4b4c05..f05796417485 100644
--- a/drivers/gpu/drm/i915/display/intel_dram.c
+++ b/drivers/gpu/drm/i915/display/intel_dram.c
@@ -9,6 +9,7 @@
 #include <drm/drm_print.h>
 #include <drm/intel/intel_pcode_regs.h>
 
+#include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_display_utils.h"
 #include "intel_display_regs.h"
@@ -767,8 +768,7 @@ static int gen12_get_dram_info(struct intel_display *display, struct dram_info *
 
 static int xelpdp_get_dram_info(struct intel_display *display, struct dram_info *dram_info)
 {
-	struct intel_uncore *uncore = to_intel_uncore(display->drm);
-	u32 val = intel_uncore_read(uncore, MTL_MEM_SS_INFO_GLOBAL);
+	u32 val = intel_de_read(display, MTL_MEM_SS_INFO_GLOBAL);
 
 	switch (REG_FIELD_GET(MTL_DDR_TYPE_MASK, val)) {
 	case 0:
-- 
2.52.0

