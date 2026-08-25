Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E08C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CFA10EB2A;
	Tue, 25 Aug 2026 17:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrIZDC8G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AA610EB2A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679761; x=1819215761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HMTdqyHT0cO6UXLlCkPeSIOqaabn5btuN/EdUl9k9eQ=;
 b=XrIZDC8Gw9+2ikKFbbZdDDTYYdSyeeQ/VHEjM5Pi+nNjMLsUmp25FyLd
 Jd2zdqfXCS0c+w0coB1q7rpJCcd4KUPBGlkBDpogw0lqB9oQst2MSHMDo
 cMuBPtGNw6MSUi6uIpXG1ApL/dPR/rcSN1BeFRVZ6UtO4kGE3CoEavSXp
 GfNLTWTx4N+qcsOG7OzTcZiMzoEBBBDk7S2kZlS8t4oue+vn/cBTg4o8s
 108hjirpTS8JMaE6gezBoSdD550wuwc78bjQk1gAvgX5JImZIfWOeOpJ3
 iHqhZ8BmlZjph5JmQ+9HqB3924of6m9Ngny2lC6Ki766CeWjLovZFIn6t g==;
X-CSE-ConnectionGUID: 3iIIdExwTHCcBnZB2m9KQQ==
X-CSE-MsgGUID: Al2lQWKJRMGeIBGzcJMuxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210811"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:40 -0700
X-CSE-ConnectionGUID: 2ynukeHcQYeulhRJBYiN5g==
X-CSE-MsgGUID: agkv52nRSW6ZSsmHavz8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585087"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:37 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 03/11] drm/xe/cper: Add CPER structures and trace event
Date: Tue, 25 Aug 2026 23:29:20 +0530
Message-ID: <20260825175916.1103841-16-badal.nilawar@intel.com>
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

Define packed data structures and Intel-specific GUID macros needed
to build Intel GPU CPER (Common Platform Error Record) non-standard
records.

Add xe_error_cper trace event to log the assembled CPER record bytes.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_cper_types.h | 186 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_trace_cper.c |   9 ++
 drivers/gpu/drm/xe/xe_trace_cper.h |  66 ++++++++++
 4 files changed, 262 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 92134709d998..3ed60697f3f3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -136,6 +136,7 @@ xe-y += xe_bb.o \
 	xe_tlb_inval_job.o \
 	xe_trace.o \
 	xe_trace_bo.o \
+	xe_trace_cper.o \
 	xe_trace_guc.o \
 	xe_trace_lrc.o \
 	xe_ttm_stolen_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
new file mode 100644
index 000000000000..82167ea4eb16
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -0,0 +1,186 @@
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
+/* Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
+ *
+ * All values below are generated deterministically by the shell script
+ * in the [Generation Script] section. Re-run that script to verify.
+ * Do NOT hand-edit the byte values.
+ */
+
+/* Creator IDs */
+#define INTEL_CPER_CREATOR_XEKMD \
+	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
+		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
+
+#define INTEL_CPER_CREATOR_AMC \
+	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
+		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
+
+/* Notification Types */
+#define INTEL_CPER_NOTIFY_GPU_ERROR \
+	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
+		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
+
+#define INTEL_CPER_NOTIFY_DRV_ERROR \
+	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
+		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
+
+/* Section Types */
+#define INTEL_CPER_SECTION_ACCEL_GENERIC \
+	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
+		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
+
+#pragma pack(push, 1)
+
+/**
+ * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
+ *
+ * Fixed-size header for the Intel GPU error section of a CPER record.
+ * All multi-byte fields are little-endian; the structure is packed.
+ */
+struct xe_cper_sec_intel_err_hdr {
+	/** @error_class: Error classification (type, component, location, cause) */
+	union {
+		struct {
+			/** @error_class.error_type: RAS error severity */
+			u8  error_type;
+			/** @error_class.error_component: IP block that raised the error */
+			u8  error_component;
+			/** @error_class.tile: Tile number */
+			u8  tile;
+			/** @error_class.instance: Instance within the tile */
+			u32 instance;
+			/** @error_class.cause: Error cause code */
+			u32 cause;
+			/** @error_class.reserved: Reserved, must be zero */
+			u8  reserved;
+		} error_class;
+		/** @class: Raw byte view of the error class */
+		u8 class[12];
+	};
+	/** @first_timestamp: Timestamp of the first occurrence of this error class */
+	u64 first_timestamp;
+	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
+	u32 sig_id;
+	/** @error_count: Number of times this error has been observed */
+	u32 error_count;
+	/** @valid_bits: Bitmask indicating which header fields are populated */
+	union {
+		struct {
+			/** @valid_bits.location: @error_class field is valid */
+			u16 location		: 1;
+			/** @valid_bits.first_timestamp: @first_timestamp field is valid */
+			u16 first_timestamp	: 1;
+			/** @valid_bits.sig_id: @sig_id field is valid */
+			u16 sig_id			: 1;
+			/** @valid_bits.pci_bdf: @pci_bdf field is valid */
+			u16 pci_bdf		: 1;
+			/** @valid_bits.drv_version: @drv_version field is valid */
+			u16 drv_version		: 1;
+			/** @valid_bits.fw_id: @fw_id field is valid */
+			u16 fw_id			: 1;
+			/** @valid_bits.reserved: Reserved, must be zero */
+			u16 reserved		: 10;
+		} valid_bits;
+		/** @validation_bits: Raw u16 view of all valid bits */
+		u16 validation_bits;
+	};
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
+	/** @error_class: Error classification (mirrors the header error_class) */
+	union {
+		struct {
+			u8  error_type;
+			u8  error_component;
+			u8  tile;
+			u32 instance;
+			u32 cause;
+			u8  reserved;
+		} error_class;
+		/** @class: Raw byte view of the error class */
+		u8 class[12];
+	};
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
+	/** @timestamp: Hardware timestamp of this event */
+	u64 timestamp;
+	/** @metadata: Event-specific payload bytes */
+	u8  metadata[];
+};
+
+/**
+ * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
+ *
+ * Contains the standard CPER record header, section descriptor, and the
+ * Intel error section header. A &xe_cper_sec_intel_error_info payload
+ * (with its flexible @event_queue array) is appended dynamically.
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
+#endif
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
index 000000000000..6d2dbf504888
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_trace_cper.h
@@ -0,0 +1,66 @@
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
+	    const guid_t *platform_id, const guid_t *fru_id,
+	    const u8 severity,
+	    const struct xe_cper_sec_intel_err_hdr *ihdr,
+	    u32 cper_len, const u8 *cper),
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
+	TP_printk("dev=%s severity=%d platform_id=%pU fru_id=%pU "
+		"intel_err_hdr_raw=%s cper_len=%u cper_raw=%s",
+		__get_str(dev), __entry->sev,
+		__entry->platform_id, __entry->fru_id,
+		__print_hex(__entry->ihdr_raw,
+		    sizeof(struct xe_cper_sec_intel_err_hdr)),
+		__entry->cper_len,
+		__print_hex(__get_dynamic_array(cper),
+		    __entry->cper_len))
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
2.54.0

