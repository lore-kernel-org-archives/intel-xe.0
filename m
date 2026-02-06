Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE22EE2084
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 12:14:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D61910E71F;
	Fri,  6 Feb 2026 12:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIT2d4vL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD7C10E78B;
 Fri,  6 Feb 2026 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770380045; x=1801916045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fgz3X/1OCTFAyBydvQlxSpHnwnYQ/HiBKpcyjF59f40=;
 b=eIT2d4vLH5Fk9G+dOLUvsVbBZCJNSK07pOoZMyfFywlfGe4DaAnTb6KM
 YkKRzGgTGEVufko1os8h4wWAFtolh7sjuqhMdfcahCjfmo01ghiqmJDwf
 tQ14s0sK9NR2/gSyAds0ygXZHg9LRZ331uIZFgzdI7xIOMWQzs7uGhD34
 T7V9ZeS/oWfayM1aCo/XVKK98UJT5y61TI5IAL1GIfNy+Pj9q2Bj6X5xF
 yjGK3P0i/R+aGB3rnmVKfPwYsvtUhzTivD0UQz/2VtMu8hh+yH1vhXCns
 sTk9d10QLo/fF54cTFDyjrsFYV5DnqYhStOKxnolCkWnl3eSORg6kK9WW A==;
X-CSE-ConnectionGUID: QmIPXeldQ4KmYBu9P6URyA==
X-CSE-MsgGUID: nbTGHRVSTSOj0YFh8GsKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71765214"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71765214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:14:04 -0800
X-CSE-ConnectionGUID: gjC/jLTpSE6VHYu4mbKANQ==
X-CSE-MsgGUID: DXNwI6TOS92xVJrsAOwQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248472623"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:14:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 06/10] drm/i915/dpt: drop _common from the DPT file names
Date: Fri,  6 Feb 2026 14:13:27 +0200
Message-ID: <56b16bc75de44af0c235a3505528f0eaabaf7133.1770379986.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770379986.git.jani.nikula@intel.com>
References: <cover.1770379986.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

With the intel_dpt.[ch] file names vacated, and i915 specific code moved
away, we can rename the intel_dpt_common.[ch] files to the simpler name.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile                                   | 2 +-
 drivers/gpu/drm/i915/display/intel_display.c                    | 2 +-
 .../gpu/drm/i915/display/{intel_dpt_common.c => intel_dpt.c}    | 2 +-
 .../gpu/drm/i915/display/{intel_dpt_common.h => intel_dpt.h}    | 0
 drivers/gpu/drm/i915/i915_driver.c                              | 2 +-
 drivers/gpu/drm/xe/Makefile                                     | 2 +-
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/gpu/drm/i915/display/{intel_dpt_common.c => intel_dpt.c} (98%)
 rename drivers/gpu/drm/i915/display/{intel_dpt_common.h => intel_dpt.h} (100%)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1d71ecb3ca83..5497249d9e2a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -271,7 +271,7 @@ i915-y += \
 	display/intel_dpio_phy.o \
 	display/intel_dpll.o \
 	display/intel_dpll_mgr.o \
-	display/intel_dpt_common.o \
+	display/intel_dpt.o \
 	display/intel_dram.o \
 	display/intel_drrs.o \
 	display/intel_dsb.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6df7593c29d5..3a57baee990d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -85,7 +85,7 @@
 #include "intel_dp_tunnel.h"
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
-#include "intel_dpt_common.h"
+#include "intel_dpt.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
 #include "intel_dsi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt.c
similarity index 98%
rename from drivers/gpu/drm/i915/display/intel_dpt_common.c
rename to drivers/gpu/drm/i915/display/intel_dpt.c
index 6551318b037b..dffd500d378e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt_common.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -6,7 +6,7 @@
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
-#include "intel_dpt_common.h"
+#include "intel_dpt.h"
 #include "intel_parent.h"
 #include "skl_universal_plane_regs.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.h b/drivers/gpu/drm/i915/display/intel_dpt.h
similarity index 100%
rename from drivers/gpu/drm/i915/display/intel_dpt_common.h
rename to drivers/gpu/drm/i915/display/intel_dpt.h
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e1c73f626b32..d4f71d02b90e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -58,7 +58,7 @@
 #include "display/intel_display_power.h"
 #include "display/intel_dmc.h"
 #include "display/intel_dp.h"
-#include "display/intel_dpt_common.h"
+#include "display/intel_dpt.h"
 #include "display/intel_dram.h"
 #include "display/intel_encoder.h"
 #include "display/intel_fbdev.h"
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 41ec698b3cc1..8fc0c3678944 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -275,7 +275,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_dp_test.o \
 	i915-display/intel_dpll.o \
 	i915-display/intel_dpll_mgr.o \
-	i915-display/intel_dpt_common.o \
+	i915-display/intel_dpt.o \
 	i915-display/intel_dram.o \
 	i915-display/intel_drrs.o \
 	i915-display/intel_dsb.o \
-- 
2.47.3

