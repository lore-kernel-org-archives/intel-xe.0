Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966BFCA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55271112052;
	Fri,  9 Oct 2026 10:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0XSoD9/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2BE112052
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541761; x=1823077761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e2s6f/ssTntZHg1PzI6tafmhU5cSKOzFsEoqdfODoxQ=;
 b=T0XSoD9/7x51LAfmLazK0hzd5CVosdsA7ibNNm0doIohFojzOuvhLN9V
 qgrrOsLa5B9WOAdFgQLCARBVpRUS6CezxHpY0Z/mLN+8L6nQt+e5VAJA+
 gi+5BbdrzRtCWtC7olIgZ18BEp/D7d5L/6+NP+d4XD2TDzGjI66357AZZ
 GCd3L5HLAqJ86ombI+4acXBVmnf7xrLGx1FM1GPQdcxjfCrxGgD7MKGXZ
 9SQ4WxNNRbsZFT2k/FIZArqZ5Qs+SUqjC0eyQkjachfPJnt2Jm36SqiZ4
 m+KRLkbNYZxqeBwu645k7zhH9I0LZ+5WLb9+GodMOQHzRNp/yh1EnsTKz Q==;
X-CSE-ConnectionGUID: vAyRqb/LSUyac/AXDOQ6Og==
X-CSE-MsgGUID: Z4vWTOVWSoSZw7ArYNoj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="344072"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="344072"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:21 -0700
X-CSE-ConnectionGUID: PY7uY+PkSMOveCvJQC4DpA==
X-CSE-MsgGUID: t9CU7OmOQr6S60cxH6qKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2025564"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:29:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: [PATCH v4 03/12] drm/xe/cper: Initialize Intel-specific error section
 header
Date: Fri,  9 Oct 2026 16:16:06 +0530
Message-ID: <20261009104602.1075405-17-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

Define the Intel-specific CPER error section header and initialize it
from the error counter record for Intel GPU hardware errors.

Assisted-by: Copilot:Claude-Opus-5.5
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v4:
 - Split from "drm/xe/cper: Prepare CPER record" (Raag)
 - Add dedicated struct xe_cper_error_class (Michal)
 - Drop empty fill_fw_id() stub, leave a TODO instead
v2:
 - Guard against NULL THIS_MODULE->srcversion (sashiko)
---
 drivers/gpu/drm/xe/xe_cper.c       | 43 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h | 72 ++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 4f0ed5096aac..e7cae449b349 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -6,8 +6,10 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+#include <linux/pci.h>
 
 #include "xe_cper.h"
+#include "xe_cper_types.h"
 #include "xe_device.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
@@ -18,9 +20,47 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static void xe_cper_init_intel_err_hdr(struct xe_device *xe,
+				       const struct xe_ras_error_class *error_class,
+				       u64 first_timestamp, u32 sig_id, u32 error_count,
+				       struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	ihdr->error_class.error_type = error_class->common.severity;
+	ihdr->error_class.error_component = error_class->common.component;
+	ihdr->error_class.tile = error_class->product.unit.tile;
+	ihdr->error_class.instance = error_class->product.unit.instance;
+	ihdr->error_class.cause = error_class->product.cause.cause;
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
 static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 				const struct xe_ras_error_class *error_class)
 {
+	struct xe_cper_sec_intel_err_hdr ihdr = {};
 	struct xe_ras_get_counter_response local_resp;
 
 	/* Fetching the counter sends a sysctrl command */
@@ -31,6 +71,9 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
 		xe_err(xe, "CPER: failed to get counter, skipping record\n");
 		return;
 	}
+
+	xe_cper_init_intel_err_hdr(xe, error_class, local_resp.timestamp,
+				   sigid, local_resp.value, &ihdr);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
new file mode 100644
index 000000000000..74307e7f78a2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPER_TYPES_H_
+#define _XE_CPER_TYPES_H_
+
+#include <linux/types.h>
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
+#pragma pack(pop)
+
+#endif
-- 
2.54.0

