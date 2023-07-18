Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AB1C001DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 13:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB5B10E1C7;
	Tue, 18 Jul 2023 13:21:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3CB10E1C7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689686511; x=1721222511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vEoLAlX5pnpau7iYCBB8M/Or241fLnrEAg7+PuKS8mY=;
 b=naAt9J1gCq9i8Cwl/rsQOniXq1sBP+1n1KGHNX1PF/GyyWDWULSVSybz
 oH15YnYsZtVQe/Tuv1EFU2VDkj3L/bEPOFyPl71nViOhMdLPF3ItBP30Z
 30+uePpfaWPNEyGzdcExVObACnGu0YWhSkjUiifiq1TKx23iozVmRwh/f
 4M817ft59hvcQ/YFqKYdAbJHHTHZtiX4Dr/BSDBmBmURQ5ncovEG49zSt
 cKlUnWD9Y6WuWzR3sqjEZABNR8Rn6Q+A6/EIQpcistwtCiv8VSGLluG+5
 y8WZB3qkgl9nu5phrkf/LRUMQgR7a/MOqLiUotV7MHDipeNSF4EPbPew/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397043529"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="397043529"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700896653"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="700896653"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 06:21:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 18:56:45 +0530
Message-Id: <20230718132646.3079349-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230718132646.3079349-1-himal.prasad.ghimiray@intel.com>
References: <20230718132646.3079349-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/2] drm/xe: Notify Userspace when gt reset
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
-Add NULL check for xe_gt_hw_engine return(Aravind)
-Arrange variables in Christmas tree order(Tejas)
-Check GUC_GSC_OTHER_CLASS(Tejas)

v3:
- Rebase
- Remove notification for engine reset failure (Rodrigo)

v4
- Rectify the comments in header file.

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
 include/uapi/drm/xe_drm.h  |  8 ++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a21d44bfe9e8..1db4d610f2fd 100644
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
 
+static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
+{
+	char *reset_event[5];
+
+	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
+	reset_event[1] = "RESET_ENABLED=1";
+	reset_event[2] = "RESET_UNIT=gt";
+	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
+	reset_event[4] = NULL;
+	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
+
+	kfree(reset_event[3]);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
+	/* Notify userspace about gt reset failure */
+	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
+
 	return err;
 }
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 347351a8f618..c28bb54812e5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -16,6 +16,14 @@ extern "C" {
  * subject to backwards-compatibility constraints.
  */
 
+/*
+ * Uevents generated by xe on it's device node.
+ *
+ * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
+ * gt fails. The value supplied with the event is always 1.
+ */
+#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
+
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
  *
-- 
2.25.1

