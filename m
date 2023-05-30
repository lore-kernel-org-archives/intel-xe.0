Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56F6C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 10:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D54910E37E;
	Tue, 30 May 2023 10:35:23 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14310E379
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685442921; x=1716978921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3yRSpBizqXhn3XsQbpU5DCYyWk95c+/IqwglH5flXjU=;
 b=cUvJz0gdYY/zo0XbHO0JULODHT3hOs8S49xm9oET6BTR/LGxGmTbvjTI
 WRRDtfkAVlKFSheiHKqyQ5RCmn9utwGxtAy/NIZbjoc4OI7ubq8hxoxXP
 lnTTQDiYnfZ7ntcbSzwOcxT5d/nyiAP5yMIaQDwOsOwiED7rbkTNg/Gbs
 7oNqsP3AIE+0GeyKlO7s4FCu4denK5KzfZcOQL8EbIhRLJ094ISCRI+lt
 JXu580kftCSvipO8DFUHL8J2NVh8LPFJjLL+lC+y30a3RTsRSNph9zJWC
 IIi9x4tMm1EVUbTgrHsh5XuP0XV1LuuLBQfl2+QRmG905IS4wawL2Yefq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352378104"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="352378104"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="796226210"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="796226210"
Received: from aravind2-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.46.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 03:35:01 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 13:34:19 +0300
Message-Id: <20230530103420.2561722-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530103420.2561722-1-jouni.hogander@intel.com>
References: <20230530103420.2561722-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/9] drm/i915/fbc: Add function to get number of
 fences for gt
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add new function to get number of fences for gt. This allows removing
couple of ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c          | 4 +---
 drivers/gpu/drm/i915/gt/intel_gt_types.h          | 2 ++
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 109f86bb19ef..2cb537504c2f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -607,10 +607,8 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-#ifdef I915
-	if (to_gt(i915)->ggtt->num_fences)
+	if (intel_gt_fence_count(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
-#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f08c2556aa25..76bc88d974b2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -306,4 +306,6 @@ enum intel_gt_scratch_field {
 	INTEL_GT_SCRATCH_FIELD_COHERENTL3_WA = 256,
 };
 
+#define intel_gt_fence_count(gt) gt->ggtt->num_fences
+
 #endif /* __INTEL_GT_TYPES_H__ */
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 0ccc97fb9e90..89ff4e984e6b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -19,9 +19,12 @@
 #include "i915_reg_defs.h"
 #include "intel_pch.h"
 #include "i915_utils.h"
+#include "intel_gt_types.h"
 #include "intel_uncore.h"
 #include <linux/pm_runtime.h>
 
+#define intel_gt_fence_count(gt) 0
+
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
 {
 	return container_of(dev, struct drm_i915_private, drm);
-- 
2.34.1

