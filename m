Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB77C98328
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 20:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83010FC55;
	Fri, 25 Sep 2026 20:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifBMDWfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2110FC38
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790367334; x=1821903334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yloXGoCX9QrK/NDAvp8wbwaPQ5I0Ei4VOqB35rCGx1Q=;
 b=ifBMDWfov9zl+Z1D3BwMQqAIwoYdWE9vHAbWKh9+vxCs8gsPZA/TIblF
 +ZGrL5jCdQmLtWi8X453G198+xxjiS+gOLtEMAONwFUbcaEabvpgO6dsA
 s10PR/ysVwKg/N4Bzyx48FloFBcrLFiKWz11C/igWruz9pZWuCsIKTKy0
 K6n0jABZk0isDDZCanjzbICWpgKCV5jREFw8ZKzByuFxW23MS7Nv1sPCw
 MAoYpNu2zFl766DVCX+w3rDPpTimxpcLn+Ur7Y6cicCpmnoUo8EjZqkec
 juwjy0TwKU9MwdIwsALV789URPUbCSXCpX8BW0ES0JCO1OErBNfNPUK+D g==;
X-CSE-ConnectionGUID: LhcF9U7hQTuBJjQdfjgB1Q==
X-CSE-MsgGUID: O9m7proWRS+W5lAA2J+hsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90377978"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="90377978"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
X-CSE-ConnectionGUID: ADoQkEqtQsy5zZ1MumK6Aw==
X-CSE-MsgGUID: b9/fluT7TZqckmd7dPKmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="274509903"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 13:15:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v8 23/24] drm/xe: add migrate ULLS period configfs attribute
Date: Fri, 25 Sep 2026 13:15:25 -0700
Message-Id: <20260925201526.1355279-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925201526.1355279-1-matthew.brost@intel.com>
References: <20260925201526.1355279-1-matthew.brost@intel.com>
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

Add a configfs attribute to control the migrate ULLS period.
 
The migrate ULLS period specifies how long, in milliseconds, migrate
ULLS remains active before exiting. Migrate ULLS is currently used by
page-fault handling and SVM prefetch operations to process migration
work through a continuously running batch.
 
The attribute defaults to 5 ms. Setting the value to 0 disables ULLS.
 
This knob is primarily intended for performance tuning and evaluation,
allowing experimentation with the trade-off between reducing ULLS
startup/teardown overhead and limiting the time spent in a continuously
running migration workload.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_configfs.c | 67 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  2 +
 drivers/gpu/drm/xe/xe_migrate.c  | 19 ++++++---
 3 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f5c828cf7e8f..ad4bfd3c0703 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -61,6 +61,7 @@
  *	    ├── survivability_mode
  *	    ├── gt_types_allowed
  *	    ├── engines_allowed
+ *	    ├── migrate_ulls_period_ms
  *	    ├── enable_psmi
  *	    └── disable_vram_page_offline
  *
