Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F0BC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 21:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F93910E637;
	Tue, 20 May 2025 21:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alVcowkt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CDD10E637
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747776558; x=1779312558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8mnYGCpn/BXy/80d7JBNZ1ZsWq80ShQngoTCT3WIIX8=;
 b=alVcowktN7aLONxxrPqv7fV9l4qUuaItxD0oakTby6rsw7d6/SpQkq2Y
 gcKzdgo8jWJ4L+Z7E43uRflJK8CeBJHHJ+HoY+mtKnjBH9kV7jOfzcdc8
 zU1jT8pTIAKpkj+266567j7K9EryGrstDc26zN0aQYxxoxb017AwXTG1j
 97HrVYEZotMpf+ynFcTqvXKc0p2pIJfYwaztodcSf8oc0rPyPkrr3TwB0
 +FT3moKwP7UJnFWVCS+0ARMJ+GNNrv/Gl1fgqTR1vuV907qtJbjdcflHc
 oVzKS9IbJIQ7qGwZuMqNima09Ad4Ffhn+iJc5yjRzR+gka2fA95Gid62N w==;
X-CSE-ConnectionGUID: LSomAaZDRZmqzBOTjOyGSw==
X-CSE-MsgGUID: PIfKp/fESlmv85vTXafntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49604985"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49604985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 14:29:18 -0700
X-CSE-ConnectionGUID: rzAIFDxXQFyXiglKSl5qMA==
X-CSE-MsgGUID: 3rCNeFyyS0CVotuo5TH/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170829386"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 14:29:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Date: Tue, 20 May 2025 14:28:58 -0700
Message-ID: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250520-engine-mask-f6f5962afa42
X-Mailer: b4 0.15-dev-f7671
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

Sometimes it's useful to load the driver with a smaller set of engines
to allow more targeted debugging, particularly on early enabling. Add a
file in configfs that allows enable only a set of engines.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v2:
- Fix build with CONFIG_CONFIGFS_FS=n
- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
---
 drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h  |   2 +
 drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
 3 files changed, 155 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index cb9f175c89a1c..fb433503501c8 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -3,14 +3,18 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/bitops.h>
 #include <linux/configfs.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/string.h>
 
 #include "xe_configfs.h"
 #include "xe_module.h"
 
+#include "xe_hw_engine_types.h"
+
 /**
  * DOC: Xe Configfs
  *
@@ -48,6 +52,23 @@
  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
  *
+ * Allowed engine:
+ * ---------------
+ *
+ * Allow only a set of engine(s) to be available - this is the equivalent of
+ * fusing engines off in software. Examples:
+ *
+ * Allow only one render and one copy engines, nothing else::
+ *
+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
+ *
+ * Allow only compute engines and first copy engine::
+ *
+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
+ *
+ * The requested configuration may not be supported by the platform and driver
+ * may fail to probe - intended for debugging purposes.
+ *
  * Remove devices
  * ==============
  *
@@ -60,6 +81,7 @@ struct xe_config_device {
 	struct config_group group;
 
 	bool survivability_mode;
+	u64 engine_allowed;
 
 	/* protects attributes */
 	struct mutex lock;
@@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t engine_allowed_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%#llx\n", dev->engine_allowed);
+}
+
+static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
+{
+	static const struct  {
+		const char *cls;
+		u64 mask;
+	} map[] = {
+		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
+		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
+		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
+		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
+		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
+	};
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(map); i++) {
+		size_t clslen = strlen(map[i].cls);
+		size_t numlen = namelen - clslen;
+		char instancestr[4];
+		u8 instance;
+
+		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))
+			continue;
+
+		if (name[clslen] == '*' && numlen == 1) {
+			*mask = map[i].mask;
+			return true;
+		}
+
+		if (numlen > sizeof(instancestr) - 1)
+			return false;
+
+		memcpy(instancestr, name + clslen, numlen);
+		instancestr[numlen] = '\0';
+
+		if (!kstrtou8(instancestr, 10, &instance)) {
+			u16 bit = __ffs64(map[i].mask) + instance;
+			u64 val;
+
+			if (bit > sizeof(val) * BITS_PER_BYTE)
+				return false;
+
+			val = BIT_ULL(bit);
+			if ((val | map[i].mask) == map[i].mask) {
+				*mask = val;
+				return true;
+			}
+		}
+
+		return false;
+	}
+
+	return false;
+}
+
+static ssize_t engine_allowed_store(struct config_item *item, const char *page,
+				    size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	size_t namelen, p;
+	u64 mask, val = 0;
+
+	for (p = 0; p < len; p += namelen + 1) {
+		namelen = strcspn(page + p, ",\n");
+		if (!lookup_engine_mask(page + p, namelen, &mask))
+			return -EINVAL;
+
+		val |= mask;
+	}
+
+	mutex_lock(&dev->lock);
+	dev->engine_allowed = val;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
 CONFIGFS_ATTR(, survivability_mode);
+CONFIGFS_ATTR(, engine_allowed);
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
+	&attr_engine_allowed,
 	NULL,
 };
 
@@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
+	/* Default values */
+	dev->engine_allowed = U64_MAX;
+
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
 	mutex_init(&dev->lock);
@@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
 	config_item_put(&dev->group.cg_item);
 }
 
+/**
+ * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
+ * @pdev: pci device
+ *
+ * Find the configfs group that belongs to the pci device and return
+ * the mask of engines allowed to be used.
+ *
+ * Return: engine mask with allowed engines
+ */
+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
+{
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	u64 engine_allowed;
+
+	if (!dev)
+		return U64_MAX;
+
+	engine_allowed = dev->engine_allowed;
+	config_item_put(&dev->group.cg_item);
+
+	return engine_allowed;
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index d7d041ec26117..c80131f994a71 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -14,11 +14,13 @@ int xe_configfs_init(void);
 void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; };
 static inline void xe_configfs_exit(void) {};
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
+static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 93241fd0a4ba3..af750ed8c0f00 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -17,6 +17,7 @@
 #include "regs/xe_irq_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
@@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
 	}
 }
 
+static void check_sw_fuses(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
+	enum xe_hw_engine_id id;
+
+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
+		if (!(gt->info.engine_mask & BIT(id)))
+			continue;
+
+		if (!(sw_allowed & BIT(id))) {
+			gt->info.engine_mask &= ~BIT(id);
+			drm_info(&xe->drm, "%s fused off (in sw)\n",
+				 engine_infos[id].name);
+		}
+	}
+}
+
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
@@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
 	check_gsc_availability(gt);
+	check_sw_fuses(gt);
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);



