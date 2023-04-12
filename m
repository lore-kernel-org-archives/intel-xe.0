Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21C0C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A381410E82A;
	Wed, 12 Apr 2023 14:27:09 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CB510E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309627; x=1712845627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gha0cb4bF01KY/ghie8PDssp89VYnew5wujxSw41RVw=;
 b=mhoS/2xFVqChgO8t6F06BOWu7Ukt8Dyv58KhbTFCsFwOpIIyXpAePtDQ
 iFd4eXw4gA9acNa7jdvP1U7nQIupb46yrrJC9vKarmN7ENhiEDjadNyGS
 fzAvWBo2JbkEtDcpEVm+7QRAYMLypvH078rYul1c6JQfubRx//+5gG8Y6
 uGTvbldwVmtnNPoyYqGw541TFO1UgpyzGnLCXqxqlxad9iR2HtSGBgD3f
 qSsb+O528/IUPrfgSFCGMTsrVHDEnCqFJGsdffhJvBbQQFohTSMJq/TO7
 TOJpSMsJTysWfjfmaLjAjHjRbDBh1J5vGiMeDnbvARVWH/2ZIuYNzCn9r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667878"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667878"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800358403"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800358403"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:59 +0300
Message-Id: <20230412142006.877109-35-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 34/41] fixup! drm/i915/display: Remaining changes
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power_map.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
index 5bef0b777dea..1a077a91859b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
@@ -5,11 +5,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-
-#ifdef I915
 #include "vlv_sideband_reg.h"
-#else
-#endif
 
 #include "intel_display_power_map.h"
 #include "intel_display_power_well.h"
-- 
2.39.2

