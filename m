Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97821CCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67E10E8FF;
	Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiY2EwUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB4E10E8FF
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4POY1PYVPUcDXS6ahkmgUQpXIt1ahaFd24lh/TCyEG8=;
 b=jiY2EwUhjuKk1Tz5s9inlWEU02OclcoucYF+RGPwBhY0Bc4JBzB2NP90
 AYvL04+D0aWbHOSGfxPClDlnrRn8osKRvQL6+UtOlMLTdNlYv4vCGrnFc
 DbZVvrfF/fT9v5JtQOj0oFu1nHl5d8TaRyON/sASr9YCE1QuH+pqcVkIn
 7+PwbLQzuf+Gr0nRgngK3vyD0kxmfi6Kuvrc/tY25eCsFc0Mm6DKEIs99
 rGLG5EzGr+ryhUe/WM4GsGXtW1SFo9NBVr+CoWLHBJs3R3zrnLe0//Gse
 RnfnXu2OBHqoeOCGoFXzEZsTI/A0r1OEH1fNTTK59r7Kjd1PkdveY6lx4 w==;
X-CSE-ConnectionGUID: xH0sRH+DS1KJRbRuxwkubg==
X-CSE-MsgGUID: yJnuzQZvQ3qGlPQFZ0IMsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794056"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: zvKNrjUgSeiz4gRuaaUXpw==
X-CSE-MsgGUID: T4l1JSfERLyC2Nul3+MIaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298293"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 11/22] drm/xe/nvl: Define NVL-S platform
Date: Wed, 15 Oct 2025 15:06:26 -0700
Message-ID: <20251015-xe3p-v2-11-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Provide the basic platform definitions and PCI IDs for NVL-S.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 include/drm/intel/pciids.h             | 9 +++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b72f71b0f52c9..d836fd8e187a6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -377,6 +377,14 @@ static const struct xe_device_desc ptl_desc = {
 	.vm_max_level = 4,
 };
 
+static const struct xe_device_desc nvls_desc = {
+	PLATFORM(NOVALAKE_S),
+	.dma_mask_size = 46,
+	.has_display = true,
+	.max_gt_per_tile = 2,
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -405,6 +413,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
 	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
+	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 3e332214c7bb4..78286285c2495 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -24,6 +24,7 @@ enum xe_platform {
 	XE_LUNARLAKE,
 	XE_BATTLEMAGE,
 	XE_PANTHERLAKE,
+	XE_NOVALAKE_S,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 452c1de606ff2..13c592e1a28c7 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -887,4 +887,13 @@
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)
 
+/* NVL-S */
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */

-- 
2.51.0

