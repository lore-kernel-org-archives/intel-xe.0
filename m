Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65B3C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C3810E823;
	Wed, 12 Apr 2023 14:22:54 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464F110E823
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309372; x=1712845372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JI68/BFz6ILcJYU8STUoW6R16bNY45ieC72f7l2JDDk=;
 b=LOUM4XeXe5SOoFtXTG72t8RRB6moopjuqFXTCFc3zifKW4tcozFsKGlW
 YppLZkPRsQqbpjlz6RrI7d0SdVlKvlkiTM7mkPocQJEpujlkMqO6MYRDZ
 j6hXKjAlEF6jzERSEIgxHY+914vkuI23HOsg6kHNYEP8qbdd2gEVJGaNf
 byi7kX87k9OJ3RD1udl4+ivrDcoXCS6ENAKVwszOWEDBu7q3umneoWL11
 ZuMu6Do789bSN1xSBZPCW/oNt8k/J17qCzN+s9e62AkYkkhTAJIkSwA7f
 2LpF56nR7s66SBSqSDgw77G0r7yPmSjNZi7ox97EkzCkbSgmAgYiix0yA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341404568"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341404568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639250668"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="639250668"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:22:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:42 +0300
Message-Id: <20230412142006.877109-18-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/41] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Clean up atomic plane conditionals.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 1491655e7fe0..b756561f08bd 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -36,6 +36,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "i915_config.h"
+#include "i915_reg.h"
 #include "intel_atomic_plane.h"
 #include "intel_cdclk.h"
 #include "intel_display_rps.h"
@@ -434,7 +435,6 @@ static bool i9xx_must_disable_cxsr(const struct intel_crtc_state *new_crtc_state
 				   const struct intel_plane_state *old_plane_state,
 				   const struct intel_plane_state *new_plane_state)
 {
-#ifdef I915
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
 	bool old_visible = old_plane_state->uapi.visible;
 	bool new_visible = new_plane_state->uapi.visible;
@@ -470,9 +470,6 @@ static bool i9xx_must_disable_cxsr(const struct intel_crtc_state *new_crtc_state
 	}
 
 	return old_ctl != new_ctl;
-#else
-	return false;
-#endif
 }
 
 static int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_crtc_state,
-- 
2.39.2

