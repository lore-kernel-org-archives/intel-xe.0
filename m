Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DED4C77B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 23:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9EE10ED6C;
	Thu,  6 Apr 2023 23:56:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C2810ED63
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 23:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680825399; x=1712361399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AJ9gm/67w/7GdVwrxTdAIBW9f4Xbp8aQIloJ4SzyGUY=;
 b=OznYIMQ8Yj5m0nmi1JDOva8oKfAk5A0SoxC7RgRHnyJL2Qlo2S7xTukx
 oNz3AEk1t0bhVGPGGv++uCzcELRwfi6Y6nDg4LUIUjM7EUJHP7g7ZzeCH
 u7LRngk69sa9gZ+rlypYR+Nu7U7de5/zBJNgNokfew3yIdYKTHLslDwz3
 o5AqMC6tCSvFwVaGojaXpXe6tBixcLnR3qFajDBmQzLCNSczo9ZoFGJXu
 Wpo8hZunvc/AfVv58JaABMKVCWxmJoz/em7B5xhrB111hd753sAKf8ypE
 QKs5HIw9P5avdfYksa+m+FDdD4+jAR87Xd3xxhd7OfJpGH3Nxoh6q5mzj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344640873"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="344640873"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861587187"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="861587187"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 16:56:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 16:56:18 -0700
Message-Id: <20230406235621.1914492-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406235621.1914492-1-matthew.d.roper@intel.com>
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 6/9] drm/xe: Add printable name to IP
 descriptors
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Printing the name, along with the IP version number, will help reduce
confusion about which IP is present on a platform.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
 drivers/gpu/drm/xe/xe_pci.c          | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pci_types.h    |  2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6fb53a54913f..f5399b284e3b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -57,6 +57,10 @@ struct xe_device {
 
 	/** @info: device info */
 	struct intel_device_info {
+		/** @graphics_name: graphics IP name */
+		const char *graphics_name;
+		/** @media_name: media IP name */
+		const char *media_name;
 		/** @graphics_verx100: graphics IP version */
 		u32 graphics_verx100;
 		/** @media_verx100: media IP version */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a5456788bca9..4442fb58202e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -75,6 +75,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 #define NOP(x)	x
 
 static const struct xe_graphics_desc graphics_xelp = {
+	.name = "Xe_LP",
 	.ver = 12,
 	.rel = 0,
 
@@ -85,6 +86,7 @@ static const struct xe_graphics_desc graphics_xelp = {
 };
 
 static const struct xe_graphics_desc graphics_xelpp = {
+	.name = "Xe_LP+",
 	.ver = 12,
 	.rel = 10,
 
@@ -101,6 +103,7 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.vm_max_level = 3
 
 static const struct xe_graphics_desc graphics_xehpg = {
+	.name = "Xe_HPG",
 	.ver = 12,
 	.rel = 55,
 
@@ -114,6 +117,7 @@ static const struct xe_graphics_desc graphics_xehpg = {
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
+	.name = "Xe_HPC",
 	.ver = 12,
 	.rel = 60,
 
@@ -139,6 +143,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
+	.name = "Xe_LPG",
 	.ver = 12,
 	.rel = 70,
 
@@ -151,6 +156,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 };
 
 static const struct xe_media_desc media_xem = {
+	.name = "Xe_M",
 	.ver = 12,
 	.rel = 0,
 
@@ -160,6 +166,7 @@ static const struct xe_media_desc media_xem = {
 };
 
 static const struct xe_media_desc media_xehpm = {
+	.name = "Xe_HPM",
 	.ver = 12,
 	.rel = 55,
 
@@ -169,6 +176,7 @@ static const struct xe_media_desc media_xehpm = {
 };
 
 static const struct xe_media_desc media_xelpmp = {
+	.name = "Xe_LPM+",
 	.ver = 13,
 	.rel = 0,
 
@@ -390,6 +398,8 @@ static void xe_info_init(struct xe_device *xe,
 					 desc->media->rel;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.platform = desc->platform;
+	xe->info.graphics_name = desc->graphics->name;
+	xe->info.media_name = desc->media ? desc->media->name : "none";
 	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
 	xe->info.vram_flags = desc->graphics->vram_flags;
 	xe->info.vm_max_level = desc->graphics->vm_max_level;
@@ -493,12 +503,17 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe_info_init(xe, desc, subplatform_desc);
 	xe_display_info_init(xe);
 
-	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx100:%d media100:%d dma_m_s:%d tc:%d",
+	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
 		desc->platform_name,
 		subplatform_desc ? subplatform_desc->name : "",
 		xe->info.devid, xe->info.revid,
-		xe->info.is_dgfx, xe->info.graphics_verx100,
-		xe->info.media_verx100,
+		xe->info.is_dgfx,
+		xe->info.graphics_name,
+		xe->info.graphics_verx100 / 100,
+		xe->info.graphics_verx100 % 100,
+		xe->info.media_name,
+		xe->info.media_verx100 / 100,
+		xe->info.media_verx100 % 100,
 		xe->info.dma_mask_size, xe->info.tile_count);
 
 	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f4bc5ef1bce3..e479c1c4ed30 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_graphics_desc {
+	const char *name;
 	u8 ver;
 	u8 rel;
 
@@ -28,6 +29,7 @@ struct xe_graphics_desc {
 };
 
 struct xe_media_desc {
+	const char *name;
 	u8 ver;
 	u8 rel;
 
-- 
2.39.2

