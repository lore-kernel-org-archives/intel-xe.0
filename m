Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654F1606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FjGuR4EI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27ED61122BF;
	Thu, 29 Oct 2026 13:26:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E251122B0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793280384; x=1824816384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v5vehIPKHH5y1NlZ7fXVUHzmwbRDHQO0VJ0pWoGHGX4=;
 b=FjGuR4EIA/icFYuJxjP6vpZFVuT7zD/TidOQ+E7nDoTt7/rrJpWac8pH
 +MY63FxQIcqB8GtmULOthKJqqRORhdH1OhHYRsmghxnna9LCj6Y8eqq/k
 96lyDGb4g09ZO4zloVpM9b1Ix/UYw70NB9LoQLtOM3z5Qlq1PgZ2ZQBs3
 T+YNETv7X7MaGkwWq5v22yyQwKxbh/eDz+Cl/RguIW2gPOfl/ksi8T4rJ
 kXQDjLCKOHdcMhYNZuLEMk2uWjSxDSYxYSUKTjwAsxykipMtXh+Tnq4MY
 fjpgFgsyr5mXKJrDysPhQTPkc+pt4T9/e7p6NLrLEIKW5sb52V6ud6K1g A==;
X-CSE-ConnectionGUID: VZvzgkoZQYqJDRPd8aML8g==
X-CSE-MsgGUID: VKK5iwm4TTyNS2HcGKiTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1900321"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1900321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 06:26:24 -0700
X-CSE-ConnectionGUID: 26rWax2vROmu7v1/wag3+A==
X-CSE-MsgGUID: rejKrWlCQt29L+84HsvY3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5691670"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 29 Oct 2026 06:26:19 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v2 1/6] Add CPER logging support for CRI-Do not review
Date: Thu, 29 Oct 2026 18:56:11 +0530
Message-ID: <20261029132609.907017-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Badal Nilawar <badal.nilawar@intel.com>

DO NOT REVIEW. COMPILATION ONLY
This patch is from https://patchwork.freedesktop.org/series/169692/
Added only for Compilation.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-cper    |  18 +
 drivers/gpu/drm/xe/Makefile                   |   3 +
 drivers/gpu/drm/xe/xe_cper.c                  | 322 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 110 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 148 ++++++--
 drivers/gpu/drm/xe/xe_ras.h                   |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 ++++
 11 files changed, 695 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-cper b/Documentation/ABI/testing/sysfs-driver-intel-xe-cper
