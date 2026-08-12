Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8E9C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B157C10F0E3;
	Wed, 12 Aug 2026 19:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJVBWcvt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA95510F0E2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562143; x=1818098143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLPsItovC3qIRbBI7DUE0ilc0wbAHSi+PNPG7xUL0M4=;
 b=kJVBWcvt8/AlHrmSR/8k0mbc30HEFaBJHVhDPJAbBVBmIXYM1XuM8YIi
 KsthbMzSQK45raTKBCxXKzBYg0Bf3fwUHxkp6JvwLBxC4o4thGFqfOMXI
 vsDXJCi+/Hs4Z4GKTXHZoyhYaaPRbOzFInCIReLal1vdro3X1gWRjeZ3P
 C+LuYeP7Zckr9Y0lx4qVQqi1OOoCvYrM+ul8dQ++NJqkelwHI6hGpJGdc
 Ia8LrMr+y83kPbXt4aJ8dR9Q3s3fEbM9zHjx4+vB7YkFLjjKu9mIS8wvJ
 KHQhCY6fZR1MhnWrYIYJTRGQ5HqFCBXt8eJcCUqDZhcdWCBXcJs+essPE A==;
X-CSE-ConnectionGUID: TZ18mTZPTcavEGOw1P4q2A==
X-CSE-MsgGUID: zbmiIP/+Rw6Rk2/Bw0reTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987575"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:42 -0700
X-CSE-ConnectionGUID: KCW0jQsfTSuBYAZGRnKCUA==
X-CSE-MsgGUID: Q8+lH4NrQ8KMC7a/d3fsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892052"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode enabled'
 status using SIGID
Date: Wed, 12 Aug 2026 21:14:39 +0200
Message-ID: <20260812191450.11690-24-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'Runtime Mode' status using various xe_log() helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index ebd288986c11..5d3315ac735c 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -18,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 
 /**
@@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
-		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
+		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
 		return;
 	}
 
@@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	create_survivability_sysfs(pdev);
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+	xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
+
+	xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
+	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
+		xe->info.platform_name);
 }
 
 static void log_survivability_info(struct xe_device *xe)
-- 
2.47.1

