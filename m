Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0548CC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02AE10EA40;
	Fri, 15 Dec 2023 15:46:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F92F10EA40
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655194; x=1734191194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FIvVOP/Aee0nMHzyUTe8wLXAbuPzEYPEou2sUsiYG1U=;
 b=V/5IxkWSUDQFkxh056kOiwOyZSu4oxZH5sIBcEK7wR0HYAJ1x95/EaRg
 r6lnxX2BaFgc/ykMC+pFevVUVJ7r2n8Sg8KQBywZ42g283H6mCg3VOlDZ
 e5dpwBah+rOSTVnJoFvyPDkKKe9vcoWEx5KvnpVyQ7T7M6x+0zVU5TiUR
 c+eHnNK3kBiDkO72e3L0cZKn4PFI4BcVhRE6MnvgDwOvmNig6NK1Kb+ze
 6NOf60nqWaLV3nEjWgwYcNTAtL9KDkpk/iC+wb4uIuc/0pu8udgA1IRGP
 6c+rZ0LtBAHhE2nXHTVcfSXb476lHLwsI1SlA35O8ON6Hb9TizFgQdikI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141882"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324590"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:33 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 21/21] drm/xe/uapi: Remove reset uevent for now
Date: Fri, 15 Dec 2023 15:45:53 +0000
Message-Id: <20231215154553.7-22-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

This kernel uevent is getting removed for now. It will come
back later with a better future proof name.

v2: Rebase (Francois Dugast)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 18 ------------------
 include/uapi/drm/xe_drm.h  | 11 -----------
 2 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index f5d18e98f8b6..3af2adec1295 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -589,20 +589,6 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
-static void xe_uevent_gt_reset_failure(struct pci_dev *pdev, u8 tile_id, u8 gt_id)
-{
-	char *reset_event[4];
-
-	reset_event[0] = DRM_XE_RESET_FAILED_UEVENT "=NEEDS_RESET";
-	reset_event[1] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile_id);
-	reset_event[2] = kasprintf(GFP_KERNEL, "GT_ID=%d", gt_id);
-	reset_event[3] = NULL;
-	kobject_uevent_env(&pdev->dev.kobj, KOBJ_CHANGE, reset_event);
-
-	kfree(reset_event[1]);
-	kfree(reset_event[2]);
-}
-
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -659,10 +645,6 @@ static int gt_reset(struct xe_gt *gt)
 err_fail:
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
-	/* Notify userspace about gt reset failure */
-	xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
-				   gt_to_tile(gt)->id, gt->info.id);
-
 	gt_to_xe(gt)->needs_flr_on_fini = true;
 
 	return err;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 919aa72c4481..9fa3ae324731 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -20,7 +20,6 @@ extern "C" {
  *   2. Extension definition and helper structs
  *   3. IOCTL's Query structs in the order of the Query's entries.
  *   4. The rest of IOCTL structs in the order of IOCTL declaration.
- *   5. uEvents
  */
 
 /**
@@ -1341,16 +1340,6 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/**
- * DOC: uevent generated by xe on it's pci node.
- *
- * DRM_XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset gt
- * fails. The value supplied with the event is always "NEEDS_RESET".
- * Additional information supplied is tile id and gt id of the gt unit for
- * which reset has failed.
- */
-#define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

