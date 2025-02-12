Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BB2C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314D410E26A;
	Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXBU+/Bl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FEF10E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388994; x=1770924994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=886O8OOLJZTvKG89Xv5APo7kx2NiPClv2yKHgrg1ds0=;
 b=RXBU+/Bl2LtPvlqsQjJzSH1giKS2Y+je5mIYHL/DT8apRgJruD3REyIO
 zSPuaR/PorAxkGEKb1ltxl0IqZVsQSSHAvyyoLUfg9bjhw/EsRHdW1uD9
 yD0COEUQFjUwWJYYi7znYJ3hFq8WONffT1ls4OA0hOxVN8VJ67QNcJTOF
 LCFpT5blkp553+DjuPIf6GkjUca3ktWTIBD2bYK119vVxOl3m7zwurSe/
 DR2KrPUBwGLg20ozGUj1NtJTrLLAZ9O0EA69XQSTj7pe+ExpiQTdGXuGp
 U4A5gNksIjIF1frH/DImYrVbCYUhP+lSft9RBYqm7/0pQLdU1/k3OG6sz A==;
X-CSE-ConnectionGUID: 5mdO9SKGSMKpGsqGlHghsw==
X-CSE-MsgGUID: r7/AkikKQsq5/lAM3RtooA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184234"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184234"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:34 -0800
X-CSE-ConnectionGUID: fWLT/RwpSW6GLmCL1naX3w==
X-CSE-MsgGUID: hSXwupAKS6K44L4WLW/iRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437855"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 01/13] drm/xe: Add callback support for driver remove
Date: Wed, 12 Feb 2025 11:35:48 -0800
Message-ID: <20250212193600.475089-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 79 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.h       |  4 ++
 drivers/gpu/drm/xe/xe_device_types.h | 17 ++++++
 drivers/gpu/drm/xe/xe_pci.c          |  4 +-
 4 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 36d7ffb3b4d90..69bde506ee87e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -65,6 +65,12 @@
 
 #include <generated/xe_wa_oob.h>
 
+struct xe_device_remove_action {
+	struct list_head node;
+	xe_device_remove_action_t remove;
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
@@ -907,6 +918,72 @@ int xe_device_probe(struct xe_device *xe)
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
+		ra->remove(xe, ra->data);
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
+ * @ra: pointer to the object embedded into the object to cleanup
+ * @remove: function to execute. The @ra is passed as argument
+ *
+ * Example:
+ *
+ * .. code-block:: c
+ *
+ *	static void foo_remove(struct xe_device_remove_action *ra)
+ *	{
+ *		struct xe_foo *foo = container_of(ra, struct xe_foo, remove_action);
+ *		...
+ *	}
+ *
+ *	int xe_foo_init(struct xe_foo *foo)
+ *	{
+ *		...
+ *		xe_device_add_remove_action(xe, &foo->remove_action, foo_remove);
+ *		...
+ *		return 0;
+ *	};
+ */
+int xe_device_add_action_or_reset(struct xe_device *xe,
+				  xe_device_remove_action_t action,
+				  void *data)
+{
+	struct xe_device_remove_action *ra;
+
+	drm_WARN_ON(&xe->drm, !xe->probing);
+
+	ra = kmalloc(sizeof(*ra), GFP_KERNEL);
+	if (!ra) {
+		action(xe, data);
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&ra->node);
+	ra->remove = action;
+	ra->data = data;
+	list_add(&ra->node, &xe->remove_action_list);
+
+	return 0;
+}
+
 static void xe_device_remove_display(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
@@ -932,6 +1009,8 @@ void xe_device_remove(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
+
+	xe_device_call_remove_actions(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e68030..a6fedf1ef3c7b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -45,6 +45,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
+int xe_device_add_action_or_reset(struct xe_device *xe,
+				  xe_device_remove_action_t action,
+				  void *data);
+void xe_device_call_remove_actions(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a37..b322d49c83c77 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -35,6 +35,7 @@
 #include "intel_display_device.h"
 #endif
 
+struct xe_device;
 struct xe_ggtt;
 struct xe_pat_ops;
 struct xe_pxp;
@@ -70,6 +71,8 @@ struct xe_pxp;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+typedef void (*xe_device_remove_action_t)(struct xe_device *xe, void *data);
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -428,6 +431,20 @@ struct xe_device {
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

