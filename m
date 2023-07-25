Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DF9C001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCED10E3E6;
	Tue, 25 Jul 2023 15:46:20 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653010E3E2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690299978; x=1721835978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ju4Jqs3zutw8g9fNu3/vPA2mu46e09pN57RALHm9hVs=;
 b=llWWvPvNRV/qdULHec23vkK9vnc9gt3EdbMwB3QTZllYXOnmVw2XoQi9
 wIJnhwtxh53rVRbQ5KISjfn5zppn8WOcOoVdrLTs3wO2V/ctYHGXv3mWb
 7S5W/TsNw0YHQlorbEMMwvwVV6rvju5oFBCNoczzkspE8VeUYut33afn6
 /FwuX6fwm1TWFJ1btSWJaIHCUw8IFphdgla9/xwYxhlksaynaB1sUMMHy
 +z87FoDuwyW/dAb/V/moRiI00qEf5kbqhVi1Xa5csJ67jwbSfTxfQROmB
 9NSM605w+YT1CQnYEnOv/cMFM5+5AYZ2nhJnzXRvckiehxDNKOAAaMhtM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352667261"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="352667261"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729395483"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="729395483"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 08:46:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 21:21:14 +0530
Message-Id: <20230725155115.3759312-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
References: <20230725155115.3759312-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v8 2/3] drm/xe: Notify Userspace when gt reset
 fails
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Send uevent in case of gt reset failure. This intimation can be used by
userspace monitoring tool to do the device level reset/reboot
when GT reset fails. udevadm can be used to monitor the uevents.

v2:
- Support only gt failure notification (Rodrigo)

v3
- Rectify the comments in header file.

v4
- Use pci kobj instead of drm kobj for notification.(Rodrigo)
- Cleanup (Badal)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 17 +++++++++++++++++
 include/uapi/drm/xe_drm.h  |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..f4766fb6bfdb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <linux/minmax.h>
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_bb.h"
@@ -500,6 +501,19 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 id)
+{
+	char *reset_event[4];
+
+	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
+	reset_event[1] = "RESET_FAILED=gt";
+	reset_event[2] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
+	reset_event[3] = NULL;
+	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[2]);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -550,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
+	/* Notify userspace about gt reset failure */
+	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev), gt->info.id);
+
 	return err;
 }
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 347351a8f618..fdacee0a27c5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -16,6 +16,14 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/*
+ * Uevent generated by xe on it's pci node.
+ *
+ * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engine
+ * fails. The value supplied with the event is always "NEEDS_RESET".
+ */
+#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
  *
-- 
2.25.1

