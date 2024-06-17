Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C9BC2BA1A
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B22F10E506;
	Mon, 17 Jun 2024 22:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/tJBks4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E03810E522
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718663820; x=1750199820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wIMRTpns9gAddAsgIAp36up6VPvd3fyukLA+bozviBU=;
 b=H/tJBks4lS28pTKaNanK7+GRCOKsj1nMAcKb5/vJuATcbFHKDOHJG4TV
 AIHfuPTyvrSLkOzufYj2HpTg3hH1g/qjp3fTR/aDLa7iOQHxU6my8WPkC
 CmPw/yNjrP5jp5/oRontaJQkDGEhiH7Miid0cSxUrPWPTJ301il/iQb2O
 4ZLdfUkhlpvsZUSOMDRIWkRS697gK1T58kq00a0OfVITHk4Y9BfTq03tu
 R8uuU6SwNzoZjmmmISnPqSoOvA+k+dupRJ4PUNBxbaVdPICOUGIYx/g61
 9Hpn10t4XW4vsq4UnNHqGcJyZGK7GBEwdYYqVbeIQFYzLvxyBUbhe0eI+ A==;
X-CSE-ConnectionGUID: Ak4ocnTJSzaUbkOwqWFFNw==
X-CSE-MsgGUID: kyyHvifETs2QOqmADvkBOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="18428973"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="18428973"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
X-CSE-ConnectionGUID: 0Lh2LXmUSDSSiIwRNnt9Lw==
X-CSE-MsgGUID: y549wM7VTxWIpBtF8ruAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="72090773"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 15:36:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/17] drm/xe/oa/uapi: Add/remove OA config perf ops
Date: Mon, 17 Jun 2024 15:36:39 -0700
Message-ID: <20240617223651.3220399-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

Introduce add/remove config perf ops for OA. OA configurations consist of a
set of event/counter select register address/value pairs. The add_config
perf op validates and stores such configurations and also exposes them in
the metrics sysfs. These configurations will be programmed to OA unit HW
when an OA stream using a configuration is opened. The OA stream can also
switch to other stored configurations.

v2: Start config id's from 1 and other minor review comments (Umesh)
v3: Add 32 bit build
v4: Add kernel doc for non-static functions (Michal)

Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |   4 +
 drivers/gpu/drm/xe/xe_oa.c       | 434 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h       |   6 +
 drivers/gpu/drm/xe/xe_oa_types.h |  10 +
 drivers/gpu/drm/xe/xe_perf.c     |  16 ++
 include/uapi/drm/xe_drm.h        |  25 ++
 6 files changed, 495 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1195c64a715a..31b549f5f03a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -670,6 +670,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_display_register(xe);
 
+	xe_oa_register(xe);
+
 	xe_debugfs_register(xe);
 
 	xe_hwmon_register(xe);
@@ -710,6 +712,8 @@ void xe_device_remove(struct xe_device *xe)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_oa_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_fini(xe);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index e836fafa9fb3..4122785735d4 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -14,9 +14,32 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_oa.h"
+#include "xe_perf.h"
 
 #define XE_OA_UNIT_INVALID U32_MAX
 
+struct xe_oa_reg {
+	struct xe_reg addr;
+	u32 value;
+};
+
+struct xe_oa_config {
+	struct xe_oa *oa;
+
+	char uuid[UUID_STRING_LEN + 1];
+	int id;
+
+	const struct xe_oa_reg *regs;
+	u32 regs_len;
+
+	struct attribute_group sysfs_metric;
+	struct attribute *attrs[2];
+	struct kobj_attribute sysfs_metric_id;
+
+	struct kref ref;
+	struct rcu_head rcu;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -41,6 +64,405 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
 };
 
