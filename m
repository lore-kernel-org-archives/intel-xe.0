Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AD1C5AD5A
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 00:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F710F15B;
	Thu, 13 Aug 2026 00:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/czeXgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A49F10E488
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786579620; x=1818115620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bulshFf1QnJ1K3hjO5Kebww4QJf5W3P5wJuoYgpZTmQ=;
 b=V/czeXgrwuiN+qh0+daE/3c2CurtFUOBZNJ3J5wSk5QFUkHQgbeqzXir
 d8AN1bBlhan0U/2yI9R7GDbv4fhHjJ6HiQOcw7iU896YUNjwH3OO0WfO9
 cfWRXmyXuZJiVhhE2f5V/J9nxvLVQPfIREr1yw/mnneuhwm6KpWJSsM+e
 ZNmYs1KtdKVoDCSFjoa5yBdtHuT0Smh2BOuBQxUw4s+ZACH05gtko/ln9
 QqZEi5/RMB/f6t4EBebvhxI8p3x4s5qCymp0wYmvx9LSoIOSX9NbJZbsc
 TWc2Z3C1JTreqQBfuJeSnzLvPHpUKVVCRsZJg0B5pfsrEeo4dej95CHFy A==;
X-CSE-ConnectionGUID: oVzZ8ZdjQVul0nmGdLi7cQ==
X-CSE-MsgGUID: Pe7UN/k5R8GPmXtY1bh1kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="89670932"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="89670932"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 17:06:58 -0700
X-CSE-ConnectionGUID: NbS5NT5uQ22hASovkRRSSA==
X-CSE-MsgGUID: /HOMFlzJSJGL7YomXnE7OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="302048070"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 17:06:58 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jia.yao@intel.com, matthew.brost@intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v5 4/4] drm/xe/forcewake: enable configurable delayed
 forcewake release
Date: Thu, 13 Aug 2026 00:06:54 +0000
Message-ID: <20260813000654.2712317-5-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813000654.2712317-1-zongyao.bai@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
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
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c   | 72 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h   |  5 +++
 drivers/gpu/drm/xe/xe_device.c     |  3 +-
 drivers/gpu/drm/xe/xe_force_wake.c |  2 +-
 drivers/gpu/drm/xe/xe_query.c      |  2 +-
 5 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 052cce962161..3d8cd6fb165e 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -249,6 +249,23 @@
  *
  * This attribute can only be set before binding to the device.
  *
+ * Force wake hold delay
+ * ---------------------
+ *
+ * Delay in microseconds before an idle forcewake domain is put to sleep after
+ * an opt-in delayed release. Currently, only engine-cycle queries use this
+ * interval; normal forcewake puts remain immediate. Keeping the domain awake
+ * for this short window lets rapid back-to-back accesses reuse it without
+ * paying for another wake + ACK cycle. The default is 100 microseconds. Valid
+ * values range from 1 through U32_MAX microseconds; zero is rejected with
+ * -EINVAL. Runtime and system suspend cancel outstanding hold intervals before
+ * power-off. Large values may increase power use while the device remains
+ * active. Example::
+ *
+ *	# echo 100 > /sys/kernel/config/xe/0000:03:00.0/forcewake_hold_delay_us
+ *
+ * This attribute can only be set before binding to the device.
+ *
  * Remove devices
  * ==============
  *
@@ -275,6 +292,7 @@ struct xe_config_group_device {
 		bool survivability_mode;
 		bool enable_psmi;
 		bool enable_multi_queue;
+		u32 forcewake_hold_delay_us;
 		struct {
 			unsigned int max_vfs;
 			bool admin_only_pf;
@@ -295,6 +313,7 @@ static const struct xe_config_device device_defaults = {
 	.survivability_mode = false,
 	.enable_psmi = false,
 	.enable_multi_queue = true,
+	.forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
 	.sriov = {
 		.max_vfs = XE_DEFAULT_MAX_VFS,
 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
@@ -616,6 +635,36 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
 	return len;
 }
 
+static ssize_t forcewake_hold_delay_us_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%u\n", dev->forcewake_hold_delay_us);
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
 static bool wa_bb_read_advance(bool dereference, char **p,
 			       const char *append, size_t len,
 			       size_t *max_size)
@@ -856,6 +905,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
 CONFIGFS_ATTR(, enable_multi_queue);
 CONFIGFS_ATTR(, enable_psmi);
 CONFIGFS_ATTR(, engines_allowed);
+CONFIGFS_ATTR(, forcewake_hold_delay_us);
 CONFIGFS_ATTR(, gt_types_allowed);
 CONFIGFS_ATTR(, survivability_mode);
 
@@ -865,6 +915,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_enable_multi_queue,
 	&attr_enable_psmi,
 	&attr_engines_allowed,
+	&attr_forcewake_hold_delay_us,
 	&attr_gt_types_allowed,
 	&attr_survivability_mode,
 	NULL,
@@ -1143,6 +1194,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
 	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
 	PRI_CUSTOM_ATTR("%d", enable_psmi);
 	PRI_CUSTOM_ATTR("%d", survivability_mode);
+	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
 
 #undef PRI_CUSTOM_ATTR
@@ -1290,6 +1342,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
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
+	ret = dev->config.forcewake_hold_delay_us;
+	config_group_put(&dev->group);
+
+	return ret;
+}
+
 /**
  * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
  * @pdev: pci device
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 4fbbeafba473..77abc83a6f70 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
 bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
+u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
 u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 				       enum xe_engine_class class,
 				       const u32 **cs);
@@ -44,6 +45,10 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
 static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
+static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
+{
+	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+}
 static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
 						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d69fd8236b0f..196eaa3973e9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -552,7 +552,8 @@ int xe_device_init_early(struct xe_device *xe)
 
 	xe_device_parse_modparam(xe);
 
-	xe->forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
+	xe->forcewake_hold_delay_us =
+		xe_configfs_get_forcewake_hold_delay_us(to_pci_dev(xe->drm.dev));
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index ef43899e1f7d..dc25f77d5f83 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -375,7 +375,7 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 }
 
 /**
- * xe_force_wake_put_delay - Release forcewake after a delay
+ * xe_force_wake_put_delay - Release forcewake after a configurable delay
  * @fw: Pointer to the force wake structure
  * @fw_ref: Result from xe_force_wake_get()
  *
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 3c356bc48e2a..628d587e79e1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -168,7 +168,7 @@ query_engine_cycles(struct xe_device *xe,
 
 	fw_domain = xe_hw_engine_to_fw_domain(hwe);
 
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
 		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
 			err = -EIO;
 			goto out;
-- 
2.43.0

