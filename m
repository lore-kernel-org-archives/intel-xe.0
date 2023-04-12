Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68264C77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63C10E82A;
	Wed, 12 Apr 2023 14:27:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809F210E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309677; x=1712845677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BgxLoBv8KtU70C+XR1QBmreZIDfbZsoT3G9fJZKNoYI=;
 b=V3u7vHx4H335mkSvzlNXuQ/Q8+jik8NsUHNzR0KoBo1XkBfeX00zDOpD
 8lNxyG7BsRg0Z4ai4QBNKMMd/P6HhaS42ViwEZJy1pR0S176x28xV1zb7
 7hMuIE6aAzp4NA3s9N2/OCk0g2RwxFdzYSnfYS7UPbSWfiXOIyH/zzn0a
 rtuubQONKX3sqfGi5f9qf2wj31HPqO1mBHcaPauanu4dfSjEBMHq47piG
 31CKgpZssGcpETf8cTK4MfNBI5cbehKX7ymgpCiC4RXqESX94qHML1MPQ
 KGFZLLozhLLvPwmy4F9Kul4ekgiDHJqK1p/QCGEFN9Zx7H8p8jYkThjse A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430198338"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430198338"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758266114"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758266114"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:27:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:20:05 +0300
Message-Id: <20230412142006.877109-41-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 40/41] fixup! drm/i915/display: Remaining changes
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
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 17d387420373..6c0962077587 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -5,11 +5,7 @@
 
 #include "i915_drv.h"
 #include "i915_reg.h"
-#ifdef I915
 #include "i915_trace.h"
-#else
-#define trace_i915_reg_rw(a...) do { } while (0)
-#endif
 #include "intel_bios.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
-- 
2.39.2

