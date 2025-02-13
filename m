Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A14C021AA
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C410EB90;
	Thu, 13 Feb 2025 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UG/MX3K9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD1810EB8A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739474975; x=1771010975;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HHmvsaRSqjNJrfWUAJTzp7HJO3qQO+601n99Up9znao=;
 b=UG/MX3K9JaPY8bYoyfyFiRWwZ2XN/a24Jwalbi42Kz+C6v9exUQcLUKJ
 j8c3bz/Kccsiuk6Pm6ipxUu4w3Dzwaju/4xnIBz9+TjYh63Vdq4ZR72pG
 aNEZkPlnonDtdfAUieaLu1o0DN34GTRn5VHnOXYy3xfcThlrx8X8ozvcD
 t0x4H8d6MHkTm8E7yBsKGDs5H4NON/QqVq8n0ujF0hbGRNBYTiSqsHqN6
 F98naTDxe/+7JPIP14e6syYnpGgV18rZy1djf3g+rSz6dQq+Juz8P/3Ad
 BZ4Hqd+NU1EJKsq9mqT3MqMxw9xg5CUP9ifwHVr2goFDwWp2Ec3LEdXnG w==;
X-CSE-ConnectionGUID: 6zZU63VZQMOxiOTnY31pqA==
X-CSE-MsgGUID: B20fk0rSQ0uaRv7Xean9cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40127920"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40127920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
X-CSE-ConnectionGUID: RTXYGlEqSjyVfTGQi8JXHQ==
X-CSE-MsgGUID: 4bk8N5znStK0Yy7t+NwOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150416855"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:29:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 01/13] drm/xe: Add callback support for driver remove
Date: Thu, 13 Feb 2025 11:28:57 -0800
Message-ID: <20250213192909.996148-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

xe device probe uses devm cleanup in most places. However there are a
few cases where this is not possible: when the driver interacts with
component add/del. In that case, the resource group would be cleanup
while the entire device resources are in the process of cleanup.  One
example is the xe_gsc_proxy and display using that to interact with mei
and audio.

Add a callback-based remove so the exception doesn't make the probe
use multiple error handling styles.

v2: Change internal API to mimic the devm API. This will make it easier
    to migrate in future when devm can be used.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 68 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h | 14 ++++++
 drivers/gpu/drm/xe/xe_pci.c          |  4 +-
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 17280e895155c..31da48d4fdb91 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,6 +65,12 @@
 
 #include <generated/xe_wa_oob.h>
 
+struct xe_device_remove_action {
+	struct list_head node;
+	void (*action)(void *);
+	void *data;
+};
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -746,6 +752,9 @@ int xe_device_probe(struct xe_device *xe)
 	u8 last_gt;
 	u8 id;
 
+	xe->probing = true;
+	INIT_LIST_HEAD(&xe->remove_action_list);
+
 	xe_pat_init_early(xe);
 
 	err = xe_sriov_init(xe);
@@ -886,6 +895,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe->probing = false;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
@@ -907,6 +918,61 @@ int xe_device_probe(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_device_call_remove_actions - Call the remove actions
+ * @xe: xe device instance
+ *
+ * This is only to be used by xe_pci and xe_device to call the remove actions
+ * while removing the driver or handling probe failures.
+ */
+void xe_device_call_remove_actions(struct xe_device *xe)
+{
+	struct xe_device_remove_action *ra, *tmp;
+
+	list_for_each_entry_safe(ra, tmp, &xe->remove_action_list, node) {
+		ra->action(ra->data);
+		list_del(&ra->node);
+		kfree(ra);
+	}
+
+	xe->probing = false;
+}
+
+/**
+ * xe_device_add_action_or_reset - Add an action to run on driver removal
+ * @xe: xe device instance
+ * @action: Function that should be called on device remove
+ * @data: Pointer to data passed to @action implementation
+ *
+ * This adds a custom action to the list of remove callbacks executed on device
+ * remove, before any dev or drm managed resources are removed.  This is only
+ * needed if the action leads to component_del()/component_master_del() since
+ * that is not compatible with devres cleanup.
+ *
+ * Returns: 0 on success or a negative error code on failure, in which case
+ * @action is already called.
+ */
+int xe_device_add_action_or_reset(struct xe_device *xe,
+				  void (*action)(void *), void *data)
+{
+	struct xe_device_remove_action *ra;
+
+	drm_WARN_ON(&xe->drm, !xe->probing);
+
+	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
+	if (!ra) {
+		action(data);
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&ra->node);
+	ra->action = action;
+	ra->data = data;
+	list_add(&ra->node, &xe->remove_action_list);
+
+	return 0;
+}
+
 static void xe_device_remove_display(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -932,6 +998,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
+
+	xe_device_call_remove_actions(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e68030..079dad32a6f53 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -45,6 +45,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
+int xe_device_add_action_or_reset(struct xe_device *xe,
+				  void (*action)(void *), void *data);
+void xe_device_call_remove_actions(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a37..4656305dd45a6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -428,6 +428,20 @@ struct xe_device {
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
+	/**
+	 * @remove_action_list: list of actions to execute on device remove.
+	 * Use xe_device_add_remove_action() for that. Actions can only be added
+	 * during probe and are executed during the call from PCI subsystem to
+	 * remove the driver from the device.
+	 */
+	struct list_head remove_action_list;
+
+	/**
+	 * @probing: cover the section in which @remove_action_list can be used
+	 * to post cleaning actions
+	 */
+	bool probing;
+
 	/**
 	 * @mem_access: keep track of memory access in the device, possibly
 	 * triggering additional actions when they occur.
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6a8e82aff3853..70b697fde5b96 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -905,8 +905,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe(xe);
-	if (err)
+	if (err) {
+		xe_device_call_remove_actions(xe);
 		return err;
+	}
 
 	err = xe_pm_init(xe);
 	if (err)
-- 
2.48.1

