Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87C2CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C110EB9C;
	Fri, 22 Aug 2025 19:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NL64MAkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2D610EB9C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755892477; x=1787428477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTxa9fD6JMSBWkfiVi/lAkap8YvTkQrKod0IGpEVjaw=;
 b=NL64MAkbUhuRRCKQwuwyWI0z2TCIvg9VaYEEXctrEDjxu05DfTFNjt+4
 yTLfKVqBMRO7qemF8+SrQAaoDVGoRf/lerzQnd4ZM6pnd9sfSJWM2hlGh
 ptK24EA2DnY/+kSU9lewViXpPl2K08Hr2Wi4kV7b+eHeeQq3HFKjD9j4G
 Zhl+S26IBm6E+tXpgLENlrPAcgddH+DKQQYmQ4ABYBEwXTMqEkTwbTIIa
 hUZHF7jrLSWgJQd7erq6dyjc1Dif2yE6KSPRlzcjcimFp0XCZb5Ebq9Xi
 ol8pkIVihOu039W8IPBk/PVPL8AoWFcANOn951W7e1En7i1lP348XFUO5 g==;
X-CSE-ConnectionGUID: SDKHXXo3SaGDhH8ZsgtlTg==
X-CSE-MsgGUID: Q7e9/QTORpGBRUQBvUWt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57404304"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="57404304"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:54:37 -0700
X-CSE-ConnectionGUID: 8cHZqoptS36Zr6WvmOEdOA==
X-CSE-MsgGUID: 5jmNSv3tSoOS0n48E4fM/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168685532"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa007.jf.intel.com with ESMTP; 22 Aug 2025 12:54:35 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH 2/2] drm/xe: Ensure GT is in C0 during resumes
Date: Fri, 22 Aug 2025 12:53:40 -0700
Message-ID: <20250822195340.1246075-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822195340.1246075-1-x.wang@intel.com>
References: <20250822195340.1246075-1-x.wang@intel.com>
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

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
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

