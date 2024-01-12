Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5346C47DA2
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B55910EB4C;
	Fri, 12 Jan 2024 15:27:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380010EB42
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705073225; x=1736609225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GeGjGDmGTJmaTHpO1UQyeXKunCzaNTAY4aPyOayktSs=;
 b=fdXBvlxAcGT+NKVEfojbmsuj8WFhrAGTED6M1vxL4Dgdh7UZuBH7ti87
 IAr+0zc8bTraMu9jBV/cck/FoRI3+0Upy7Z18drmujXR89+hbuIDjMcJQ
 K2PQVuulWI8A8u99ZWhq/2GW+/agtb0P6zB06QxPfUjlmcSX0vjbdBFZQ
 ieY8aJgr2W+vR8tdr6rU7fHIZhqWQjvQ2rXZOcz0eN1h409N+XP36BP61
 byzER2Cdry9PUUNxUVcBn3iH78an0ieVMc7fa1oWfeXN8VqYUGMvJ9TEr
 P6KrCzsc1rGqkUp8dvRUvHXarh9xMvagW/4aH6LtJj72iyehUwuBaD7Ib A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6566366"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6566366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902003181"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="902003181"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 07:27:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/8] drm/xe/vf: Don't initialize stolen memory manager if VF
Date: Fri, 12 Jan 2024 16:26:45 +0100
Message-Id: <20240112152649.849-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

VF drivers don't have access to the stolen memory.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index e5d7d5e2bec1..662f1e9bfc65 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -19,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
+#include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
@@ -205,7 +206,9 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	u64 stolen_size, io_size, pgsize;
 	int err;
 
-	if (IS_DGFX(xe))
+	if (IS_SRIOV_VF(xe))
+		stolen_size = 0;
+	else if (IS_DGFX(xe))
 		stolen_size = detect_bar2_dgfx(xe, mgr);
 	else if (GRAPHICS_VERx100(xe) >= 1270)
 		stolen_size = detect_bar2_integrated(xe, mgr);
-- 
2.25.1

