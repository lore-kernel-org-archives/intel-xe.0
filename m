Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719D606AA2B
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oBMWH8pY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351EC10E61F;
	Mon,  2 Nov 2026 12:22:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE5C10E61F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 12:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793622131; x=1825158131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aBSnKLdBnZFAtWmMdrWwyq2qVm+22z9KqtfLZUYgLzc=;
 b=oBMWH8pYCRn8U/T84sl8rcLxD94toLvNvNSBk45oGOKNT+XkMkOdL0Ww
 OQ+wIUnn3RX2kehyhEWr3Nd5qkkfs86oimy+O1owbhngva0+BJIxLi5g/
 kTkGsL7dbNL9TrAeJb/ASbVSKb6aNJaf9AzyKmOWjoNI1GbhFoYCPcBRA
 aKoCbEVu7VrQVG05g83zLGZZiOiKOuL50obB0ZCkM4LZ7nY15Ipd+AEjq
 XqBHT3dfTkUgMacqpzbjAsGnNrk4waQN5L9/drpPDrIhzwmTp/a7Wx7Vf
 x2hNjolcjKPF3+g9/W4GvQdcTrqqUR3AfyKtya8yu32RGkeLCurIy7Zir Q==;
X-CSE-ConnectionGUID: DRBZgn2EQTe4yUV+Qsi9TQ==
X-CSE-MsgGUID: rpi76cCbSiq7MmSXXXNUxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2191375"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2191375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:22:10 -0800
X-CSE-ConnectionGUID: 7dtxYiXeQxaau+6I1KwT9A==
X-CSE-MsgGUID: W6F5zzlfQVC1d8pXTaDREg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6141717"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:22:09 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/vram: add decay-based reinstatement of soft-offlined
 VRAM pages
Date: Mon,  2 Nov 2026 17:51:48 +0530
Message-ID: <20261102122147.2361513-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The existing bad-page flow soft-offlines a VRAM page on the first HW
report and promotes it to a permanent (hard) retirement on the second
report at the same address. Once soft-offlined a page stays offline
forever, which over-punishes transient DBE errors: a single hit caused
by a one-off environmental disturbance keeps the page reserved until
the next reboot / probe.

This change adds a per VRAM-manager decay timer so that a SOFT-offlined
page is automatically reinstated after the configured decay window
(default 24 hours) of no further reports at that address. HARD-offlined
pages continue to be permanent.

Also adds the xe_page_offline_mode enum (SOFT/HARD) and per-entry mode
tracking with SOFT->HARD promotion on second hit at the same address.

Configuration via configfs bad_page_decay_secs (default 86400, 0 disables).

IGT coverage:
https://patchwork.freedesktop.org/patch/765064/

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 54 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 64 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 16 ++++++
 4 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index ad4bfd3c0703..c25944650f59 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -305,6 +305,7 @@ struct xe_config_group_device {
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool disable_vram_page_offline;
+		u32 bad_page_decay_secs;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -327,6 +328,7 @@ static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.disable_vram_page_offline = false,
+	.bad_page_decay_secs = 24 * 60 * 60,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -702,6 +704,36 @@ static ssize_t disable_vram_page_offline_store(struct config_item *item,
 	return len;
 }
 
+static ssize_t bad_page_decay_secs_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+
+	return sprintf(page, "%u\n", dev->config.bad_page_decay_secs);
+}
+
+static ssize_t bad_page_decay_secs_store(struct config_item *item,
+					 const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(page, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > jiffies_to_msecs(MAX_JIFFY_OFFSET) / 1000)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.bad_page_decay_secs = val;
+
+	return len;
+}
+
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -943,6 +975,7 @@ CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, migrate_ulls_period_ms);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
+CONFIGFS_ATTR(, bad_page_decay_secs);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -954,6 +987,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_migrate_ulls_period_ms,
 	&attr_enable_psmi,
 	&attr_disable_vram_page_offline,