+static void xe_oa_config_release(struct kref *ref)
+{
+	struct xe_oa_config *oa_config =
+		container_of(ref, typeof(*oa_config), ref);
+
+	kfree(oa_config->regs);
+
+	kfree_rcu(oa_config, rcu);
+}
+
+static void xe_oa_config_put(struct xe_oa_config *oa_config)
+{
+	if (!oa_config)
+		return;
+
+	kref_put(&oa_config->ref, xe_oa_config_release);
+}
+
+static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
+{
+	static const struct xe_reg flex_eu_regs[] = {
+		EU_PERF_CNTL0,
+		EU_PERF_CNTL1,
+		EU_PERF_CNTL2,
+		EU_PERF_CNTL3,
+		EU_PERF_CNTL4,
+		EU_PERF_CNTL5,
+		EU_PERF_CNTL6,
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(flex_eu_regs); i++) {
+		if (flex_eu_regs[i].addr == addr)
+			return true;
+	}
+	return false;
+}
+
+static bool xe_oa_reg_in_range_table(u32 addr, const struct xe_mmio_range *table)
+{
+	while (table->start && table->end) {
+		if (addr >= table->start && addr <= table->end)
+			return true;
+
+		table++;
+	}
+
+	return false;
+}
+
+static const struct xe_mmio_range xehp_oa_b_counters[] = {
+	{ .start = 0xdc48, .end = 0xdc48 },	/* OAA_ENABLE_REG */
+	{ .start = 0xdd00, .end = 0xdd48 },	/* OAG_LCE0_0 - OAA_LENABLE_REG */
+	{}
+};
+
+static const struct xe_mmio_range gen12_oa_b_counters[] = {
+	{ .start = 0x2b2c, .end = 0x2b2c },	/* OAG_OA_PESS */
+	{ .start = 0xd900, .end = 0xd91c },	/* OAG_OASTARTTRIG[1-8] */
+	{ .start = 0xd920, .end = 0xd93c },	/* OAG_OAREPORTTRIG1[1-8] */
+	{ .start = 0xd940, .end = 0xd97c },	/* OAG_CEC[0-7][0-1] */
+	{ .start = 0xdc00, .end = 0xdc3c },	/* OAG_SCEC[0-7][0-1] */
+	{ .start = 0xdc40, .end = 0xdc40 },	/* OAG_SPCTR_CNF */
+	{ .start = 0xdc44, .end = 0xdc44 },	/* OAA_DBG_REG */
+	{}
+};
+
+static const struct xe_mmio_range mtl_oam_b_counters[] = {
+	{ .start = 0x393000, .end = 0x39301c },	/* OAM_STARTTRIG1[1-8] */
+	{ .start = 0x393020, .end = 0x39303c },	/* OAM_REPORTTRIG1[1-8] */
+	{ .start = 0x393040, .end = 0x39307c },	/* OAM_CEC[0-7][0-1] */
+	{ .start = 0x393200, .end = 0x39323C },	/* MPES[0-7] */
+	{}
+};
+
+static const struct xe_mmio_range xe2_oa_b_counters[] = {
+	{ .start = 0x393200, .end = 0x39323C },	/* MPES_0_MPES_SAG - MPES_7_UPPER_MPES_SAG */
+	{ .start = 0x394200, .end = 0x39423C },	/* MPES_0_MPES_SCMI0 - MPES_7_UPPER_MPES_SCMI0 */
+	{ .start = 0x394A00, .end = 0x394A3C },	/* MPES_0_MPES_SCMI1 - MPES_7_UPPER_MPES_SCMI1 */
+	{},
+};
+
+static bool xe_oa_is_valid_b_counter_addr(struct xe_oa *oa, u32 addr)
+{
+	return xe_oa_reg_in_range_table(addr, xehp_oa_b_counters) ||
+		xe_oa_reg_in_range_table(addr, gen12_oa_b_counters) ||
+		xe_oa_reg_in_range_table(addr, mtl_oam_b_counters) ||
+		(GRAPHICS_VER(oa->xe) >= 20 &&
+		 xe_oa_reg_in_range_table(addr, xe2_oa_b_counters));
+}
+
+static const struct xe_mmio_range mtl_oa_mux_regs[] = {
+	{ .start = 0x0d00, .end = 0x0d04 },	/* RPM_CONFIG[0-1] */
+	{ .start = 0x0d0c, .end = 0x0d2c },	/* NOA_CONFIG[0-8] */
+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
+	{ .start = 0x38d100, .end = 0x38d114},	/* VISACTL */
+	{}
+};
+
+static const struct xe_mmio_range gen12_oa_mux_regs[] = {
+	{ .start = 0x0d00, .end = 0x0d04 },     /* RPM_CONFIG[0-1] */
+	{ .start = 0x0d0c, .end = 0x0d2c },     /* NOA_CONFIG[0-8] */
+	{ .start = 0x9840, .end = 0x9840 },	/* GDT_CHICKEN_BITS */
+	{ .start = 0x9884, .end = 0x9888 },	/* NOA_WRITE */
+	{ .start = 0x20cc, .end = 0x20cc },	/* WAIT_FOR_RC6_EXIT */
+	{}
+};
+
+static const struct xe_mmio_range xe2_oa_mux_regs[] = {
+	{ .start = 0x5194, .end = 0x5194 },	/* SYS_MEM_LAT_MEASURE_MERTF_GRP_3D */
+	{ .start = 0x8704, .end = 0x8704 },	/* LMEM_LAT_MEASURE_MCFG_GRP */
+	{ .start = 0xB1BC, .end = 0xB1BC },	/* L3_BANK_LAT_MEASURE_LBCF_GFX */
+	{ .start = 0xE18C, .end = 0xE18C },	/* SAMPLER_MODE */
+	{ .start = 0xE590, .end = 0xE590 },	/* TDL_LSC_LAT_MEASURE_TDL_GFX */
+	{ .start = 0x13000, .end = 0x137FC },	/* PES_0_PESL0 - PES_63_UPPER_PESL3 */
+	{},
+};
+
+static bool xe_oa_is_valid_mux_addr(struct xe_oa *oa, u32 addr)
+{
+	if (GRAPHICS_VER(oa->xe) >= 20)
+		return xe_oa_reg_in_range_table(addr, xe2_oa_mux_regs);
+	else if (GRAPHICS_VERx100(oa->xe) >= 1270)
+		return xe_oa_reg_in_range_table(addr, mtl_oa_mux_regs);
+	else
+		return xe_oa_reg_in_range_table(addr, gen12_oa_mux_regs);
+}
+
+static bool xe_oa_is_valid_config_reg_addr(struct xe_oa *oa, u32 addr)
+{
+	return xe_oa_is_valid_flex_addr(oa, addr) ||
+		xe_oa_is_valid_b_counter_addr(oa, addr) ||
+		xe_oa_is_valid_mux_addr(oa, addr);
+}
+
+static struct xe_oa_reg *
+xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
+		 u32 __user *regs, u32 n_regs)
+{
+	struct xe_oa_reg *oa_regs;
+	int err;
+	u32 i;
+
+	oa_regs = kmalloc_array(n_regs, sizeof(*oa_regs), GFP_KERNEL);
+	if (!oa_regs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < n_regs; i++) {
+		u32 addr, value;
+
+		err = get_user(addr, regs);
+		if (err)
+			goto addr_err;
+
+		if (!is_valid(oa, addr)) {
+			drm_dbg(&oa->xe->drm, "Invalid oa_reg address: %X\n", addr);
+			err = -EINVAL;
+			goto addr_err;
+		}
+
+		err = get_user(value, regs + 1);
+		if (err)
+			goto addr_err;
+
+		oa_regs[i].addr = XE_REG(addr);
+		oa_regs[i].value = value;
+
+		regs += 2;
+	}
+
+	return oa_regs;
+
+addr_err:
+	kfree(oa_regs);
+	return ERR_PTR(err);
+}
+
+static ssize_t show_dynamic_id(struct kobject *kobj,
+			       struct kobj_attribute *attr,
+			       char *buf)
+{
+	struct xe_oa_config *oa_config =
+		container_of(attr, typeof(*oa_config), sysfs_metric_id);
+
+	return sysfs_emit(buf, "%d\n", oa_config->id);
+}
+
+static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
+					 struct xe_oa_config *oa_config)
+{
+	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
+	oa_config->sysfs_metric_id.attr.name = "id";
+	oa_config->sysfs_metric_id.attr.mode = 0444;
+	oa_config->sysfs_metric_id.show = show_dynamic_id;
+	oa_config->sysfs_metric_id.store = NULL;
+
+	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
+	oa_config->attrs[1] = NULL;
+
+	oa_config->sysfs_metric.name = oa_config->uuid;
+	oa_config->sysfs_metric.attrs = oa_config->attrs;
+
+	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
+}
+
+/**
+ * xe_oa_add_config_ioctl - Adds one OA config
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_oa_config
+ * @file: @drm_file
+ *
+ * The functions adds an OA config to the set of OA configs maintained in
+ * the kernel. The config determines which OA metrics are collected for an
+ * OA stream.
+ */
+int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct drm_xe_oa_config param;
+	struct drm_xe_oa_config *arg = &param;
+	struct xe_oa_config *oa_config, *tmp;
+	struct xe_oa_reg *regs;
+	int err, id;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
+		return -EACCES;
+	}
+
+	err = __copy_from_user(&param, u64_to_user_ptr(data), sizeof(param));
+	if (XE_IOCTL_DBG(oa->xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(oa->xe, arg->extensions) ||
+	    XE_IOCTL_DBG(oa->xe, !arg->regs_ptr) ||
+	    XE_IOCTL_DBG(oa->xe, !arg->n_regs))
+		return -EINVAL;
+
+	oa_config = kzalloc(sizeof(*oa_config), GFP_KERNEL);
+	if (!oa_config)
+		return -ENOMEM;
+
+	oa_config->oa = oa;
+	kref_init(&oa_config->ref);
+
+	if (!uuid_is_valid(arg->uuid)) {
+		drm_dbg(&oa->xe->drm, "Invalid uuid format for OA config\n");
+		err = -EINVAL;
+		goto reg_err;
+	}
+
+	/* Last character in oa_config->uuid will be 0 because oa_config is kzalloc */
+	memcpy(oa_config->uuid, arg->uuid, sizeof(arg->uuid));
+
+	oa_config->regs_len = arg->n_regs;
+	regs = xe_oa_alloc_regs(oa, xe_oa_is_valid_config_reg_addr,
+				u64_to_user_ptr(arg->regs_ptr),
+				arg->n_regs);
+	if (IS_ERR(regs)) {
+		drm_dbg(&oa->xe->drm, "Failed to create OA config for mux_regs\n");
+		err = PTR_ERR(regs);
+		goto reg_err;
+	}
+	oa_config->regs = regs;
+
+	err = mutex_lock_interruptible(&oa->metrics_lock);
+	if (err)
+		goto reg_err;
+
+	/* We shouldn't have too many configs, so this iteration shouldn't be too costly */
+	idr_for_each_entry(&oa->metrics_idr, tmp, id) {
+		if (!strcmp(tmp->uuid, oa_config->uuid)) {
+			drm_dbg(&oa->xe->drm, "OA config already exists with this uuid\n");
+			err = -EADDRINUSE;
+			goto sysfs_err;
+		}
+	}
+
+	err = create_dynamic_oa_sysfs_entry(oa, oa_config);
+	if (err) {
+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		goto sysfs_err;
+	}
+
+	oa_config->id = idr_alloc(&oa->metrics_idr, oa_config, 1, 0, GFP_KERNEL);
+	if (oa_config->id < 0) {
+		drm_dbg(&oa->xe->drm, "Failed to create sysfs entry for OA config\n");
+		err = oa_config->id;
+		goto sysfs_err;
+	}
+
+	mutex_unlock(&oa->metrics_lock);
+
+	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
+
+	return oa_config->id;
+
+sysfs_err:
+	mutex_unlock(&oa->metrics_lock);
+reg_err:
+	xe_oa_config_put(oa_config);
+	drm_dbg(&oa->xe->drm, "Failed to add new OA config\n");
+	return err;
+}
+
+/**
+ * xe_oa_remove_config_ioctl - Removes one OA config
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_perf_param
+ * @file: @drm_file
+ */
+int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct xe_oa_config *oa_config;
+	u64 arg, *ptr = u64_to_user_ptr(data);
+	int ret;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	if (xe_perf_stream_paranoid && !perfmon_capable()) {
+		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
+		return -EACCES;
+	}
+
+	ret = get_user(arg, ptr);
+	if (XE_IOCTL_DBG(oa->xe, ret))
+		return ret;
+
+	ret = mutex_lock_interruptible(&oa->metrics_lock);
+	if (ret)
+		return ret;
+
+	oa_config = idr_find(&oa->metrics_idr, arg);
+	if (!oa_config) {
+		drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
+		ret = -ENOENT;
+		goto err_unlock;
+	}
+
+	WARN_ON(arg != oa_config->id);
+
+	sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
+	idr_remove(&oa->metrics_idr, arg);
+
+	mutex_unlock(&oa->metrics_lock);
+
+	drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
+
+	xe_oa_config_put(oa_config);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&oa->metrics_lock);
+	return ret;
+}
+
+/**
+ * xe_oa_register - Xe OA registration
+ * @xe: @xe_device
+ *
+ * Exposes the metrics sysfs directory upon completion of module initialization
+ */
+void xe_oa_register(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	if (!oa->xe)
+		return;
+
+	oa->metrics_kobj = kobject_create_and_add("metrics",
+						  &xe->drm.primary->kdev->kobj);
+}
+
+/**
+ * xe_oa_unregister - Xe OA de-registration
+ * @xe: @xe_device
+ */
+void xe_oa_unregister(struct xe_device *xe)
+{
+	struct xe_oa *oa = &xe->oa;
+
+	if (!oa->metrics_kobj)
+		return;
+
+	kobject_put(oa->metrics_kobj);
+	oa->metrics_kobj = NULL;
+}
+
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
 {
 	return 1;
@@ -239,6 +661,9 @@ int xe_oa_init(struct xe_device *xe)
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
+	drmm_mutex_init(&oa->xe->drm, &oa->metrics_lock);
+	idr_init_base(&oa->metrics_idr, 1);
+
 	ret = xe_oa_init_oa_units(oa);
 	if (ret) {
 		drm_err(&xe->drm, "OA initialization failed (%pe)\n", ERR_PTR(ret));
@@ -252,6 +677,12 @@ int xe_oa_init(struct xe_device *xe)
 	return ret;
 }
 
+static int destroy_config(int id, void *p, void *data)
+{
+	xe_oa_config_put(p);
+	return 0;
+}
+
 /**
  * xe_oa_fini - OA de-initialization during device remove
  * @xe: @xe_device
@@ -263,5 +694,8 @@ void xe_oa_fini(struct xe_device *xe)
 	if (!oa->xe)
 		return;
 
+	idr_for_each(&oa->metrics_idr, destroy_config, oa);
+	idr_destroy(&oa->metrics_idr);
+
 	oa->xe = NULL;
 }
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 2647c1947746..5ccc772e047a 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -8,9 +8,15 @@
 
 #include "xe_oa_types.h"
 
+struct drm_device;
+struct drm_file;
 struct xe_device;
 
 int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
+void xe_oa_register(struct xe_device *xe);
+void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
+int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index e7b91e31f0e8..f8a45015cf49 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -7,6 +7,7 @@
 #define _XE_OA_TYPES_H_
 
 #include <linux/bitops.h>
+#include <linux/idr.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
@@ -125,6 +126,15 @@ struct xe_oa {
 	/** @xe: back pointer to xe device */
 	struct xe_device *xe;
 
+	/** @metrics_kobj: kobj for metrics sysfs */
+	struct kobject *metrics_kobj;
+
+	/** @metrics_lock: lock protecting add/remove configs */
+	struct mutex metrics_lock;
+
+	/** @metrics_idr: List of dynamic configurations (struct xe_oa_config) */
+	struct idr metrics_idr;
+
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index f619cf50b453..ca01042d75b1 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -8,11 +8,25 @@
 
 #include <drm/xe_drm.h>
 
+#include "xe_oa.h"
 #include "xe_perf.h"
 
 u32 xe_perf_stream_paranoid = true;
 static struct ctl_table_header *sysctl_header;
 
+static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
+		       struct drm_file *file)
+{
+	switch (arg->perf_op) {
+	case DRM_XE_PERF_OP_ADD_CONFIG:
+		return xe_oa_add_config_ioctl(dev, arg->param, file);
+	case DRM_XE_PERF_OP_REMOVE_CONFIG:
+		return xe_oa_remove_config_ioctl(dev, arg->param, file);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * xe_perf_ioctl - The top level perf layer ioctl
  * @dev: @drm_device
@@ -32,6 +46,8 @@ int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		return -EINVAL;
 
 	switch (arg->perf_type) {
+	case DRM_XE_PERF_TYPE_OA:
+		return xe_oa_ioctl(dev, arg, file);
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 323d899a276b..fd9a4bd9e3d4 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1378,6 +1378,7 @@ struct drm_xe_wait_user_fence {
  * enum drm_xe_perf_type - Perf stream types
  */
 enum drm_xe_perf_type {
+	DRM_XE_PERF_TYPE_OA,
 	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
 };
 
@@ -1469,6 +1470,30 @@ enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
+/**
+ * struct drm_xe_oa_config - OA metric configuration
+ *
+ * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
+ * particular config can be specified when opening an OA stream using
+ * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
+ */
+struct drm_xe_oa_config {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @uuid: String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x" */
+	char uuid[36];
+
+	/** @n_regs: Number of regs in @regs_ptr */
+	__u32 n_regs;
+
+	/**
+	 * @regs_ptr: Pointer to (register address, value) pairs for OA config
+	 * registers. Expected length of buffer is: (2 * sizeof(u32) * @n_regs).
+	 */
+	__u64 regs_ptr;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

