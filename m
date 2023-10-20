Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EAACDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6822610E580;
	Fri, 20 Oct 2023 04:49:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391E610E583
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777339; x=1729313339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKEjtC9NQghjVvoBUWtnCR4KQWtgegp1ULTCs48cnnQ=;
 b=cMoEtd+n23YINZYaLY1idMKKqQblFrUAhpUYb5PZg8wAlPa4VvpV1SHn
 eNQJsAnRwfWZ02Pw5AnbIYPtzD8sQ6SSqyJtVlDSBI0saVfyo2OnjHtvf
 epWaAKYXfkAI/IZlT6/sdx7b4C6WKQG8bPrwx5yo58dUXtJAMuO2gghIE
 jSthmptP5xDNdIKi9pKDH1k0NOyewo0s+LbLu0HaBLZcncnAlkM+7WOOT
 viogGFZdzvN3ry6RpQznTc/VCauEMlosz6OMrJ8my2tx82nhTygbFZmfz
 HHo6ep95ESquB50qk1lKXXuF45J97YFxRXbz/Uyltx4m0LX2PA+i/xsz1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310807"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310807"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959797"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959797"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:48:57 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:27 +0530
Message-Id: <20231020045533.1425375-7-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 06/12] drm/xe: Rename XE_RESET_FAILED_UEVENT
 to XE_RESET_REQUIRED_UEVENT.
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

DEVICE_STATUS=NEEDS_RESET will be used for other reasons apart from
gt reset failure. Hence use more generic uevent name and provide reason
for reset along with the uevent.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 13 +++++++------
 include/uapi/drm/xe_drm.h  | 17 ++++++++++++-----
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 74e1f47bd401..91e0a9a7f1cd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -545,16 +545,17 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
 {
-	char *reset_event[4];
+	char *reset_event[5];
 
-	reset_event[0] = XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
-	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
-	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
-	reset_event[3] = NULL;
+	reset_event[0] = XE_RESET_REQUIRED_UEVENT;
+	reset_event[1] = XE_RESET_REQUIRED_UEVENT_REASON_GT;
+	reset_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
+	reset_event[3] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
+	reset_event[4] = NULL;
 	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
 
-	kfree(reset_event[1]);
 	kfree(reset_event[2]);
+	kfree(reset_event[3]);
 }
 
 static int gt_reset(struct xe_gt *gt)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 24bf8f0f52e8..ae1b1c7528d5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -19,12 +19,19 @@ extern "C" {
 /**
  * DOC: uevent generated by xe on it's pci node.
  *
- * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
- * fails. The value supplied with the event is always "NEEDS_RESET".
- * Additional information supplied is tile id and gt id of the gt unit for
- * which reset has failed.
+ * XE_RESET_REQUIRED_UEVENT - Event is generated when device needs reset.
+ * The REASON is provided along with the event for which reset is required.
+ * On the basis of REASONS, additional information might be supplied.
  */
-#define XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
+#define XE_RESET_REQUIRED_UEVENT        "DEVICE_STATUS=NEEDS_RESET"
+
+/**
+ * XE_RESET_REQUIRED_UEVENT_REASON_GT - Reason provided to XE_RESET_REQUIRED_UEVENT
+ * incase of gt reset failure. The additional information supplied is tile id and
+ * gt id of the gt unit for which reset has failed.
+ */
+#define XE_RESET_REQUIRED_UEVENT_REASON_GT    "REASON=GT_RESET_FAILED"
+
 
 /**
  * struct xe_user_extension - Base class for defining a chain of extensions
-- 
2.25.1

