Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314FDE784A5
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 06:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89A10E178;
	Mon,  2 Oct 2023 06:58:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CAC10E223
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 06:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696229899; x=1727765899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2DIsI3uiqtXGB8cO3AN1Hcb0BtlutNatPov1db/D69Y=;
 b=RhXBw6kgAP/zhb9x8aBZQzxLjWVgL2WSP09KeKETvrmmj9zI3jQg0M9W
 WVjRanyuEzVFgkHMmFmJvLqJiVbcC7u0L+v+xWYx0rsyWH3Pshir9n3xH
 Rtcpi6vsWdJLk4Y8gedQeQm4nUx7pePgVS5mlWduhdVOgvW4R+wQm8DpI
 cqHyxaQ2fIyh52V246dm79e/86oq6RFiuiLo4z2Txv5Iba4rcI6rmGZbo
 DEf1Ex9bYDOGsV4K9z7hLW73QxbUfma834HHiTA5WyZHmsqrqhOsXpeSJ
 t3cCd+sYapSanuwIUKe8K6tXnFHQ33v4eyAIQRRcHayrYEzKT5kSTD7l3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372942734"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="372942734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="1431352"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2023 23:57:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 09:58:02 +0300
Message-Id: <20231002065802.3609656-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002065802.3609656-1-jouni.hogander@intel.com>
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915/display: Include i915_active header
 in frontbuffer tracking code
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Intel frontbuffer tracking code is using i915_active functions -> include
i915_active.h directly instead of relying getting indirectly included.

Cc: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230929112047.1151914-1-jouni.hogander@intel.com
(cherry picked from commit f52d1493dfbf9ba421bb3f84a798cc309128b728)
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 58bd80989e4b..b80cf8fb1c97 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -56,6 +56,7 @@
  */
 
 #include "gem/i915_gem_object_frontbuffer.h"
+#include "i915_active.h"
 #include "i915_drv.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
-- 
2.34.1