new file mode 100644
index 000000000000..2faccc318b34
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-cper
@@ -0,0 +1,18 @@
+What:		/sys/bus/pci/drivers/xe/.../cper_on_query
+Date:		October 2026
+KernelVersion:	7.5
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
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a8476e2e8d54..0392ba58dd65 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -169,6 +169,9 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
+xe-$(CONFIG_UEFI_CPER) += xe_cper.o \
+			  xe_trace_cper.o
+
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
new file mode 100644
index 000000000000..bb90030bcd2d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/bcd.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/time.h>
+#include <linux/timekeeping.h>
+
+#include "xe_cper.h"
+#include "xe_cper_types.h"
+#include "xe_device.h"
+#include "xe_printk.h"
+#include "xe_ras.h"
+#include "xe_ras_types.h"
+#include "xe_trace_cper.h"
+
+static bool is_sigid(u32 sigid)
+{
+	return sigid != INTEL_SIGID_INVALID && sigid != U32_MAX;
+}
+
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
+}
+
+/* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
+static const struct xe_device_guid_entry xe_device_guids[] = {
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+	{ 0x6752, GUID_INIT(0xb778ead8, 0x0009, 0x59a7,
+			    0xa1, 0x3a, 0x78, 0xce, 0x4d, 0xdd, 0xae, 0xf5) },
+};
+
+static const guid_t *lookup_device_guid(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_device_guids); i++)
+		if (xe_device_guids[i].device_id == pdev->device)
+			return &xe_device_guids[i].guid;
+
+	xe_printk(xe, warn_once, "CPER: no platform GUID for device %04x\n", pdev->device);
+
+	return NULL;
+}
+
+static u64 cper_timestamp_now(void)
+{
+	struct tm tm;
+	u64 ts = 0;
+	u8 *p = (u8 *)&ts;
+	int year;
+
+	time64_to_tm(ktime_get_real_seconds(), 0, &tm);
+
+	year = tm.tm_year + 1900;
+
+	p[0] = bin2bcd(tm.tm_sec);
+	p[1] = bin2bcd(tm.tm_min);
+	p[2] = bin2bcd(tm.tm_hour);
+	p[3] = 0x0;
+	p[4] = bin2bcd(tm.tm_mday);
+	p[5] = bin2bcd(tm.tm_mon + 1);
+	p[6] = bin2bcd(year % 100);
+	p[7] = bin2bcd(year / 100);
+
+	return ts;
+}
+
+static void cper_init_intel_hdr(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				u64 first_timestamp, u32 sig_id, u32 error_count,
+				struct xe_cper_intel_hdr *ihdr)
+{
+	ihdr->counter = *counter;
+	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
+	ihdr->sig_id = U32_MAX;
+
+	if (first_timestamp) {
+		ihdr->first_timestamp = first_timestamp;
+		ihdr->validation_bits |= XE_CPER_VALID_FIRST_TIMESTAMP;
+	}
+
+	if (is_sigid(sig_id)) {
+		ihdr->sig_id = sig_id;
+		ihdr->validation_bits |= XE_CPER_VALID_SIG_ID;
+	}
+
+	ihdr->error_count = error_count;
+
+	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
+	ihdr->validation_bits |= XE_CPER_VALID_PCI_BDF;
+
+#ifdef MODULE
+	if (THIS_MODULE->srcversion) {
+		strscpy(ihdr->drv_version, THIS_MODULE->srcversion, sizeof(ihdr->drv_version));
+		ihdr->validation_bits |= XE_CPER_VALID_DRV_VERSION;
+	}
+#endif
+}
+
+static void cper_init_record_hdr(struct xe_device *xe, u8 severity,
+				 const guid_t *notification_type,
+				 struct cper_record_header *rhdr,
+				 u32 total_len)
+{
+	const guid_t *device_guid;
+
+	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
+	memcpy(rhdr->signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
+	rhdr->revision          = CPER_RECORD_REV;
+	rhdr->signature_end     = CPER_SIG_END;
+	rhdr->section_count     = 1;
+	rhdr->error_severity    = severity;
+	rhdr->validation_bits   = CPER_VALID_TIMESTAMP;
+	rhdr->record_length     = total_len;
+	rhdr->timestamp         = cper_timestamp_now();
+	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
+	rhdr->notification_type = *notification_type;
+	rhdr->record_id         = cper_next_record_id();
+
+	device_guid = lookup_device_guid(xe);
+	if (device_guid) {
+		rhdr->platform_id      = *device_guid;
+		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
+	}
+}
+
+static void cper_init_section_desc(struct xe_device *xe, u8 severity,
+				   struct cper_section_descriptor *sdesc,
+				   u32 einfo_len)
+{
+	sdesc->section_offset   = sizeof(struct cper_record_header) +
+				  sizeof(struct cper_section_descriptor);
+	sdesc->section_length   = sizeof(struct xe_cper_intel_hdr) + einfo_len;
+	sdesc->revision         = CPER_SEC_REV;
+	sdesc->validation_bits  = 0;
+	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
+	sdesc->section_severity = severity;
+
+	if (xe->info.has_device_uid) {
+		memcpy(&sdesc->fru_id, &xe->device_uid, sizeof(xe->device_uid));
+		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
+	}
+}
+
+static void cper_record_emit(struct xe_device *xe, u8 severity,
+			     const guid_t *notification_type,
+			     const struct xe_cper_intel_hdr *ihdr,
+			     const void *einfo, u32 einfo_len)
+{
+	struct cper_section_descriptor *sdesc;
+	struct xe_cper_nonstd_record *rec;
+	struct cper_record_header *rhdr;
+	u32 total_len;
+
+	total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
+	rec = kzalloc(total_len, GFP_KERNEL);
+	if (!rec)
+		return;
+
+	rhdr = &rec->record_hdr;
+	sdesc = &rec->section_desc;
+
+	/* Assemble the CPER record header (UEFI Appendix N.2.1) */
+	cper_init_record_hdr(xe, severity, notification_type, rhdr, total_len);
+
+	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
+	cper_init_section_desc(xe, severity, sdesc, einfo_len);
+
+	/* Copy the Intel-specific section header */
+	rec->intel_hdr = *ihdr;
+
+	/* Append optional variable-length error info */
+	if (einfo && einfo_len)
+		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_len);
+
+	trace_xe_error_cper(xe, &rhdr->platform_id, &sdesc->fru_id, severity,
+			    &rec->intel_hdr, total_len, (u8 *)rec);
+
+	kfree(rec);
+}
+
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
+{
+	struct xe_cper_intel_hdr ihdr = {};
+
+	xe_assert(xe, is_hw_sigid(sigid));
+
+	cper_init_intel_hdr(xe, counter, response->timestamp,
+			    sigid, response->value, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
+}
+
+static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     const struct xe_ras_error_class *counter)
+{
+	struct xe_ras_get_counter_response response = {};
+
+	/* Fetching the counter sends a sysctrl command */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	if (xe_ras_get_counter_response(xe, counter, &response)) {
+		xe_err(xe, "CPER: failed to get counter, skipping record\n");
+		return;
+	}
+
+	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
+}
+
+/**
+ * xe_cper_emit() - Emit a CPER record for a SIGID log entry
+ * @xe: The &xe_device
+ * @cper_sev: CPER severity
+ * @sigid: Error signature identifier
+ * @component: Component identifier
+ * @location: Location details of the @component
+ * @data: Pointer to the additional details, or ERR_PTR, or NULL if not applicable
+ * @len: Length of the @data in bytes, or 0 if not applicable
+ * @vaf: Formatted log message
+ *
+ * Emit a CPER record for a SIGID log entry
+ *
+ * Example trace output::
+ *
+ *   xe_error_cper: dev=0000:03:00.0 severity=2
+ *     platform_id=9046afe5-9041-5124-8614-92550d9e9da6
+ *     fru_id=91befe38-2f61-3d7b-0000-000000000000
+ *     intel_hdr_raw=
+ *       01 02 00 18 00 00 00 01 00 00 00 00 64 77 51 14 ...
+ *     cper_len=1772
+ *     cper_raw=
+ *       43 50 45 52 00 01 ff ff ff ff 01 00 02 00 00 00 ...
+ */
+void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+		  u32 component, u32 location, const void *data, size_t len,
+		  struct va_format *vaf)
+{
+	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
+		cper_emit_hw_err(xe, cper_sev, sigid, data);
+		return;
+	}
+
+	/* TODO software CPER */
+}
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
new file mode 100644
index 000000000000..89fb8432f027
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_H_
+#define _XE_CPER_H_
+
+#include <linux/types.h>
+
+#include "abi/xe_sigid_abi.h"
+
+struct va_format;
+struct xe_device;
+struct xe_ras_error_class;
+struct xe_ras_get_counter_response;
+
+#if IS_ENABLED(CONFIG_UEFI_CPER)
+void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+		  u32 component, u32 location, const void *data, size_t len,
+		  struct va_format *vaf);
+void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			  const struct xe_ras_error_class *counter,
+			  const struct xe_ras_get_counter_response *response);
+int xe_cper_sysfs_init(struct xe_device *xe);
+#else
+static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+				u32 component, u32 location, const void *data, size_t len,
+				struct va_format *vaf) {}
+static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
+					enum xe_sigid sigid,
+					const struct xe_ras_error_class *counter,
+					const struct xe_ras_get_counter_response *response) {}
+static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
+#endif
+
+#endif /* _XE_CPER_H_ */
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
new file mode 100644
index 000000000000..68e30df0440e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_TYPES_H_
+#define _XE_CPER_TYPES_H_
+
+#include <linux/cper.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#include "xe_ras_types.h"
+
+/*
+ * Validation bits definition for validation_bits in struct
+ * xe_cper_intel_hdr. When set, corresponding fields in header
+ * contains valid data
+ */
+#define XE_CPER_VALID_LOCATION		0x0001
+#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
+#define XE_CPER_VALID_SIG_ID		0x0004
+#define XE_CPER_VALID_PCI_BDF		0x0008
+#define XE_CPER_VALID_DRV_VERSION	0x0010
+
+/*
+ * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
+ *
+ * All values below are generated deterministically by uuid generator.
+ * Do not hand-edit the byte values.
+ */
+
+/* Creator IDs */
+#define INTEL_CPER_CREATOR_XEKMD \
+	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
+		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
+
+/* Notification Types */
+#define INTEL_CPER_NOTIFY_GPU_ERROR \
+	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
+		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
+
+/* Section Types */
+#define INTEL_CPER_SECTION_ACCEL_GENERIC \
+	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
+		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
+
+/**
+ * struct xe_cper_intel_hdr - Intel-specific CPER header
+ *
+ * Fixed-size header for the Intel GPU error section of a CPER record.
+ * All multi-byte fields are little-endian.
+ */
+struct xe_cper_intel_hdr {
+	/** @counter: Error class (severity, component, location, cause) */
+	struct xe_ras_error_class counter;
+	/** @first_timestamp: First occurrence of this error class, in ticks */
+	u64 first_timestamp;
+	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
+	u32 sig_id;
+	/** @error_count: Number of times this error has been observed */
+	u32 error_count;
+	/** @validation_bits: Raw u16 view of all valid bits */
+	u16 validation_bits;
+	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
+	char pci_bdf[16];
+	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
+	char drv_version[25];
+	/** @reserved: Reserved for future use, must be zero */
+	u8 reserved[261];
+} __packed;
+
+/**
+ * struct xe_cper_nonstd_record - Intel GPU CPER record
+ *
+ * Contains the standard CPER record header, section descriptor, and the
+ * Intel error section header.
+ */
+struct xe_cper_nonstd_record {
+	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
+	struct cper_record_header record_hdr;
+	/** @section_desc: CPER section descriptor */
+	struct cper_section_descriptor section_desc;
+	/** @intel_hdr: Intel-specific CPER header */
+	struct xe_cper_intel_hdr intel_hdr;
+} __packed;
+
+/**
+ * struct xe_device_guid_entry - Mapping from PCI device ID to CPER device GUID
+ *
+ * Used to resolve the platform_id field in a CPER record header.
+ * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
+ * with name string "platform/8086:<dev_id_hex_lower>".
+ */
+struct xe_device_guid_entry {
+	/** @device_id: PCI device ID */
+	u16       device_id;
+	/** @guid: Corresponding UUIDv5 device GUID */
+	guid_t    guid;
+};
+
+/**
+ * struct xe_cper - Xe CPER state
+ */
+struct xe_cper {
+	/** @on_query: Emit a CPER record on each RAS counter query */
+	bool on_query;
+};
+
+#endif
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
 
diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
index 29eb16db3320..80e2b1724ceb 100644
--- a/drivers/gpu/drm/xe/xe_log.c
+++ b/drivers/gpu/drm/xe/xe_log.c
@@ -8,6 +8,7 @@
 
 #include "abi/xe_log_abi.h"
 
+#include "xe_cper.h"
 #include "xe_device.h"
 #include "xe_log.h"
 #include "xe_pci_types.h"
@@ -19,7 +20,9 @@ static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi
 {
 	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
 				   component, location, data, len, vaf);
-	/* TODO */
+
+	xe_cper_emit(xe_any_to_xe(pdev), cper_sev, sigid,
+		     component, location, data, len, vaf);
 }
 
 static const char *log_unknown_component_prefix(u32 component)
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index db3cbc186a51..2c01c183d02b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -3,9 +3,12 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bitfield.h>
+
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_configfs.h"
+#include "xe_cper.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
 #include "xe_drm_ras.h"
@@ -110,7 +113,8 @@ static const char * const gpu_health_states[] = {
 };
 static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
+		       u32 *value, bool emit_cper);
 
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
@@ -136,6 +140,20 @@ static u8 xe_to_drm_ras_severity(u8 severity)
 	}
 }
 
+static u8 ras_sev_to_cper_sev(u8 severity)
+{
+	switch (severity) {
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
 static u8 drm_to_xe_ras_component(u8 component)
 {
 	switch (component) {
@@ -172,6 +190,24 @@ static u8 xe_to_drm_ras_component(u8 component)
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
 static int ras_status_to_errno(u32 status)
 {
 	switch (status) {
@@ -192,6 +228,12 @@ static int ras_status_to_errno(u32 status)
 	}
 }
 
+static u16 ras_comp_to_log_comp(u8 component)
+{
+	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
+	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -534,7 +576,7 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	counter.common.severity = severity;
 	counter.common.component = component;
 
-	ret = get_counter(xe, &counter, &value);
+	ret = get_counter(xe, &counter, &value, false);
 	if (ret)
 		return;
 
@@ -544,13 +586,17 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
 	xe_drm_ras_event(xe, drm_component, drm_severity, value);
 }
 
-static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
+static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	u8 uncorr_type;
 
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
+	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+		    "Uncorrectable error detected, type %u\n", uncorr_type);
+
 	/* Request a reset if error is global */
 	if (uncorr_type == GLOBAL_UNCORR_ERROR)
 		return XE_RAS_RECOVERY_ACTION_RESET;
@@ -571,7 +617,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
+	u32 raw_source;
+
+	BUILD_BUG_ON(sizeof(raw_source) != sizeof(*source));
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -585,9 +633,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "CSC error detected: 0x%08x\n", csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
@@ -595,21 +642,26 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
 
 		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       ieh_error->global_error_status);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "PUNIT error detected: 0x%08x\n",
+					  ieh_error->global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
 	}
 
 	/* For other SoC internal errors, request a reset as recovery mechanism */
+	memcpy(&raw_source, source, sizeof(raw_source));
+	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
+		    &arr->counter, sizeof(arr->counter),
+		    "Unknown error detected: 0x%08x\n", raw_source);
 	return XE_RAS_RECOVERY_ACTION_RESET;
 }
 
 static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_memory_error *info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	int ret;
 
 	/*
@@ -621,17 +673,25 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	 */
 	switch (info->category) {
 	case XE_RAS_MEMORY_POISON:
-		xe_info(xe, "[RAS]: Poison error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Poison error detected\n");
 		break;
 	case XE_RAS_MEMORY_DATA_PARITY:
-		xe_info(xe, "[RAS]: Data parity error detected\n");
+		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+				 "Data parity error detected\n");
 		break;
 	case XE_RAS_MEMORY_DB_ECC:
 		ret = handle_page_offline(xe, info->sw_address, true);
