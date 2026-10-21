Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D57606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E0UlEolR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B352D10FEAD;
	Wed, 21 Oct 2026 16:25:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E125110FEAD
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 16:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792599933; x=1824135933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saFy3eAGVgJM0zLe/WHd7jlfFbkLUP2DHmjHrKPOBRk=;
 b=E0UlEolRNLygdo8kfCerWCF7wP1uZ0Cd1PjalobDHakiZM+Ueiubd95J
 6IS8g/Hp5MGnPiTpv0dSyY2kZJNopQgzT5gKFHcxLbHxaKlkqVt0mhJ2K
 QmrKwdJoOtGwklAldAs5eiO7JZT5Ha2+eF8rbOAh6yGAeZKhAVIQxacAN
 alBjGKjPD2Jh9Gn+T5emTXsk1HVOJDgrqnJc1jLpds9HjCeMkAFZfhyWc
 xXf/QIO0R0EDgWF9jm+wPCKVDK9YDg8dIK29rWk9bC9GSDscrRDmoyY0M
 plBm8F0G6j09eoHUAbjtVRUqrOJ99XiRj45WAI7obDMbpfj5s945Bb3zu g==;
X-CSE-ConnectionGUID: fLLF2zPfSlOmaoQIvdINTw==
X-CSE-MsgGUID: lGdh2oBlSU+ywwmkIdOdAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1428265"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1428265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 09:25:33 -0700
X-CSE-ConnectionGUID: F+PsQcusTfi6POdgQVAvNQ==
X-CSE-MsgGUID: D8kgNcFsSM2O49L5HRE7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3468900"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 09:25:28 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 1/5] Add CPER logging support for CRI-Do not review
Date: Wed, 21 Oct 2026 21:55:09 +0530
Message-ID: <20261021162508.265700-8-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
 drivers/gpu/drm/xe/xe_cper.c                  | 530 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h                  |  37 ++
 drivers/gpu/drm/xe/xe_cper_types.h            | 185 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_log.c                   |   5 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 249 +++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
 drivers/gpu/drm/xe/xe_trace_cper.h            |  65 +++
 13 files changed, 1198 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-cper
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

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
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 10930c924070..5458119ddf40 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -168,6 +168,9 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
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
index 000000000000..0fedef06e138
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,530 @@
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
+static bool is_hw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
+}
+
+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+	/* 0x674D  platform/8086:674d */
+	{ 0x674D, GUID_INIT(0xf95911b8, 0x6564, 0x5905,
+			    0xa6, 0xa7, 0xb9, 0xbf, 0x54, 0xab, 0x6c, 0x27) },
+	/* 0x674E  platform/8086:674e */
+	{ 0x674E, GUID_INIT(0xb8d24106, 0x0108, 0x59f1,
+			    0x8f, 0xfc, 0x9f, 0xc4, 0xa9, 0xc9, 0xb7, 0xb0) },
+	/* 0x674F  platform/8086:674f */
+	{ 0x674F, GUID_INIT(0xdd8dd88e, 0xef2f, 0x59b1,
+			    0x99, 0x15, 0xdb, 0x6f, 0x1d, 0xc9, 0xb4, 0x5d) },
+	/* 0x6750  platform/8086:6750 */
+	{ 0x6750, GUID_INIT(0x1dd66c44, 0x87d5, 0x524a,
+			    0xad, 0x6e, 0xfc, 0x18, 0x9d, 0x42, 0x6f, 0x1a) },
+	/* 0x6751  platform/8086:6751 */
+	{ 0x6751, GUID_INIT(0x17d0dd04, 0x2fad, 0x5400,
+			    0x99, 0xc8, 0x9b, 0x45, 0x51, 0x3b, 0x67, 0xe3) },
+};
+
+static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
+		if (xe_platform_ids[i].device_id == pdev->device)
+			return &xe_platform_ids[i].platform_id;
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
+	p[3] = 0x1; /* precise time */
+	p[4] = bin2bcd(tm.tm_mday);
+	p[5] = bin2bcd(tm.tm_mon + 1);
+	p[6] = bin2bcd(year % 100);
+	p[7] = bin2bcd(year / 100);
+
+	return ts;
+}
+
+static void fill_cper_error_class(struct xe_cper_error_class *dst,
+				  const struct xe_ras_error_class *src)
+{
+	dst->error_type = src->common.severity;
+	dst->error_component = src->common.component;
+	dst->tile = src->product.unit.tile;
+	dst->instance = src->product.unit.instance;
+	dst->cause = src->product.cause.cause;
+}
+
+static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
+				       const struct xe_ras_error_class *error_class,
+				       u64 first_timestamp, u32 sig_id, u32 error_count,
+				       struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	fill_cper_error_class(&ihdr->error_class, error_class);
+	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
+
+	if (first_timestamp) {
+		ihdr->first_timestamp = first_timestamp;
+		ihdr->validation_bits |= XE_CPER_VALID_FIRST_TIMESTAMP;
+	}
+
+	if (sig_id != U32_MAX) {
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
+
+	/* TODO: fill fw_id and set XE_CPER_VALID_FW_ID */
+}
+
+static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
+				const guid_t *notification_type,
+				const struct xe_cper_sec_intel_err_hdr *ihdr,
+				const void *einfo, u32 einfo_len)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	const guid_t *platform_id = lookup_platform_id(pdev);
+	u32 total_len = sizeof(struct xe_cper_nonstd_record) + einfo_len;
+	struct cper_section_descriptor *sdesc;
+	struct cper_record_header *rhdr;
+	struct xe_cper_nonstd_record *rec;
+
+	rec = kzalloc(total_len, GFP_KERNEL);
+	if (!rec)
+		return;
+
+	rhdr = &rec->record_hdr;
+	sdesc = &rec->section_desc;
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
+	if (platform_id) {
+		rhdr->platform_id      = *platform_id;
+		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
+	}
+	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
+	rhdr->notification_type = *notification_type;
+	rhdr->record_id         = cper_next_record_id();
+
+	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
+	sdesc->section_offset   = sizeof(struct cper_record_header) +
+				  sizeof(struct cper_section_descriptor);
+	sdesc->section_length   = sizeof(struct xe_cper_sec_intel_err_hdr) + einfo_len;
+	sdesc->revision         = CPER_SEC_REV;
+	sdesc->validation_bits  = 0;
+	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
+	if (xe->info.has_device_uid) {
+		memcpy(&sdesc->fru_id, &xe->device_uid, sizeof(xe->device_uid));
+		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
+	}
+	sdesc->section_severity = severity;
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
+/* Entries built from RAS error logs carry fixed-size error_details */
+#define XE_CPER_RAS_LOG_ENTRY_SIZE \
+	(offsetof(struct xe_intel_priv_event_entry, metadata) + \
+	 sizeof_field(struct xe_ras_error_log, error_details))
+
+static struct xe_cper_sec_intel_error_info *
+build_einfo(const struct xe_ras_error_log *logs, u32 num_logs,
+	    const struct xe_ras_error_class *ec, u32 error_count)
+{
+	u32 queue_len = num_logs * XE_CPER_RAS_LOG_ENTRY_SIZE;
+	struct xe_cper_sec_intel_error_info *einfo;
+	struct xe_intel_priv_event_entry *entry;
+	u32 i;
+
+	einfo = kzalloc_flex(*einfo, event_queue, queue_len);
+	if (!einfo)
+		return NULL;
+
+	einfo->error_count        = error_count;
+	einfo->event_queue_length = queue_len;
+	einfo->event_queue_count  = num_logs;
+	fill_cper_error_class(&einfo->error_class, ec);
+
+	entry = (struct xe_intel_priv_event_entry *)einfo->event_queue;
+	for (i = 0; i < num_logs; i++) {
+		entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);
+		entry->timestamp    = logs[i].timestamp;
+		memcpy(entry->metadata, logs[i].error_details, sizeof(logs[i].error_details));
+		entry = (void *)entry + XE_CPER_RAS_LOG_ENTRY_SIZE;
+	}
+
+	return einfo;
+}
+
+static void free_einfo_arr(struct xe_cper_einfo_entry *einfo_arr, u32 count)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++)
+		kfree(einfo_arr[i].einfo);
+	kfree(einfo_arr);
+}
+
+static bool fill_einfo_entry(struct xe_cper_einfo_entry *entry,
+			     const struct xe_ras_info_queue_dynamic_counter_hdr *hdr,
+			     const struct xe_ras_error_log *logs, u32 num_logs)
+{
+	entry->einfo = build_einfo(logs, num_logs, &hdr->error_class, hdr->counter);
+	if (!entry->einfo)
+		return false;
+
+	entry->einfo_size = struct_size(entry->einfo, event_queue,
+					entry->einfo->event_queue_length);
+	/* The first log is the first occurrence of the error */
+	entry->timestamp = logs[0].timestamp;
+	entry->hdr = *hdr;
+	return true;
+}
+
+static u32 build_detail_einfo(const struct xe_ras_error_class *error_class, u32 error_count,
+			      const struct xe_ras_error_log *logs, u32 num_logs,
+			      struct xe_cper_einfo_entry *einfo_arr)
+{
+	/* All logs belong to the queried class; the error count may exceed the logs kept */
+	const struct xe_ras_info_queue_dynamic_counter_hdr hdr = {
+		.error_class = *error_class,
+		.counter = error_count,
+	};
+
+	if (!num_logs)
+		return 0;
+
+	return fill_einfo_entry(&einfo_arr[0], &hdr, logs, num_logs) ? 1 : 0;
+}
+
+static u32 build_aggregate_einfo(struct xe_device *xe,
+				 const struct xe_ras_info_queue_dynamic_counter_hdr *hdrs,
+				 u32 num_hdrs, const struct xe_ras_error_log *logs,
+				 u32 avail_logs, struct xe_cper_einfo_entry *einfo_arr)
+{
+	u32 log_offset = 0, count = 0, i;
+
+	for (i = 0; i < num_hdrs; i++) {
+		/* @counter is the error count; firmware logs at most XE_RAS_NUM_COUNTERS */
+		u32 num_logs = min_t(u32, hdrs[i].counter, XE_RAS_NUM_COUNTERS);
+
+		if (num_logs > avail_logs - log_offset) {
+			xe_warn(xe, "CPER: header[%u] claims %u logs but only %u remain\n",
+				i, num_logs, avail_logs - log_offset);
+			break;
+		}
+
+		if (!num_logs)
+			continue;
+
+		if (!fill_einfo_entry(&einfo_arr[count], &hdrs[i], &logs[log_offset], num_logs))
+			break;
+
+		log_offset += num_logs;
+		count++;
+	}
+
+	return count;
+}
+
+/**
+ * xe_prepare_cper_error_info() - Build the CPER error info records from RAS info queue data
+ * @xe: xe device instance
+ * @counter_resp: counter response containing the first embedded chunk
+ * @error_class: RAS error class used to populate the einfo error_class fields
+ * @count_out: output number of entries in the returned array
+ *
+ * Assembles the complete raw info queue data from the first chunk already
+ * embedded in @counter_resp and any additional chunks fetched via
+ * GET_INFO_QUEUE.  Two use cases are supported based on num_headers in
+ * the info queue header:
+ *
+ * Detail error counter (num_headers == 0)::
+ *
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_einfo_entry covering all N logs.
+ *
+ * Aggregate error counter (num_headers > 0)::
+ *
+ *   [xe_ras_info_queue_dynamic_counter_hdr * num_headers]
+ *   [xe_ras_error_log * N]
+ *
+ *   Returns one xe_cper_einfo_entry per header.  Each header's @counter field
+ *   is the error count of its class; at most XE_RAS_NUM_COUNTERS
+ *   xe_ras_error_log entries follow it and its @error_class is used to
+ *   populate the entry's einfo->error_class.
+ *
+ * Returns: allocated xe_cper_einfo_entry array on success (caller must free it
+ *          with free_einfo_arr()), NULL if no error info could be built.
+ *          @count_out is set to the number of entries in the array.
+ */
+static struct xe_cper_einfo_entry *
+xe_prepare_cper_error_info(struct xe_device *xe,
+			   const struct xe_ras_get_counter_response *counter_resp,
+			   const struct xe_ras_error_class *error_class,
+			   u32 *count_out)
+{
+	const struct xe_ras_info_queue_header *first_qhdr = &counter_resp->first.header;
+	struct xe_cper_einfo_entry *einfo_arr = NULL;
+	const struct xe_ras_error_log *logs;
+	u32 buf_size, raw_total, num_headers, headers_size;
+	u32 avail_logs, count = 0;
+	u8 *raw_buf = NULL;
+
+	if (!first_qhdr->total_size) {
+		xe_warn(xe, "CPER: info queue reports zero total size\n");
+		goto out;
+	}
+
+	buf_size = min(first_qhdr->total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+	raw_buf = kzalloc_objs(*raw_buf, buf_size);
+	if (!raw_buf)
+		goto out;
+
+	raw_total = xe_ras_drain_info_queue_raw(xe, counter_resp, raw_buf, buf_size);
+	if (!raw_total)
+		goto out;
+
+	num_headers = first_qhdr->num_headers;
+	headers_size = num_headers * sizeof(struct xe_ras_info_queue_dynamic_counter_hdr);
+	if (headers_size > raw_total) {
+		xe_warn(xe, "CPER: aggregate headers size (%u) exceeds raw total (%u)\n",
+			headers_size, raw_total);
+		goto out;
+	}
+
+	logs = (const struct xe_ras_error_log *)(raw_buf + headers_size);
+	avail_logs = (raw_total - headers_size) / sizeof(*logs);
+
+	einfo_arr = kzalloc_objs(*einfo_arr, num_headers ?: 1);
+	if (!einfo_arr)
+		goto out;
+
+	if (num_headers)
+		count = build_aggregate_einfo(xe, (const void *)raw_buf, num_headers,
+					      logs, avail_logs, einfo_arr);
+	else
+		count = build_detail_einfo(error_class, counter_resp->value,
+					   logs, avail_logs, einfo_arr);
+
+	if (!count) {
+		kfree(einfo_arr);
+		einfo_arr = NULL;
+	}
+out:
+	kfree(raw_buf);
+	*count_out = count;
+	return einfo_arr;
+}
+
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
+{
+	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
+	struct xe_cper_einfo_entry single = {};
+	u32 einfo_count = 0, count, i;
+
+	if (!is_hw_sigid(sigid))
+		return;
+
+	/* Draining the info queue sends sysctrl commands */
+	might_sleep();
+	xe_device_assert_mem_access(xe);
+
+	/* Without info queue data, emit a single record from the counter itself */
+	single.hdr.error_class = *error_class;
+	single.hdr.counter = resp->value;
+	single.timestamp = resp->timestamp;
+	entries = &single;
+	count = 1;
+
+	if (resp->has_info_queue) {
+		einfo_arr = xe_prepare_cper_error_info(xe, resp, error_class, &einfo_count);
+		if (einfo_arr) {
+			entries = einfo_arr;
+			count = einfo_count;
+		} else {
+			xe_warn(xe, "CPER: failed to build error info from info queue, emitting record without it\n");
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		struct xe_cper_sec_intel_err_hdr ihdr = {};
+
+		xe_cper_init_intel_err_hdr(xe, &entries[i].hdr.error_class, entries[i].timestamp,
+					   sigid, entries[i].hdr.counter, &ihdr);
+
+		xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr,
+				    entries[i].einfo, entries[i].einfo_size);
+	}
+
+	free_einfo_arr(einfo_arr, einfo_count);
+}
+
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
+ */
+void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+		  u32 component, u32 location, const void *data, size_t len,
+		  struct va_format *vaf)
+{
+	if (!xe)
+		return;
+
+	if (is_hw_sigid(sigid)) {
+		if (!IS_ERR_OR_NULL(data) && len == sizeof(struct xe_ras_error_class))
+			xe_cper_emit_hw_err(xe, cper_sev, sigid, data);
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
index 000000000000..ad50349c0a6f
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
+			  const struct xe_ras_error_class *error_class,
+			  const struct xe_ras_get_counter_response *resp);
+int xe_cper_sysfs_init(struct xe_device *xe);
+#else
+static inline void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+				u32 component, u32 location, const void *data, size_t len,
+				struct va_format *vaf) {}
+static inline void xe_cper_emit_counter(struct xe_device *xe, int cper_sev,
+					enum xe_sigid sigid,
+					const struct xe_ras_error_class *error_class,
+					const struct xe_ras_get_counter_response *resp) {}
+static inline int xe_cper_sysfs_init(struct xe_device *xe) { return 0; }
+#endif
+
+#endif /* _XE_CPER_H_ */
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
new file mode 100644
index 000000000000..e0034429e661
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -0,0 +1,185 @@
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
+ * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
+ * contains valid data
+ */
+#define XE_CPER_VALID_LOCATION		0x0001
+#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
+#define XE_CPER_VALID_SIG_ID		0x0004
+#define XE_CPER_VALID_PCI_BDF		0x0008
+#define XE_CPER_VALID_DRV_VERSION	0x0010
+#define XE_CPER_VALID_FW_ID		0x0020
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
+#pragma pack(push, 1)
+
+/**
+ * struct xe_cper_error_class - Intel GPU CPER error classification
+ */
+struct xe_cper_error_class {
+	/** @error_type: RAS error severity */
+	u8  error_type;
+	/** @error_component: IP block that raised the error */
+	u8  error_component;
+	/** @tile: Tile number */
+	u8  tile;
+	/** @instance: Instance within the tile */
+	u32 instance;
+	/** @cause: Error cause code */
+	u32 cause;
+	/** @reserved: Reserved, must be zero */
+	u8  reserved;
+};
+
+/**
+ * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
+ *
+ * Fixed-size header for the Intel GPU error section of a CPER record.
+ * All multi-byte fields are little-endian; the structure is packed.
+ */
+struct xe_cper_sec_intel_err_hdr {
+	/** @error_class: Error classification (type, component, location, cause) */
+	struct xe_cper_error_class error_class;
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
+	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
+	char fw_id[256];
+	/** @reserved: Reserved for future use, must be zero */
+	u8 reserved[5];
+};
+
+/**
+ * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
+ *
+ * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
+ * is available. The @event_queue flexible array holds @event_queue_count
+ * packed &xe_intel_priv_event_entry records.
+ */
+struct xe_cper_sec_intel_error_info {
+	/** @error_class: Error classification */
+	struct xe_cper_error_class error_class;
+	/** @error_count: Total number of errors recorded */
+	u32 error_count;
+	/** @event_queue_length: Total byte size of the @event_queue array */
+	u32 event_queue_length;
+	/** @event_queue_count: Number of entries in @event_queue */
+	u32 event_queue_count;
+	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
+	u8 event_queue[];
+};
+
+/**
+ * struct xe_intel_priv_event_entry - Single error event in the event queue
+ *
+ * Each entry is variable-length; @entry_length gives the byte size of
+ * @metadata only (not including @entry_length or @timestamp).
+ */
+struct xe_intel_priv_event_entry {
+	/** @entry_length: Byte length of the @metadata payload */
+	u32 entry_length;
+	/** @timestamp: Timestamp of this event, in firmware ticks */
+	u64 timestamp;
+	/** @metadata: Event-specific payload bytes */
+	u8  metadata[];
+};
+
+/**
+ * struct xe_cper_nonstd_record - Intel GPU CPER record
+ *
+ * Contains the standard CPER record header, section descriptor, and the
+ * Intel error section header. A &xe_cper_sec_intel_error_info payload
+ * may be appended dynamically.
+ */
+struct xe_cper_nonstd_record {
+	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
+	struct cper_record_header record_hdr;
+	/** @section_desc: CPER section descriptor */
+	struct cper_section_descriptor section_desc;
+	/** @intel_hdr: Intel-specific error section header */
+	struct xe_cper_sec_intel_err_hdr intel_hdr;
+};
+
+#pragma pack(pop)
+
+/**
+ * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
+ *
+ * Used to resolve the platform_id field in a CPER section descriptor.
+ * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
+ * with name string "platform/8086:<dev_id_hex_lower>".
+ */
+struct xe_platform_id_entry {
+	/** @device_id: PCI device ID */
+	u16       device_id;
+	/** @platform_id: Corresponding UUIDv5 platform GUID */
+	guid_t    platform_id;
+};
+
+/**
+ * struct xe_cper_einfo_entry - One CPER error info payload and its source counter
+ */
+struct xe_cper_einfo_entry {
+	/** @hdr: Error class and counter value used for the CPER section header */
+	struct xe_ras_info_queue_dynamic_counter_hdr hdr;
+	/** @einfo: Allocated error info payload, NULL if none */
+	struct xe_cper_sec_intel_error_info *einfo;
+	/** @einfo_size: Byte size of @einfo including the event queue */
+	u32 einfo_size;
+	/** @timestamp: Timestamp of the first occurrence of this error class */
+	u64 timestamp;
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
index aa3a98ddb457..cd93142c68ba 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
 
+#include "xe_cper_types.h"
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
 #include "xe_heci_gsc.h"
@@ -590,6 +591,9 @@ struct xe_device {
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
index 9c15ce8f0b6a..afd41b7e9e86 100644
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
@@ -109,8 +112,6 @@ static const char * const gpu_health_states[] = {
 };
 static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
-
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
 	switch (severity) {
@@ -191,6 +192,44 @@ static int ras_status_to_errno(u32 status)
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
+static u16 ras_comp_to_log_comp(u8 component)
+{
+	return FIELD_PREP(XE_LOG_COMPONENT_CLASS_MASK, XE_LOG_COMPONENT_CLASS_HARDWARE) |
+	       FIELD_PREP(XE_LOG_COMPONENT_TYPE_MASK, component);
+}
+
 static inline const char *sev_to_str(u8 severity)
 {
 	if (severity >= XE_RAS_SEV_MAX)
@@ -526,38 +565,44 @@ static void ras_usp_aer_init(struct xe_device *xe)
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
 	u8 drm_severity, drm_component;
-	u32 value;
 	int ret;
 
 	counter.common.severity = severity;
 	counter.common.component = component;
 
-	ret = get_counter(xe, &counter, &value);
+	ret = xe_ras_get_counter_response(xe, &counter, &response);
 	if (ret)
 		return;
 
 	drm_severity = xe_to_drm_ras_severity(severity);
 	drm_component = xe_to_drm_ras_component(component);
 
-	xe_drm_ras_event(xe, drm_component, drm_severity, value);
+	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
 }
 
-static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
+static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_compute_error *error_info = (void *)arr->details;
+	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
 	u8 uncorr_type;
 
 	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
 
 	/* Request a reset if error is global */
-	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
+		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+			    "Global uncorrectable error detected\n");
 		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
 
 	/*
 	 * No action needed for other errors.
 	 * Local errors are recovered using an engine reset by GuC.
 	 */
+	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
+		    "Other compute errors\n");
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
@@ -571,7 +616,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 {
 	struct xe_ras_soc_error *info = (void *)arr->details;
 	struct xe_ras_soc_error_source *source = &info->source;
-	struct xe_ras_error_class *counter = &arr->counter;
 
 	if (source->csc) {
 		struct xe_ras_csc_error *csc_error = (void *)info->details;
@@ -585,9 +629,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
@@ -595,9 +638,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
 
 		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
-			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       ieh_error->global_error_status);
+			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
+					  "PUNIT error detected: 0x%x\n",
+					  ieh_error->global_error_status);
 			punit_error_handler(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
@@ -621,10 +664,12 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
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
@@ -664,8 +709,11 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
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
@@ -676,19 +724,30 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+/**
+ * xe_ras_get_counter_response() - Get error counter record
+ * @xe: Xe device instance
+ * @counter: RAS error class
+ * @out: Counter record retrieved
+ *
+ * Retrieve the counter record of a specific error class from firmware.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *out)
 {
-	struct xe_ras_get_counter_response response = {0};
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_error_common *common;
 	size_t rlen;
 	int ret;
 
+	memset(out, 0, sizeof(*out));
 	request.counter = *counter;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
-				  &request, sizeof(request), &response, sizeof(response));
+				  &request, sizeof(request), out, sizeof(*out));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
@@ -696,19 +755,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return ret;
 	}
 
-	if (rlen != sizeof(response)) {
+	if (rlen != sizeof(*out)) {
 		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
-		       rlen, sizeof(response));
+		       rlen, sizeof(*out));
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!ras_counter_is_valid(xe, &out->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &out->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
 	       sev_to_str(common->severity));
 
 	return 0;
@@ -791,7 +849,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 
 			switch (component) {
 			case XE_RAS_COMP_CORE_COMPUTE:
-				action = handle_core_compute_errors(arr);
+				action = handle_core_compute_errors(xe, arr);
 				break;
 			case XE_RAS_COMP_SOC_INTERNAL:
 				action = handle_soc_internal_errors(xe, arr);
@@ -839,12 +897,24 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
+	int ret;
 
 	counter.common.severity = drm_to_xe_ras_severity(severity);
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+	ret = xe_ras_get_counter_response(xe, &counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.value;
+
+	if (READ_ONCE(xe->cper.on_query))
+		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter.common.severity),
+				     ras_comp_to_hw_sigid(counter.common.component),
+				     &counter, &response);
+	return 0;
 }
 
 /**
@@ -1016,6 +1086,123 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 	return 0;
 }
 
+static int get_info_queue_data(struct xe_device *xe,
+			       struct xe_ras_get_info_queue_request *req,
+			       struct xe_ras_get_info_queue_response *out)
+{
+	struct xe_ras_get_info_queue_response response = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_info_queue_header *hdr;
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
+				  req, sizeof(*req), &response, sizeof(response));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to get info queue data %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "sysctrl: unexpected get info queue data response length %zu (expected %zu)\n",
+		       rlen, sizeof(response));
+		return -EIO;
+	}
+
+	hdr = &response.queue_response.header;
+	xe_dbg(xe, "[RAS]: info queue data: status=%u chunk_size=%u flags=0x%x\n",
+	       response.operation_status, hdr->chunk_size, hdr->flags);
+
+	*out = response;
+	return 0;
+}
+
+static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
+			   u32 expected_offset, u32 dest_size)
+{
+	u32 end;
+
+	return hdr->chunk_offset == expected_offset &&
+	       hdr->chunk_size && hdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
+	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
+	       end <= XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE && end <= dest_size;
+}
+
+/**
+ * xe_ras_drain_info_queue_raw() - Drain the full RAS info queue into a flat buffer
+ * @xe: xe device
+ * @counter_resp: counter response carrying the first embedded chunk and the
+ *                counter identifier used as the source context for subsequent
+ *                GET_INFO_QUEUE fetches
+ * @dest_buf: destination buffer supplied by the caller
+ * @dest_size: size of @dest_buf in bytes; also caps the total amount of data
+ *             assembled from the info queue
+ *
+ * Copies the first chunk already embedded in @counter_resp, then loops
+ * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
+ * signals no more data or a transport/bounds error is encountered.  On
+ * transport or bounds errors the function stops and returns whatever has
+ * been assembled so far.
+ *
+ * Returns: number of valid bytes written into @dest_buf.  Zero if @dest_buf is
+ *          NULL or @dest_size is 0.
+ */
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size)
+{
+	const struct xe_ras_info_queue_header *first_hdr = &counter_resp->first.header;
+	struct xe_ras_get_info_queue_request req = {0};
+	struct xe_ras_get_info_queue_response resp;
+	u32 flags = first_hdr->flags;
+	u32 offset = 0;
+
+	if (!dest_buf || !dest_size)
+		return 0;
+
+	if (first_hdr->total_size > dest_size)
+		xe_warn(xe, "[RAS]: info queue size %u exceeds %u, truncating\n",
+			first_hdr->total_size, dest_size);
+
+	/* Copy first chunk already embedded in the counter response */
+	if (chunk_is_valid(first_hdr, offset, dest_size)) {
+		memcpy(dest_buf, counter_resp->first.data, first_hdr->chunk_size);
+		offset = first_hdr->chunk_size;
+	}
+
+	req.source_command = XE_SYSCTRL_CMD_GET_COUNTER;
+	req.source_context = counter_resp->counter;
+	req.queue_request.session_id = counter_resp->counter;
+
+	/* Fetch any remaining chunks */
+	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
+		const struct xe_ras_info_queue_header *hdr = &resp.queue_response.header;
+
+		req.queue_request.offset = offset;
+		req.queue_request.size = min(XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
+
+		if (get_info_queue_data(xe, &req, &resp)) {
+			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u failed\n",
+			       offset);
+			return offset;
+		}
+
+		if (!chunk_is_valid(hdr, offset, dest_size)) {
+			xe_warn(xe, "[RAS]: invalid info queue chunk (offset=%u size=%u, expected offset=%u)\n",
+				hdr->chunk_offset, hdr->chunk_size, offset);
+			return offset;
+		}
+
+		memcpy(dest_buf + offset, resp.queue_response.data, hdr->chunk_size);
+		offset += hdr->chunk_size;
+		flags = hdr->flags;
+	}
+
+	return min(offset, first_hdr->total_size);
+}
+
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
@@ -1216,5 +1403,9 @@ int xe_ras_init(struct xe_device *xe)
 	if (ret)
 		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
 
