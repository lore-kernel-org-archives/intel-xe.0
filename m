Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8522CC48BEB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDDC10E801;
	Tue, 13 Feb 2024 15:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAkGlW+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0451410E7D3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707839055; x=1739375055;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A5rYCy4dRpzhs0WE3dbLCHi5PXsFW2vTuPZuA/VO9ho=;
 b=eAkGlW+k0wVP5Ahdxyej3TwoWI08PG5wYK10UWgWoUiq5DfgiObzd1mE
 dxZlBENurTTXW2YZ7SmTpK4OTRaiL4NQQ3k6TlA3X3RvhTlpZ4CvjK3Ch
 cVAFxMXxz+Kf+8n2EaAmUh3lXJntSNerSF0L4e9d4zR4vdek5q+FegQ6I
 o06i2vDjrlOOa5ZOer/1qd7rHg0hWCCs3v8XE8ZU7tLK13GdmqsL28+2V
 u2EnebKYDqulfkb5hEoXkuOeH8eTSWUqr+CJn7VryjRi13zFtIhOexNDI
 plzus8W0Wen/Yc22u7hthC7uE0FNQFTZZ6Yx/UZlAegcE8XfkQHfTWg8Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19262922"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="19262922"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7564503"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:44:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/8] drm/xe/vf: Don't initialize stolen memory manager if VF
Date: Tue, 13 Feb 2024 16:43:51 +0100
Message-Id: <20240213154355.1221-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

VF drivers don't have access to the stolen memory.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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
2.43.0

