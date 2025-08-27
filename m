Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E8CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 00:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CAF10E6E4;
	Wed, 27 Aug 2025 00:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhmhcDpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A70D10E6E4
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 00:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756253206; x=1787789206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IyNzQHXIkGrYiplDIapb57KTeaYekHY1ppAtOXu7LJ0=;
 b=VhmhcDpNusSGVdM7ICWILJ4lkE340gNyUzqUXz8jICUKXrumbYticyp+
 j84eiAM8ESOWkz1xcLLoxPp9T+wAHb3okgjmjo/rNFrpLY9vRzi1tKb2i
 FJufKG3NabJYhv7QC235lZgR694xdmdiWroj8hwFruZLNe8dWom7+tIe/
 kLlr0/5qo+09x4fe6rn/ZAZekDq8h9KRkDxLmEUmdJk+4dWKSF0PIRtwK
 gu2YAQxK7JUzwDtEPNeQNZ071V6dGcMVLt9CKyfG7kK95DR4TzRQyOOgG
 frcZeG9fupOPhgstXBlScFnHXUoP36PIihUQ64mxLCK+/OlQsRREArSKW Q==;
X-CSE-ConnectionGUID: hfk4VcDlQLm31T2GesSurA==
X-CSE-MsgGUID: /C/BHD4WQn65WJd15El/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58600574"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58600574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 17:06:46 -0700
X-CSE-ConnectionGUID: Hdxh3LxRRI6tIhzm3iBngA==
X-CSE-MsgGUID: j40eI16nQVeCi+EOhGhrtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174113189"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa004.jf.intel.com with ESMTP; 26 Aug 2025 17:06:43 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 2/2] drm/xe: Ensure GT is in C0 during resumes
Date: Tue, 26 Aug 2025 17:06:33 -0700
Message-ID: <20250827000633.1369890-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827000633.1369890-1-x.wang@intel.com>
References: <20250827000633.1369890-1-x.wang@intel.com>
MIME-Version: 1.0
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

This patch ensures the gt will be awake for the entire duration
of the resume sequences until GuCRC takes over and GT-C6 gets
re-enabled.

Before suspending GT-C6 is kept enabled, but upon resume, GuCRC
is not yet alive to properly control the exits and some cases of
instability and corruption related to GT-C6 can be observed.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 51934d5dc44f..a2e85030b7f4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -18,7 +18,7 @@
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
-#include "xe_guc.h"
+#include "xe_gt_idle.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
@@ -177,6 +177,9 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
+	for_each_gt(gt, xe, id)
+		xe_gt_idle_disable_c6(gt);
+
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
@@ -533,6 +536,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_rpm_lockmap_acquire(xe);
 
+	for_each_gt(gt, xe, id)
+		xe_gt_idle_disable_c6(gt);
+
 	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
-- 
2.43.0

