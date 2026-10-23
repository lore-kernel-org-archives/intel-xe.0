Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F290606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aXTgem3V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39238112958;
	Fri, 23 Oct 2026 04:17:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2BF11293D
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 04:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792729054; x=1824265054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fp3mm/G1SFY32VFX3qrxFmVnjgsjEJ1mIJLAtaBFA4=;
 b=aXTgem3VBNGwidV/Qzlt0L+G8afZZGeZ8huWi4hUnaZBU2n2rYj7J7QL
 ejISHf/L4qyP9iZ0o5kw8sErTvvIRVOyEB32p260Ef3p99LsIVxIwU8fh
 xRWycEmufZbNWQbi4BbmjNjn0gQN5GgRxKsd7CI7Fnl66X4aWa+2I3pvU
 FY2qLTRweCs+ORi1u8ZWlAppiKhSkBq7LxTfkFVYCypQa4JY+DYgevvV7
 TwaNBA9GY8tlquouc3mwiLbDmuiVevmFku0RnRa6e86qP5ZrRZGwFaUQz
 AUKpP2//xMNxQSmKwKWZjhJdX6NJQFA4Ls0Am5w0UUWWRPJjTPwYh82Ha g==;
X-CSE-ConnectionGUID: FjFCR1JxS9ml/dsbmIae/w==
X-CSE-MsgGUID: 36eRdpRnQdeIx6nnGg+nYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1383470"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1383470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:34 -0700
X-CSE-ConnectionGUID: J2jOUs+3SQuaomC5x5XHeA==
X-CSE-MsgGUID: 0PuVDsw8QuGxEfT3qdEGfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3658268"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 21:17:31 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: [PATCH v5 04/13] drm/xe/cper: Construct CPER record for hardware
 errors
Date: Fri, 23 Oct 2026 10:04:26 +0530
Message-ID: <20261023043422.681260-19-badal.nilawar@intel.com>
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

Assemble the CPER record header, section descriptor and the Intel
error section for Intel GPU hardware errors.

Assisted-by: LLM
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
v5:
 - Rebased
 - Add helpers to initialize CPER headers (Raag)
v4:
 - Split from "drm/xe/cper: Prepare CPER record" (Raag)
 - Use xe->device_uid for FRU ID
 - Add platform IDs for all CRI PCI device IDs
v2:
 - Encode cper_record_header timestamp in BCD format (sashiko)
---
 drivers/gpu/drm/xe/xe_cper.c       | 139 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper_types.h |  53 +++++++++++
 2 files changed, 192 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 3d7657517223..012693fe48c4 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -3,10 +3,14 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bcd.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/minmax.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/time.h>
+#include <linux/timekeeping.h>
 
 #include "xe_cper.h"
 #include "xe_cper_types.h"
@@ -25,6 +29,60 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
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
 static void cper_init_intel_hdr(struct xe_device *xe,
 				const struct xe_ras_error_class *counter,
 				u64 first_timestamp, u32 sig_id, u32 error_count,
@@ -58,6 +116,86 @@ static void cper_init_intel_hdr(struct xe_device *xe,
 	/* TODO: fill fw_id and set XE_CPER_VALID_FW_ID */
 }
 
+static void cper_init_record_hdr(struct xe_device *xe, u8 severity,
+				 const guid_t *notification_type,
+				 struct cper_record_header *rhdr,
+				 u32 total_len)
+{
+	const guid_t *platform_id;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
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
+	platform_id = lookup_platform_id(pdev);
+	if (platform_id) {
+		rhdr->platform_id      = *platform_id;
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
+	struct cper_record_header *rhdr;
+	struct xe_cper_nonstd_record *rec;
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
+	/* TODO: Emit trace event */
+
+	kfree(rec);
+}
+
 static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 			      const struct xe_ras_error_class *counter,
 			      const struct xe_ras_get_counter_response *response)
@@ -66,6 +204,7 @@ static void cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid
 
 	cper_init_intel_hdr(xe, counter, response->timestamp,
 			    sigid, response->value, &ihdr);
+	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR, &ihdr, NULL, 0);
 }
 
 static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
index a8730ff62b69..e32c7d539257 100644
--- a/drivers/gpu/drm/xe/xe_cper_types.h
+++ b/drivers/gpu/drm/xe/xe_cper_types.h
@@ -6,7 +6,9 @@
 #ifndef _XE_CPER_TYPES_H_
 #define _XE_CPER_TYPES_H_
 
+#include <linux/cper.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 
 #include "xe_ras_types.h"
 
@@ -21,6 +23,28 @@
 #define XE_CPER_VALID_PCI_BDF		0x0008
 #define XE_CPER_VALID_DRV_VERSION	0x0010
 
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
 /**
  * struct xe_cper_intel_hdr - Intel-specific CPER header
  *
@@ -48,4 +72,33 @@ struct xe_cper_intel_hdr {
 	u8 reserved[5];
 } __packed;
 
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
 #endif
-- 
2.54.0

