Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98518C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 05:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679DE10E2E0;
	Tue, 16 Jul 2024 05:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ivhsvgw2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73C10E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 05:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721109078; x=1752645078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MWQ4RcVy+novDAR25p3PnfHPOtqoUm76OUB17zNhQ0c=;
 b=Ivhsvgw2w62K7ojFqFyBjiQ5EZipTUbX3NfP+p1cWaewBxbBIJfVsuEf
 2jAiRLhU3SwqfEoMrWPQNNjz+zp7570rCZiiK2veHfbMWFXletuV7M741
 FEJ9kpAjuduCkK66sECHW6sSFqSGUnOfeAstsS1kEtjzjQr8ZSg3finJ3
 dhXJuzORXQ2HWy60xVAgJF98bUyv5ipzoz3hM5Soyvz6AEhRQxDVlkI6N
 TOSjXXbG3czEgTX/+M1I/8hVlG4RTY4H+IWkWKrdFsMt+1a4e3bgNGXTK
 l0s7CTzuZFB3dyB0npPWFKC+QaGLGHzp6j0KTa/v1LPTkzSpkUw1hWUM+ A==;
X-CSE-ConnectionGUID: p6ah8IXRQA6Y7Sqnm1Xc1Q==
X-CSE-MsgGUID: UEKF0bxmTIectT0AT8DGdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18637974"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18637974"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 22:51:18 -0700
X-CSE-ConnectionGUID: RdjptAgQTjqoHsCGnzcsAw==
X-CSE-MsgGUID: 700Cl9jHRwaP8BwN8txacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49769195"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa010.jf.intel.com with ESMTP; 15 Jul 2024 22:51:16 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2lpg: fixup! "drm/xe/xe2: Add Wa_15015404425"
Date: Tue, 16 Jul 2024 11:22:35 +0530
Message-Id: <20240716055235.3420111-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use XE_WA as used elsewhere.

Fixes: 86c5b70a9c0c ("drm/xe/xe2: Add Wa_15015404425")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c       | 5 ++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index cf622d07e190..30409357487d 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -13,6 +13,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include <generated/xe_wa_oob.h>
+
 #include "regs/xe_bars.h"
 #include "regs/xe_regs.h"
 #include "xe_device.h"
@@ -22,6 +24,7 @@
 #include "xe_macros.h"
 #include "xe_sriov.h"
 #include "xe_trace.h"
+#include "xe_wa.h"
 
 static void tiles_fini(void *arg)
 {
@@ -127,7 +130,7 @@ static void mmio_flush_pending_writes(struct xe_gt *gt)
 	struct xe_tile *tile = gt_to_tile(gt);
 	int i;
 
-	if (tile->xe->info.platform != XE_LUNARLAKE)
+	if (!XE_WA(gt, 15015404425))
 		return;
 
 	/* 4 dummy writes */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 08f7336881e3..3d0e0779a833 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,3 +30,4 @@
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 16023588340	GRAPHICS_VERSION(2001)
+15015404425	GRAPHICS_VERSION(2004)
-- 
2.25.1

