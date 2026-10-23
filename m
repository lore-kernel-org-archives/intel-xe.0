Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F93606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N9MZtIvl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DB8112948;
	Fri, 23 Oct 2026 04:17:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C510E572
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729050; x=1824265050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MSa0RxTQbEUDbQxZ/lN2YItLV5kgyHLexwmFjw9dSOE=;
 b=N9MZtIvl61qF/PIDUGp8WBc+NZrJFPCmEGz01erUIkC2/4NNi3fa3kgA
 vlofDHu1pHwMdDK/fmWF/8gEbNdxFYK9TtE7Yhy4hQtvtbNpzPlRSlCIi
 /qPpSlAiOxLytlERTtH6r6iL/J1bosDkNWZDswKuCeeyceni4VUn9K58/
 7EcyZdWlzeuh5XfdQrFRNbdo8aOY4rPHppvgaYcO71bFMTzCwtu/zTQvV
 pcwtsQ5Y6haw+tbh8WQZwnKBySikOZ9lFQCYAwMJsTwx4cM1OP9czSTyH
 DAZtO8b/inZ1I0HB89tLdfW68UXrgWT13UDQhGFYCHZptWb6d7tCOGTKb Q==;
X-CSE-ConnectionGUID: 5iEjaUP4SOajbKiLkCJyYA==
X-CSE-MsgGUID: t3WTMhahTBK4E8YH2Gb3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383461"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383461"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:30 -0700
X-CSE-ConnectionGUID: SCO5rXCbR1agY/tWU6dk7A==
X-CSE-MsgGUID: muhpRax1Q1OChIVQWloZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658259"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:28 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 03/13] drm/xe/cper: Initialize Intel-specific section header
Date: Fri, 23 Oct 2026 10:04:25 +0530
Message-ID: <20261023043422.681260-18-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
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

Define the Intel-specific CPER header and initialize it
from the error counter record for Intel GPU hardware errors.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5:
 - Move xe_cper_emit_counter() from patch 7 of rev4 to this patch to
   avoid code churn (Raag)
 - Use __packed for individual structures instead of #pragma pack (Raag)
 - Drop redundent 'err'/'error' references, shorten structure name (Raag)
v4:
 - Split from "drm/xe/cper: Prepare CPER record" (Raag)
 - Add dedicated struct xe_cper_error_class (Michal)
 - Drop empty fill_fw_id() stub, leave a TODO instead
v2:
 - Guard against NULL THIS_MODULE->srcversion (sashiko)
---
 drivers/gpu/drm/xe/xe_cper.c       | 52 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h | 51 +++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index a9044e708cac..3d7657517223 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -6,18 +6,68 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/minmax.h>
+#include <linux/pci.h>
 
 #include "xe_cper.h"
+#include "xe_cper_types.h"
 #include "xe_device.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
 
+static bool is_valid_sigid(u32 sigid)
+{
+	return sigid != U32_MAX;
+}
+
 static bool is_hw_sigid(enum xe_sigid sigid)
 {
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static void cper_init_intel_hdr(struct xe_device *xe,
+				const struct xe_ras_error_class *counter,
+				u64 first_timestamp, u32 sig_id, u32 error_count,
+				struct xe_cper_intel_hdr *ihdr)
+{
+	ihdr->counter = *counter;
+	ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
+
+	if (first_timestamp) {
+		ihdr->first_timestamp = first_timestamp;
+		ihdr->validation_bits |= XE_CPER_VALID_FIRST_TIMESTAMP;
+	}
+
+	if (is_valid_sigid(sig_id)) {
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
+static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			      const struct xe_ras_error_class *counter,
+			      const struct xe_ras_get_counter_response *response)
+{
+	struct xe_cper_intel_hdr ihdr = {};
+
+	cper_init_intel_hdr(xe, counter, response->timestamp,
+			    sigid, response->value, &ihdr);
+}
+
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			     const struct xe_ras_error_class *counter)
 {
@@ -31,6 +81,8 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 		xe_err(xe, "CPER: failed to get counter, skipping record\n");
 		return;
 	}
+
+	cper_emit_counter(xe, cper_sev, sigid, counter, &response);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
new file mode 100644
index 000000000000..a8730ff62b69
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -0,0 +1,51 @@
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
+	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
+	char fw_id[256];
+	/** @reserved: Reserved for future use, must be zero */
+	u8 reserved[5];
+} __packed;
+
+#endif
-- 
2.54.0

