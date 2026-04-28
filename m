Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D16FF886D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845EE10EAC5;
	Tue, 28 Apr 2026 09:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdPf6YCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A45910EAD4;
 Tue, 28 Apr 2026 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777369906; x=1808905906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uB4xlW2NiYg2+VnaZXy4cSe7/Uq3sHAwngGh2dNNuXY=;
 b=AdPf6YCA93PbuMr2CVsN01bMkV4NXmD+bf2yh7F2p0SrUXZW7+royXne
 aBBMLOg/bu3gsQomr056t7WZMjkFXjKd2fKpYd3vpPkz7JalginUd2Rmz
 69iwRcF4L6GicxWddkBqbga1dkU+N9pwcODNIH9mb3MBilOdg/ZY5slWR
 lM/jjvtN4I63o/FE+1tLgo7HRnO7Kxgr7PugxFwK9uU6kwTygcDzkTjU+
 lKrTxdxM+vlJrWpSupno+xkc5Nbm6ktcHkjUmdhWxVymUTh64Xcuu1S2r
 0HT34wiWQAKLS44lo3ZS/VpR/wg1BpI//sMKv53wD/uF9Or+vKmuw0nle Q==;
X-CSE-ConnectionGUID: Rjz9rpaKSjS3c65apGgNrA==
X-CSE-MsgGUID: nxdzMBZ7TumKJfv8oqyKqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78385136"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78385136"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:46 -0700
X-CSE-ConnectionGUID: 2WUFInzNRvyFTlSsb+2fVg==
X-CSE-MsgGUID: TbT1eCr/SSGRH/jqMdvdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238891848"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 02:51:44 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v5 8/8] drm/i915: remove HAS_PCH_NOP() dependency from clock
 gating
Date: Tue, 28 Apr 2026 12:48:26 +0300
Message-ID: <20260428095104.818360-9-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428095104.818360-1-luciano.coelho@intel.com>
References: <20260428095104.818360-1-luciano.coelho@intel.com>
MIME-Version: 1.0
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

intel_pch_init_clock_gating() already handles unsupported PCH types,
including PCH_NOP, by doing nothing.

Drop the explicit HAS_PCH_NOP() check from the IVB clock gating
path and always call the display helper directly. This removes one
more direct dependency on display-side PCH macros from
intel_clock_gating.c.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/intel_clock_gating.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c27b6f9266b1..86bdeb20f427 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -31,7 +31,7 @@
 #include <drm/intel/mchbar_regs.h>
 
 #include "display/intel_display_clock_gating.h"
-#include "display/intel_display_core.h"
+#include "display/intel_pch.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
@@ -290,8 +290,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
 			 GEN6_MBC_SNPCR_MED);
 
-	if (!HAS_PCH_NOP(display))
-		intel_pch_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
 
 	gen6_check_mch_setup(i915);
 }
-- 
2.53.0

