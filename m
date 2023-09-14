Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC36EDE987
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78B110E254;
	Thu, 14 Sep 2023 06:32:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF1E10E254
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694673151; x=1726209151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hyF+dj44HAZgFo5NGl5son7a+CRV4KHV6SVrfXaVZa8=;
 b=DbGdI6pyWrSjZkU52h1HXbFF0G7OGT/d3GfaAtJtynXeNj9IkOuDlDGv
 PosdnGGvqZ09NCVuZL3h9aIwSL9j6dzQ/466XuLRDh7vMcXs2mabgG/eh
 1eP0ujZF5lNe0Sj5z6yLkF8qa0dpexmo36zYinF2dgNavQgFpDYg1vG7i
 uN5oL/aV6WABcHBUf2cDvSfOJg1McxHnkiGB9VR97VrxUPESUnlr1n4g5
 GEeuMdpjXVQFbOIkjL5CMstZq7SvYpKuGvsp+STmHiTM/NrdBeC13KrZd
 141qTEFPgdu/q8plvOqRnhUEWI2yjOLxNQP74zsgYhzQPVvq8Yqy5AjPu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359127203"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="359127203"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721110775"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="721110775"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.36.89])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 09:32:10 +0300
Message-Id: <20230914063211.5210-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914063211.5210-1-jouni.hogander@intel.com>
References: <20230914063211.5210-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] fixup! drm/xe/display: Implement display
 support
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

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 94ab0354185e..03ac39efba38 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -21,6 +21,7 @@
 #include "i915_utils.h"
 #include "intel_gt_types.h"
 #include "intel_uncore.h"
+#include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
 
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
-- 
2.34.1

