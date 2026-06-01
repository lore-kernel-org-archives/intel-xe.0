Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E70CD6E55
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B411130E3;
	Mon,  1 Jun 2026 10:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS6U72Ek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6753113194;
 Mon,  1 Jun 2026 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310126; x=1811846126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufK8bbdV/PFgIR1iNHOV++mXiDSjhHJGDPn3rIFm/70=;
 b=MS6U72EkhxbpvdE4lQZftzKdUn+p2PLbSGFNhYGFQ9bZk0cHJRtQKz+B
 AOiDi9zlCtfGEs/Uwp+z65XSWVR0sIvM0JY87eXhvcTMkzI2AnVwAntqN
 PiJbvJ0Dp985b7h5NoJN6Jwf/LsNreG3OHOWt3hRxT2MPJYxn45v+YlaL
 NIkiWy+jjPMrb5ZZyBRS08YDqYLkokhNWYnkk4L4Bc+XOCxEXqIEAytbA
 Oy80iFXniMWTmTetcLPxNlhS/bR3ktswGbLWxOI/elRel6R0KzCJzI++z
 iOSDi7vkvXDTVZMUxTYBwdDQWBjvPf+9qAHbbXkU6C3j3EERzSosff8tT A==;
X-CSE-ConnectionGUID: LXVHzsnlSYCgb/DrpM5awA==
X-CSE-MsgGUID: qFdwSTI8QlSMJponTYRvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797245"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:26 -0700
X-CSE-ConnectionGUID: Y738e6S7SB2dhu5vLFyjow==
X-CSE-MsgGUID: xrZdIhouQKa4PZHdOWrN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728461"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 3/5] drm/i915: add flush_workqueue(display->wq.cleanup) on
 shutdown
Date: Mon,  1 Jun 2026 13:34:58 +0300
Message-ID: <047afe4f8589d4391b95dfc4bff084292ba3bf32.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
References: <cover.1780310011.git.jani.nikula@intel.com>
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

We're missing the cleanup workqueue flush on the shutdown path. Add it.

Unfortunately have to briefly include intel_display_core.c here. To be
removed later.

Link: https://lore.kernel.org/r/agRp6Was9FCQbKee@intel.com
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 93940cfe91a0..60d5e06675ab 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -54,6 +54,7 @@
 #include "display/intel_bw.h"
 #include "display/intel_cdclk.h"
 #include "display/intel_crtc.h"
+#include "display/intel_display_core.h"
 #include "display/intel_display_device.h"
 #include "display/intel_display_driver.h"
 #include "display/intel_display_power.h"
@@ -1053,6 +1054,8 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 		drm_atomic_helper_shutdown(&i915->drm);
 	}
 
+	flush_workqueue(display->wq.cleanup);
+
 	intel_dp_mst_suspend(display);
 
 	intel_encoder_block_all_hpds(display);
-- 
2.47.3

