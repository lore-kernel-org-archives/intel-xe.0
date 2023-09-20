Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A8DCE79AC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 09:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993C210E475;
	Wed, 20 Sep 2023 09:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E2D10E475
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695201829; x=1726737829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PU/+VooEDTR8KIjZIhosROtp+J92FMcpEeYpHRPxDe4=;
 b=ZeubMx3FHzeI0JxL3u49qGWuMv4gxaZg++glyZAr/v97bhM2IMZjAcYQ
 1QsVnnoJvVF0PnSV/aPwjUqZsb/LksO9bZ6xb8kSj4Fu2RAz54daw2MoW
 sm1zvvHyU6XzqDaLoU0rDlrcJax9EHkRQ5OSu7/H2P6V6lOevUF8YJRoM
 D/mUzFqqemEU11mrU12LPbkqMRch354TlfAAhcAEJ7xojRMW+JEdAiwgY
 +69xoVU4nOrdKekVe3qOjDwwjRQTsZu0DlLRxuRbztZ+KurGpkLPWTL49
 x4Qm8LJXNYagaOD3WupMb813oZihjs/38UKcqxsEZ5UnJXsVbisyu5O87 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444267607"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="444267607"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781625280"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="781625280"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 02:23:46 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 20 Sep 2023 12:19:21 +0300
Message-Id: <20230920091923.1573873-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920091923.1573873-1-alexander.usyskin@intel.com>
References: <20230920091923.1573873-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/4] drm/xe/gsc: add has_heci_gscfi indication
 to device
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

Mark support of MEI-GSC interaction per device.
Add has_heci_gscfi indication to xe_device and xe_pci structures.
Mark DG1 and DG2 devices as supported.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 3 +++
 drivers/gpu/drm/xe/xe_pci.c          | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 750e1f0d3339..1d1fe53fc30d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -32,6 +32,7 @@ struct xe_ggtt;
 #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
 #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
 #define IS_DGFX(xe) ((xe)->info.is_dgfx)
+#define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
 
 #define XE_VRAM_FLAGS_NEED64K		BIT(0)
 
@@ -237,6 +238,8 @@ struct xe_device {
 		u8 has_link_copy_engine:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
+		/** @has_heci_gscfi: device has heci gscfi */
+		u8 has_heci_gscfi:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..145eaa430d74 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -57,6 +57,7 @@ struct xe_device_desc {
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 	u8 has_display:1;
+	u8 has_heci_gscfi:1;
 
 	u8 has_llc:1;
 };
@@ -265,6 +266,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(XE_DG1),
 	.has_display = true,
 	.require_force_probe = true,
+	.has_heci_gscfi = 1,
 };
 
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
@@ -274,6 +276,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(XE_DG2), \
+	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
@@ -562,6 +565,7 @@ static int xe_info_init(struct xe_device *xe,
 		return -ENODEV;
 
 	xe->info.is_dgfx = desc->is_dgfx;
+	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
@@ -703,7 +707,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	xe_display_info_init(xe);
 
-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d",
+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) display:%s dma_m_s:%d tc:%d gscfi:%d",
 		desc->platform_name,
 		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
@@ -715,7 +719,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe->info.media_verx100 / 100,
 		xe->info.media_verx100 % 100,
 		str_yes_no(xe->info.enable_display),
-		xe->info.dma_mask_size, xe->info.tile_count);
+		xe->info.dma_mask_size, xe->info.tile_count,
+		xe->info.has_heci_gscfi);
 
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
 		xe_step_name(xe->info.step.graphics),
-- 
2.34.1

