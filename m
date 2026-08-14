Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA94C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1656210F6D8;
	Fri, 14 Aug 2026 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3BOnsi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1246910F6CA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727941; x=1818263941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CXDrTVJ/EwBoQ3tSLkAFRxTBYwYbNFj7m/l+j5uc4e0=;
 b=c3BOnsi8/6YKpOuZQCbCuMTOkcRf6Phn4hah+VRm74R6HW88wvPQMakV
 u4kMTrZ04pK0j5qyLZWhCk3N4gBGJS1m6nIAb4HXw/+aTYqjiEhc7g6ze
 DKqBFKFbuBUOt4/nPe0Y/jqK1lA/iIlfQJ9nxZ+3DI9SFZJKtqBOUjDcn
 mi7IFz5rmbPf/Gsjfms///bm5gQDEZnkO12ML0upalxH5cYondBnHKA8T
 aK0qnGfeMQ2/MlGwyncJ43rS56prMRP8/xZIb/M0q7lHQhvH+wdnEggPy
 n94pRSReeEdqZXQWbY/696KBIQZmgf24XQHFvY2vinwmIqH9dDKrRsj+X A==;
X-CSE-ConnectionGUID: 7UNMaomXSkaQ81Q8EOyxEw==
X-CSE-MsgGUID: C2UB6S0aSMuqNI6sMLGQHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464092"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464092"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:01 -0700
X-CSE-ConnectionGUID: BKW2rkejQ72HLtIgpWUXYA==
X-CSE-MsgGUID: AXtU9YfcQ96mrEGajy32dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946285"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 24/33] drm/xe/survivability: Report 'Runtime Mode enabled'
 status using SIGID
Date: Fri, 14 Aug 2026 19:17:50 +0200
Message-ID: <20260814171801.13347-25-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'Runtime Mode' status or failure using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: always use xe_log_err (Riana)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 77923bdfb19b..45d44ebe288b 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -436,7 +436,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
-		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
+		xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
 		return;
 	}
 
@@ -444,11 +444,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	create_survivability_sysfs(pdev);
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
-	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
+
+	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
+	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
+		xe->info.platform_name);
 }
 
 /**
-- 
2.47.1

