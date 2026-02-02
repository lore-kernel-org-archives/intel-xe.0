Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD62E7FDF2
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C310E49A;
	Mon,  2 Feb 2026 21:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCj+9oct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDB510E49A;
 Mon,  2 Feb 2026 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068665; x=1801604665;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VywB4vITL5Kv9+WiHDYNb/2eKNlhuErLbvl3WtxmvD0=;
 b=eCj+9oct1Q8DtL8UqFwWbtpKppgfnFotmj/Zxs6rqiwf+vWjeBW9549K
 fok8NGEK52NshJBRMU7gs1q65WMXT4UIWJeQQhqYcqrnyDYRuL1TJMlO3
 TB7Fmq2JVT/9xpOqtezq8ZTwePH2+EHhrAHSaRgd3eFOk6dSaRFv9VyLr
 co9xUdCReaeOM7KcOcwfby3XErRuSJLpKkFvfX8VAwOjd4aJYoC+22k8A
 eIrGx902/tzNx0M01CjZUi5nQHrTdcbhScRChVyp+FXhR0RrUWQTVEcju
 LtsOyIHCfwgAPg8FupLlp9JPbn4K/6KMFQ+2avoMCwKzmobxPxxvhWk2d A==;
X-CSE-ConnectionGUID: Jcth07FAQYmw2FYfeNg1kw==
X-CSE-MsgGUID: SYMUMO5DSoitROllR8eAWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814360"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:24 -0800
X-CSE-ConnectionGUID: QOb8is2wS82ZXC1pstRhyw==
X-CSE-MsgGUID: OgjrQYokToK4Rm4FEUKRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646872"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:23 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:19 -0300
Subject: [PATCH 13/16] drm/xe/nvlp: Add NVL-P platform definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-13-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>
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

Add platform definition along with device IDs for NVL-P.

BSpec: 74201
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
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
index 9bcf7c067479..1ce4115e117e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -438,6 +438,20 @@ static const struct xe_device_desc cri_desc = {
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
 
@@ -468,6 +482,7 @@ static const struct pci_device_id pciidlist[] = {
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