+		xe_log_comp(xe, ret ? cper_sev : CPER_SEV_INFORMATIONAL,
+			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+			    "Double-bit ECC error detected at sw address 0x%llx\n",
+			    info->sw_address);
 		if (ret)
 			return XE_RAS_RECOVERY_ACTION_RESET;
 		break;
 	default:
+		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
+			    "Unknown error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
 	}
 
@@ -664,8 +724,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		if (!ras_counter_is_valid(xe, &errors[id]))
 			continue;
 
-		xe_warn(xe, "[RAS]: %s %s detected\n",
-			comp_to_str(component), sev_to_str(severity));
+		xe_log_from(xe, ras_sev_to_cper_sev(severity),
+			    ras_comp_to_hw_sigid(component),
+			    ras_comp_to_log_comp(component),
+			    &errors[id], sizeof(errors[id]),
+			    "error detected\n");
 
 		/* Send event once per component */
 		if (sent & BIT(component))
@@ -676,9 +739,37 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
+		       u32 *value, bool emit_cper)
 {
 	struct xe_ras_get_counter_response response = {0};
+	int ret;
+
+	ret = xe_ras_get_counter_response(xe, counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.value;
+	if (emit_cper)
+		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter->common.severity),
+				     ras_comp_to_hw_sigid(counter->common.component),
+				     counter, &response);
+	return 0;
+}
+
+/**
+ * xe_ras_get_counter_response() - Get error counter record
+ * @xe: Xe device instance
+ * @counter: RAS error class
+ * @response: Counter record retrieved
+ *
+ * Retrieve the counter record of a specific error class from firmware.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *response)
+{
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_error_common *common;
@@ -688,7 +779,7 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 	request.counter = *counter;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
-				  &request, sizeof(request), &response, sizeof(response));
+				  &request, sizeof(request), response, sizeof(*response));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
@@ -696,20 +787,19 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return ret;
 	}
 
-	if (rlen != sizeof(response)) {
+	if (rlen != sizeof(*response)) {
 		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
-		       rlen, sizeof(response));
+		       rlen, sizeof(*response));
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!ras_counter_is_valid(xe, &response->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &response->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
-	       sev_to_str(common->severity));
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
+	       comp_to_str(common->component), sev_to_str(common->severity));
 
 	return 0;
 }
@@ -791,7 +881,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
@@ -844,7 +934,7 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+	return get_counter(xe, &counter, value, READ_ONCE(xe->cper.on_query));
 }
 
 /**
@@ -1208,6 +1298,10 @@ int xe_ras_init(struct xe_device *xe)
 
 	xa_init(&state->offlined_pages);
 
+	ret = devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
+	if (ret)
+		return ret;
+
 	/* Fetch the offline list before queue to avoid duplication */
 	get_offline_list(xe);
 	get_offline_queue(xe);
