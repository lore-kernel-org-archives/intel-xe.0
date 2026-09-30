Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8391BCA5FC4
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 22:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430D610E2D4;
	Wed, 30 Sep 2026 22:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QH0cLDY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328BC10E1D0
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 22:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790806105; x=1822342105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1mzu3cnyIqyBnU3F50k35kg7HROiWKivnRdUxZdMiCk=;
 b=QH0cLDY9WTxLD8wRbBmaQbhwso+mmWXzKWYMGckzm0Vpr3Ui7vQpIrlS
 whLox335ihfvNCZ8fJ1RemspMBMukuNQYMkUda/tPhIhVqhO+TL3CCn4Z
 yoaPkk1EUbD3G6D4Qhft3NOdj6KundPVwO5Zuec0+k7+bG/rGfQX+UT4R
 QocYLXVMZm+RCLVp+It2oeIeaD2OGAER5vURzX7ezbaCAEz/C0luy9gxz
 03krpkZfVTe/LwKmaZiYSSvFVNGhCRNGaXwfIPGm0ZOzem3XiB55dlXXz
 Ijo4QO7NoYVxmLMO/eueyvIqrQso4qTRxT+mM2YmtNIlQr0oOzOWYbGN4 A==;
X-CSE-ConnectionGUID: xiUwCFdbQE2Kg1ww6zbeww==
X-CSE-MsgGUID: x6WfFMuLQvWEWpKAEPUOWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117084167"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="117084167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 15:08:24 -0700
X-CSE-ConnectionGUID: yK0Rn6r9SiOnuxmBIEqDaw==
X-CSE-MsgGUID: zmlFmEN5TRWT8AO8scKm0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="279607855"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 15:08:24 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, rodrigo.vivi@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v10 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
Date: Wed, 30 Sep 2026 15:08:20 -0700
Message-ID: <20260930220820.2184643-5-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930220820.2184643-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260930220820.2184643-1-zongyao.bai@intel.com>
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

Enable delayed forcewake release for engine-cycle queries used by
tools such as VTune and PTI. Bursts of queries can reuse an already
awake domain, avoiding another wake request and ACK wait. Only
engine-cycle queries request delayed release; all other forcewake users
continue to request immediate release.

Add the bind-time configfs forcewake_hold_delay_us attribute to control
the hold interval. It defaults to 100 us and accepts values from 1 to
U32_MAX microseconds. Runtime and system suspend cancel and settle
outstanding delayed releases before power-off. Longer intervals trade
higher power use for more opportunities to reuse an awake domain.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub-Copilot:gpt-5.6-sol
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c   | 78 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h   |  5 ++
 drivers/gpu/drm/xe/xe_device.c     |  3 +-
 drivers/gpu/drm/xe/xe_force_wake.c |  2 +-
 drivers/gpu/drm/xe/xe_query.c      |  2 +-
 5 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index ad4bfd3c0703..aa0726110ceb 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -277,6 +277,23 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Force wake hold delay
+ * ---------------------
+ *
+ * Delay in microseconds before an idle forcewake domain is put to sleep after
+ * an opt-in delayed release. Currently only engine-cycle queries request
+ * delayed release; existing callers continue to use the immediate-release API.
+ * A forcewake get for the same domain during the hold interval can reuse the
+ * awake domain without another wake request and ACK wait. The default is 100
+ * microseconds. Valid values range from 1 through U32_MAX microseconds; zero is
+ * rejected with -EINVAL. Runtime and system suspend drain outstanding delayed
+ * releases before power-off. Large values may increase power use while the
+ * device remains active. Example::
+ *
+ *	# echo 100 > /sys/kernel/config/xe/0000:03:00.0/forcewake_hold_delay_us
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -305,6 +322,7 @@ struct xe_config_group_device {
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool disable_vram_page_offline;
+		u32 forcewake_hold_delay_us;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -327,6 +345,7 @@ static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.disable_vram_page_offline = false,
+	.forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -675,6 +694,40 @@ static ssize_t migrate_ulls_period_ms_store(struct config_item *item,
 	return len;
 }
 
+static ssize_t forcewake_hold_delay_us_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 delay_us;
+
+	scoped_guard(mutex, &dev->lock)
+		delay_us = dev->config.forcewake_hold_delay_us;
+
+	return sprintf(page, "%u\n", delay_us);
+}
+
+static ssize_t forcewake_hold_delay_us_store(struct config_item *item,
+					     const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
+	u32 val;
+	int ret;
+
+	ret = kstrtouint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+	if (is_bound(dev))
+		return -EBUSY;
+
+	dev->config.forcewake_hold_delay_us = val;
+
+	return len;
+}
+
 static ssize_t disable_vram_page_offline_show(struct config_item *item, char *page)
 {
 	struct xe_config_device *dev = to_xe_config_device(item);
@@ -944,6 +997,7 @@ CONFIGFS_ATTR(, migrate_ulls_period_ms);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, forcewake_hold_delay_us);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -955,6 +1009,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_psmi,
 	&attr_disable_vram_page_offline,
 	&attr_engines_allowed,
+	&attr_forcewake_hold_delay_us,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1240,6 +1295,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1407,6 +1463,28 @@ u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev)
 	return ret;
 }
 
+/**
+ * xe_configfs_get_forcewake_hold_delay_us - get configfs forcewake_hold_delay_us setting
+ * @pdev: pci device
+ *
+ * Return: forcewake_hold_delay_us setting in configfs
+ */
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	u32 ret;
+
+	if (!dev)
+		return device_defaults.forcewake_hold_delay_us;
+
+	scoped_guard(mutex, &dev->lock)
+		ret = dev->config.forcewake_hold_delay_us;
+
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_disable_vram_page_offline - get configfs disable_vram_page_offline setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 10a00d6bbf8f..92af14eabb3d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -25,6 +25,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
 u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev);
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
@@ -47,6 +48,10 @@ static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
 static inline u32 xe_configfs_get_migrate_ulls_period_ms(struct pci_dev *pdev) { return 5; }
+static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+}
 static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 38ec3da8cc74..ce9124a72d9b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -472,7 +472,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe_device_parse_modparam(xe);
 
-	xe->forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+	xe->forcewake_hold_delay_us =
+		xe_configfs_get_forcewake_hold_delay_us(to_pci_dev(xe->drm.dev));
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index e58f24fd6667..4edf3b322ed9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -391,7 +391,7 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 }
 
 /**
- * xe_force_wake_put_delay - Release forcewake after a delay
+ * xe_force_wake_put_delay - Release forcewake after a configurable delay
  * @fw: Pointer to the force wake structure
  * @fw_ref: Result from xe_force_wake_get()
  *
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2ebf0893b4f5..f83ebc6f7827 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -149,7 +149,7 @@ static int query_engine_cycles_read(struct xe_device *xe,
 
 	fw_domain = xe_hw_engine_to_fw_domain(hwe);
 
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
 		if (xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
 			hwe_read_timestamp(hwe, &resp->engine_cycles,
 					   &resp->cpu_timestamp,
-- 
2.43.0

