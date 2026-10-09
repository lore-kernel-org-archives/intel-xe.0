Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2938CA601C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847E6112052;
	Fri,  9 Oct 2026 10:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFs5Cejh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82FC112052
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541775; x=1823077775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0iB4jD9tsPeojl3iI0SlHTDS6ev9GvRL0Hgogr1g1Fc=;
 b=UFs5Cejhpso2ft2B2ykXH5xTLFNzGOpIcAG8wqa9Re3djvLlUXYdBCjC
 yQrEVqV55bqE8KXpqlKdsZmSvylBc0MdpsMrfPyyr4D/whbCTDqt4FKwd
 nsi0r0Ce8xS34JowXsU69RVYm5RwE1fNJ4OyJFURZFeZ5Twdmqu+6BWOi
 /LhGOuof0LhBkSpxIBKHLj0dAdcN88tGERq/MRvOJGPxkbfpq8BHeWqIc
 lAXOzmbYO6QCRIFwFNnsGi79d68ikRPzul1ae+bfV2TPAnmAb1S5+fjO/
 J38u1YI4tFbxDBVvkK0uX+BG36AIVTGGUPVoD4BC9cGtZy1eFbL36Hg2j w==;
X-CSE-ConnectionGUID: JvCNEY+dQQS8q8m9DKTq5g==
X-CSE-MsgGUID: dycGonrPT7KahGZJ0vAq/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344095"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344095"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:35 -0700
X-CSE-ConnectionGUID: OY+8udPzQcmDoASrrtyxtg==
X-CSE-MsgGUID: +3ts1oDPRHqqQyOd3a+fpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025593"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:32 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 07/12] drm/xe/cper: Log CPER records for aggregate counter
 retrieval
Date: Fri,  9 Oct 2026 16:16:10 +0530
Message-ID: <20261009104602.1075405-21-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

Log CPER records for aggregate counter retrieval from userspace when
cper_on_query sysfs is enabled.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
 - Add xe_cper_emit_counter() to emit records from the counter response
   already fetched for userspace, instead of fetching it again
 - Move cper_on_query to struct xe_cper and xe_cper.c (Raag)
 - Document cper_on_query sysfs in ABI
 - Fix sysfs attribute cper_on_query permissions (sashiko)
---
 .../ABI/testing/sysfs-driver-intel-xe-cper    | 18 ++++
 drivers/gpu/drm/xe/xe_cper.c                  | 99 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_cper.h                  | 11 +++
 drivers/gpu/drm/xe/xe_cper_types.h            |  8 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  4 +
 drivers/gpu/drm/xe/xe_ras.c                   | 42 ++++++++
 6 files changed, 169 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-cper b/Documentation/ABI/testing/sysfs-driver-intel-xe-cper
new file mode 100644
index 000000000000..19f56d2c0ab3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-cper
@@ -0,0 +1,18 @@
+What:		/sys/bus/pci/drivers/xe/.../cper_on_query
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:
+		This file controls whether a CPER (Common Platform Error Record)
+		is emitted each time a RAS error counter is queried.
+
+		This sysfs file is present only on Intel Xe platforms that support
+		the RAS error counter interface and when the kernel is built with
+		CPER support. Reading the current setting is available to all
+		users, while updating it is restricted to administrative users
+		only.
+
+		The value is a boolean. When set to 1, every counter query emits
+		a CPER record built from the counter and its associated info
+		queue data. When set to 0 (default), no record is emitted on
+		query.
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 7acb503efd11..709fc3d52fcf 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/minmax.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/time.h>
 #include <linux/timekeeping.h>
 
@@ -378,32 +380,41 @@ xe_prepare_cper_error_info(struct xe_device *xe,
 	return einfo_arr;
 }
 
