Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04889CE79AA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADD510E288;
	Tue, 19 Sep 2023 16:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC80C10E13B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140179; x=1726676179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UzYO5LbpS+NoC/6MdC8bq+SYv/L9TZwVlqFOMTGdlvs=;
 b=BQiZJK6fqdP38IrbkTZ4J6U6+vQvA0e96QbnOWaik0525fFh03eZ9Cis
 CK6cDVk8kzy6K60ENC6Vc9G6FVB/7Cvf/Fq39XNAx0NThwL8AvShcVZJh
 hweWLtKnKN6wL6lImRvI6H9vmM3dCfqIh353bOrbNgIBMvNjmn+EH8Lf5
 SiGDx822NYHLbPpas8YQpo2uCFdSizYx1UrciU18707AxBUin+ROW8U8x
 0wIKDyCjtO5sbDrfxTefay8LePtWuGlg37aqEOpPixshkikFxGvrKiVDf
 iVpwAFk6wGpN44twX/xZQDVmepGtTYcwKB3mXmS0ubFoTqvosxH2HfW8C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913543"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913543"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016517"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016517"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:34 -0700
Message-ID: <20230919161049.2307855-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/21] drm/xe/oa: Start implementing OA stream
 open ioctl
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

Start implementing OA stream open ioctl and parse properties passed in as
part of OA stream open. The remaining operations associated with OA stream
open continue in subsequent patches.

v2: Include PVC in xe_oa_timestamp_frequency
    Remove forcewake_get from reading RPM_CONFIG0

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   1 +
 drivers/gpu/drm/xe/xe_oa.c     | 239 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h     |   2 +
 3 files changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index aacca14e52b11..7a179c4515633 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -115,6 +115,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
 
+	DRM_IOCTL_DEF_DRV(XE_OA_OPEN, xe_oa_stream_open_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OA_ADD_CONFIG, xe_oa_add_config_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OA_REMOVE_CONFIG, xe_oa_remove_config_ioctl, DRM_RENDER_ALLOW),
 
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 1963bc6fad10e..c0ff8c2319ac0 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -11,11 +11,16 @@
 #include <drm/xe_drm.h>
 #include <drm/drm_drv.h>
 
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_oa_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_mmio.h"
 #include "xe_oa.h"
 
+#define DEFAULT_POLL_FREQUENCY_HZ 200
+#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
+
 static u32 xe_oa_stream_paranoid = true;
 static int xe_oa_sample_rate_hard_limit;
 static u32 xe_oa_max_sample_rate = 100000;
@@ -31,6 +36,21 @@ static const struct xe_oa_format oa_formats[] = {
 	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
 };
 
+struct xe_oa_open_properties {
+	bool sample;
+	bool single_exec_q;
+	u64 exec_q_id;
+
+	int metrics_set;
+	int oa_format;
+	bool oa_periodic;
+	int oa_period_exponent;
+
+	struct xe_hw_engine *hwe;
+
+	u64 poll_oa_period;
+};
+
 static struct ctl_table_header *sysctl_header;
 
 static void xe_oa_config_release(struct kref *ref)
@@ -53,6 +73,225 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
 	kref_put(&oa_config->ref, xe_oa_config_release);
 }
 