@@ -262,6 +263,20 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Migrate ULLS Period (ms)
+ * ------------------------
+ *
+ * Migrate ULLS period, in milliseconds. This is the delay between entering
+ * migrate ULLS (a continuously running batch) and exiting it. Migrate ULLS is
+ * currently entered during page faults and SVM prefetch operations. Default 5,
+ * zero indicates ULLS is disabled.
+ *
+ * How to disable migration ULLS:
+ *
+ *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/migrate_ulls_period_ms
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -283,6 +298,7 @@ struct xe_config_group_device {
 	struct xe_config_device {
 		u64 gt_types_allowed;
 		u64 engines_allowed;
+		u32 migrate_ulls_period_ms;
 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
@@ -306,6 +322,7 @@ struct xe_config_group_device {
 static const struct xe_config_device device_defaults = {
 	.gt_types_allowed = U64_MAX,
 	.engines_allowed = U64_MAX,
+	.migrate_ulls_period_ms = 5,
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
@@ -631,6 +648,33 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t migrate_ulls_period_ms_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%u\n", dev->migrate_ulls_period_ms);
+}
+
+static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
+					    const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(page, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.migrate_ulls_period_ms = val;
+
+	return len;
+}
+
 static ssize_t disable_vram_page_offline_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -896,6 +940,7 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
 CONFIGFS_ATTR(, ctx_restore_mid_bb);
 CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
+CONFIGFS_ATTR(, migrate_ulls_period_ms);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
@@ -906,6 +951,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_ctx_restore_mid_bb,
 	&attr_ctx_restore_post_bb,
 	&attr_enable_multi_queue,
+	&attr_migrate_ulls_period_ms,
 	&attr_enable_psmi,
 	&attr_disable_vram_page_offline,
 	&attr_engines_allowed,
@@ -1189,6 +1235,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 
 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
+	PRI_CUSTOM_ATTR("%u", migrate_ulls_period_ms);
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
@@ -1340,6 +1387,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_migrate_ulls_period_ms - get configfs migrate_ulls_period_ms setting
+ * @pdev: pci device
+ *
+ * Return: Migrate ULLS period in milliseconds (zero is disabled).
+ */
+u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 ret;
+
+	if (!dev)
+		return device_defaults.migrate_ulls_period_ms;
+
+	ret = dev->config.migrate_ulls_period_ms;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_disable_vram_page_offline - get configfs disable_vram_page_offline setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 42cd1a491d01..10a00d6bbf8f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
@@ -45,6 +46,7 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
 static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d7d13a25cdb9..c643177ff2d0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -23,6 +23,7 @@
 #include "xe_assert.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_exec_queue.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -81,14 +82,17 @@ struct xe_migrate {
 	u64 min_chunk_size;
 	/** @ulls: ULLS support */
 	struct {
+		/** @ulls.exit_ms: ULLS exit period milliseconds */
+		u32 exit_ms;
 		/** @ulls.enabled: ULLS is enabled, protected by job_mutex */
 		bool enabled;
-#define ULLS_EXIT_JIFFIES	msecs_to_jiffies(5)
 		/** @ulls.exit_work: ULLS exit worker */
 		struct delayed_work exit_work;
 	} ulls;
 };
 
+#define ULLS_EXIT_JIFFIES(_m)	msecs_to_jiffies((_m)->ulls.exit_ms)
+
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
 #define NUM_PT_SLOTS 48
@@ -512,7 +516,7 @@ static struct dma_fence *xe_migrate_job_push(struct xe_migrate *m,
 	if (xe_migrate_ulls_enabled(m)) {
 		ulls = ULLS_ACTIVE;
 		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
-				 ULLS_EXIT_JIFFIES);
+				 ULLS_EXIT_JIFFIES(m));
 	}
 
 	return __xe_migrate_job_push(m, job, ulls);
@@ -534,7 +538,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 
 	xe_assert(xe, xe->info.has_usm);
 
-	if (!IS_DGFX(xe))
+	if (!IS_DGFX(xe) || !m->ulls.exit_ms)
 		return;
 
 job_alloc:
@@ -572,7 +576,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
 		xe_sched_job_put(job);
 	if (xe_migrate_ulls_enabled(m))
 		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
-				 ULLS_EXIT_JIFFIES);
+				 ULLS_EXIT_JIFFIES(m));
 	mutex_unlock(&m->job_mutex);
 }
 
@@ -599,7 +603,7 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 	if (WARN_ON_ONCE(IS_ERR(job))) {
 		drm_dev_exit(idx);
 		mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
-				 ULLS_EXIT_JIFFIES);
+				 ULLS_EXIT_JIFFIES(m));
 		return;		/* Not fatal */
 	}
 
@@ -616,7 +620,7 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 		} else {
 			xe_sched_job_put(job);
 			mod_delayed_work(system_percpu_wq, &m->ulls.exit_work,
-					 ULLS_EXIT_JIFFIES);
+					 ULLS_EXIT_JIFFIES(m));
 		}
 	}
 
@@ -700,6 +704,9 @@ int xe_migrate_init(struct xe_migrate *m)
 			(unsigned long long)m->min_chunk_size);
 	}
 
+	m->ulls.exit_ms =
+		xe_configfs_get_migrate_ulls_period_ms(to_pci_dev(xe->drm.dev));
+
 	return err;
 
 err_out:
-- 
2.34.1

