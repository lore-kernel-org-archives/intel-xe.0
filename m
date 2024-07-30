Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140EC3DA7F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 22:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4F10E32C;
	Tue, 30 Jul 2024 22:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmBapAXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60D410E32C
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 22:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722379646; x=1753915646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGs5AqtO7tfygUoGbMhBsiPGHENqnRoKGRPDFW04JmA=;
 b=mmBapAXYJ+kK0DWdv2qCcansXozmgEa9Or+eLbRAzU4EqsWEN9bUXV/L
 xXiUZTrxotj8tc0Bt1MzRRrUk+tcpG/Z4nZOQpukS9gpx2dNGTZguaSTN
 Eo8DYR2gNWMCmfMHZ5df+VlLSizQzUmvJqcmNVwIS2544bcu2AnCzASr9
 SN4+HdM/3OiRycv/cg9BRnNPiNERu93lfx7Gl2W6WAqoFHxLu9aps3Tgl
 QTA1v/45gtQ7xNe6khFz7UKfdoZAWIDRLnQ55Y+R120L2zsS32ZzegDyl
 BVKZVV3I6wMRuewRc4q9UURc+meTS89Pai0R9sf756B3vojqfUBJt0Us5 w==;
X-CSE-ConnectionGUID: GEKVas6CQMC+KM0VGa9PUw==
X-CSE-MsgGUID: /5MLDuOpSFeCfeHCQLP8MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24097654"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="24097654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:47:26 -0700
X-CSE-ConnectionGUID: gUhlfj+9R1Gz0NKf3sZqqw==
X-CSE-MsgGUID: AGV5RK1iTZu9QawceDMM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="58619845"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa003.fm.intel.com with ESMTP; 30 Jul 2024 15:47:25 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/gt: Apply Wa_14020881953
Date: Tue, 30 Jul 2024 15:45:30 -0700
Message-Id: <20240730224530.2688251-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

This WA requires us to disable Render power gating. There is a second part
to the WA which requires setting a WA bit in GuC. That will be done once
GuC FW has those changes.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c    | 7 ++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 67aba4140510..3ed60a212ff6 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <generated/xe_wa_oob.h>
 
 #include "xe_force_wake.h"
 #include "xe_device.h"
@@ -16,6 +17,7 @@
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_wa.h"
 
 /**
  * DOC: Xe GT Idle
@@ -110,7 +112,10 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
 
 	xe_device_assert_mem_access(gt_to_xe(gt));
 
-	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
+	if (XE_WA(gt, 14020881953))
+		pg_enable = MEDIA_POWERGATE_ENABLE;
+	else
+		pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
 
 	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
 		if ((gt->info.engine_mask & BIT(i)))
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..c513b801655c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -31,3 +31,4 @@
 		GRAPHICS_VERSION(2001)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
+14020881953	GRAPHICS_VERSION_RANGE(2001, 2004)
-- 
2.38.1

