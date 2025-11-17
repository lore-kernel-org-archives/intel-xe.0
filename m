Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38DCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 23:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CA710E404;
	Mon, 17 Nov 2025 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6pTwIHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBA810E401
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 23:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763423010; x=1794959010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZCXJzyuFsG2mDtP9UT5yO5YYP09JGWxDFowwXnBPcpI=;
 b=F6pTwIHMSK1R1rZmhq29Mcr6xibUG4rRegdV/gDf4cK2+tgDHdQ/qoI/
 AceKAr1ooUGv5AjcSkVxadRGloSSARiFv8qRzeQC1CJAKxcfU0ZOpTapE
 P2ap1IT/5PA5/elnXZv05ry2UH7uqcu5ZZv2AyWp8TOBX69Kjq+bKcAJn
 10bxtJBVhTymeFoQ1isjK/zsQhpzbECCqgVyllxXrOAqqCFzB0b5ywXek
 0fGIKC+SQbHJudbc67H2zckYiKQtmSAOkLSezQ8DXfJpHy8HSaT1DuefE
 jao96dp4daaiTgD5sBqYgCQhTm5t14RqKs/FmZuUolIhM2BHWd7ftRHz4 Q==;
X-CSE-ConnectionGUID: BymggVLfTeSNvGBGZ8V2YA==
X-CSE-MsgGUID: /VnU/2GrQTSExW2Anc8Peg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69302090"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="69302090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:30 -0800
X-CSE-ConnectionGUID: xy3i63YLS/abE4wJwDufKw==
X-CSE-MsgGUID: iiQy+oMtTeaKWUKwq8blAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190827331"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:43:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 3/3] drm/xe: Improve rebar log messages
Date: Mon, 17 Nov 2025 15:42:47 -0800
Message-ID: <20251117-xe-pci-rebar-2-part-2-v2-3-9f3dac7dec36@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
References: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Some minor improvements to the log messages in the rebar logic:
use xe-oriented printk, switch unit from M to MiB in a few places for
consistency and use ilog2(SZ_1M) for clarity.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_rebar.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
index a55950d1e2e2f..7e2c7079b6ff9 100644
--- a/drivers/gpu/drm/xe/xe_pci_rebar.c
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -6,12 +6,11 @@
 #include <linux/pci.h>
 #include <linux/types.h>
 
-#include <drm/drm_print.h>
-
 #include "regs/xe_bars.h"
 #include "xe_device_types.h"
 #include "xe_module.h"
 #include "xe_pci_rebar.h"
+#include "xe_printk.h"
 
 static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 {
@@ -21,12 +20,12 @@ static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 
 	ret = pci_resize_resource(pdev, resno, bar_size, 0);
 	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
+		xe_info(xe, "Failed to resize BAR%d to %dMiB (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			resno, 1 << bar_size, ERR_PTR(ret));
 		return;
 	}
 
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+	xe_info(xe, "BAR%d resized to %dMiB\n", resno, 1 << bar_size);
 }
 
 /*
@@ -59,11 +58,10 @@ void xe_pci_rebar_resize(struct xe_device *xe)
 						     (resource_size_t)SZ_1M);
 
 		if (!pci_rebar_size_supported(pdev, LMEM_BAR, rebar_size)) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
-				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
-				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
-				 (u64)current_size >> 20);
+			xe_info(xe, "Requested size %lluMiB is not supported by rebar sizes: 0x%llx. Leaving default: %lluMiB\n",
+				(u64)pci_rebar_size_to_bytes(rebar_size) >> ilog2(SZ_1M),
+				pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
+				(u64)current_size >> ilog2(SZ_1M));
 			return;
 		}
 
@@ -81,8 +79,8 @@ void xe_pci_rebar_resize(struct xe_device *xe)
 			return;
 	}
 
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+	xe_info(xe, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		(u64)current_size >> ilog2(SZ_1M), (u64)rebar_size >> ilog2(SZ_1M));
 
 	while (root->parent)
 		root = root->parent;
@@ -94,7 +92,7 @@ void xe_pci_rebar_resize(struct xe_device *xe)
 	}
 
 	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		xe_info(xe, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
 		return;
 	}
 

-- 
2.51.2

