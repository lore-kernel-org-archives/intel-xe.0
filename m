Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EAFCFA777
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 11:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50410E862;
	Fri, 21 Nov 2025 11:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2ODcQpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3BE10E861;
 Fri, 21 Nov 2025 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763724128; x=1795260128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IfgCr2A0AW2+if39k67kAV3A8HQEz9YVxlUOeIAyfRY=;
 b=W2ODcQpEzsOGg9BvvcfcC2KJGF5OZb2UQBbH59hhsp7JLUuU7nf1h6rv
 PbuyP/g/emiSnSC6aVyfjzVQnTD6TibFe1JTjQvYXNxeLNbfutKGxk3Xp
 KMV5V62WNck5Q8cAaX5D/SF66vY1n0V/xIsngQIUqyStezWXxC8OoT0yC
 7qYcs1YGaMpSgJ1FR7/rAIwQJNgOYaGNodBMOMzi156pljfcWjaO0LDMA
 JtXt5y+l4IzGxzpQe2AvFKs1aOmWaH0DZlQi6hYyqX+QvU9MCX6uIyKe4
 ll/6F4EUATByKhEx14VdKistKxkEc0AyZeFtioDc9AZ8ecpRc7gMVmqUM Q==;
X-CSE-ConnectionGUID: EVreqvPZQCaOJES4F/HWYA==
X-CSE-MsgGUID: knEPcaTYTXyRde1bFxwmjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65760223"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="65760223"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:22:08 -0800
X-CSE-ConnectionGUID: EM3pr0/HQDKnvDcZXFCktg==
X-CSE-MsgGUID: 825A4xGeQs2a/6Ou/mDquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191917125"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:22:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/i915/cdclk: drop i915_drv.h include
Date: Fri, 21 Nov 2025 13:21:59 +0200
Message-ID: <20251121112200.3435099-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

intel_cdclk.c no longer needs i915_drv.h. Drop it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 5c90e53b4e46..69a79ccdd1ba 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -29,7 +29,6 @@
 #include <drm/drm_print.h>
 
 #include "hsw_ips.h"
-#include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_audio.h"
@@ -46,6 +45,7 @@
 #include "intel_pcode.h"
 #include "intel_plane.h"
 #include "intel_psr.h"
+#include "intel_step.h"
 #include "intel_vdsc.h"
 #include "skl_watermark.h"
 #include "skl_watermark_regs.h"
-- 
2.47.3

