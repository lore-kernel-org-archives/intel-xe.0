Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204F1CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 22:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B0A10E59F;
	Mon, 25 Aug 2025 22:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ3U9isH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D797310E59F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756161155; x=1787697155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nvIU3HVCuFJPCRYKAO/83hDIObaBSAwm3D5pcVta4QU=;
 b=nQ3U9isHH/RAVnaXJPVfZqZ4z4WgEMBfULi00e1cTjNoakY+pocDbMLk
 Jx1GjTC3S68MwwislvcesjGGyYbWizsJrNHozmWODwPKqqlW6ge6F1YI5
 sgtRikWWVDQR2KEVygql+oU48FaM15gc/FCDRpGwSGVgSh0MAQGhzUaas
 ULf9yA8V4dWOF/IwG6rFb+3cEd9fecSS4sSzHBrW2a6+A/EkKmZMiCg4E
 ERNaBLe9NybWtYAKNqnj9/Usovf7oamD+mJSdawhEZ75Lc+4CYwpOJSXf
 d2ID5INXY7Ps8997qdoghblei0mi0N6zPLkw0iDI5Rk8t/kAdtFWK1hJb g==;
X-CSE-ConnectionGUID: Zu8ZIC6pTvOyoJdX5l68RQ==
X-CSE-MsgGUID: w7I/dtaaTgW+tH38N5OfXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69818309"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69818309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 15:32:34 -0700
X-CSE-ConnectionGUID: /1OOFUIxR1eDcbzUML6p6g==
X-CSE-MsgGUID: bcydygulQIe5C1Sb5/mBwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170243518"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2025 15:32:33 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 3/3] drm/xe: Ensure GT is in C0 during resumes
Date: Mon, 25 Aug 2025 15:32:19 -0700
Message-ID: <20250825223219.1351786-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825223219.1351786-1-x.wang@intel.com>
References: <20250825223219.1351786-1-x.wang@intel.com>
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

