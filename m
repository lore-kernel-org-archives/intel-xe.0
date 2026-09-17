Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C62EC982CC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 00:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65B10E3F5;
	Thu, 17 Sep 2026 00:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7E/RGoX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B6510E363
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 00:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789603625; x=1821139625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J1U5NZHu2Ipyo2IFULD+mlFmX9ppntEhGE63V6RiMJU=;
 b=b7E/RGoXys6KPtwQftVDBVy6sRVdJOmjSxlZhYYFYw8Gp30JfjrNAnOd
 quGGmac+5sJfBVRrwjO2lFtFivsDwmNHqssmjq/ijAVuTheClcBSryRUp
 O4wJGY+n33ytru4Bkc8yBakp6rvEHMamoZ+nu3zn4oxz2LaLaQ8nqbfhJ
 B2HYZE4Wfng7K0jLsb0H0M6HrPnLgorS+W2cGDBRWbG2YrOyFYXq5CcYU
 vxO8Qzu1IaYT5PYWUdSPVUP9kNkNoFrm4P9aVeOu1Ob/fcdEmMejv3jPC
 PwF87WQM0hcAoMBrgXjGpJEBtlRQ3wWe0mu7wSZR0z4hzirSSOsQaa7yA w==;
X-CSE-ConnectionGUID: OUJnCQJpSeyFuh0+70HszA==
X-CSE-MsgGUID: Vjgwf/ZSSmmKPqSkd2J/eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101143924"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101143924"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 17:07:04 -0700
X-CSE-ConnectionGUID: iChEiiXyQ0e6wyclL6fp9w==
X-CSE-MsgGUID: tk4BYZmsTVSpirvSBowJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267280406"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2026 17:07:03 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, Zongyao Bai <zongyao.bai@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
Date: Thu, 17 Sep 2026 00:07:01 +0000
Message-ID: <20260917000701.1751733-5-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917000701.1751733-1-zongyao.bai@intel.com>
References: <20260720221306.1173028-1-zongyao.bai@intel.com>
 <20260917000701.1751733-1-zongyao.bai@intel.com>
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
index f5c828cf7e8f..f437ebc4a654 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -262,6 +262,23 @@
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
@@ -289,6 +306,7 @@ struct xe_config_group_device {
 		bool enable_psmi;
 		bool enable_multi_queue;
 		bool disable_vram_page_offline;
+		u32 forcewake_hold_delay_us;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -310,6 +328,7 @@ static const struct xe_config_device device_defaults = {
 	.enable_psmi = false,
 	.enable_multi_queue = true,
 	.disable_vram_page_offline = false,
+	.forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -631,6 +650,40 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
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
@@ -899,6 +952,7 @@ CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, disable_vram_page_offline);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, forcewake_hold_delay_us);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -909,6 +963,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_psmi,
 	&attr_disable_vram_page_offline,
 	&attr_engines_allowed,
+	&attr_forcewake_hold_delay_us,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1193,6 +1248,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", disable_vram_page_offline);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1340,6 +1396,28 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
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
index 42cd1a491d01..6d05a2e6bc42 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
 bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
@@ -45,6 +46,10 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+}
 static inline bool xe_configfs_get_disable_vram_page_offline(struct pci_dev *pdev) { return false; }
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2389353461ee..4cafc9283d45 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -471,7 +471,8 @@ int xe_device_init_early(struct xe_device *xe)
 
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

