Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE30FCCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 21:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9132510E329;
	Fri, 31 Oct 2025 21:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqY6MOI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773F10E325
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761945508; x=1793481508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9MGfEdvb5DE3LVtIdvp3rOQzpe5Y+Gf4bPUyXuVFqs=;
 b=AqY6MOI2Sh5RWylz7KHIkt4l9fHP0WLFsDW692y204LUhV3JD7IHIk4h
 2GybPluGG9Vtg+xfRlLcmm5o4jZCGbGTSssDUD9FlV0jSTUFQSo4B4kkN
 2htO2nx5Pk2nsqh3ITVB+qyit5H0rGpnJr4jIFcbmboN+fUlVXySxLJp3
 j+5DGw+2X6IJ2epn/AeyXFO6UxeQzh0a84nv4t3XuoXQb6n1VtuT7GR/N
 eKafqBN6U6cXz8sgrZmwGmeevfgiyu8mO9cYAmo44ep8UwF169/sVCKOA
 2cTYja5BUh/5P36q+dMlX6a/TgX82/LwWd+b/8KV34EmCUFXDjyCtdD/a w==;
X-CSE-ConnectionGUID: v8qAhj8DQyemxmBkO8lhfw==
X-CSE-MsgGUID: dNtkRNggSseiHrhiWUzcNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="86740453"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="86740453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
X-CSE-ConnectionGUID: yIFaGJnaRw+04aTYUvK7Ig==
X-CSE-MsgGUID: DmNou3jFQAaoloig2Rd7mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="209891499"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:18:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Improve rebar log messages
Date: Fri, 31 Oct 2025 14:17:43 -0700
Message-ID: <20251031-xe-pci-rebar-2-part-2-v1-2-c4a794a39041@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
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
consistency and us ilog2(SZ_1M) for clarity.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_rebar.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
index d21e29c95ca33..378447a3be0ca 100644
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
 
 #define BAR_SIZE_SHIFT 20
 
@@ -47,12 +46,12 @@ static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 
 	ret = pci_resize_resource(pdev, resno, bar_size);
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
@@ -93,9 +92,8 @@ void xe_pci_rebar(struct xe_device *xe)
 		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
 
 		if (!bar_size_bit) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			xe_info(xe, "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				(u64)rebar_size >> ilog2(SZ_1M), bar_size_mask, (u64)current_size >> ilog2(SZ_1M));
 			return;
 		}
 
@@ -111,8 +109,8 @@ void xe_pci_rebar(struct xe_device *xe)
 			return;
 	}
 
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+	xe_info(xe, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		(u64)current_size >> ilog2(SZ_1M), (u64)rebar_size >> ilog2(SZ_1M));
 
 	while (root->parent)
 		root = root->parent;
@@ -124,7 +122,7 @@ void xe_pci_rebar(struct xe_device *xe)
 	}
 
 	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		xe_info(xe, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
 		return;
 	}
 

-- 
2.51.0