+	&attr_bad_page_decay_secs,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1427,6 +1461,26 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_bad_page_decay_secs - get configfs bad_page_decay_secs setting
+ * @pdev: pci device
+ *
+ * Return: bad_page_decay_secs setting in configfs
+ */
+u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 ret;
+
+	if (!dev)
+		return device_defaults.bad_page_decay_secs;
+
+	ret = dev->config.bad_page_decay_secs;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 327b648944ff..406b72224702 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -26,6 +26,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
+u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 36d47de8b11b..ed0ca5f2b144 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -355,6 +355,51 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static unsigned long xe_ttm_vram_decay_gc_period(struct xe_ttm_vram_mgr *mgr)
+{
+	unsigned long period = mgr->decay_interval_jiffies / 8;
+
+	if (period < msecs_to_jiffies(60 * 1000))
+		period = msecs_to_jiffies(60 * 1000);
+	return period;
+}
+
+static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
+{
+	struct xe_ttm_vram_mgr *mgr = container_of(to_delayed_work(work),
+						   struct xe_ttm_vram_mgr,
+						   decay_gc_work);
+	struct xe_ttm_vram_offline_resource *pos, *n;
+	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
+	unsigned long now = jiffies;
+	unsigned long decay;
+
+	mutex_lock(&mgr->lock);
+	decay = mgr->decay_interval_jiffies;
+	if (!decay)
+		goto reschedule;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		if (pos->mode != XE_PAGE_OFFLINE_SOFT)
+			continue;
+		if (!time_after(now, pos->last_seen + decay))
+			continue;
+
+		list_del(&pos->offlined_link);
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		--mgr->n_offlined_pages;
+		drm_info(&xe->drm,
+			 "decay: reinstated soft-offlined page 0x%llx\n",
+			 pos->addr);
+		kfree(pos);
+	}
+
+reschedule:
+	schedule_delayed_work(&mgr->decay_gc_work,
+			      xe_ttm_vram_decay_gc_period(mgr));
+	mutex_unlock(&mgr->lock);
+}
+
 static const struct dmem_cgroup_ops xe_ttm_vram_mgr_dmem_ops;
 
 static int xe_ttm_vram_mgr_dmem_reclaim(struct dmem_cgroup_pool_state *pool,
@@ -415,6 +460,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	struct xe_ttm_vram_mgr *mgr = arg;
 	struct ttm_resource_manager *man = &mgr->manager;
 
+	cancel_delayed_work_sync(&mgr->decay_gc_work);
+
 	mutex_lock(&mgr->lock);
 	xe_ttm_vram_free_bad_pages(mgr);
 	mutex_unlock(&mgr->lock);
@@ -438,6 +485,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	struct ttm_resource_manager *man = &mgr->manager;
 	struct dmem_cgroup_region *cg;
 	const char *name;
+	u32 decay_secs;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
@@ -447,6 +495,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 		return err;
 	INIT_LIST_HEAD(&mgr->offlined_pages);
 	INIT_LIST_HEAD(&mgr->queued_pages);
+	INIT_DELAYED_WORK(&mgr->decay_gc_work, xe_ttm_vram_decay_gc_worker);
+	decay_secs = xe_configfs_get_bad_page_decay_secs(to_pci_dev(xe->drm.dev));
+	mgr->decay_interval_jiffies = secs_to_jiffies(decay_secs);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -725,8 +776,12 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
 	lockdep_assert_held(&mgr->lock);
 
 	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
-		if (pos->addr == addr)
+		if (pos->addr == addr) {
+			if (pos->mode == XE_PAGE_OFFLINE_SOFT)
+				pos->mode = XE_PAGE_OFFLINE_HARD;
+			pos->last_seen = jiffies;
 			return true;
+		}
 	}
 
 	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
@@ -804,6 +859,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = XE_PAGE_RESERVE_PENDING;
 		nentry->addr = addr;
+		nentry->mode = XE_PAGE_OFFLINE_SOFT;
+		nentry->last_seen = jiffies;
 
 		if (block) {
 			pbo = xe_ttm_vram_block_owner_get(xe, block);
@@ -843,6 +900,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			}
 			++vram_mgr->n_offlined_pages;
 			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			if (vram_mgr->decay_interval_jiffies &&
+			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
+				schedule_delayed_work(&vram_mgr->decay_gc_work,
+						      xe_ttm_vram_decay_gc_period(vram_mgr));
+			}
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 4a2cd27a5b61..0a6d8f8c2aa8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -7,8 +7,16 @@
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
 #include <linux/gpu_buddy.h>
+#include <linux/workqueue.h>
 #include <drm/ttm/ttm_device.h>
 
+#define XE_BAD_PAGE_DECAY_SECS_DEFAULT	(24 * 60 * 60)
+
+enum xe_page_offline_mode {
+	XE_PAGE_OFFLINE_SOFT = 0,
+	XE_PAGE_OFFLINE_HARD,
+};
+
 /**
  * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
  *
@@ -37,6 +45,10 @@ struct xe_ttm_vram_mgr {
 	struct mutex lock;
 	/** @mem_type: The TTM memory type */
 	u32 mem_type;
+	/** @decay_gc_work: reinstates expired soft-offlined pages */
+	struct delayed_work decay_gc_work;
+	/** @decay_interval_jiffies: soft-offline decay interval */
+	unsigned long decay_interval_jiffies;
 };
 
 /**
@@ -79,6 +91,10 @@ struct xe_ttm_vram_offline_resource {
 	u64 addr;
 	/** @status: buddy reservation status */
 	enum xe_page_reserve_status status;
+	/** @mode: soft or hard offline mode */
+	enum xe_page_offline_mode mode;
+	/** @last_seen: most recent hardware report time */
+	unsigned long last_seen;
 };
 
 #endif
-- 
2.52.0

