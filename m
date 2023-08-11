Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9073CC04A94
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 09:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0D410E68B;
	Fri, 11 Aug 2023 09:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5360910E686
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691746603; x=1723282603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AokhDgDnOAdLvSOaIrokdrVCn5x55CCaZBRzN6PeTIM=;
 b=keB5FoJd3KUn2EOj8gs4TWyJV6MEbZ7q83W3G6rs1YMCBWQI5029NAH1
 v8Ios9tpLUNkdOCQOTq9NZSTViVEfunN5iB3LJmQY9l33CR1deEtqhedH
 xLJRA0Bf7DDQsuXE83duU8V2xc8hhoUg0rpgz+n341eHZcOmHZ42otw5Y
 vmchOOUeFltDSV2WmYvhuaWPsJRIsAXiiwdZjcCtiliajYgUDY6AewntC
 S1jzR75LIWYhECSMxz4s9d4A0H1z5ABlvgxHSZ2VY2gJ98NirezTcZaR3
 fAWBl1lzgHzFddPMKYjJXnHSh1v6fmWVn92H6OsIV1gnhJUdvTJjlVY5o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="458012845"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="458012845"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906374768"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906374768"
Received: from unknown (HELO localhost) ([10.252.49.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 02:36:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 12:35:58 +0300
Message-Id: <20230811093559.2304457-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811093559.2304457-1-jani.nikula@intel.com>
References: <20230811093559.2304457-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/9] fixup! drm/xe/display: Implement display
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use i915 version of intel_gmch.h instead of copy-pasting.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/xe/compat-i915-headers/soc/intel_gmch.h    | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
index d0133eedc720..33c5257b3a71 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
@@ -3,16 +3,4 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef __INTEL_GMCH_H__
-#define __INTEL_GMCH_H__
-
-#include <linux/types.h>
-
-struct drm_i915_private;
-
-int intel_gmch_bridge_setup(struct drm_i915_private *i915);
-void intel_gmch_bar_setup(struct drm_i915_private *i915);
-void intel_gmch_bar_teardown(struct drm_i915_private *i915);
-int intel_gmch_vga_set_state(struct drm_i915_private *i915, bool enable_decode);
-
-#endif /* __INTEL_GMCH_H__ */
+#include "../../../i915/soc/intel_gmch.h"
-- 
2.39.2

