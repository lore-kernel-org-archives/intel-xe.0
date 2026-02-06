Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6825EE6B4B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894B10E8D6;
	Fri,  6 Feb 2026 18:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGlS4YBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D4810E8A5;
 Fri,  6 Feb 2026 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770403008; x=1801939008;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vQ4DCcUrZMNbhzZKbHTxWFDC8dH32VslfsyuaMfw8xA=;
 b=AGlS4YBxPrPNk2Bdj1/cvtGJZDXgeAuW6NIdwRrJYMxSbdUqhyZN5asu
 BQ1F0eSs/aQzQVU4U2ZC5HOE96CADF/3DQ6GMDYWkd6HEKn+3O9QcJLPu
 GRxQ1lXCgVXUs1citScwjcbqb6nCzV4gEh9HggozQbz209vyYCyxAi44h
 xYpYhP2+DrAYHrBWctKMX4NxJHXZfccGjtKEiNbBaQY11ndjN8xD7svQz
 mQ4/X8UhwoYFGzg3OUrOHKUC6ZHCMiDq/Ph40X8tj42gjWt3JZryKqzbo
 IWfUELU9EG7diY2dNSBc34+VFxWsHEuw3f82ksgtewSfzJtwvc/BnCPyE g==;
X-CSE-ConnectionGUID: WTHWZo1gQ2KTPx9+UWUKjw==
X-CSE-MsgGUID: 737tiQ4rRtyp6boNgbgo8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516960"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516960"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:47 -0800
X-CSE-ConnectionGUID: wr71HFhUS+qC99wPpTgO/w==
X-CSE-MsgGUID: ccxa06kZRD2am2880VsPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224774"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:46 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:08 -0300
Subject: [PATCH v3 12/15] drm/xe/nvlp: Add NVL-P platform definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-12-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add platform definition along with device IDs for NVL-P.  Here is the
list of device descriptor fields and associated Bspec references:

  .dma_mask_size (Bspec 74198)
  .has_cached_pt (Bspec 71582)
  .has_display (Bspec 74196)
  .has_flat_ccs (Bspec 74110)
  .has_page_reclaim_hw_assist (Bspec 73451)
  .max_gt_per_tile (Bspec 74196)
  .va_bits (Bspec 74198)
  .vm_max_level (Bspec 59507)

v2:
  - Add list of descriptor fields and Bspec references. (Matt)

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             |  4 ++--
 drivers/gpu/drm/xe/xe_pci.c            | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_platform_types.h |  1 +
 include/drm/intel/pciids.h             | 12 ++++++++++++
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 8bf16d60b9a5..9e998f9708df 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -512,8 +512,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		/*
 		 * Display scanout is always non-coherent with the CPU cache.
 		 *
-		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
-		 * non-coherent and require a CPU:WC mapping.
+		 * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
+		 * lookups are also non-coherent and require a CPU:WC mapping.
 		 */
 		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
 		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c11e4723e57e..cdee7a9acf14 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -450,6 +450,20 @@ static const struct xe_device_desc cri_desc = {
 	.vm_max_level = 4,
 };
 
+static const struct xe_device_desc nvlp_desc = {
+	PLATFORM(NOVALAKE_P),
+	.dma_mask_size = 46,
+	.has_cached_pt = true,
+	.has_display = true,
+	.has_flat_ccs = 1,
+	.has_page_reclaim_hw_assist = true,
+	.has_pre_prod_wa = true,
+	.max_gt_per_tile = 2,
+	.require_force_probe = true,
+	.va_bits = 48,
+	.vm_max_level = 4,
+};
+
 #undef PLATFORM
 __diag_pop();
 
@@ -480,6 +494,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
 	INTEL_CRI_IDS(INTEL_PCI_DEVICE, &cri_desc),
+	INTEL_NVLP_IDS(INTEL_VGA_DEVICE, &nvlp_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index f516dbddfd88..6cff385227ea 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -26,6 +26,7 @@ enum xe_platform {
 	XE_PANTHERLAKE,
 	XE_NOVALAKE_S,
 	XE_CRESCENTISLAND,
+	XE_NOVALAKE_P,
 };
 
 enum xe_subplatform {
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 52520e684ab1..33b91cb2e684 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -900,4 +900,16 @@
 #define INTEL_CRI_IDS(MACRO__, ...) \
 	MACRO__(0x674C, ## __VA_ARGS__)
 
+/* NVL-P */
+#define INTEL_NVLP_IDS(MACRO__, ...) \
+	MACRO__(0xD750, ## __VA_ARGS__), \
+	MACRO__(0xD751, ## __VA_ARGS__), \
+	MACRO__(0xD752, ## __VA_ARGS__), \
+	MACRO__(0xD753, ## __VA_ARGS__), \
+	MACRO__(0XD754, ## __VA_ARGS__), \
+	MACRO__(0XD755, ## __VA_ARGS__), \
+	MACRO__(0XD756, ## __VA_ARGS__), \
+	MACRO__(0XD757, ## __VA_ARGS__), \
+	MACRO__(0xD75F, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */

-- 
2.52.0

