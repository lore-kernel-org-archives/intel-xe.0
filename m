Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BFCC5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B010E592;
	Wed, 19 Aug 2026 14:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkNyRPeW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1FD10E592;
 Wed, 19 Aug 2026 14:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148336; x=1818684336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KPrMRj4jmndcMBddGUdz25DhZ6EEVvOGleuu5znp/Ro=;
 b=OkNyRPeW+s4p69h+SVbQODpxUOrfLLSm+8ZKZnB7uUiQsu0IWvA/ZKcW
 Vxd1kQH+WeeI/HGO22Dg1bV8cfotJuE1/ZIV0+OrM/exoOQQAYVQvwFjy
 XUsAR2z0AOXnZKw2iQ0VJO3Nx/61DFPREwb2wl0grwhpfe6PdYkTg/OwD
 wy8hakH2fKZAIjmtyIZJZXleOA7JUdA7MW2LLiKq5HINymkVCSl6nc/Ha
 5wduOWN6XOchIjYXr5kA6JiJa8sHJvIsMPDaupg2S4bh80rfSh35F2ISe
 fyzm6ortgtmR7OgTJtakD2+Yqn+QpeMAxr3c/9+uYwqzQFpX8W20HUXku Q==;
X-CSE-ConnectionGUID: mgyxysWhTqqqBg40gsxGUw==
X-CSE-MsgGUID: AqQkuRHySBuLAUodDwFUhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86781891"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86781891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:35 -0700
X-CSE-ConnectionGUID: TtTtDrJPROi4D0skq/sstA==
X-CSE-MsgGUID: hc7xx2LlTaa6f4xSZpCPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="290368359"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH 4/4] drm/i915/display: use fixed 10 second timeout for fence
 wait
Date: Wed, 19 Aug 2026 17:05:13 +0300
Message-ID: <f61a3a828b0c0159d63d132f8f557a546a6f9ced.1787148235.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787148235.git.jani.nikula@intel.com>
References: <cover.1787148235.git.jani.nikula@intel.com>
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

i915 has a configurable fence wait timeout, defaulting to 10 seconds,
and xe uses MAX_SCHEDULE_TIMEOUT i.e. it has no timeout.

Use a fixed 10 second timeout for both drivers instead of having them do
different things. Ditch the now unused compat header from xe.

i915 actually needs the timeout to deal with CI reset tests, but there
shouldn't be any harm in having a 10 second timeout in xe either.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

There have been a number of stabs at this in the past (see links below),
and all of them have been rejected with one reason or another.

My primary goal here is just to remove the annoying i915_fence_timeout()
usage and i915 vs. xe difference. Further cleanup can come later (or
never, as it usually is).

https://lore.kernel.org/r/20251112155612.8320-1-jani.nikula@intel.com
https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com
https://lore.kernel.org/r/8cde57236982fc3ca1a5608332943d3b9274a45a.1775661609.git.jani.nikula@intel.com
https://lore.kernel.org/r/20260408233458.22666-6-ville.syrjala@linux.intel.com
---
 drivers/gpu/drm/i915/display/intel_display.c     |  4 +---
 .../gpu/drm/xe/compat-i915-headers/i915_config.h | 16 ----------------
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index aa5d41dac8a9..c3a11e9e69e2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -50,7 +50,6 @@
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
-#include "i915_config.h"
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "i9xx_wm.h"
@@ -7284,8 +7283,7 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 		if (!new_plane_state->fence)
 			continue;
 
-		ret = dma_fence_wait_timeout(new_plane_state->fence, false,
-					     i915_fence_timeout());
+		ret = dma_fence_wait_timeout(new_plane_state->fence, false, 10 * HZ);
 		if (!ret)
 			ret = -ETIMEDOUT;
 		if (ret < 0) {
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
deleted file mode 100644
index d4522203e2dd..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_config.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef __I915_CONFIG_H__
-#define __I915_CONFIG_H__
-
-#include <linux/sched.h>
-
-static inline unsigned long i915_fence_timeout(void)
-{
-	return MAX_SCHEDULE_TIMEOUT;
-}
-
-#endif /* __I915_CONFIG_H__ */
-- 
2.47.3

