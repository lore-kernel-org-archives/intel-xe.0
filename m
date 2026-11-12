Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF219606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hg/bna2o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526310EE90;
	Thu, 12 Nov 2026 13:47:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B7210F2A6
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491243; x=1826027243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QRqIaAX+UtW1zkfgMaUn24dyuBTHeaTd7HCrP8hkcME=;
 b=hg/bna2oK6ezeesTuj0P/K3qqYerFVmo3jdUktqX2MT6B9ArSJ+H73cG
 Pm9rWiXdhtB6hr5aeA1yY9POiVydTPaVysqtEU9O293kTLiWn3AJpkwMN
 jXk8UlXIJINRCip/5G/DnQAZ8Bbbkoc2M8RwNGE3R6+8EfOPR+C+8tgM/
 Ml7CBb7+tPIz7UYXgZX4zqYxSL+37o201aCWrg7qgAsdSHL/bcwGioeel
 ixM5E8XnbZ2aCGmsdRMNsPEIXxjwDemGW2CDpiHW9J6e3y9mKPI/urrV8
 NbV7JibMNfVag6DkqTnHwtRjkWv0tAfPC4YAz5IOuTsFROPxh1n/bK8t9 w==;
X-CSE-ConnectionGUID: 2hUOWQGkQ2O/cJY9zqDMeQ==
X-CSE-MsgGUID: V+KegKf1Qd668K6y/3o0LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3306656"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3306656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:46:58 -0800
X-CSE-ConnectionGUID: IOLDMeNUTqyuCBQI60CQ4w==
X-CSE-MsgGUID: oNROX/AwSLqWOuPjGuIMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8527894"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 05:46:55 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 1/6] drm/xe/cper: Add software CPER emission entry point
Date: Thu, 12 Nov 2026 19:16:38 +0530
Message-ID: <20261112134636.1860446-9-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
References: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
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

Keep hardware CPER handling unchanged and return early
when the Xe device is unavailable.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v3:
- Handle early PCI probe where xe device is null. (Sashiko)

v4:
- Add has_driver_cper flag. (Badal)
---
 drivers/gpu/drm/xe/xe_cper.c         | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
index bb90030bcd2d..dd6d4251dd1d 100644
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
@@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
 	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
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
@@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
 		  u32 component, u32 location, const void *data, size_t len,
 		  struct va_format *vaf)
 {
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
+		    (cper_sev == CPER_SEV_RECOVERABLE ||
+		     cper_sev == CPER_SEV_FATAL))
+			cper_emit_sw_err(xe, cper_sev, sigid, component, location, data, vaf);
+		return;
+	}
 }
 
 static ssize_t cper_on_query_show(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 933f5d27aa62..d992ff8d2fc9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -170,6 +170,8 @@ struct xe_device {
 		u8 has_device_atomics_on_smem:1;
 		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
 		u8 has_device_uid:1;
+		/** @info.has_driver_cper: Device supports driver-generated CPER records */
+		u8 has_driver_cper:1;
 		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
 		u8 has_drm_ras:1;
 		/** @info.has_fan_control: Device supports fan control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ce231069880a..c615eddb2abc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -475,6 +475,7 @@ static const struct xe_device_desc cri_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_device_uid = true,
+	.has_driver_cper = true,
 	.has_drm_ras = true,
 	.has_flat_ccs = false,
 	.has_gsc_nvm = 1,
@@ -802,6 +803,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_cached_pt = desc->has_cached_pt;
 	xe->info.has_device_uid = desc->has_device_uid;
+	xe->info.has_driver_cper = desc->has_driver_cper;
 	xe->info.has_drm_ras = desc->has_drm_ras;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 74a6cd461b21..e7bf46ea729f 100644
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

