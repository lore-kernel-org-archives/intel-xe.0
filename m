Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F045CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1839A10E537;
	Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ7vs5Ot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9210E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s9sh4qYBW1guTbN/3Vp+gXJXvuSy6XcJP5Fgd/nXbm8=;
 b=UZ7vs5OtxIEOp7NyDsCcLjTxs0R+c5YqSj/nJWK0FnRsPPZUdD6biE4c
 xYyUs3qMJAHqG4tMD1dQxAYzeR2JBDWJejGFhQIsb3JGf7W+B1rSRqFX/
 n+b5KuwoF6HqMcwJknSQgLmbTDWSZZrMe6HwclSOsrEwRAolOnLW2L21A
 8VOYczhxlrEXbTtZvfPfz9gPSVvHaTz9lFPYYup/BbknfdW/9CV6x12LE
 z8SjWObugl+5bqRsNmPm+P8yPFDCf54ratRDj3sdIALqJSeoUNzyo+Xib
 Q1iUv+W1eD/V6c7sNmZ8WRKpLzd1XBEK27JKRjQsDlXg+BYaG22to/zfI g==;
X-CSE-ConnectionGUID: hJdXGtHQSzSG9PpUdf3mqw==
X-CSE-MsgGUID: FWUuL1qaTIaHZ9tfSma9OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414878"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: 7LCZH5FwQEyd0mjk3c/vFw==
X-CSE-MsgGUID: hHz3a9UdQNmFcmfc6D8FTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567308"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 14/23] drm/xe/nvl: Define NVL-S platform
Date: Mon, 13 Oct 2025 20:24:46 -0700
Message-ID: <20251013-xe3p-v1-14-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
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
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 include/drm/intel/pciids.h             | 9 +++++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8480e53990031..aa8359a4c5594 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -354,6 +354,14 @@ static const struct xe_device_desc ptl_desc = {
 	.needs_shared_vf_gt_wq = true,
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
 
@@ -382,6 +390,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
 	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
 	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
+	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index d08574c4cdb8b..f5140a244daf3 100644
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
index 69d4ae92d822a..00dd007f538ff 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -884,4 +884,13 @@
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

