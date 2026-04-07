Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37622FF5136
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 19:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6C610E4A7;
	Tue,  7 Apr 2026 19:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9h8hhXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A5410E4A7;
 Tue,  7 Apr 2026 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775590600; x=1807126600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpGb036mXv+n6HuwbmzfWALOoLLooygwU5xL+bQ4GSg=;
 b=Y9h8hhXjk7HDCDvJp9GbnDcNqzl/IHuKNwcEXak+cm/AAI4ByJ07IM+l
 ztlMifiDmSAP983nSWh1ppv6BMX2rkmZ6MqVzaUwS4wv1ehnqDoLJWUII
 K0coHYkKMq40EcKmk/r5Rv6X0jyM/cKb0oM7ZJXUOxPbnT7eU9QPLOL+7
 0+pFI2rO6fSRIqiLI5GYkby76kb4oeOB22DtSvr8ZQ/1natL+FvwxHDHF
 D8rLuia4EuCTON1+MCvGei+i6etTXF2TSjIIbd7anIsQobtQdtib8cRjv
 PAnI+TwTBJrHm+7yjoNforkqTO4ip2n06SUvB/MwF+e0AJfPzI+avKv2Y A==;
X-CSE-ConnectionGUID: Y3q6SX8uR1mKCVx2TAx/nw==
X-CSE-MsgGUID: J/r6Z5CETxykXLVgGUTq8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75602310"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="75602310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:40 -0700
X-CSE-ConnectionGUID: SVRNVnpOTCuH35NlrL1TNw==
X-CSE-MsgGUID: cpNXPjmCRuyfKWb/b5/6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="225083970"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 1/5] drm/i915/mchbar: include intel_mchbar_regs.h from
 intel_mchbar.h
Date: Tue,  7 Apr 2026 22:36:26 +0300
Message-ID: <e44dc2daf3fc39d02c3f598c323caa3c08a54304.1775590536.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775590536.git.jani.nikula@intel.com>
References: <cover.1775590536.git.jani.nikula@intel.com>
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

As an exception to the rule of not including unnecessary headers from
headers, include intel_mchbar_regs.h from intel_mchbar.h. In order to
use the interfaces in intel_mchbar.h you will always have to include the
registers anyway, so the includes are in pairs everywhere. There is zero
asymmetry. Simplify.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

