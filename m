Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF6EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012C010E3EC;
	Thu, 17 Aug 2023 08:25:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785BC10E413
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692260718; x=1723796718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SCg1m3f9mRvUyj3ui5FfJM+EsIPBiZKBdOGYa03IY4c=;
 b=Vi6r1Y6F2D3ZulhdfJf5zu1aUZKPE9Mg8dAxyeJ3sitJ2Bxf7H3LwW4J
 OUgKSf2HtKJKMEEBRxtOFD15ke7E7BTmhBwexYpXj6QeXvXKa+CorVoG6
 N0DzpYG1cv5i23VDCRYME+XV4AKSdiXfGrjWP4zzRGB5sHI/gV7h6OhZH
 Lietlb0UtaK3VYQ0pINnil7rSmnHjJ/3LjZ3EPExE1ZPbGfYHZOa4C3nv
 Wcg3NvqpUQIWj9RgC2eqUeh5GD9fMKuQLIGug0+1hzJ8ckwC+IPQrWek/
 6cnQ7d0F/wVj5e3Hk9a5DAQunt/5reVjoE4M9VJhznKngBJW1W1N1njp8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375514253"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="375514253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848803721"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="848803721"
Received: from ajanoscz-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.52.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:25:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:24:36 +0300
Message-Id: <20230817082437.3116208-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230817082437.3116208-1-jani.nikula@intel.com>
References: <20230817082437.3116208-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 8/9] fixup! drm/xe/display: Implement display support
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use i915 version of intel_gmch.h instead of copy-pasting.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
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

