Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE6C021B7
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090F410EB40;
	Sat, 22 Feb 2025 00:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRiYScf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10D910E10F
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bq+JS53+jXDrFy/aW1oD2gVJsiR/2S3m62P47E+/Q/0=;
 b=fRiYScf9A1dhyi4oMNtMVwmm7ybMZzseqdTJsKpxmPjIivJ8Fu6lnsIO
 h5L4l8C+FG6zqCrCw7LrTRWgT3Di3jYZ0JunYyOwmh9ElfKiyYTn80hGh
 R9d8BJmAAsTfVgPRbYoXq0expC/oBq2o1Zny93QLjoaMUUhGcoWiKRpTD
 WxVjRhB3NsyGO08CN/nYE4DagP2ZLDoC/HKtH6k9j4OQOUiqJmWiyE2W/
 BwTBB2NMKZboGxDTFGV0kpxN4MTOxmFUG8VgMMk3YvL71uZruMqEYAIHr
 mKufPmnTmbiVqnTey6sl+Ba0ewWTw8S9qONmSadotP+57kYOJ6W/KcSjk A==;
X-CSE-ConnectionGUID: gk7GoVT7R/iaPwsLBt5+NA==
X-CSE-MsgGUID: qreWl8/qQYefMVSCM9kI8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926391"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926391"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: xOsIk4rSSRK76kO78rVHlw==
X-CSE-MsgGUID: HM/z4NbpTkahvBgJFnoRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704945"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 06/11] drm/xe: Drop remove callback support
Date: Fri, 21 Feb 2025 16:10:46 -0800
Message-ID: <20250222001051.3012936-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

Now that devres supports component driver cleanup during driver removal
cleanup, the xe custom support for removal callbacks is not needed
anymore. Drop it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 68 ----------------------------
 drivers/gpu/drm/xe/xe_device.h       |  3 --
 drivers/gpu/drm/xe/xe_device_types.h | 14 ------
 drivers/gpu/drm/xe/xe_pci.c          |  4 +-
 4 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64d3a26ad4a3e..e76d233025a69 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,12 +65,6 @@
 
 #include <generated/xe_wa_oob.h>
 
-struct xe_device_remove_action {
-	struct list_head node;
-	void (*action)(void *);
-	void *data;
-};
-
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -752,9 +746,6 @@ int xe_device_probe(struct xe_device *xe)
 	int err;
 	u8 id;
 
-	xe->probing = true;
-	INIT_LIST_HEAD(&xe->remove_action_list);
-
 	xe_pat_init_early(xe);
 
 	err = xe_sriov_init(xe);
@@ -904,8 +895,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
-	xe->probing = false;
-
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
@@ -916,61 +905,6 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
-/**
- * xe_device_call_remove_actions - Call the remove actions
- * @xe: xe device instance
- *
- * This is only to be used by xe_pci and xe_device to call the remove actions
- * while removing the driver or handling probe failures.
- */
-void xe_device_call_remove_actions(struct xe_device *xe)
-{
-	struct xe_device_remove_action *ra, *tmp;
-
-	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
-		ra->action(ra->data);
-		list_del(&ra->node);
-		kfree(ra);
-	}
-
-	xe->probing = false;
-}
-
-/**
- * xe_device_add_action_or_reset - Add an action to run on driver removal
- * @xe: xe device instance
- * @action: Function that should be called on device remove
- * @data: Pointer to data passed to @action implementation
- *
- * This adds a custom action to the list of remove callbacks executed on device
- * remove, before any dev or drm managed resources are removed.  This is only
- * needed if the action leads to component_del()/component_master_del() since
- * that is not compatible with devres cleanup.
- *
- * Returns: 0 on success or a negative error code on failure, in which case
- * @action is already called.
- */
-int xe_device_add_action_or_reset(struct xe_device *xe,
-				  void (*action)(void *), void *data)
-{
-	struct xe_device_remove_action *ra;
-
-	drm_WARN_ON(&xe->drm, !xe->probing);
-
-	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
-	if (!ra) {
-		action(data);
-		return -ENOMEM;
-	}
-
-	INIT_LIST_HEAD(&ra->node);
-	ra->action = action;
-	ra->data = data;
-	list_add(&ra->node, &xe->remove_action_list);
-
-	return 0;
-}
-
 void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -980,8 +914,6 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_driver_remove(xe);
 
 	xe_heci_gsc_fini(xe);
-
-	xe_device_call_remove_actions(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 079dad32a6f53..0bc3bc8e68030 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -45,9 +45,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
-int xe_device_add_action_or_reset(struct xe_device *xe,
-				  void (*action)(void *), void *data);
-void xe_device_call_remove_actions(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4656305dd45a6..833c29fed3a37 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -428,20 +428,6 @@ struct xe_device {
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
-	/**
-	 * @remove_action_list: list of actions to execute on device remove.
-	 * Use xe_device_add_remove_action() for that. Actions can only be added
-	 * during probe and are executed during the call from PCI subsystem to
-	 * remove the driver from the device.
-	 */
-	struct list_head remove_action_list;
-
-	/**
-	 * @probing: cover the section in which @remove_action_list can be used
-	 * to post cleaning actions
-	 */
-	bool probing;
-
 	/**
 	 * @mem_access: keep track of memory access in the device, possibly
 	 * triggering additional actions when they occur.
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 41ec6825b9bcc..447eacb355d7c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -900,10 +900,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe(xe);
-	if (err) {
-		xe_device_call_remove_actions(xe);
+	if (err)
 		return err;
-	}
 
 	err = xe_pm_init(xe);
 	if (err)
-- 
2.48.1

