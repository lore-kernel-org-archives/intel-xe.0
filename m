Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B773E109B494
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 15:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D1010EA6C;
	Tue, 31 Mar 2026 15:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAr1csUS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E735B10EA6C;
 Tue, 31 Mar 2026 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774971805; x=1806507805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u02iRdzxhFi7pQJv3jgp4IJ6sKaAAeenOo+6zSCL4WU=;
 b=dAr1csUS+/DHN/e/Jm92DJVsfXVGZOff2TCqbvp3uHvbBgLnyEVAcyvx
 JS/DlmFlZmRrzHDzrQBqsse+LbkdkRhozmFKSZWKL2ppcqcV+vNQPRYCv
 oZ0vq3JdQoRem1SMv5wMZDcrwkaYxQA1J1fVZFrMVS+7DCN2XCJwB1eeV
 qdbD87uP4yYDqKdlAlXibrnrMR8p9EV8m9TYXPshl72Q8bhz/A3Yj6WdL
 XLlkLSVn/PhdphsdzTdtua3KmxjJMSs4YjRbxUFF9z4ygWeHW76kXkrRR
 uycxR1z6CUpjnN4Vm7mQT2IpjjVL57CLREJwBK733QUE3EGIdMBGcQubO g==;
X-CSE-ConnectionGUID: rW1cFu98Q5+WeL69xpkqsg==
X-CSE-MsgGUID: a6oBO0odTSqadDeMbw/n1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75884139"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75884139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:25 -0700
X-CSE-ConnectionGUID: MjryH6vJRjePh/TCfpUXHQ==
X-CSE-MsgGUID: 0VDjswlySFWIz1+DTj/MWg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:22 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/12] drm/i915/mchbar: Use intel_mchbar_read() instead of
 intel_de_read()
Date: Tue, 31 Mar 2026 18:42:52 +0300
Message-ID: <20260331154259.24600-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
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

We are doing a few accesses to MCHBAR registers with intel_de_read().
Use the dedicated intel_mchbar_read() instead.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 5 +++--
 drivers/gpu/drm/i915/display/intel_display_power.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index a47736613f6e..3a84c95474c6 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -41,6 +41,7 @@
 #include "intel_display_utils.h"
 #include "intel_display_wa.h"
 #include "intel_dram.h"
+#include "intel_mchbar.h"
 #include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "intel_pci_config.h"
@@ -376,8 +377,8 @@ static unsigned int intel_hpll_vco(struct intel_display *display)
 	else
 		return 0;
 
-	tmp = intel_de_read(display, display->platform.pineview ||
-			    display->platform.mobile ? HPLLVCO_MOBILE : HPLLVCO);
+	tmp = intel_mchbar_read(display, display->platform.pineview ||
+				display->platform.mobile ? HPLLVCO_MOBILE : HPLLVCO);
 
 	vco = vco_table[tmp & 0x7];
 	if (vco == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index ec96b141c74c..8da2990395e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -24,6 +24,7 @@
 #include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_dram.h"
+#include "intel_mchbar.h"
 #include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "intel_pch_refclk.h"
@@ -1252,7 +1253,7 @@ static void assert_can_disable_lcpll(struct intel_display *display)
 static u32 hsw_read_dcomp(struct intel_display *display)
 {
 	if (display->platform.haswell)
-		return intel_de_read(display, D_COMP_HSW);
+		return intel_mchbar_read(display, D_COMP_HSW);
 	else
 		return intel_de_read(display, D_COMP_BDW);
 }
-- 
2.52.0

