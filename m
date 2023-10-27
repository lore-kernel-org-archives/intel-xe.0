Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF64C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 07:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10C10E951;
	Fri, 27 Oct 2023 07:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F7410E951
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 07:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698393581; x=1729929581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vo1zvd9M+KrYck3Txg0nG1on7Z1q3gYxnyedfbg6Wug=;
 b=iXR6Qm11h5odixeIq0dAT5y6Yd7yaNsKPpTHqztye07JObhiaZbs75uo
 mkgbF8E39rSXdFRiBzCvP7r5Q+yVTxeHzvn5JRu2pznyrpqJXIqErfSEt
 hNpVoOgrqqWthJQNAt4SFUpvGTvrExOR0QseZ2mifAIpp1p1h4fS9i0zr
 r87T1x9AtbjcgnZT2inz+vq7s9T+o00h5HzrVsuq9E87sgOrCw2ijfxcA
 i66x8OTSkF2QiUjR758PHrCVYdsdB3vSzXEk/VObLEO7lCTZd3x1/EB+Y
 kSB3bQh7aJ+h2gHO6vW/Jx2Y7Bvx+T1oUWyuKazmAwAWLLIHV5X704Mos w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391603715"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="391603715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794510122"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="794510122"
Received: from inyestex-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.212.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 00:59:39 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 10:58:51 +0300
Message-Id: <20231027075918.2206862-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027075918.2206862-1-jouni.hogander@intel.com>
References: <20231027075918.2206862-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/31] drm/i915: separate subplatform init and
 runtime feature init
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Adjusting ->port_mask does not belong in
intel_device_info_subplatform_init(), but rather
intel_display_device_info_runtime_init().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1035800e623e13d5e7baf1215b07e7cdad5eb764.1696336887.git.jani.nikula@intel.com
(cherry picked from commit 079d0b01bc5943dd19c7cb8fa9a99976217cc4c6)
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 7 +++++++
 drivers/gpu/drm/i915/intel_device_info.c            | 5 -----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 11f4a6c54cc7..9f0266318a41 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -948,6 +948,13 @@ static void __intel_display_device_info_runtime_init(struct drm_i915_private *i9
 	BUILD_BUG_ON(BITS_PER_TYPE(display_runtime->cpu_transcoder_mask) < I915_MAX_TRANSCODERS);
 	BUILD_BUG_ON(BITS_PER_TYPE(display_runtime->port_mask) < I915_MAX_PORTS);
 
+	/* This covers both ULT and ULX */
+	if (IS_HASWELL_ULT(i915) || IS_BROADWELL_ULT(i915))
+		display_runtime->port_mask &= ~BIT(PORT_D);
+
+	if (IS_ICL_WITH_PORT_F(i915))
+		display_runtime->port_mask |= BIT(PORT_F);
+
 	/* Wa_14011765242: adl-s A0,A1 */
 	if (IS_ALDERLAKE_S(i915) && IS_DISPLAY_STEP(i915, STEP_A0, STEP_A2))
 		for_each_pipe(i915, pipe)
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index db3997cec6ff..59bea1398c91 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -27,7 +27,6 @@
 #include <drm/drm_print.h>
 #include <drm/i915_pciids.h>
 
-#include "display/intel_display_device.h"
 #include "gt/intel_gt_regs.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
@@ -232,19 +231,15 @@ static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	if (find_devid(devid, subplatform_ult_ids,
 		       ARRAY_SIZE(subplatform_ult_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_ULT);
-		if (IS_HASWELL(i915) || IS_BROADWELL(i915))
-			DISPLAY_RUNTIME_INFO(i915)->port_mask &= ~BIT(PORT_D);
 	} else if (find_devid(devid, subplatform_ulx_ids,
 			      ARRAY_SIZE(subplatform_ulx_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_ULX);
 		if (IS_HASWELL(i915) || IS_BROADWELL(i915)) {
 			/* ULX machines are also considered ULT. */
 			mask |= BIT(INTEL_SUBPLATFORM_ULT);
-			DISPLAY_RUNTIME_INFO(i915)->port_mask &= ~BIT(PORT_D);
 		}
 	} else if (find_devid(devid, subplatform_portf_ids,
 			      ARRAY_SIZE(subplatform_portf_ids))) {
-		DISPLAY_RUNTIME_INFO(i915)->port_mask |= BIT(PORT_F);
 		mask = BIT(INTEL_SUBPLATFORM_PORTF);
 	} else if (find_devid(devid, subplatform_uy_ids,
 			   ARRAY_SIZE(subplatform_uy_ids))) {
-- 
2.34.1

