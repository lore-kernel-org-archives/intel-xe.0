Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E81C43327
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:03:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B641D10F2CA;
	Thu,  2 Jul 2026 11:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1888LWY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4310F2CA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990183; x=1814526183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rpA6yaQ8QVAVuk2jyqk75VomFNMHPHUHKtzN9rI+lao=;
 b=D1888LWYy6qBRyU/NvdSepvf5jGr02zoLl6gMzcuYrwzM22qJXSe1IMR
 wjAFYjrB8bctzo8WCqNBvSNkIpPuUvp38Dvih2P09MOKM6AuWvRrkYxi9
 CCKLwdOaStAQPaGL7G2CcbB9iZdTMYjK5gj5BskbkUzUC6luuAcwk6c44
 JbtDH0dn2FJ+HdJmTV4S3wh6tDTZjqEOv5Xn3HamTNUXPU8WSIbKHiKOZ
 z3wW7hIlfrAWeHZW0EhFal13F1Ds3OyLm1mJKLR7kklrAdMYlV8xFUwCT
 K8/A3R0afVQG8yipRbIaXb+TIPfFbVj9oAQeKBOBFmNdFHmxOhvGJmHaM g==;
X-CSE-ConnectionGUID: O9TiifhNTn6nsVn8feombw==
X-CSE-MsgGUID: mujmHgRVSHS2fbw9PCVBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852898"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852898"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:02 -0700
X-CSE-ConnectionGUID: WrD5Ept7TaOdonrbpShZYw==
X-CSE-MsgGUID: f/YmrangRpi1Bjr/GOkL4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738795"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:03:00 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 5/7] drm/xe/cper: APIs to prepare and log CPER record
Date: Thu,  2 Jul 2026 16:44:07 +0530
Message-ID: <20260702111401.3680214-14-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add APIs to initialize Intel-specific CPER metadata, build a
non-standard CPER record, and emit it via the xe_error_cper tracepoint.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/Makefile  |   1 +
 drivers/gpu/drm/xe/xe_cper.c | 215 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h |  30 +++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 01e6711cce1c..37600de21a35 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -35,6 +35,7 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_cper.o \
 	xe_dep_scheduler.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
