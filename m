Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF2606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f0uAjP0n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43250112952;
	Fri, 23 Oct 2026 04:17:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B7811294F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729057; x=1824265057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGXbHfT9iKNhxI4S34RDfaEZybCNLQME/FMpA5DkyiQ=;
 b=f0uAjP0nGBoNZGVWOjgSGTb9pSVt5OOH3EXgmcSwJP+0XrLU+gxjisVc
 fm9RlvQcUJQDHwgR65Vt7xEtC1cH7nBw6tWfro90lF1viQqCeqJ+5RZjL
 KbxPmtp+yWkwDOQgHEutu7birwLGMrPsVASo+KSDqamyVqeLyTVZtTHjc
 bjSxZsshnkwHS0DIkEEnCeiZxYWJGwDT2khcpHJEN8N8JdRjoAX87prf1
 lJBBK//hQEVnqvxW/hIxFQfuUjilZYaAehd6KCVymKL/aiUlc04omRdLc
 Z+cg/jJIF+zBo/8ZoptAYhicE+TYfIK9LdFHGAmSy6WZgaduAEvnPF1pY g==;
X-CSE-ConnectionGUID: lK8j3P5OQkqsJpNI8MU2yg==
X-CSE-MsgGUID: DTWdGyBvQW6vMPEdbq9a/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383486"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383486"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:37 -0700
X-CSE-ConnectionGUID: YWrQzS6qSfu9I/Jr5XCkHw==
X-CSE-MsgGUID: c6qqQLVTT3eUXs8Z8XE9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658275"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 05/13] drm/xe/cper: Log CPER records for aggregate counter
 retrieval
Date: Fri, 23 Oct 2026 10:04:27 +0530
Message-ID: <20261023043422.681260-20-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Log CPER records for aggregate counter retrieval from userspace when
cper_on_query sysfs is enabled.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5:
 - Refactor get_counter() to conditionally emit cper (Raag)
v4:
 - Add xe_cper_emit_counter() to emit records from the counter response
   already fetched for userspace, instead of fetching it again
 - Move cper_on_query to struct xe_cper and xe_cper.c (Raag)
 - Document cper_on_query sysfs in ABI
 - Fix sysfs attribute cper_on_query permissions (sashiko)
---
 .../ABI/testing/sysfs-driver-intel-xe-cper    | 18 +++++
 drivers/gpu/drm/xe/xe_cper.c                  | 67 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_cper.h                  | 11 +++
 drivers/gpu/drm/xe/xe_cper_types.h            |  8 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  4 ++
 drivers/gpu/drm/xe/xe_ras.c                   | 51 ++++++++++++--
 6 files changed, 150 insertions(+), 9 deletions(-)
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
index 012693fe48c4..0ead6237bbb4 100644
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
 
@@ -196,12 +198,24 @@ static void cper_record_emit(struct xe_device *xe, u8 severity,
 	kfree(rec);
 }
 
-static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
-			      const struct xe_ras_error_class *counter,
-			      const struct xe_ras_get_counter_response *response)
+/**
+ * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
+ * @xe: The &xe_device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @counter: RAS error class
+ * @response: Counter response returned by firmware for @counter
+ *
+ * Build and emit a CPER record from @response.
+ */
+void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			  const struct xe_ras_error_class *counter,
+			  const struct xe_ras_get_counter_response *response)
 {
 	struct xe_cper_intel_hdr ihdr = {};
 
+	xe_assert(xe, is_hw_sigid(sigid));
+
 	cper_init_intel_hdr(xe, counter, response->timestamp,
 			    sigid, response->value, &ihdr);
 	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
@@ -221,7 +235,7 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 		return;
 	}
 
-	cper_emit_counter(xe, cper_sev, sigid, counter, &response);
+	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
 }
 
 /**
@@ -249,3 +263,48 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 
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
index e32c7d539257..107688b17d17 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -101,4 +101,12 @@ struct xe_platform_id_entry {
 	guid_t    platform_id;
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
index 6a6f9a24365c..b98418795d5e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_cper_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -566,6 +567,9 @@ struct xe_device {
 		struct xe_ras_state state;
 	} ras;
 
+	/** @cper: CPER state */
+	struct xe_cper cper;
+
 	/** @i2c: I2C host controller */
 	struct xe_i2c *i2c;
 
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 1da523c6e84c..95e87c635b04 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -6,6 +6,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_cper.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -110,7 +111,8 @@ static const char * const gpu_health_states[] = {
 };
 static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
+		       u32 *value, bool emit_cper);
 
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
@@ -192,6 +194,38 @@ static int ras_status_to_errno(u32 status)
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
@@ -533,7 +567,7 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	counter.common.severity = severity;
 	counter.common.component = component;
 
-	ret = get_counter(xe, &counter, &value);
+	ret = get_counter(xe, &counter, &value, false);
 	if (ret)
 		return;
 
@@ -677,7 +711,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 
 static int get_counter(struct xe_device *xe,
 		       struct xe_ras_error_class *counter,
-		       u32 *value)
+		       u32 *value, bool emit_cper)
 {
 	struct xe_ras_get_counter_response response = {};
 	int ret;
@@ -687,7 +721,10 @@ static int get_counter(struct xe_device *xe,
 		return ret;
 
 	*value = response.value;
-
+	if (emit_cper)
+		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter->common.severity),
+				     ras_comp_to_hw_sigid(counter->common.component),
+				     counter, &response);
 	return 0;
 }
 
@@ -869,7 +906,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+	return get_counter(xe, &counter, value, READ_ONCE(xe->cper.on_query));
 }
 
 /**
@@ -1248,5 +1285,9 @@ int xe_ras_init(struct xe_device *xe)
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
 
+	ret = xe_cper_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
+
 	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
 }
-- 
2.54.0

