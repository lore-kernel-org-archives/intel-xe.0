Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EE1CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7910E6A4;
	Wed, 22 Oct 2025 05:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4ORLjoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0D710E6A6
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761110317; x=1792646317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pbl8dq9oH3nWCaz2YYunZJgElvGF5mdAT7rvx36lFkc=;
 b=S4ORLjoL3QyA44/N6FyVx1fRFjszhErpEW1VguhVDah1TvFv7SwLWYOy
 4TWeKmAlbKGvcQQtiRdHO3QLbtdvipZErMEwKfW6V46wThJbyQOCqAHg1
 tpdlnswz+k/6tPak88feIM4BVxF5mOuL61dqQdcVk9RbBHZoaJx8ylhuE
 zXkOLwFBMNoL2j5ys5XbVVPhC6yloJNscJuYcaX0wBlI8M1TcagVhP4pX
 q4Oj0aV3ezw+VHUeV1iVJoBVxv0ZHWIpGKYYEh8jAnjFYppoKIqN3SgUt
 snRHoplg2e919FiUkDPt2UmAlwWP8Fme+CRl8dobLdgoT9yTdyfDLqck8 w==;
X-CSE-ConnectionGUID: gIx7cQXuSk+6brPCEjRBbA==
X-CSE-MsgGUID: A8aAoaL/T06StPF3gh3Hbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67083971"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67083971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
X-CSE-ConnectionGUID: j2c7/VLyS5uwdVaCKNB9XA==
X-CSE-MsgGUID: kymdtzOzRNCIZFcUNeGplQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="220959681"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 22:18:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 01/12] drm/xe/cri: Add CRI platform definition
Date: Tue, 21 Oct 2025 22:17:33 -0700
Message-ID: <20251021-cri-v1-1-bf11e61d9f49@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Add platform definition and PCI IDs for Crescent Island.

Other platforms use INTEL_VGA_DEVICE since they have a
PCI_BASE_CLASS_DISPLAY class.  This is not the case for CRI, so just
match on devid, which should be sufficient.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 include/drm/intel/pciids.h             |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c3136141a9536..000bb30b97712 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -396,6 +396,20 @@ static const struct xe_device_desc nvls_desc = {
 	.vm_max_level = 4,
 };
 
+static const struct xe_device_desc cri_desc = {
+	DGFX_FEATURES,
+	PLATFORM(CRESCENTISLAND),
+	.dma_mask_size = 52,
+	.has_display = false,
+	.has_flat_ccs = false,
+	.has_mbx_power_limits = true,
+	.has_sriov = true,
+	.max_gt_per_tile = 2,
+	.require_force_probe = true,
+	.va_bits = 57,
+	.vm_max_level = 4,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -425,6 +439,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
+	INTEL_CRI_IDS(INTEL_PCI_DEVICE, &cri_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 78286285c2495..f516dbddfd882 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -25,6 +25,7 @@ enum xe_platform {
 	XE_BATTLEMAGE,
 	XE_PANTHERLAKE,
 	XE_NOVALAKE_S,
+	XE_CRESCENTISLAND,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 13c592e1a28c7..b258e79b437ac 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -896,4 +896,8 @@
 	MACRO__(0xD744, ## __VA_ARGS__), \
 	MACRO__(0xD745, ## __VA_ARGS__)
 
+/* CRI */
+#define INTEL_CRI_IDS(MACRO__, ...) \
+	MACRO__(0x674C, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */

-- 
2.51.0