new file mode 100644
index 000000000000..b46190601d98
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/cper.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <drm/drm_print.h>
+
+#include "xe_cper.h"
+#include "xe_cper_types.h"
+#include "xe_device_types.h"
+#include "xe_ras_types.h"
+#include "xe_trace_cper.h"
+
+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+};
+
+/**
+ * fill_pci_bdf - populate pci_bdf in the Intel section header
+ * @xe: xe device instance
+ * @ihdr: Intel section header to update
+ *
+ * Writes the PCI domain:bus:device.function string into @ihdr->pci_bdf and
+ * sets the corresponding valid bit.
+ */
+static void fill_pci_bdf(struct xe_device *xe,
+			  struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	snprintf(ihdr->pci_bdf, sizeof(ihdr->pci_bdf), "%04x:%02x:%02x.%x",
+		 pci_domain_nr(pdev->bus), pdev->bus->number,
+		 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+	ihdr->valid_bits.pci_bdf = 1;
+}
+
+/**
+ * fill_drv_version - populate drv_version in the Intel section header
+ * @ihdr: Intel section header to update
+ *
+ * Copies the module's srcversion string into @ihdr->drv_version and sets the
+ * corresponding valid bit.
+ */
+static void fill_drv_version(struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	if (!THIS_MODULE->srcversion)
+		return;
+
+	strscpy(ihdr->drv_version, THIS_MODULE->srcversion,
+		sizeof(ihdr->drv_version));
+	ihdr->valid_bits.drv_version = 1;
+}
+
+/**
+ * lookup_platform_id - find the UUIDv5 platform_id for a PCI device ID
+ * @pdev: PCI device whose device ID is used as the lookup key
+ *
+ * Searches xe_platform_ids[] for an entry matching @pdev->device.
+ *
+ * Returns a pointer to the matching guid_t, or %NULL if not found.
+ */
+static const guid_t *lookup_platform_id(const struct pci_dev *pdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(xe_platform_ids); i++)
+		if (xe_platform_ids[i].device_id == pdev->device)
+			return &xe_platform_ids[i].platform_id;
+	return NULL;
+}
+
+static void fill_fw_id(struct xe_device *xe,
+			struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	/* TODO: populate ihdr->fw_id from firmware version queries */
+}
+
+/**
+ * xe_cper_init_intel_err_hdr - Populate an Intel CPER section header
+ * @xe: xe device instance
+ * @location: 12-byte error classification blob (cast from the source
+ *            error class struct); pass %NULL if not applicable
+ * @first_timestamp: timestamp of the first occurrence; pass 0 if not available
+ * @sig_id: signal identifier for the error; pass %U32_MAX if not applicable
+ * @error_count: number of times this error has occurred
+ * @ihdr: Intel section header to populate
+ *
+ * Fills in @ihdr with the provided error metadata and sets the corresponding
+ * valid bits.
+ */
+void xe_cper_init_intel_err_hdr(struct xe_device *xe,
+				       const u8 location[12],
+				       u64 first_timestamp,
+				       u32 sig_id,
+				       u64 error_count,
+				       struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	if (location) {
+		memcpy(&ihdr->error_class, location, sizeof(ihdr->error_class));
+		ihdr->valid_bits.location = 1;
+	}
+
+	if (first_timestamp) {
+		ihdr->first_timestamp = first_timestamp;
+		ihdr->valid_bits.first_timestamp = 1;
+	}
+
+	if (sig_id != U32_MAX) {
+		ihdr->sig_id = sig_id;
+		ihdr->valid_bits.sig_id = 1;
+	}
+
+	ihdr->error_count = error_count;
+
+	fill_pci_bdf(xe, ihdr);
+	fill_drv_version(ihdr);
+	fill_fw_id(xe, ihdr);
+}
+
+/**
+ * xe_cper_record_emit - Build and emit a CPER record for an Intel GPU error
+ * @xe: xe device instance
+ * @fru_id: GUID identifying the field-replaceable unit
+ * @severity: CPER error severity (CPER_SEV_*)
+ * @ihdr: Intel-specific section header, fully populated by
+ *        xe_cper_init_intel_err_hdr()
+ * @einfo: optional xe_cper_sec_intel_error_info payload; may be %NULL
+ * @einfo_size: byte size of @einfo, including any event_queue data
+ *
+ * The platform_id is resolved automatically from xe_platform_ids[] using
+ * the PCI device ID.  If no entry matches, the field is left zeroed and
+ * the record is still emitted.
+ */
+void xe_cper_record_emit(struct xe_device *xe,
+		  const guid_t *fru_id,
+		  u8 severity,
+		  guid_t notification_type,
+		  struct xe_cper_sec_intel_err_hdr *ihdr,
+		  const void *einfo,
+		  u32 einfo_size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	const guid_t *platform_id = lookup_platform_id(pdev);
+	u32 total_len = sizeof(struct xe_cper_nonstd_record) + einfo_size;
+	struct cper_section_descriptor *sdesc;
+	struct cper_record_header *rhdr;
+	struct xe_cper_nonstd_record *rec;
+
+	rec = kzalloc(total_len, GFP_KERNEL);
+	if (!rec) {
+		drm_err(&xe->drm, "CPER: failed to allocate record buffer\n");
+		return;
+	}
+
+	rhdr  = &rec->record_hdr;
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
+	rhdr->timestamp         = ktime_get_real_ns();
+	if (platform_id) {
+		rhdr->platform_id      = *platform_id;
+		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
+	}
+	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
+	rhdr->notification_type = notification_type;
+	rhdr->record_id         = cper_next_record_id();
+	rhdr->flags             = 0;
+
+	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
+	sdesc->section_offset   = sizeof(struct cper_record_header) +
+				  sizeof(struct cper_section_descriptor);
+	sdesc->section_length   = sizeof(struct xe_cper_sec_intel_err_hdr) +
+				  einfo_size;
+	sdesc->revision         = CPER_RECORD_REV;
+	/* Set validation_bits using CPER_SEC_VALID_FRU_ID / CPER_SEC_VALID_FRU_TEXT
+	 * when the corresponding fields are populated.
+	 */
+	sdesc->validation_bits  = 0;
+	sdesc->reserved         = 0;
+	sdesc->flags            = 0;
+	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
+	if (fru_id && !guid_is_null(fru_id)) {
+		sdesc->fru_id           = *fru_id;
+		sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
+	}
+	sdesc->section_severity = severity;
+
+	/* Copy the Intel-specific section header (updated with BDF/version) */
+	rec->intel_hdr = *ihdr;
+
+	/* Append optional variable-length error info */
+	if (einfo && einfo_size)
+		memcpy((u8 *)rec + sizeof(*rec), einfo, einfo_size);
+
+	trace_xe_error_cper(xe, platform_id, fru_id, severity,
+			    &rec->intel_hdr, total_len, (u8 *)rec);
+
+	kfree(rec);
+}
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
new file mode 100644
index 000000000000..7027e3f1be60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_H_
+#define _XE_CPER_H_
+
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+struct xe_cper_sec_intel_err_hdr;
+struct xe_device;
+
+void xe_cper_record_emit(struct xe_device *xe,
+		  const guid_t *fru_id,
+		  u8 severity,
+		  guid_t notification_type,
+		  struct xe_cper_sec_intel_err_hdr *ihdr,
+		  const void *einfo,
+		  u32 einfo_size);
+
+void xe_cper_init_intel_err_hdr(struct xe_device *xe,
+				const u8 location[12],
+				u64 first_timestamp,
+				u32 sig_id,
+				u64 error_count,
+				struct xe_cper_sec_intel_err_hdr *ihdr);
+
+#endif /* _XE_CPER_H_ */
-- 
2.54.0

