Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB6FC61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A85410E20A;
	Tue, 25 Aug 2026 17:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfFLr7OF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F51910E20A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679764; x=1819215764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AgTO7KjC5mBzYyypkMkAJ8Rdge2q/hOiZZJNgMlRz7g=;
 b=WfFLr7OFRLE/HlXeYRyjdO2Gk80IAmR0tjUW/yDAxW8zD50vfKYGlPzP
 0Kv4zSJxFIofAy6ctkxFUE4F/fRy2nnHMgbpCk38ffJk3U00eOKa6wzbn
 +l2nSMbqI6cujKGoLhCsUCA7hpxuoLhEoUrAJW41jrDE6gzKo9sPwvvNF
 sWumR8MUH5Obc9tNLmh92/Aq6aACl3+asG/w4CeFXWlaYY0gEGT+qxhQC
 u1zHDd6cEYc9TctgyYFLxbVdccTZKYqvUVovwu/hgzWLTSyKU/COKLG0a
 dFoHjvLIeWY3CnVqMPbvMEXgROeaHKoIL2Z4rZw8cgX14AELdqIHHIp8y A==;
X-CSE-ConnectionGUID: IXQRkY81Rk61Z7rnarDigA==
X-CSE-MsgGUID: 6vK2KaJGQ66jwvngLH8Z0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210812"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210812"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:44 -0700
X-CSE-ConnectionGUID: osm/SFX/QKaOfaFuejZaOg==
X-CSE-MsgGUID: jEZZHpadSTytOsKtvsZPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585098"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:41 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 04/11] drm/xe/cper: APIs to prepare and log CPER record
Date: Tue, 25 Aug 2026 23:29:21 +0530
Message-ID: <20260825175916.1103841-17-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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
 drivers/gpu/drm/xe/Makefile       |   5 +-
 drivers/gpu/drm/xe/regs/xe_regs.h |   2 +
 drivers/gpu/drm/xe/xe_cper.c      | 184 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.h      |  34 ++++++
 4 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3ed60697f3f3..c7d13bb090a6 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -136,7 +136,6 @@ xe-y += xe_bb.o \
 	xe_tlb_inval_job.o \
 	xe_trace.o \
 	xe_trace_bo.o \
-	xe_trace_cper.o \
 	xe_trace_guc.o \
 	xe_trace_lrc.o \
 	xe_ttm_stolen_mgr.o \
@@ -165,6 +164,10 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
+xe-$(CONFIG_UEFI_CPER_X86) += \
+			xe_cper.o \
+			xe_trace_cper.o
+
 # graphics virtualization (SR-IOV) support
 xe-y += \
 	xe_gt_sriov_vf.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ef4746b7b5d3..580c3dad858a 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -30,6 +30,8 @@
 #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
 #define   TILE_COUNT				REG_GENMASK(15, 8)
 
+#define CRI_FRU_ID				XE_REG(0x102008)
+
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
new file mode 100644
index 000000000000..371537052de3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -0,0 +1,184 @@
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
+#include "regs/xe_regs.h"
+#include "xe_cper.h"
+#include "xe_cper_types.h"
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_mmio.h"
+#include "xe_ras_types.h"
+#include "xe_trace_cper.h"
+
+static const struct xe_platform_id_entry xe_platform_ids[] = {
+	/* 0x674C  platform/8086:674c */
+	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
+			    0x86, 0x14, 0x92, 0x55, 0x0d, 0x9e, 0x9d, 0xa6) },
+};
+
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
+static guid_t read_fru_id(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	guid_t guid = GUID_INIT(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
+	u64 val;
+
+	val = xe_mmio_read64_2x32(mmio, CRI_FRU_ID);
+
+	memcpy(&guid, &val, sizeof(val));
+
+	return guid;
+}
+
+static void fill_fw_id(struct xe_device *xe, struct xe_cper_sec_intel_err_hdr *ihdr)
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
+void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[12],
+				u64 first_timestamp, u32 sig_id,
+				u32 error_count, struct xe_cper_sec_intel_err_hdr *ihdr)
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
+	strscpy(ihdr->pci_bdf, pci_name(to_pci_dev(xe->drm.dev)), sizeof(ihdr->pci_bdf));
+	ihdr->valid_bits.pci_bdf = 1;
+
+#ifdef MODULE
+	strscpy(ihdr->drv_version, THIS_MODULE->srcversion, sizeof(ihdr->drv_version));
+	ihdr->valid_bits.drv_version = 1;
+#else
+	ihdr->valid_bits.drv_version = 0;
+#endif
+
+	fill_fw_id(xe, ihdr);
+}
+
+/**
+ * xe_cper_record_emit - Build and emit a CPER record for an Intel GPU error
+ * @xe: xe device instance
+ * @notification_type: CPER notification type (INTEL_CPER_NOTIFY_*)
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
+void xe_cper_record_emit(struct xe_device *xe, u8 severity,
+			 guid_t *notification_type,
+			 struct xe_cper_sec_intel_err_hdr *ihdr,
+			 const void *einfo, u32 einfo_len)
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
+	rhdr->timestamp         = ktime_get_real_seconds();
+	if (platform_id) {
+		rhdr->platform_id      = *platform_id;
+		rhdr->validation_bits |= CPER_VALID_PLATFORM_ID;
+	}
+	rhdr->creator_id        = INTEL_CPER_CREATOR_XEKMD;
+	rhdr->notification_type = *notification_type;
+	rhdr->record_id         = cper_next_record_id();
+	rhdr->flags             = 0;
+
+	/* Assemble the section descriptor (UEFI Appendix N.2.2) */
+	sdesc->section_offset   = sizeof(struct cper_record_header) +
+				  sizeof(struct cper_section_descriptor);
+	sdesc->section_length   = sizeof(struct xe_cper_sec_intel_err_hdr) + einfo_len;
+	sdesc->revision         = CPER_RECORD_REV;
+	/*
+	 * Set validation_bits using CPER_SEC_VALID_FRU_ID / CPER_SEC_VALID_FRU_TEXT
+	 * when the corresponding fields are populated.
+	 */
+	sdesc->validation_bits  = 0;
+	sdesc->reserved         = 0;
+	sdesc->flags            = 0;
+	sdesc->section_type     = INTEL_CPER_SECTION_ACCEL_GENERIC;
+	sdesc->fru_id = read_fru_id(xe);
+	sdesc->validation_bits |= CPER_SEC_VALID_FRU_ID;
+	sdesc->section_severity = severity;
+
+	/* Copy the Intel-specific section header (updated with BDF/version) */
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
diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
new file mode 100644
index 000000000000..4d852a487b65
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper.h
@@ -0,0 +1,34 @@
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
+#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
+void xe_cper_record_emit(struct xe_device *xe, u8 severity,
+			 guid_t *notification_type,
+			 struct xe_cper_sec_intel_err_hdr *ihdr,
+			 const void *einfo, u32 einfo_size);
+
+void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[12],
+				u64 first_timestamp, u32 sig_id, u32 error_count,
+				struct xe_cper_sec_intel_err_hdr *ihdr);
+#else
+static inline void xe_cper_record_emit(struct xe_device *xe, u8 severity,
+				       guid_t *notification_type,
+				       struct xe_cper_sec_intel_err_hdr *ihdr,
+				       const void *einfo, u32 einfo_size) {}
+
+static inline void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[12],
+					      u64 first_timestamp, u32 sig_id, u32 error_count,
+					      struct xe_cper_sec_intel_err_hdr *ihdr) {}
+#endif
+#endif /* _XE_CPER_H_ */
-- 
2.54.0

