Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ACD606A323
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D6FrzlD4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E68E10E516;
	Fri, 27 Nov 2026 09:29:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A14210E516
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795771768; x=1827307768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jEl/MaXxMd2wfGrrc5jM8noM4dFiDts+vDt/QSTiK6g=;
 b=D6FrzlD4GeViNfBFuPoz15HM8S+xlw82cVxXX0rV0559yrafE20a57el
 iXjSxYi2o3EI9rOdgaKT7kuKzFXHvTWw4iQ0agCbfrX/2NthlaPd/j+dG
 aUHyO7o2LWuZQ5U4yoK5VKIRVb8HNNFHkPhhnuzkFpEbQlaQV5hp8UGsA
 +xzp9qnkMGRE+f5qFSrN022tdXxkryz8JKa6y9eNHHml/fh45W4BxNLfH
 FULVJZ/DDjoibT5JF6CRXtoe3gR8zzHar74XlUNi8HKOM73gMsK+9/GeT
 oWq8htNTmSoE/XMwpacar7sQfONqOtAyMKtLQrpxfqdcbV0LTWWWEieE0 Q==;
X-CSE-ConnectionGUID: zLOIVDDaR+2TQohvRledtA==
X-CSE-MsgGUID: QNTRNtmrTjOie4mKLiyfQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4678863"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4678863"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:29:27 -0800
X-CSE-ConnectionGUID: pPvGunVBTlO50PzXBQQfeQ==
X-CSE-MsgGUID: EMNr91kvQeehuJBtpSI58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12276064"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 27 Nov 2026 01:29:24 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 1/6] drm/xe/cper: Add software CPER emission entry point
Date: Fri, 27 Nov 2026 14:59:15 +0530
Message-ID: <20261127092914.2176025-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
References: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a software CPER emission handler for CRI SIGIDs.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
v3:
- Handle early PCI probe where xe device is null. (Sashiko)

v4:
- Add has_driver_cper flag. (Badal)

v5:
- Update commit message. (Badal)
- Handle severity with single line.
---
 drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index 64bbb149e4e3..d75b867940ad 100644
--- a/drivers/gpu/drm/xe/xe_cper.c
+++ b/drivers/gpu/drm/xe/xe_cper.c
@@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
 	return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, INTEL_SIGID_BATCH);
 }
 
+static bool is_sw_sigid(enum xe_sigid sigid)
+{
+	return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, INTEL_SIGID_BATCH);
+}
+
 /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device ID. */
 static const struct xe_device_guid_entry xe_device_guids[] = {
 	{ 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
@@ -491,6 +496,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, &response);
 }
 
+static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
+			     u32 component, u32 location, const void *data,
+			     struct va_format *vaf)
+{
+}
+
 /**
  * xe_cper_emit() - Emit a CPER record for a SIGID log entry
  * @xe: The &xe_device
@@ -519,12 +530,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf)
 {
+	/* TODO: Handle using pdev instead of xe. */
+	if (!xe)
+		return;
+
 	if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
 		cper_emit_hw_err(xe, cper_sev, sigid, data);
 		return;
 	}
 
-	/* TODO software CPER */
+	if (xe->info.has_driver_cper) {
+		if (is_sw_sigid(sigid) &&
+		    (cper_sev == CPER_SEV_RECOVERABLE || cper_sev == CPER_SEV_FATAL))
+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9e0d7d3d07d5..e38bc28404ff 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -171,6 +171,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
 		u8 has_device_uid:1;
+		/** @info.has_driver_cper: Device supports driver-generated CPER records */
+		u8 has_driver_cper:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index eaac0b25b948..ac04a45ab13e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -486,6 +486,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_device_uid = true,
+	.has_driver_cper = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -814,6 +815,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_device_uid = desc->has_device_uid;
+	xe->info.has_driver_cper = desc->has_driver_cper;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 90936f805d8f..177b963bfc5a 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -42,6 +42,7 @@ struct xe_device_desc {
 	u8 has_cached_pt:1;
 	u8 has_display:1;
 	u8 has_device_uid:1;
+	u8 has_driver_cper:1;
 	u8 has_drm_ras:1;
 	u8 has_fan_control:1;
 	u8 has_fixed_vram_channels:1;
-- 
2.48.1

