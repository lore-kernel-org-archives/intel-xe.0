Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9CC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977310E52F;
	Tue,  5 Sep 2023 14:14:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919EE10E52F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923263; x=1725459263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S5TuoZZ+CcmprF+2ju7EHxZVp1ROfJUUQ/DuKshKQEA=;
 b=fQTjemI1W/4GEUa1/adhJ+yfpw9oC/hz19Jw7chZAc7NFMV0RJlK0s79
 KoOJn9pj7Ybu//ZwWvamd7kRvVP0q91tIF8dHkpDb+JYQR9NW2Fmp3qVq
 3RE+/siuTuE2dCVuxTRK9vUtBpvzb1R5ss1UAZ72fCp3o7lwhUnE0teBV
 +FZeRneu1nmCf2WKOlILe2+v+QiJZQLtgSgcPm1qhGwPwpUmt7igme/+j
 Cr0vRv9gm4Ta3F+mWgrAudoIxX4bUHZAt7dnCN/BzBaBK4i5pZwcTbT+0
 Rvww+WmMAxs1A3F7vZhlIIpDzULhyz6AujmcdpVXi8xip8fO/oGwNbSAW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380611138"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="380611138"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811245491"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="811245491"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:47 +0300
Message-Id: <20230905141347.1027082-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] Revert "FIXME: drm/i915/display: Set
 DISPLAY_MMIO_BASE to 0 for xe"
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit a75cb4b04d90a806cdadc6708ed055948467d91c.
---
 drivers/gpu/drm/i915/display/intel_display_reg_defs.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
index 42199c1dc55d..2f07b7afa3bf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
@@ -8,11 +8,7 @@
 
 #include "i915_reg_defs.h"
 
-#ifdef I915
 #define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
-#else
-#define DISPLAY_MMIO_BASE(dev_priv)    ((dev_priv) ? 0U : 0U)
-#endif
 
 #define VLV_DISPLAY_BASE		0x180000
 
-- 
2.39.2

