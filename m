Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999B5D77892
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBD10EB78;
	Fri, 23 Jan 2026 17:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5yaUugG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179010EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769189204; x=1800725204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HPtFvfX5wwqiZmj4WCGRfp6NFAYzfDOYEtwh4oCZhdc=;
 b=g5yaUugGlC+XMgLEYU2SI0U+vLMnemaBKhcgEgeeMjwhuDCN6mZDhCtT
 XEqBtCw+TGd4nauupRb2OyPKpox4EwrG1uTMD+34fZ9rWF1FNaU9L02oa
 t/5boklKYHAZPtWBqOp2ULTkBcw8GxTOiDVbRgWhilbBPX3GKJrB86pqX
 WeNWQsTrw/Gh8XV4A1jwx/Zt3THByTnuLZkgT72c0BZwU71rJbEd+CiqU
 9Z8q4V+PmWO+wQ0udwelo8LrLnJMfp6bDayEKxFjRKW4sy2b1kRzA4nqh
 cctx9s8g+DByC0neS4BS1VBagxJAZ+ALkeIG88nSbXsslnzHxq17vqXgI A==;
X-CSE-ConnectionGUID: KUHaaQN+QoudLqgF80fFZQ==
X-CSE-MsgGUID: O5hYUy2QTuSQpKhdrNV94w==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="73034591"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="73034591"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:26:44 -0800
X-CSE-ConnectionGUID: fHidjCYTRiGBvNuiz7jxBA==
X-CSE-MsgGUID: ubCaKvddQPuuxgDGosy3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="212072547"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:26:41 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/pm: Disable D3Cold for BMG only on specific platforms
Date: Fri, 23 Jan 2026 23:02:38 +0530
Message-Id: <20260123173238.1642383-1-karthik.poosa@intel.com>
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

Restrict D3Cold disablement for BMG to unsupported NUC platforms,
instead of disabling it on all platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3e331a6715ee ("drm/xe/pm: Temporarily disable D3Cold on BMG")
---
 drivers/gpu/drm/xe/xe_pm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 559cf5490ac0..01185f10a883 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -8,6 +8,7 @@
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
+#include <linux/dmi.h>
 
 #include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
@@ -366,9 +367,15 @@ ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
 
 static u32 vram_threshold_value(struct xe_device *xe)
 {
-	/* FIXME: D3Cold temporarily disabled by default on BMG */
-	if (xe->info.platform == XE_BATTLEMAGE)
-		return 0;
+	if (xe->info.platform == XE_BATTLEMAGE) {
+		const char *product_name;
+
+		product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
+		if (product_name && strstr(product_name, "NUC13RNG")) {
+			drm_warn(&xe->drm, "BMG + D3Cold not supported on this platform\n");
+			return 0;
+		}
+	}
 
 	return DEFAULT_VRAM_THRESHOLD;
 }
-- 
2.25.1

