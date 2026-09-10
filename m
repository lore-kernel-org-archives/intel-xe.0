Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15109C79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 19:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9325C10E2DE;
	Thu, 10 Sep 2026 19:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFnuuC+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659810E2DE;
 Thu, 10 Sep 2026 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789069366; x=1820605366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HsYbG+O9eIUnCxAUZGRtO98IoX4AlK9zYiRW8AxsMHE=;
 b=bFnuuC+LyUy4YfQw0bmYIUbClqf1eVA3JcVLojsFoqR8GPqhuZYZg7oN
 4KT8npL0oWAfWxno/++na1czB/bPEgkqj1XDSL7EcTz/AzltgeUClD22B
 3i2uSomaU207eLIPXEcYb18XUp5ddRVKtz6zi1xAKxueNXq3OirtHIAS6
 NnWh4EYQ4HJA7PSKGPbevj2qeRC1D6vXTlHZCHYmkJjZ0ZftoLDqYxc2a
 Mnp2PtVXYxTuM8bV0S13JdJeZ9S3aIfSd+tmOGH7NDvx3U++wMst9rt5z
 Ahje7dXIuYsqRlX+dWldL5sLKguu5ludsk8ipZrCN2STxnQYxzttdbj9s A==;
X-CSE-ConnectionGUID: h8+r5Z7lQ6O2jfxo3DcB0Q==
X-CSE-MsgGUID: wMjNDiCORIGlE/Zq1BwzEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100125517"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100125517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:46 -0700
X-CSE-ConnectionGUID: LJQS3VcWQSukrqfUllHsag==
X-CSE-MsgGUID: B6AxxJhnSFmIkQRFzIi0wg==
X-ExtLoop1: 1
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 12:42:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/4] drm/i915/display: stop using the configurable fence
 timeout
Date: Thu, 10 Sep 2026 22:42:33 +0300
Message-ID: <1880e49c9270049d5dfd944a1cbf712d664d02aa.1789069102.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789069102.git.jani.nikula@intel.com>
References: <cover.1789069102.git.jani.nikula@intel.com>
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

i915 has the Kconfig option DRM_I915_FENCE_TIMEOUT, defaulting to 10
seconds. xe doesn't use it, instead defaulting to
MAX_SCHEDULE_TIMEOUT. Unify the behaviour by switching to
dma_fence_wait() which defaults to MAX_SCHEDULE_TIMEOUT.

As dma_fence_wait() returns 0 when the fence was signaled, update the
return value check.

This should be possible now that commit 3aef9c94c02b ("drm/i915: Perform
full wedge on display reset") has been merged, and we no longer rely on
the timeout.

v3: Try this again with full wedge

v2: Use dma_fence_wait(), fix return value check (Maarten)

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c     |  6 ++----
 .../gpu/drm/xe/compat-i915-headers/i915_config.h | 16 ----------------
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9151ea6c15ab..579b03034c46 100644
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
@@ -7298,9 +7297,8 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 
 	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
-			ret = dma_fence_wait_timeout(new_plane_state->fence, false,
-						     i915_fence_timeout());
-			if (ret <= 0)
+			ret = dma_fence_wait(new_plane_state->fence, false);
+			if (ret < 0)
 				break;
 
 			dma_fence_put(new_plane_state->fence);
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