@@ -1221,7 +1315,7 @@ int xe_ras_init(struct xe_device *xe)
 
 	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
 	if (ret)
-		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
+		return ret;
 
-	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
+	return xe_cper_sysfs_init(xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1b358c7d040f..c44fa172011f 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,5 +23,7 @@ int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *response);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_trace_cper.c b/drivers/gpu/drm/xe/xe_trace_cper.c
new file mode 100644
index 000000000000..caea8783ab7c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "xe_trace_cper.h"
+#endif
diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_trace_cper.h
new file mode 100644
index 000000000000..af952a6e168c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM xe
+
+#if !defined(_XE_TRACE_CPER_H_) || defined(TRACE_HEADER_MULTI_READ)
+#define _XE_TRACE_CPER_H_
+
+#include <linux/tracepoint.h>
+#include <linux/types.h>
+
+#include "xe_cper_types.h"
+#include "xe_device_types.h"
+
+#define __dev_name_xe(xe)	dev_name((xe)->drm.dev)
+
+TRACE_EVENT(xe_error_cper,
+	    TP_PROTO(struct xe_device *xe,
+		     const guid_t *platform_id, const guid_t *fru_id,
+		     const u8 severity,
+		     const struct xe_cper_intel_hdr *ihdr,
+		     u32 cper_len, const u8 *cper),
+	    TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
+
+	    TP_STRUCT__entry(
+		__string(dev, __dev_name_xe(xe))
+		__array(char, platform_id, UUID_SIZE)
+		__array(char, fru_id, UUID_SIZE)
+		__field(u8, sev)
+		__array(u8, ihdr_raw, sizeof(struct xe_cper_intel_hdr))
+		__field(u32, cper_len)
+		__dynamic_array(u8, cper, cper_len)
+	    ),
+
+	    TP_fast_assign(
+		__assign_str(dev);
+		__entry->sev = severity;
+		memcpy(__entry->platform_id, platform_id, UUID_SIZE);
+		memcpy(__entry->fru_id, fru_id, UUID_SIZE);
+		memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_intel_hdr));
+		__entry->cper_len = cper_len;
+		memcpy(__get_dynamic_array(cper), cper, cper_len);
+	    ),
+
+	    TP_printk("dev=%s severity=%d platform_id=%pUl fru_id=%pUl intel_hdr_raw=%s cper_len=%u cper_raw=%s",
+		      __get_str(dev), __entry->sev,
+		      __entry->platform_id, __entry->fru_id,
+		      __print_hex(__entry->ihdr_raw,
+				  sizeof(struct xe_cper_intel_hdr)),
+		      __entry->cper_len,
+		      __print_hex(__get_dynamic_array(cper),
+				  __entry->cper_len))
+);
+
+#endif
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
+#define TRACE_INCLUDE_FILE xe_trace_cper
+#include <trace/define_trace.h>
-- 
2.48.1

