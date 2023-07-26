Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE377C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 23:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A8410E4CD;
	Wed, 26 Jul 2023 23:21:49 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A2810E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 23:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690413707; x=1721949707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ruLI7ys7oECnYrv6MBOgUqPFxdHS0gXdM/IC6FdaJhw=;
 b=BQwrN/ouaYvBemFh0WC9HlsgE0ksNACVNbHZaNZA5qV/UluhlI3aTL0I
 8mY3CwgLmTANlneQuEpERU0vLhZ8ZKMOYwA+5IYxwjoLq+Lraoc2PDGE7
 2AyCVuDWYpgt73DaL6RukIcAB1LWD3iwTjwHFzjMQr9Bt2eHPkzlVFWq4
 0PumOV10llOfNuG8ZDCAiE7Vbxf3Mr6z/Mk4I2q+JbJ45q9J+8OkOG1et
 iCJz6R2h/BzgN38+vi9BGYPnENoGfOcfk05K88VG0aXL82tW2y6xvrH9b
 9mmd40zbNAjSMEE7qdWbKpLxtKrC0OWQVkT0e4ht61oTzPuB4woiEnyDU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="367031374"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="367031374"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 16:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726715229"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="726715229"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 16:21:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 04:56:49 +0530
Message-Id: <20230726232650.3873897-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
References: <20230726232650.3873897-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 2/3] drm/xe: Notify Userspace when gt reset
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

v5
- Add tile id and gt id as additional info provided by uevent.
- Provide code documentation for the uevent. (Rodrigo)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 19 +++++++++++++++++++
 include/uapi/drm/xe_drm.h  | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..5e70e486b27c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <linux/minmax.h>
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_bb.h"
@@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
+{
+	char *reset_event[4];
+
+	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
+	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
+	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
+	reset_event[3] = NULL;
+	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[1]);
+	kfree(reset_event[2]);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -550,6 +565,10 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
+	/* Notify userspace about gt reset failure */
+	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
+				   gt_to_tile(gt)->id, gt->info.id);
+
 	return err;
 }
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 347351a8f618..18a0feb1a259 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -16,6 +16,16 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/**
+ * DOC: uevent generated by xe on it's pci node.
+ *
+ * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
+ * fails. The value supplied with the event is always "NEEDS_RESET".
+ * Additional information supplied is tile id and gt id of the gt unit for
+ * which reset has failed.
+ */
+#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
  *
-- 
2.25.1

