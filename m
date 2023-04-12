Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FFDC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A210E82A;
	Wed, 12 Apr 2023 14:26:33 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218010E835
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309591; x=1712845591;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f175GcHs4938826y3LoieloEk0mlB7oVRo6H+hJYPHU=;
 b=DRnHJ7RkNiXVmUwgTEp0EOiQ3SAXxwtTzbWeglJ+VLSYnYD2bhj+TNKU
 lO1acmnDzdkC9uv4aJZ4txZQZYcRl6tHsgterUETgN9321Jare/hOhSSN
 iXiW5fMDwWE6E3ZZ16soQr1i9iZVZBvht/Vcm+eHRfVbzc2966LS3uLBm
 cOoJZRsl5fMqGxf7rFUljLkzdfJ3l5TXl8QSGcvDflQQJ6dAzgvG55ZQK
 xbr52efq5Vc3LTeoDjEKhROc2N73aT2XYgPfBSx3x1xeqfCum+3iOuv0Z
 irvUgc9z0iTbCRQ6MG/Mut3bri9PbDFuqorJ3P41bJ/HCrH080iObBtyh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328021623"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="328021623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666376043"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666376043"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:26:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:57 +0300
Message-Id: <20230412142006.877109-33-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 32/41] drm/i915/display: remove unnecessary
 i915_debugfs.h includes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com,
 Nirmoy Das <nirmoy.das@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Leftovers from before display debugfs was separated to its own file.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230411131922.401602-1-jani.nikula@intel.com
(cherry picked from commit 1bf3836383e6957ac848ee81eb691820c862b3d6)
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 1 -
 drivers/gpu/drm/i915/display/intel_hdmi.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f6143ca60703..2ea58171b019 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -44,7 +44,6 @@
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
-#include "i915_debugfs.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c7e9e1fbed37..a73a315ac8ad 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -40,7 +40,6 @@
 #include <drm/drm_edid.h>
 #include <drm/intel_lpe_audio.h>
 
-#include "i915_debugfs.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_atomic.h"
-- 
2.39.2

