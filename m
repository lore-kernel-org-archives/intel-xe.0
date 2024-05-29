Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74587C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 17:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2C210E576;
	Wed, 29 May 2024 17:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqowZ9Ay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DEE10E350;
 Wed, 29 May 2024 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717004900; x=1748540900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTci0aj+c1TimvNuGvGl2HiTFkg+fVEuvTXkhxrJX0c=;
 b=RqowZ9Ay80z97YLIxtP/OIKUJWSGbQB9lqY6quppgMkk5r1V7Apd7zR1
 7uJUvWwLvYsbMzpSW0jCxWwYqUR9cAiVW90c/YRO+TRP83tyIci+igrTe
 td6yvPrb3ziuOe+0CT6g05Rt7MfsFsIDA014JobM7mOiBv8BB4S73k47A
 Qsy0dFl7VyTwDHuEG2ioKGiGmaN/7sLwquxm8CzNmihKwPG8lly+gpTWD
 t13TgeJQqSpfQdFBXQ2TEwi/VrIQnRH35BSpTWiKCzVd86LFuUcVZLJzC
 CkYEV1Y/kqPSiUHE8GyNUil+ilp3gFiyzmV1+MULkWNGYNU4AtxyX1vNa w==;
X-CSE-ConnectionGUID: y1PIiWrQSK2XunmjYpVmUg==
X-CSE-MsgGUID: khRIYZHOTHWUrAD6TT2/Ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24082660"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24082660"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 10:48:19 -0700
X-CSE-ConnectionGUID: g59i3B3mTUyBph2RF15aWQ==
X-CSE-MsgGUID: uGU2EaMUTNeyaIjJkclMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35452783"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 10:48:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH 03/10] drm/i915/display: include i915_gpu_error.h where needed
Date: Wed, 29 May 2024 20:48:07 +0300
Message-Id: <a5dbb8d46403761bd8518db45fa71dc55930d3cf.1717004739.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717004739.git.jani.nikula@intel.com>
References: <cover.1717004739.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Include what you use. With this, we can drop the include from xe compat
i915_drv.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c          | 1 +
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 63fccdda56c0..b5ebb0f5b269 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -26,6 +26,7 @@
 #include <linux/firmware.h>
 
 #include "i915_drv.h"
+#include "i915_gpu_error.h"
 #include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_dmc.h"
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index fb784ab64cd4..9776cc3332fe 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,7 +19,6 @@
 #include "xe_bo.h"
 #include "xe_pm.h"
 #include "xe_step.h"
-#include "i915_gpu_error.h"
 #include "i915_reg_defs.h"
 #include "i915_utils.h"
 #include "intel_step.h"
-- 
2.39.2

