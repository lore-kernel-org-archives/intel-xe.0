Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9389CD6E4A
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 11:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6610FD25;
	Fri, 29 May 2026 11:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+dp71mk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EC810FD22;
 Fri, 29 May 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780052684; x=1811588684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1V8QBd50/f/T1UiAOu78/SlnqvLaZu2vwbedGNrMVM=;
 b=i+dp71mkWQnCrY786LK6fM5JX6oa+VfTisFXXdCfw9ABAogzhWSUJHJX
 Ei7Emtnh/IO87+eoGyPStlaZxbuZlUqOo4tG2nawKDhEeaMCPs/yOY3d/
 vGaQSXp+i7rhqspsraDW/pdTu5JuBpqgzHtzY/ibFvb559xwqHclLnSJA
 7Gz+2TSMzZ6Og7P/wc6q14C6EP/3YsQdyNWdA07TNf9fhS+SUHHuUu7rQ
 /tHDA0sImUDA/U+9Q6c1KE4b48uTXdE8le3nRX8Me9hnhaQ/8vH8Mh484
 0Qs40a/6cvuY+5hkeEnB/WZAo5jJcN1OMNcQK88itRIGGtg6laNdjuVIY g==;
X-CSE-ConnectionGUID: M/CBBM1zQ8q52OuDeRYWvw==
X-CSE-MsgGUID: D75iCkOeSG66ShdIB0mltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92377771"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92377771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:44 -0700
X-CSE-ConnectionGUID: 8SStyMPmRGC6sY6hZsnF+Q==
X-CSE-MsgGUID: 1wk5GcF+RX69fPRO8I5rlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="246840878"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 04:04:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com
Subject: [PATCH 03/24] drm/i915: add flush_workqueue(display->wq.cleanup) on
 shutdown
Date: Fri, 29 May 2026 14:03:47 +0300
Message-ID: <187ed77534a4d6ae37a4b64084d8efda744e0c6c.1780051905.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051905.git.jani.nikula@intel.com>
References: <cover.1780051905.git.jani.nikula@intel.com>
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

