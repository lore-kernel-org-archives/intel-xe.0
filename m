Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4ECC79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879DE10E088;
	Sun,  6 Sep 2026 17:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2qebzx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9010E346
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788714569; x=1820250569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jEY2tfrfEUlWRkNoM2KATD0b1qNSQI9E2rPSTNzYSlU=;
 b=a2qebzx0IJIPYiL4lFpLmmy5tcMNpgFWSUUGsix1rGdImpxLHzGfIpwo
 doz/oi/Q5O41QT0nGl3sR+WhtG/I4fHSvF+jKI1Lx3J934QQl8zzlNUV1
 U2yvHq3zsoTmG6qhd2fXUiCrov+0obOiOs9n5EOOj4JrFx6qxYjAsfYJ4
 RS8CBYe8TRTErU7J4dQt6wpuYrRwIJa36LbklxESprnVI3dhFQ7oMty8u
 GpDVuZQ69dnM2TIwtWMonSzSosH0m5UqdMDi6HAtnbrS8b1f11W42Q0po
 nPJW0tXyKkvvrrN0OMBV8IYMium41C29Mn0Jq7+sJue12rWY/Rw+gAYwA g==;
X-CSE-ConnectionGUID: p9b+tYmzQ1OIUeCfvG/w8Q==
X-CSE-MsgGUID: /1hGdR/aQF6uq/DbyfCm2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88071445"
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="88071445"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:28 -0700
X-CSE-ConnectionGUID: vn4JX3zrT8Cmy9S/MRJyrw==
X-CSE-MsgGUID: yNKBipqIRIWqfzOFm1rLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,265,1779174000"; d="scan'208";a="269996121"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 10:09:25 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: [PATCH v3 04/12] drm/xe/cper: Prepare CPER record
Date: Sun,  6 Sep 2026 22:56:09 +0530
Message-ID: <20260906172604.2215987-18-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Initialize Intel-specific CPER metadata and construct
CPER record for Intel GPU hardware errors.

v2:
 - Encode cper_record_header timestamp in BCD format (sashiko)
 - Guard against NULL THIS_MODULE->srcversion (sashiko)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |   2 +
 drivers/gpu/drm/xe/xe_cper.c      | 171 ++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

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
index f04a91223a43..31ca53ce1aa7 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -3,16 +3,176 @@
  * Copyright © 2026 Intel Corporation
  */
 
+#include <linux/bcd.h>
 #include <linux/pci.h>
 
 #include <drm/drm_print.h>
 
+#include "regs/xe_regs.h"
 #include "xe_cper.h"
+#include "xe_cper_types.h"
 #include "xe_device.h"
+#include "xe_mmio.h"
 #include "xe_printk.h"
 #include "xe_ras.h"
 #include "xe_ras_types.h"
 
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
+static void xe_cper_init_intel_err_hdr(struct xe_device *xe, const u8 location[12],
+				       u64 first_timestamp, u32 sig_id, u32 error_count,
+				       struct xe_cper_sec_intel_err_hdr *ihdr)
+{
+	if (location) {
+		memcpy(&ihdr->error_class, location, sizeof(ihdr->error_class));
+		ihdr->validation_bits |= XE_CPER_VALID_LOCATION;
+	}
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
+	fill_fw_id(xe, ihdr);
+}
+
+static void xe_cper_record_emit(struct xe_device *xe, u8 severity,
+				guid_t *notification_type,
+				struct xe_cper_sec_intel_err_hdr *ihdr,
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
+	rhdr->timestamp         = cper_timestamp_now();
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
+	/* TODO: Emit trace event */
+
+	kfree(rec);
+}
 /**
  * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
  * @pdev: PCI device associated with the Xe device
@@ -30,6 +190,7 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_ras_get_counter_response local_resp = {};
 	struct xe_ras_get_counter_response *counter_response = response;
+	struct xe_cper_sec_intel_err_hdr ihdr = {};
 
 	if (!xe)
 		return;
@@ -48,5 +209,15 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
 		}
 	}
 
+	xe_cper_init_intel_err_hdr(xe,
+				   (const u8 *)counter,
+				   counter_response->timestamp,
+				   sigid,
+				   counter_response->value,
+				   &ihdr);
+
+	xe_cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_GPU_ERROR,
+			    &ihdr, NULL, 0);
+
 	/* TODO */
 }
-- 
2.54.0

