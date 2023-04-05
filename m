Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E37C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BBA10E9FD;
	Wed,  5 Apr 2023 15:41:10 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6F010E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709269; x=1712245269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jsyc7j+XZ9q2HnaJZpuoAHxGrqhOQkqQR3woo0LHQvs=;
 b=MMdP0ZKwX4Q3RXY6hlRESJUuc8Qgs0K609zpUho+DQDqmKeaqahygiFg
 54kkf1QjYbsA/L7+vRYA6zpeNf++XPKwbnpsQyqN2S8Wuf+wbGPZhtOBm
 qUrfb5SWFMiuiV+hieSOXbImtdFcPVElYrAxBsVk/4ADQqrZ2zP5uuuDu
 13Wv4bgeNPc8RG3PYp7iyX1hEoo6X/agLJ2goqmitwlNuFyt/7kI0bz3P
 CLkl6kwApOs+DOhm+bmQ6t0W0iMQKyi5m7Hhe1WJvpdAXySc9BQsQCoNh
 RpO4XWvQGGh/txYOEUt7ijwTCYsLpL4/QDqsLFcsPCVixkMr+RI9g9Xmh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342501175"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342501175"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="756033619"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="756033619"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:41:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:19 +0300
Message-Id: <20230405153920.926583-21-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 20/21] fixup! drm/i915/display: Remaining changes
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove intel overlay ifdefs

No longer needed with intel_overlay.h having conditional build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index cb14c201cc17..24c96f388d52 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -48,7 +48,6 @@
 #ifdef I915
 #include "intel_crt.h"
 #include "intel_dvo.h"
-#include "intel_overlay.h"
 #include "intel_sdvo.h"
 #include "intel_tv.h"
 
@@ -109,6 +108,7 @@
 #include "intel_lvds_regs.h"
 #include "intel_modeset_setup.h"
 #include "intel_modeset_verify.h"
+#include "intel_overlay.h"
 #include "intel_panel.h"
 #include "intel_pch_display.h"
 #include "intel_pch_refclk.h"
-- 
2.39.2

