Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3713BC7EE37
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4610ED3F;
	Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6904110E5D9
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qTVBHe4jJeOLOy8O7REve+0ruREw+9UpGwKnPJMq9dM=;
 b=Jl837nN/j9qC3sVEhDIWGkdqizDjCI3bQZZ1OVcS4VwSwMAdfnFPfONc
 C7Afr6lOgDjj0VutCpcT1CTsfpAzhNlUhBgtn77yGb1GZOOp9bIT9JL8U
 s3Dp/RaMbCl0awy2Ep2i3pp+clOOoauhbwGuUFBgZRkC/fQXqJz2nRaHJ
 HJIxkM1sQZAQA3coR+1iD+g306uL8BxQ/FygvCUWv8FgAME3bN0dkdEFS
 OcRcBt9MELXVJZ7SZfLwtqJF4SW0ANQTsM52EkOS6dqJYmu/ZUy6oS7eA
 rUJNGbhyhyNdQpmxTTO3mQRML6Ker63cd2kSmBnCarVuGd65OQyEaW9wN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297352"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956596"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956596"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:45 -0800
Message-Id: <20230225001548.1743820-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 09/12] drm/xe: Remove dependency on
 intel_mchbar_regs.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only thing really needed is the base offset, MCHBAR_MIRROR_BASE_SNB.
Remove the include and just define it inplace.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/intel_device_info.h |  2 ++
 drivers/gpu/drm/xe/xe_display.h                    |  5 ++---
 drivers/gpu/drm/xe/xe_guc_pc.c                     | 10 +++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.h b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
index dd05f298019e..959acb261007 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.h
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.h
@@ -28,6 +28,8 @@
 #include <linux/types.h>
 #include "xe_device_types.h"
 
+struct drm_i915_private;
+
 /* Minimal parts used by xe */
 #define intel_runtime_info xe_device_display_info
 
diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
index 262cd5442489..5c09962f4906 100644
--- a/drivers/gpu/drm/xe/xe_display.h
+++ b/drivers/gpu/drm/xe/xe_display.h
@@ -6,13 +6,11 @@
 #ifndef _XE_DISPLAY_H_
 #define _XE_DISPLAY_H_
 
-#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include <drm/drm_drv.h>
 
 #include "xe_device.h"
 
-#include "display/ext/i915_irq.h"
-#include "display/intel_opregion.h"
+#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
 int xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver);
 
@@ -44,6 +42,7 @@ void xe_display_pm_resume_early(struct xe_device *xe);
 void xe_display_pm_resume(struct xe_device *xe);
 
 #else
+
 static inline int
 xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d91dad8638ef..5a8d827ba770 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -21,12 +21,12 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 
-#include "intel_mchbar_regs.h"
+#define MCHBAR_MIRROR_BASE_SNB	0x140000
 
-/* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
-#define   RP0_MASK	REG_GENMASK(7, 0)
-#define   RP1_MASK	REG_GENMASK(15, 8)
-#define   RPN_MASK	REG_GENMASK(23, 16)
+#define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
+#define   RP0_MASK				REG_GENMASK(7, 0)
+#define   RP1_MASK				REG_GENMASK(15, 8)
+#define   RPN_MASK				REG_GENMASK(23, 16)
 
 #define GEN10_FREQ_INFO_REC	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
-- 
2.39.0

