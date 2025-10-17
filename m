Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A688CCD183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 02:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C339710EAEA;
	Fri, 17 Oct 2025 02:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiafXmf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E68B10EAE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 02:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760668038; x=1792204038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RSyXjz7lIP3Cb4O1FRiy5CmtoavrhJKlHgM2iudbxqc=;
 b=OiafXmf1HezpbWAtbHbl2F3CaPSmb73MI+6Xhs2C6XVjGzVCykQZeAUu
 ln06Eml4caqj8/H6XQ8SI6qk2P13GlTa//v8PItJNzN/plwpd384CfozO
 eWY7KG6zzDk0iJtGXKKLh7MjSEDHuHejWBv4KrsMtztwWMwzz5rQRRDEb
 AmN5amrzWiejh7G8Fuj95uhAsDIynWZzM76u+CLw4WSvmva59B19nl576
 gZyavmcrw2JxA/cyOTmSk0uveEw1gurwpT3p+pXJFaHstwf3SW1RLtVbz
 KLF5w8KaaNx5eRUV3bpcykekQoQZtJ1Hf2zSS8091CRVSvE9qgOxHpiqj Q==;
X-CSE-ConnectionGUID: KixqCCO9TfyAhs9cHV4VsA==
X-CSE-MsgGUID: 3CE0wTXmSaG+ckWdOEbW5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66739214"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="66739214"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:18 -0700
X-CSE-ConnectionGUID: M2hqDXSFSlacjpJ1SO4Z4w==
X-CSE-MsgGUID: zchBnUuoQSm+WamVj2El/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="183089189"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 19:27:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 11/24] drm/xe/nvl: Define NVL-S platform
Date: Thu, 16 Oct 2025 19:26:30 -0700
Message-ID: <20251016-xe3p-v3-11-3dd173a3097a@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
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
v2: Fix rebase on flags moving to the device descriptor (Gustavo)
---
 drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 include/drm/intel/pciids.h             |  9 +++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index fac46178cebba..0546442e2a631 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -377,6 +377,17 @@ static const struct xe_device_desc ptl_desc = {
 	.vm_max_level = 4,
 };
 
+static const struct xe_device_desc nvls_desc = {
+	PLATFORM(NOVALAKE_S),
+	.dma_mask_size = 46,
+	.has_display = true,
+	.has_flat_ccs = 1,
+	.max_gt_per_tile = 2,
+	.require_force_probe = true,
+	.va_bits = 48,
+	.vm_max_level = 4,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -405,6 +416,7 @@ static const struct pci_device_id pciidlist[] = {
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

