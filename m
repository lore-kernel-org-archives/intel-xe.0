Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CBBEDB7F6
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0C710E3DE;
	Tue,  7 Apr 2026 10:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/UWtiUc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF57910E3E5;
 Tue,  7 Apr 2026 10:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775559473; x=1807095473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3toR1SseGrGYdv0n7ktzNZLrKucF12Or7xEZyI4//Pk=;
 b=i/UWtiUckxSmc53oM7BHnG5gBugFRSt7OgvsHtYDTHk9i2JogmAP1aH+
 a4EZSNdkj695rOGkuLEJzbG07GcKGiQO0XErsUVq7TyTsZgXWLoxjxTA9
 Mbo4WkVqG+S3t6GbWGSTD+xz/A+Mx/y7eKKnNkN52OYhUWw5suXyHSpfn
 /ddFCeMbxF5YDlrpJjwBEkkM5fa+t7N0XfAJBDYMixUbv9kpxtHIC//rW
 NzLFGe1D/W/Wfel+Ar83KnHIgFA1+mjFItO3sIvqWip7w5SLXL6lRuoXG
 ZPs2fHUL/J+Ow95UnHzR8IDlJHAyId6myGGz0JVkeX/s+nvaKdNlmGxwm w==;
X-CSE-ConnectionGUID: VRcUPWW6SQyIug42ipBc/w==
X-CSE-MsgGUID: m7WF5pyTSs+k7uJP2zADQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94099415"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="94099415"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:57:52 -0700
X-CSE-ConnectionGUID: 0irVqmVpQaCL0J3sdz/sIA==
X-CSE-MsgGUID: sXQw5T68QbqXJA81I0K/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="233109314"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:57:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/3] drm/i915/mchbar: include intel_mchbar_regs.h from
 intel_mchbar.h
Date: Tue,  7 Apr 2026 13:57:40 +0300
Message-ID: <591ac112d10fd9d75691020e31b07e89086f1416.1775559414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775559414.git.jani.nikula@intel.com>
References: <cover.1775559414.git.jani.nikula@intel.com>
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

As an exception to the rule of not including unnecessary headers from
headers, include intel_mchbar_regs.h from intel_mchbar.h. In order to
use the interfaces in intel_mchbar.h you will always have to include the
registers anyway, so the includes are in pairs everywhere. There is zero
asymmetry. Simplify.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/i9xx_wm.c             | 1 -
 drivers/gpu/drm/i915/display/intel_bw.c            | 1 -
 drivers/gpu/drm/i915/display/intel_cdclk.c         | 1 -
 drivers/gpu/drm/i915/display/intel_display_power.c | 1 -
 drivers/gpu/drm/i915/display/intel_dram.c          | 1 -
 drivers/gpu/drm/i915/display/intel_mchbar.c        | 1 -
 drivers/gpu/drm/i915/display/intel_mchbar.h        | 1 +
 7 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index 3dbfb850fe1d..02ac6f9a3d0e 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -20,7 +20,6 @@
 #include "intel_dram.h"
 #include "intel_fb.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 #include "intel_wm.h"
 #include "skl_watermark.h"
 #include "vlv_sideband.h"
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index e6c8fd630294..474438fc1ebc 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -16,7 +16,6 @@
 #include "intel_display_utils.h"
 #include "intel_dram.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "skl_watermark.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 835a332e9686..82955cf16c4c 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -42,7 +42,6 @@
 #include "intel_display_wa.h"
 #include "intel_dram.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "intel_pci_config.h"
 #include "intel_plane.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 98e5a794fab7..4091b7c4914f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -25,7 +25,6 @@
 #include "intel_dmc.h"
 #include "intel_dram.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "intel_pch_refclk.h"
 #include "intel_pmdemand.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
index 2079c63e3649..f103f7cba018 100644
--- a/drivers/gpu/drm/i915/display/intel_dram.c
+++ b/drivers/gpu/drm/i915/display/intel_dram.c
@@ -15,7 +15,6 @@
 #include "intel_display_regs.h"
 #include "intel_dram.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 #include "intel_parent.h"
 #include "vlv_sideband.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_mchbar.c b/drivers/gpu/drm/i915/display/intel_mchbar.c
index 16fcfe1e93ec..a0d0a796c6bb 100644
--- a/drivers/gpu/drm/i915/display/intel_mchbar.c
+++ b/drivers/gpu/drm/i915/display/intel_mchbar.c
@@ -10,7 +10,6 @@
 #include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_mchbar.h"
-#include "intel_mchbar_regs.h"
 
 static bool has_mchbar_mirror(struct intel_display *display)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_mchbar.h b/drivers/gpu/drm/i915/display/intel_mchbar.h
index 002a4454e8ed..51ecd6075bdf 100644
--- a/drivers/gpu/drm/i915/display/intel_mchbar.h
+++ b/drivers/gpu/drm/i915/display/intel_mchbar.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 #include "i915_reg_defs.h"
+#include "intel_mchbar_regs.h"
 
 struct intel_display;
 
-- 
2.47.3

