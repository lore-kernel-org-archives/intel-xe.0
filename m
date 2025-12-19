Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC99E66891
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1C10ED16;
	Fri, 19 Dec 2025 21:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Derx/wse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40110E036
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766179030; x=1797715030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KzPLaDjJvJlg91yLwIUZs7Wd3cOLXoCAdtIUknS6+vs=;
 b=Derx/wseEXuhxY0hdORI7LQ6tBTA0bGfULS/Dzc6LUIMsMTGFxWxpxJm
 PGnhQNcCEVdQ33oE3whvYG2VATSAlC3l3YkmPHpMxXs9KjShQo9MPyAmt
 QLrgFEciB6clw9YFvqynlAtrQMg2punPpqc2gdZdmjWeGsCLNYazeCKzY
 A5Pn1miH8mQo3/gevsVP4Ewe9WR1HND02y19sBXxn/QYeDzsjFZGAbPOk
 rrRZCKhOVSiFcaHd4ndrZhIzHWiVSLNxVYDBaa8dT/hmRfH9FUMNbvmTw
 w0XZmaeJI+BJFvZu6A5UJHwghBrbnYwfKqjP78GijzUVMjkXglm+QmqXy w==;
X-CSE-ConnectionGUID: nml3KIwER9KxoauUkHkiTw==
X-CSE-MsgGUID: LsB6UUGXTqCt86zGCNgwSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68036836"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68036836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:10 -0800
X-CSE-ConnectionGUID: pP8h6opcTWGuRI6TAxqpVw==
X-CSE-MsgGUID: bhEnPXk2Qp+jbw54zv3jNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199447622"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:17:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [CI 2/2] drm/xe: Improve rebar log messages
Date: Fri, 19 Dec 2025 13:16:49 -0800
Message-ID: <20251219211650.1908961-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219211650.1908961-4-matthew.d.roper@intel.com>
References: <20251219211650.1908961-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Lucas De Marchi <lucas.demarchi@intel.com>

Some minor improvements to the log messages in the rebar logic:
use xe-oriented printk, switch unit from M to MiB in a few places for
consistency and use ilog2(SZ_1M) for clarity.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_rebar.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
index a55950d1e2e2..7e2c7079b6ff 100644
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
2.52.0

