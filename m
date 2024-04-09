Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC408C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 12:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68967112D39;
	Tue,  9 Apr 2024 12:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayoJ0APv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD940112A64;
 Tue,  9 Apr 2024 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712665640; x=1744201640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+yXvvtjmq3PcR4/PzqdJjpriZ21HG+HCDKZSEHAlv+Y=;
 b=ayoJ0APvHcFazSULWfuqPeCcO8igq6H/ZeRHS0BlFwt4L6C3EIecRcox
 RvT1+BbdAWZL2gwUhWGSnb8rimOjUgEq+qChehD0a+9CyhJBu0t4g9nDK
 SHBUsDAOPyhaBIyqaw4+0XyyUMsQa9peG2csdGuvBo0G8S7EOrfgEGV/t
 4Bq41pk/1tPl3OvUkqPgRYvqVzsOAL/piuZHeIPPzHBeZ3izVajkhdeCX
 og5OasPDDMmPfxnp4INur/xLBZDrMXsqu6v4M31X0FrCT5wrjelXH1DnC
 zeKpHE3klqLjNMiaAjOF+2T9xxSdD2vhlqvCUwuAoRZES29o5b3wa7/Up A==;
X-CSE-ConnectionGUID: I2EZaU5NST2Pavjv1nO5aA==
X-CSE-MsgGUID: nBBCEdIxSLyqQ7LBBbU4Qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10948478"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="10948478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 05:27:20 -0700
X-CSE-ConnectionGUID: YbTzNyItSFCUdehHnSxGRQ==
X-CSE-MsgGUID: tS4ZKV1hQfqkeDXuZxJjxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24695777"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 05:27:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Subject: [PATCH v3 4/7] drm/xe/display: add generic __to_intel_display()
Date: Tue,  9 Apr 2024 15:26:46 +0300
Message-Id: <503fea3fc545bebe6aa303d33cb5e816f7738343.1712665176.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712665176.git.jani.nikula@intel.com>
References: <cover.1712665176.git.jani.nikula@intel.com>
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

Add generic __to_intel_display() macro that accepts either struct
xe_device * or struct intel_display *. This is to be used for
transitional stuff that eventually needs to be converted to use struct
intel_display *, and therefore is not part of to_intel_display().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 2792a497257e..4448eda8b2a4 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -29,6 +29,17 @@
 #include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
 
+/*
+ * Transitional macro to optionally convert struct xe_device * to struct
+ * intel_display *, also accepting the latter.
+ */
+#define __to_intel_display(p)						\
+	_Generic(p,							\
+		 const struct xe_device *: (&((const struct xe_device *)(p))->display), \
+		 struct xe_device *: (&((struct xe_device *)(p))->display), \
+		 const struct intel_display *: (p),			\
+		 struct intel_display *: (p))
+
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
 {
 	return container_of(dev, struct drm_i915_private, drm);
-- 
2.39.2