+/*
+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
+ * cases, return the adjusted CS timestamp frequency to the user.
+ */
+u32 xe_oa_timestamp_frequency(struct xe_device *xe)
+{
+	u32 reg, shift;
+
+	/*
+	 * Wa_18013179988:dg2
+	 * Wa_14015568240:pvc
+	 * Wa_14015846243:mtl
+	 */
+	switch (xe->info.platform) {
+	case XE_DG2:
+	case XE_PVC:
+	case XE_METEORLAKE:
+		xe_device_mem_access_get(xe);
+		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
+		xe_device_mem_access_put(xe);
+
+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
+		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
+
+	default:
+		return xe_root_mmio_gt(xe)->info.clock_freq;
+	}
+}
+
+static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
+{
+	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
+	u32 den = xe_oa_timestamp_frequency(oa->xe);
+
+	return div_u64(nom + den - 1, den);
+}
+
+static bool oa_format_valid(struct xe_oa *oa, u64 format)
+{
+	if (format >= XE_OA_FORMAT_MAX)
+		return false;
+	return test_bit(format, oa->format_mask);
+}
+
+static bool engine_supports_oa(const struct xe_hw_engine *hwe)
+{
+	return hwe->oa_group;
+}
+
+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
+{
+	return hwe->oa_group && hwe->oa_group->type == type;
+}
+
+#define OA_EXPONENT_MAX 31
+
+static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
+					  u32 n_props,
+					  struct xe_oa_open_properties *props)
+{
+	const struct xe_oa_format *f;
+	u64 __user *uprop = uprops;
+	bool config_instance = false;
+	bool config_class = false;
+	u8 class, instance;
+	struct xe_gt *gt;
+	u32 i;
+	int ret;
+
+	if (!n_props || n_props >= DRM_XE_OA_PROP_MAX) {
+		drm_dbg(&oa->xe->drm, "Invalid number of xe perf properties given\n");
+		return -EINVAL;
+	}
+
+	props->poll_oa_period = DEFAULT_POLL_PERIOD_NS;
+
+	/* Defaults when class:instance is not passed */
+	class = XE_ENGINE_CLASS_RENDER;
+	instance = 0;
+
+	for (i = 0; i < n_props; i++) {
+		u64 oa_period, oa_freq_hz;
+		u64 id, value;
+
+		ret = get_user(id, uprop);
+		if (ret)
+			return ret;
+
+		ret = get_user(value, uprop + 1);
+		if (ret)
+			return ret;
+
+		switch ((enum drm_xe_oa_property_id)id) {
+		case DRM_XE_OA_PROP_EXEC_QUEUE_ID:
+			props->single_exec_q = true;
+			props->exec_q_id = value;
+			break;
+		case DRM_XE_OA_PROP_SAMPLE_OA:
+			props->sample = value;
+			break;
+		case DRM_XE_OA_PROP_OA_METRICS_SET:
+			if (!value) {
+				drm_dbg(&oa->xe->drm, "Unknown OA metric set ID\n");
+				return -EINVAL;
+			}
+			props->metrics_set = value;
+			break;
+		case DRM_XE_OA_PROP_OA_FORMAT:
+			if (!oa_format_valid(oa, value)) {
+				drm_dbg(&oa->xe->drm, "Unsupported OA report format %llu\n",
+					value);
+				return -EINVAL;
+			}
+			props->oa_format = value;
+			break;
+		case DRM_XE_OA_PROP_OA_EXPONENT:
+			if (value > OA_EXPONENT_MAX) {
+				drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n",
+					OA_EXPONENT_MAX);
+				return -EINVAL;
+			}
+
+			BUILD_BUG_ON(sizeof(oa_period) != 8);
+			oa_period = oa_exponent_to_ns(oa, value);
+
+			oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+			if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
+				drm_dbg(&oa->xe->drm,
+					"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
+					  xe_oa_max_sample_rate);
+				return -EACCES;
+			}
+
+			props->oa_periodic = true;
+			props->oa_period_exponent = value;
+			break;
+		case DRM_XE_OA_PROP_POLL_OA_PERIOD:
+			if (value < 100000 /* 100us */) {
+				drm_dbg(&oa->xe->drm, "OA timer too small (%lluns < 100us)\n",
+					value);
+				return -EINVAL;
+			}
+			props->poll_oa_period = value;
+			break;
+		case DRM_XE_OA_PROP_OA_ENGINE_CLASS:
+			class = (u8)value;
+			config_class = true;
+			break;
+		case DRM_XE_OA_PROP_OA_ENGINE_INSTANCE:
+			instance = (u8)value;
+			config_instance = true;
+			break;
+		default:
+			drm_dbg(&oa->xe->drm, "Unknown xe oa property ID %lld\n", id);
+			return -EINVAL;
+		}
+
+		uprop += 2;
+	}
+
+	if ((config_class && !config_instance) ||
+	    (config_instance && !config_class)) {
+		drm_dbg(&oa->xe->drm, "OA engine class/instance parameters must be passed together\n");
+		return -EINVAL;
+	}
+
+	for_each_gt(gt, oa->xe, i) {
+		props->hwe = xe_gt_hw_engine(gt, class, instance, false);
+		if (props->hwe)
+			break;
+	}
+	if (!props->hwe) {
+		drm_dbg(&oa->xe->drm, "OA engine class and instance invalid %d:%d\n",
+			class, instance);
+		return -EINVAL;
+	}
+
+	if (!engine_supports_oa(props->hwe)) {
+		drm_dbg(&oa->xe->drm, "Engine not supported by OA %d:%d\n",
+			class, instance);
+		return -EINVAL;
+	}
+
+	f = &oa->oa_formats[props->oa_format];
+	if (!props->oa_format || !f->size ||
+	    !engine_supports_oa_format(props->hwe, f->type)) {
+		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
+			props->oa_format, f->type, f->size, props->hwe->class);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file)
+{
+	struct xe_oa *oa = &to_xe_device(dev)->oa;
+	struct drm_xe_oa_open_param *param = data;
+	struct xe_oa_open_properties props = {};
+	u32 known_open_flags;
+
+	if (!oa->xe) {
+		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
+		return -ENODEV;
+	}
+
+	known_open_flags = XE_OA_FLAG_FD_CLOEXEC | XE_OA_FLAG_FD_NONBLOCK | XE_OA_FLAG_DISABLED;
+	if (param->flags & ~known_open_flags) {
+		drm_dbg(&oa->xe->drm, "Unknown drm_xe_oa_open_param flag\n");
+		return -EINVAL;
+	}
+
+	return xe_oa_read_properties_unlocked(oa, u64_to_user_ptr(param->properties_ptr),
+					      param->num_properties,
+					      &props);
+}
+
 static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
 {
 	static const struct xe_reg flex_eu_regs[] = {
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 79f77f445deb0..fd6caf652047a 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -16,6 +16,8 @@ int xe_oa_ioctl_version(struct xe_device *xe);
 int xe_oa_sysctl_register(void);
 void xe_oa_sysctl_unregister(void);
 
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
-- 
2.41.0

