Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69B9C88E4A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 09:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022710E61E;
	Fri, 11 Sep 2026 09:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgOzIuKM";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2026 09:53:36 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E844B10E61E
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789120417; x=1820656417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3MDYUVOs1E7nLgkh8aN12PFuAA4CmmeycYuSy2sLafQ=;
 b=EgOzIuKMjKlVmogw3eHBRFxNGpZkE8G4qVeSOU6uW4LA40i7AftwR1Yv
 g7RnF8g+yEtHkFkXVMFr2WOyLjOZU6eeglAOi7r5QAjIq6uggPHnFJRU3
 phKsNsvtZm3ybzmVxBJR1kXh4QOP25vTyWZTEQg+g9WNeeRBTd9OAy3Gi
 fmSmj1aTyhZyJPxOyYlKM1m6jJN9xANwaT9VyMj4YeIrx5+KsiUg0LRmU
 m+I9Ydy0xSDk23JG1b3C04PxkPb32eVXKTCxEzA5iyHfDTgq30H7h9wqH
 ihFVj3su6PO/rWPMK/yd9OpWBOtD5Uh7MfaO2t5PTcjp57xK2yIpVRbCJ g==;
X-CSE-ConnectionGUID: 0Ou8kfuRTmWCiJMcI5YFug==
X-CSE-MsgGUID: cRiDmBIuTc+36v2DSlBB0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="91859"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="91859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 02:46:30 -0700
X-CSE-ConnectionGUID: m5RYQqp1RSiUI21crB5QlA==
X-CSE-MsgGUID: K5ILGe8dRqi/lrIGr7PNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="277125128"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 02:46:29 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH] drm/xe/vram: add decay-based reinstatement of
 soft-offlined VRAM pages
Date: Fri, 11 Sep 2026 15:16:17 +0530
Message-ID: <20260911094616.1333590-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 54 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 62 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 16 ++++++
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index f5c828cf7e8f..d866eb93f05f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -289,6 +289,7 @@ struct xe_config_group_device {
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool disable_vram_page_offline;
+		u32 bad_page_decay_secs;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -310,6 +311,7 @@ static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.disable_vram_page_offline = false,
+	.bad_page_decay_secs = 24 * 60 * 60,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -658,6 +660,36 @@ static ssize_t disable_vram_page_offline_store(struct config_item *item,
 	return len;
 }
 
+static ssize_t bad_page_decay_secs_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%u\n", dev->bad_page_decay_secs);
+}
+
+static ssize_t bad_page_decay_secs_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 val;
+	int ret;
+
+	ret = kstrtou32(page, 0, &val);
+	if (ret)
+		return ret;
+
+	/* Cap at ~68 years to keep secs_to_jiffies() sane on 32-bit HZ=1000. */
+	if (val > (U32_MAX / 1000))
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
@@ -898,6 +930,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
+CONFIGFS_ATTR(, bad_page_decay_secs);
 CONFIGFS_ATTR(, engines_allowed);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
@@ -908,6 +941,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_disable_vram_page_offline,
+	&attr_bad_page_decay_secs,
 	&attr_engines_allowed,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
@@ -1360,6 +1394,26 @@ bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev)
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
index 42cd1a491d01..9bfb2f76a423 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,6 +25,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
+u32 xe_configfs_get_bad_page_decay_secs(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9a514d983e90..c1bfb9bc826c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -354,6 +354,51 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
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
+							struct xe_ttm_vram_mgr,
+							decay_gc_work);
+	struct xe_ttm_vram_offline_resource *opos, *on;
+	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
+	unsigned long now = jiffies;
+	unsigned long decay;
+
+	mutex_lock(&mgr->lock);
+	decay = mgr->decay_interval_jiffies;
+	if (!decay)
+		goto reschedule;
+
+	list_for_each_entry_safe(opos, on, &mgr->offlined_pages, offlined_link) {
+		if (opos->mode != XE_PAGE_OFFLINE_SOFT)
+			continue;
+		if (!time_after(now, opos->last_seen + decay))
+			continue;
+
+		xe_ttm_vram_buddy_free(mgr, &opos->blocks, opos->used_visible_size);
+		list_del_rcu(&opos->offlined_link);
+		--mgr->n_offlined_pages;
+		drm_info(&xe->drm,
+			 "decay: reinstated soft-offlined page 0x%llx\n",
+			 opos->addr);
+		kfree_rcu(opos, rcu);
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
@@ -414,6 +459,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	struct xe_ttm_vram_mgr *mgr = arg;
 	struct ttm_resource_manager *man = &mgr->manager;
 
+	cancel_delayed_work_sync(&mgr->decay_gc_work);
+
 	mutex_lock(&mgr->lock);
 	xe_ttm_vram_free_bad_pages(mgr);
 	mutex_unlock(&mgr->lock);
@@ -446,6 +493,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 		return err;
 	INIT_LIST_HEAD(&mgr->offlined_pages);
 	INIT_LIST_HEAD(&mgr->queued_pages);
+	INIT_DELAYED_WORK(&mgr->decay_gc_work, xe_ttm_vram_decay_gc_worker);
+	mgr->decay_interval_jiffies =
+		secs_to_jiffies(XE_BAD_PAGE_DECAY_SECS_DEFAULT);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -711,8 +761,12 @@ static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
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
@@ -790,6 +844,8 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 		INIT_LIST_HEAD(&nentry->blocks);
 		nentry->status = XE_PAGE_RESERVE_PENDING;
 		nentry->addr = addr;
+				nentry->mode = XE_PAGE_OFFLINE_SOFT;
+				nentry->last_seen = jiffies;
 
 		if (block) {
 			pbo = xe_ttm_vram_block_owner_get(xe, block);
@@ -829,6 +885,10 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
 			}
 			++vram_mgr->n_offlined_pages;
 			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			if (vram_mgr->decay_interval_jiffies &&
+			    !delayed_work_pending(&vram_mgr->decay_gc_work))
+				schedule_delayed_work(&vram_mgr->decay_gc_work,
+						      xe_ttm_vram_decay_gc_period(vram_mgr));
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index efcf3e1d4e80..dcc90706e52c 100644
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
@@ -39,6 +47,10 @@ struct xe_ttm_vram_mgr {
 	u32 mem_type;
 	/** @max_pages: max pages that can be in offline queue retrieved from FW */
 	u16 max_pages;
+	/** @decay_gc_work: reinstates expired soft-offlined pages */
+	struct delayed_work decay_gc_work;
+	/** @decay_interval_jiffies: soft-offline decay interval */
+	unsigned long decay_interval_jiffies;
 };
 
 /**
@@ -81,6 +93,10 @@ struct xe_ttm_vram_offline_resource {
 	u64 addr;
 	/** @status: buddy reservation status */
 	enum xe_page_reserve_status status;
+	/** @mode: soft or hard offline mode */
+	enum xe_page_offline_mode mode;
+	/** @last_seen: most recent hardware report time */
+	unsigned long last_seen;
 	/** @rcu: RCU head for deferred freeing */
 	struct rcu_head rcu;
 };
-- 
2.52.0