+	ret = xe_cper_sysfs_init(xe);
+	if (ret)
+		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
+
 	return devm_add_action_or_reset(xe->drm.dev, ras_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 1b358c7d040f..ccb79f2c2844 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -23,5 +23,10 @@ int xe_ras_init(struct xe_device *xe);
 enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
+int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
+				struct xe_ras_get_counter_response *out);
+u32 xe_ras_drain_info_queue_raw(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index a86f9d2b8c92..85602efa5b01 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -19,6 +19,10 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
+
 /**
  * enum xe_ras_page_action - Page offline actions for page offline request
  *
@@ -110,6 +114,110 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
+ *
+ * Provides chunk metadata for commands that support extended info queue
+ * functionality. Used when the total data exceeds a single mailbox response.
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of the complete info queue data in bytes */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within the total data in bytes */
+	u32 chunk_offset;
+	/** @chunk_size: Size of the data in this chunk in bytes */
+	u32 chunk_size;
+	/** @reserved0: Reserved for future use */
+	u32 reserved0;
+	/** @flags: Info queue control flags (XE_RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:4;
+	/** @num_headers: Number of detailed counter headers at start of the data */
+	u32 num_headers:5;
+	/** @reserved2: Reserved for future use */
+	u32 reserved2:15;
+	/** @checksum: CRC32 checksum of this chunk data */
+	u32 checksum;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_data_request {
+	/** @offset: Byte offset of the requested data chunk */
+	u32 offset;
+	/** @size: Maximum size of the requested chunk in bytes */
+	u32 size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_data_response {
+	/** @header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header header;
+	/** @data: Info queue data for this chunk */
+	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_dynamic_counter_hdr - Aggregate counter header entry
+ *
+ * When a session requests aggregate counter data, one header per matching
+ * dynamic counter class is prepended to the queue data. The @counter field
+ * is the error count of this class; at most XE_RAS_NUM_COUNTERS error log
+ * entries follow for it.
+ */
+struct xe_ras_info_queue_dynamic_counter_hdr {
+	/** @error_class: Error class associated with this counter group */
+	struct xe_ras_error_class error_class;
+	/** @counter: Error count of this class */
+	u32 counter;
+} __packed;
+
+/**
+ * struct xe_ras_error_log - Single error log entry following dynamic counter headers
+ */
+struct xe_ras_error_log {
+	/** @timestamp: Timestamp when the error was recorded */
+	u64 timestamp;
+	/** @error_details: Error-specific details */
+	u32 error_details[16];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_request {
+	/** @queue_request: Info queue request parameters */
+	struct xe_ras_info_queue_data_request queue_request;
+	/** @source_command: Original command that generated the info queue */
+	u32 source_command;
+	/** @source_context: Context from original command, if applicable */
+	struct xe_ras_error_class source_context;
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_response {
+	/** @operation_status: Status of the retrieval operation */
+	u32 operation_status;
+	/** @queue_response: Info queue data chunk */
+	struct xe_ras_info_queue_data_response queue_response;
+} __packed;
+
 /**
  * struct xe_ras_get_counter_request - Request structure for get counter
  */
@@ -132,8 +240,14 @@ struct xe_ras_get_counter_response {
 	u64 timestamp;
 	/** @threshold: Threshold value for the counter */
 	u32 threshold;
-	/** @reserved: Reserved  */
-	u32 reserved[57];
+	/** @reserved: Reserved for future use */
+	u32 reserved:9;
+	/** @has_info_queue: Set if info queue is available */
+	u32 has_info_queue:1;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:22;
+	/** @first: First info queue chunk, if @has_info_queue is set */
+	struct xe_ras_info_queue_data_response first;
 } __packed;
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 1f3f782d770e..9188457ef7ae 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -37,6 +37,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
 };
 
 /**
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
index 000000000000..76e53ec6a673
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
+	TP_PROTO(struct xe_device *xe,
+		 const guid_t *platform_id, const guid_t *fru_id,
+		 const u8 severity,
+		 const struct xe_cper_sec_intel_err_hdr *ihdr,
+		 u32 cper_len, const u8 *cper),
+	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
+
+	TP_STRUCT__entry(
+	    __string(dev, __dev_name_xe(xe))
+	    __array(char, platform_id, UUID_SIZE)
+	    __array(char, fru_id, UUID_SIZE)
+	    __field(u8, sev)
+	    __array(u8, ihdr_raw, sizeof(struct xe_cper_sec_intel_err_hdr))
+	    __field(u32, cper_len)
+	    __dynamic_array(u8, cper, cper_len)
+	    ),
+
+	TP_fast_assign(
+	    __assign_str(dev);
+	    __entry->sev = severity;
+	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
+	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
+	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err_hdr));
+	    __entry->cper_len = cper_len;
+	    memcpy(__get_dynamic_array(cper), cper, cper_len);
+	    ),
+
+	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
+		  __get_str(dev), __entry->sev,
+		  __entry->platform_id, __entry->fru_id,
+		  __print_hex(__entry->ihdr_raw,
+			      sizeof(struct xe_cper_sec_intel_err_hdr)),
+		  __entry->cper_len,
+		  __print_hex(__get_dynamic_array(cper),
+			      __entry->cper_len))
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