-static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-				const struct xe_ras_error_class *error_class)
+/**
+ * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
+ * @xe: The &xe_device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @error_class: RAS error class of the counter
+ * @resp: Counter response returned by firmware for @error_class
+ *
+ * Build and emit CPER records from @resp, including any info queue data.
+ * Must be called from a sleepable context with a runtime PM reference held.
+ */
+void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			  const struct xe_ras_error_class *error_class,
+			  const struct xe_ras_get_counter_response *resp)
 {
 	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
-	struct xe_ras_get_counter_response local_resp;
 	struct xe_cper_einfo_entry single = {};
 	u32 einfo_count = 0, count, i;
 
-	/* Fetching the counter sends a sysctrl command */
+	if (!is_hw_sigid(sigid))
+		return;
+
+	/* Draining the info queue sends sysctrl commands */
 	might_sleep();
 	xe_device_assert_mem_access(xe);
 
-	if (xe_ras_get_counter_response(xe, error_class, &local_resp)) {
-		xe_err(xe, "CPER: failed to get counter, skipping record\n");
-		return;
-	}
-
 	/* Without info queue data, emit a single record from the counter itself */
 	single.hdr.error_class = *error_class;
-	single.hdr.counter = local_resp.value;
-	single.timestamp = local_resp.timestamp;
+	single.hdr.counter = resp->value;
+	single.timestamp = resp->timestamp;
 	entries = &single;
 	count = 1;
 
-	if (local_resp.has_info_queue) {
-		einfo_arr = xe_prepare_cper_error_info(xe, &local_resp, error_class, &einfo_count);
+	if (resp->has_info_queue) {
+		einfo_arr = xe_prepare_cper_error_info(xe, resp, error_class, &einfo_count);
 		if (einfo_arr) {
 			entries = einfo_arr;
 			count = einfo_count;
@@ -425,6 +436,23 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
 	free_einfo_arr(einfo_arr, einfo_count);
 }
 
+static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+				const struct xe_ras_error_class *error_class)
+{
+	struct xe_ras_get_counter_response resp;
+
+	/* Fetching the counter sends a sysctrl command */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	if (xe_ras_get_counter_response(xe, error_class, &resp)) {
+		xe_err(xe, "CPER: failed to get counter, skipping record\n");
+		return;
+	}
+
+	xe_cper_emit_counter(xe, cper_sev, sigid, error_class, &resp);
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &xe_device
@@ -453,3 +481,48 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 
 	/* TODO software CPER */
 }
+
+static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+
+	return sysfs_emit(buf, "%u\n", READ_ONCE(xe->cper.on_query));
+}
+
+static ssize_t cper_on_query_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct xe_device *xe = kdev_to_xe_device(dev);
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(xe->cper.on_query, enable);
+
+	return count;
+}
+static DEVICE_ATTR_RW(cper_on_query);
+
+static struct attribute *cper_attrs[] = {
+	&dev_attr_cper_on_query.attr,
+	NULL
+};
+
+/* See Documentation/ABI/testing/sysfs-driver-intel-xe-cper */
+static const struct attribute_group cper_group = {
+	.attrs = cper_attrs,
+};
+
+/**
+ * xe_cper_sysfs_init() - Create the CPER sysfs attributes
+ * @xe: The &xe_device
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_cper_sysfs_init(struct xe_device *xe)
+{
+	return devm_device_add_group(xe->drm.dev, &cper_group);
+}
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
index 84676c7645a5..ad50349c0a6f 100644
--- a/drivers/gpu/drm/xe/xe_cper.h
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -12,15 +12,26 @@
 
 struct va_format;
 struct xe_device;
+struct xe_ras_error_class;
+struct xe_ras_get_counter_response;
 
 #if IS_ENABLED(CONFIG_UEFI_CPER)
 void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf);
+void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			  const struct xe_ras_error_class *error_class,
+			  const struct xe_ras_get_counter_response *resp);
+int xe_cper_sysfs_init(struct xe_device *xe);
 #else
 static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 				u32 component, u32 location, const void *data, size_t len,
 				struct va_format *vaf) {}
+static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
+					enum xe_sigid sigid,
+					const struct xe_ras_error_class *error_class,
+					const struct xe_ras_get_counter_response *resp) {}
+static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
 #endif
 
 #endif /* _XE_CPER_H_ */
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index 627c7117f23e..e0034429e661 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -174,4 +174,12 @@ struct xe_cper_einfo_entry {
 	u64 timestamp;
 };
 
+/**
+ * struct xe_cper - Xe CPER state
+ */
+struct xe_cper {
+	/** @on_query: Emit a CPER record on each RAS counter query */
+	bool on_query;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 41f703a87916..d88e0768bc3e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_cper_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -579,6 +580,9 @@ struct xe_device {
 	/** @ras: RAS structure for device */
 	struct xe_drm_ras ras;
 
+	/** @cper: CPER state */
+	struct xe_cper cper;
+
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 900319938fe5..25ea178228f7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_configfs.h"
+#include "xe_cper.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -183,6 +184,38 @@ static int ras_status_to_errno(u32 status)
 	}
 }
 
+static enum xe_sigid ras_comp_to_hw_sigid(u8 component)
+{
+	switch (component) {
+	case XE_RAS_COMP_DEVICE_MEMORY:
+		return XE_SIGID_DEVICE_MEMORY;
+	case XE_RAS_COMP_CORE_COMPUTE:
+		return XE_SIGID_CORE_COMPUTE;
+	case XE_RAS_COMP_PCIE:
+		return XE_SIGID_PCIE;
+	case XE_RAS_COMP_FABRIC:
+		return XE_SIGID_FABRIC;
+	case XE_RAS_COMP_SOC_INTERNAL:
+		return XE_SIGID_SOC_INTERNAL;
+	default:
+		return XE_SIGID_HW;
+	}
+}
+
+static u8 ras_sev_to_cper_sev(u8 ras_sev)
+{
+	switch (ras_sev) {
+	case XE_RAS_SEV_CORRECTABLE:
+		return CPER_SEV_CORRECTED;
+	case XE_RAS_SEV_UNCORRECTABLE:
+		return CPER_SEV_RECOVERABLE;
+	case XE_RAS_SEV_INFORMATIONAL:
+		return CPER_SEV_INFORMATIONAL;
+	default:
+		return CPER_SEV_RECOVERABLE;
+	}
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -616,6 +649,11 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 		return ret;
 
 	*value = response.value;
+
+	if (READ_ONCE(xe->cper.on_query))
+		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter.common.severity),
+				     ras_comp_to_hw_sigid(counter.common.component),
+				     &counter, &response);
 	return 0;
 }
 
@@ -1067,4 +1105,8 @@ void xe_ras_init(struct xe_device *xe)
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
+
+	ret = xe_cper_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
 }
-- 
2.54.0

