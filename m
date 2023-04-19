Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BAEC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA310E96B;
	Wed, 19 Apr 2023 12:40:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AE710E972
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908043; x=1713444043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V9ZFYhOXxp1EoJT/hyT/lTDGBDrQXBAStydYtMDJoQw=;
 b=jYrJe1fVFpGOHXGHP2ezl4VDpGFN0/Vf51sv/sDeJSunzqKZohq2kUJW
 6Ig5pBj3wslcU+CkkSzSPTnVYhni3BNYq9ISPqC7PcXgZ56KW4KM8Nlyl
 yFbwfcZ6G5cA6E6+mRLpvFlX4xU0+vbwyZMnOqqG6MO6WVZDcGKf/i57q
 LYdkBbwJ+Mg80yi4+CqTlD1I36JKvbfHYx6ggeYvgoNco1fh2w34qdfsa
 BFOlrR1o8WS7VdVDl3zTDgkehU2Rm++vCBGyYjQXAFThXFRolCISkE1+u
 Nju53Vy2BTBVxjXTdEPar54w4K0ViPQ+jagKM6EY/KE1/rOOQmfzqeYTN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431711578"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="431711578"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865821895"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="865821895"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:47 +0300
Message-Id: <20230419123947.543175-10-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 9/9] fixup! drm/i915/display: Remaining changes
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

Use the dummy mmio_offset member instead to avoid ifdef.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index d6079e08ea82..755c1ea8225c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -8,11 +8,7 @@
 
 #include "i915_reg_defs.h"
 
-#ifdef I915
 #define DISPLAY_MMIO_BASE(dev_priv)	(INTEL_INFO(dev_priv)->display.mmio_offset)
-#else
-#define DISPLAY_MMIO_BASE(dev_priv)    ((dev_priv) ? 0U : 0U)
-#endif
 
 #define VLV_DISPLAY_BASE		0x180000
 
-- 
2.39.2

