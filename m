Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE0BC61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CD610EFF1;
	Thu, 27 Aug 2026 12:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPcn1vop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A0810EFF3;
 Thu, 27 Aug 2026 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787834135; x=1819370135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4zE+L2sCl9yJUTxucHSuXTJqoQC2oJRKfYY5cQVSokI=;
 b=hPcn1vopPEsWk0hnY5hpcCY7L7QaxkmQqB8VFORhcAhyCNx0DZd/eQLC
 ZDHf4N3bPxtlyDF9FuuYlXC7MmOFN4CHbZvPU+YJNeBWvMgyiNxdZiy2v
 vOs3gWr4uXwodB6WyXfSe+INPPMa3y4Eeuz4Oq/zWIP1jvwniNRDLbUj8
 mUlVtxFx6cC9t1CYM0rde4OYfqq+5H0B1jEvMvWihbn7oZgWgoIxgqNO1
 1tltJk8wAvVNljJsfuMbYHBleUGUgH4rmxeUY0TizA43rbhGB+q34yG+e
 3taS2HdGvlkGhpMIZo2tq438o3yvxEXG+MYyOaV9xk4Mb35cye/GC2WIa g==;
X-CSE-ConnectionGUID: O9AbZPrnTKmu/6zge9Mt8g==
X-CSE-MsgGUID: IWz22EikSTeWdg++rEeyrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105853471"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="105853471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:34 -0700
X-CSE-ConnectionGUID: BSQIpqxLQwykWcwIV3jLLw==
X-CSE-MsgGUID: s6pvOZ8aR+O1/vbx1Rh6WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="291370712"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 05:35:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, Maarten Lankhorst <maarten.lankhorst@intel.com>
Subject: [PATCH v2 7/7] drm/i915/display: use fixed 10 second timeout for
 fence wait
Date: Thu, 27 Aug 2026 15:34:57 +0300
Message-ID: <6e84bb6224a333a57d119cd384aac69288ef63de.1787833879.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787833879.git.jani.nikula@intel.com>
References: <cover.1787833879.git.jani.nikula@intel.com>
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

With the fence wait timeout now limited to a) platforms where GPU reset
clobbers display, and b) force testing display resets, let's unify the
timeouts across drivers. Use a fixed 10 second timeout for both drivers
instead of having them do different things. Ditch the now unused compat
header from xe.

For i915, this means no longer being able to configure the timeout. The
new fixed timeout is the same as the old default.

For xe, this means adding a timeout for forced display reset tests only
(as xe does not support platforms where GPU reset clobbers display).

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c     |  3 +--
 .../gpu/drm/xe/compat-i915-headers/i915_config.h | 16 ----------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 76ec9161aaa3..aa765d617702 100644
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
@@ -7283,7 +7282,7 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *state)
 
 	if (intel_display_reset_needed_after_gpu_reset(display) ||
 	    intel_display_reset_test(display))
-		timeout = i915_fence_timeout();
+		timeout = 10 * HZ;
 	else
 		timeout = MAX_SCHEDULE_TIMEOUT;
 
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

