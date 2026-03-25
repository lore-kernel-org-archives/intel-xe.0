Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFA109C059
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 18:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBFA10E851;
	Wed, 25 Mar 2026 18:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqmpNCUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C19110E84E;
 Wed, 25 Mar 2026 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774464845; x=1806000845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EK2P9ygcelMhAZcZqFCOD3BIGIMMM0QUu4Ge5WppJGI=;
 b=XqmpNCUrj3lSW97jJu4NeKZjSkHpqbWFlVtWtzSJg16sHBKZSEypOIg0
 aafm/PEE7dEmyg1JhOScKLqoN3/9MECIH4JDQf4SPgRJYpoo9qDu20n1B
 eb4yif0uYuF6JS6O95E0vXBg7tDc0KoBGtbO2S9INYdq9Wl1njvEywyZX
 elyBJ7s+nWTkyl6lDc2awum2YoLqrUKS5DwQ0/mCjbQiAiDiu2pWQa6YA
 fUgE69Jh6Ho3JX30IwlSBIc3eep4YEvSOeWsL5Dx+/9T6IvKGqVllhrQ/
 apU+gceSK0txRLf6eSlZ4LgW/iCjy3vmRK6orKnLy2pOPyoG2vrpWHHef A==;
X-CSE-ConnectionGUID: 1XYMbRd6R0ubQzxuNESE0A==
X-CSE-MsgGUID: /cU7r9p4R2enzNTt8zqrjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75399976"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75399976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:04 -0700
X-CSE-ConnectionGUID: eSjzttHkQ8ai/sbDSw1dhQ==
X-CSE-MsgGUID: +Pr62d7xRzWPIouGxcZwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221872434"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/12] drm/i915/mchbar: Use intel_mchbar_read() instead of
 intel_de_read()
Date: Wed, 25 Mar 2026 20:53:34 +0200
Message-ID: <20260325185342.11482-6-ville.syrjala@linux.intel.com>
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

We are doing a few accesses to MCHBAR registers with intel_de_read().
Use the dedicated intel_mchbar_read() instead.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 5 +++--
 drivers/gpu/drm/i915/display/intel_display_power.c | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 121a12c5b8ac..2a17e9b22740 100644
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

