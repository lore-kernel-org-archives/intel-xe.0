Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A4CC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB1F10F6BA;
	Fri, 14 Aug 2026 17:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgjQvBQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DA910F6D6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727935; x=1818263935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQx0Sh0yfkluC8aikoI0X9SRAJ6BO/MBY2/5P9aFmjc=;
 b=ZgjQvBQ1iCmm739qzSZsCccNqm3v/LSRXXHEgEt1HSANdssAj+Yy/sQh
 eRJtP5LqsHQhq7ogqHdKW7EedmpHdcQKY40yly7sK6jrZh4sKIiyVm5M0
 p6dk0JNOdLfnabAFQ8jQ02snBq2VixkVDIBN+ePoLlJuuQRRltbWxwiIE
 Yn8pMSNV9p8EzGdUDDcpWn+zMPu1Frr5FRdpIrsnuN8fwX5UTHys/SMYo
 wwFWv1P5qOJTXa3sMSfFV2sOBdRc3oJohuGV1ysRSsyRz5AwQS4cOpT+A
 Qc1D94SFtSoykZboZgCo8jQrvdhdfUSIxWl+7TCZmCaS05HbwSDpoXaYg Q==;
X-CSE-ConnectionGUID: MP5t1K8AQLChrJZVifVnRA==
X-CSE-MsgGUID: 49BZ3VX0Sbmg1Jz7jiz88Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464080"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464080"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:55 -0700
X-CSE-ConnectionGUID: sSJoGX3bRciWXz2DPVh8cw==
X-CSE-MsgGUID: QcL/UYEPRnyvQ2FkaCen7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946263"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v5 21/33] drm/xe/survivability: Report sysfs failure in one
 place
Date: Fri, 14 Aug 2026 19:17:47 +0200
Message-ID: <20260814171801.13347-22-michal.wajdeczko@intel.com>
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

If we fail to create any of the survivability sysfs files, actual
error is reported by the caller. Move that reporting to sysfs helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: don't use SIGID (Riana)
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 0ace10ae500a..8b74bbc96390 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -18,6 +18,7 @@
 #include "xe_mmio.h"
 #include "xe_nvm.h"
 #include "xe_pcode_api.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 
 /**
@@ -309,24 +310,26 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	int ret;
 
 	ret = device_create_file(dev, &dev_attr_survivability_mode);
-	if (ret) {
-		dev_warn(dev, "Failed to create survivability sysfs files\n");
-		return ret;
-	}
+	if (ret)
+		goto failed;
 
 	ret = devm_add_action_or_reset(xe->drm.dev,
 				       xe_survivability_mode_fini, xe);
 	if (ret)
-		return ret;
+		goto failed;
 
 	/* Survivability info is not required if enabled via configfs */
 	if (!xe_configfs_get_survivability_mode(pdev)) {
 		ret = devm_device_add_group(dev, &survivability_info_group);
 		if (ret)
-			return ret;
+			goto failed;
 	}
 
 	return 0;
+
+failed:
+	xe_err(xe, "Failed to create survivability sysfs files: %pe\n", ERR_PTR(ret));
+	return ret;
 }
 
 static int enable_boot_survivability_mode(struct pci_dev *pdev)
@@ -432,9 +435,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
 	}
 
 	populate_survivability_info(xe);
-
-	if (create_survivability_sysfs(pdev))
-		dev_err(&pdev->dev, "Failed to create survivability sysfs\n");
+	create_survivability_sysfs(pdev);
 
 	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
 	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
-- 
2.47.1

