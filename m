Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F8EB64DD
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 13:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BB710E481;
	Wed, 21 Jun 2023 13:55:57 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FED10E481
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687355754; x=1718891754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f99RsHQrxy7cJhehiqE2a+nQTUEraDHbmiq0euNKu/w=;
 b=DI53b9kNDjOekIFZxqubkNrGYZnBcqEcp62GPjypPKzGGKr/eqmKlxVE
 JSo7aXXGfvmGnqfB/0bbWy2A6cJX9ILHwALZCKMnTi5D1RMAuToyqcyxL
 CCfWpBdRcorHQzXD89eVc7MiQR41a3XTEVaUZ3cMCYy0SwoKRGQtqvLO1
 K125o2wg5sYT+0ljZSlZSAtyn2KixPJS8xWVZMEXYlG8zUQFzD2OHDBKF
 5XF/zuf1r1OkvXVRE+W3lVh7JDbMWFkFxKe+3o0TFyTlG52UjOxKQTgz9
 kSyEf9qS/kPUWiS7a5sJNF4b3QQMUD/TkkpkdUUNrAXDqDiVLMvbpQmqT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340524247"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="340524247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 06:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="708706676"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="708706676"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 06:55:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jun 2023 16:55:41 +0300
Message-Id: <20230621135541.151035-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621135541.151035-1-jani.nikula@intel.com>
References: <20230621135541.151035-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915: fix intel_display_irq.c include
 order
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

I meant to sort the includes before submitting commit 2b874a027810
("drm/i915/irq: split out display irq handling") but forgot, and it
wasn't noticed in review either. Sort the includes.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230516122926.2720581-1-jani.nikula@intel.com
(cherry picked from commit d705a8c73acbe523cb602228d411a73f288bf34c)
---
 drivers/gpu/drm/i915/display/intel_display_irq.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index 0eedd1ebb389..3b2a287d2041 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -3,23 +3,23 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include "gt/intel_rps.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
 #include "icl_dsi_regs.h"
-#include "intel_display_irq.h"
-#include "intel_display_types.h"
-#include "intel_hotplug_irq.h"
-#include "intel_psr_regs.h"
 #include "intel_crtc.h"
+#include "intel_de.h"
+#include "intel_display_irq.h"
 #include "intel_display_trace.h"
+#include "intel_display_types.h"
 #include "intel_dp_aux.h"
-#include "intel_gmbus.h"
+#include "intel_fdi_regs.h"
 #include "intel_fifo_underrun.h"
+#include "intel_gmbus.h"
+#include "intel_hotplug_irq.h"
 #include "intel_psr.h"
-#include "intel_fdi_regs.h"
-#include "gt/intel_rps.h"
-#include "intel_de.h"
+#include "intel_psr_regs.h"
 
 static void
 intel_handle_vblank(struct drm_i915_private *dev_priv, enum pipe pipe)
-- 
2.39.2

