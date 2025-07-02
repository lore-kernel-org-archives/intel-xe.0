Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F43C83F04
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436510E242;
	Wed,  2 Jul 2025 13:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItOjm1RC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F253D10E712
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464016; x=1783000016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3r3H+vf/40UJJQ1G0cnBRwDf+xltz8YgTgY0j0s1N4=;
 b=ItOjm1RC6R6slw+Mq89zZgK3KYxDgdRbuaAIECCFfNBA3yTe5sJjbG23
 Sf2jmJnDEBcsxvNVRr4Zhqqjed8UemwCWIcPkoJbjtcdHqkOvsxxIIsG8
 hXFWIsUwevEJqloqDje5yRzgnlhQq74Fd1QSR3JTw8xGKyRilpdi3noJV
 peYY3gSHvAXrG+RekKu9RBExV8LyjSVF0wQLNELKs5fdnkxowTGfs5wpE
 38t8pjhT83oJGuHu8QWzZiwwRIdGBHzo5d7nbGZhGV6bOHj+DERrK5xDm
 R6OiMSyu8owsDkaKrFGfkQNORXFNF6ZiZWvmd1tJ+QXDtvsI8zl+Ir9fo g==;
X-CSE-ConnectionGUID: 5LCD4Eu1RlOE72oPs2I2sQ==
X-CSE-MsgGUID: ZfbiBXywRlGiZcZw755DEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186076"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:56 -0700
X-CSE-ConnectionGUID: qfaIvNTpTNSNf3RxRa4qPw==
X-CSE-MsgGUID: Lp4BdzVwQAKpFzIk3CEf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177755999"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:52 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Date: Wed,  2 Jul 2025 19:41:13 +0530
Message-ID: <20250702141118.3564242-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702141118.3564242-1-riana.tauro@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
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

Certain runtime firmware errors can cause the device to be wedged
requiring a firmware flash to restore normal operation.
Runtime Survivability Mode indicates that a firmware flash is necessary to
recover the device.

The below sysfs is an indication that device is in survivability mode

/sys/bus/pci/devices/<device>/surivability_mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 26 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  4 ++-
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  8 ++++++
 4 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4a38486dccc8..5defa54ccd26 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -716,7 +716,7 @@ int xe_device_probe_early(struct xe_device *xe)
 		 * possible, but still return the previous error for error
 		 * propagation
 		 */
-		err = xe_survivability_mode_enable(xe);
+		err = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_BOOT);
 		if (err)
 			return err;
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..e1adcb33c9b0 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -129,7 +129,10 @@ static ssize_t survivability_mode_show(struct device *dev,
 	struct xe_survivability_info *info = survivability->info;
 	int index = 0, count = 0;
 
-	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
+	count += sysfs_emit_at(buff, count, "Survivability mode: %s\n",
+			       survivability->type ? "Runtime" : "Boot");
+
+	for (index = 0; survivability->boot_status && index < MAX_SCRATCH_MMIO; index++) {
 		if (info[index].reg)
 			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
 					       info[index].reg, info[index].value);
@@ -169,6 +172,10 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
+	/* Only create sysfs for runtime survivability mode */
+	if (xe_survivability_mode_is_runtime(xe))
+		return 0;
+
 	/* Make sure xe_heci_gsc_init() knows about survivability mode */
 	survivability->mode = true;
 
@@ -189,6 +196,17 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	return 0;
 }
 
+/**
+ * xe_survivability_mode_is_runtime - check if survivability mode is runtime
+ * @xe: xe device instance
+ *
+ * Returns true if in runtime survivability mode, false otherwise
+ */
+bool xe_survivability_mode_is_runtime(struct xe_device *xe)
+{
+	return xe->survivability.type == XE_SURVIVABILITY_TYPE_RUNTIME;
+}
+
 /**
  * xe_survivability_mode_is_enabled - check if survivability mode is enabled
  * @xe: xe device instance
@@ -251,16 +269,18 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
  * Return: 0 if survivability mode is enabled or not requested; negative error
  * code otherwise.
  */
-int xe_survivability_mode_enable(struct xe_device *xe)
+int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type type)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	if (!xe_survivability_mode_is_requested(xe))
+	if (!xe_survivability_mode_is_requested(xe) &&
+	    type != XE_SURVIVABILITY_TYPE_RUNTIME)
 		return 0;
 
 	survivability->size = MAX_SCRATCH_MMIO;
+	survivability->type = type;
 
 	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
 			    GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index 02231c2bf008..559d1e99b03a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -9,9 +9,11 @@
 #include <linux/types.h>
 
 struct xe_device;
+enum xe_survivability_type;
 
-int xe_survivability_mode_enable(struct xe_device *xe);
+int xe_survivability_mode_enable(struct xe_device *xe, const enum xe_survivability_type);
 bool xe_survivability_mode_is_enabled(struct xe_device *xe);
+bool xe_survivability_mode_is_runtime(struct xe_device *xe);
 bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index 19d433e253df..01f07d9c4124 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -9,6 +9,11 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+enum xe_survivability_type {
+	XE_SURVIVABILITY_TYPE_BOOT,
+	XE_SURVIVABILITY_TYPE_RUNTIME,
+};
+
 struct xe_survivability_info {
 	char name[NAME_MAX];
 	u32 reg;
@@ -30,6 +35,9 @@ struct xe_survivability {
 
 	/** @mode: boolean to indicate survivability mode */
 	bool mode;
+
+	/** @type: survivability mode type (boot or runtime) */
+	enum xe_survivability_type type;
 };
 
 #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
-- 
2.47.1

