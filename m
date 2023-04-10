Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D35FC77B6F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B7610E1E2;
	Mon, 10 Apr 2023 18:39:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEA410E15D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151969; x=1712687969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMn+TjAE1PipsgP9cdU9l3PyOBqvldbCeYMSXlMaM4Y=;
 b=VE5k9XyVDXdm1ftx1a6NIKf4cKvohkLaa1gNiEW+vsrK/vEel6kG2kTK
 VxQJ6TM3JbN6mlqcsfHcIWNy8ZoPU3glaCI/AHDCkGkMtp8A7PF/ffkgo
 bpWF+uco7WPyL5uDeQHuewovKUPuUdqrsFRHsXQ3H3TzNaAYEywFvGHeS
 DuxKeibUXmQ++BB30DItvcNi0ct8DGBrtF/vOUs51VKHlLw/P/nQK5MCT
 mehE+TdFI/GVQRjshE/V49uhwlQt5jTWa4FC2qsxV5whRUcB0lahPpQrj
 yjGhmxdBGN7HjWVLmfldtskHr3KxWuM5C+pQCvVQe7d+LNMKcEYab3Zsf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327521139"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="327521139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752857962"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752857962"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:39:08 -0700
Message-Id: <20230410183910.2696628-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Use packed bitfields for xe->info
 feature flags
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace 'bool' fields with single bits to allow the various device
feature flags to pack more tightly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f5399b284e3b..9ce6e348dd29 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -67,8 +67,6 @@ struct xe_device {
 		u32 media_verx100;
 		/** @mem_region_mask: mask of valid memory regions */
 		u32 mem_region_mask;
-		/** @is_dgfx: is discrete device */
-		bool is_dgfx;
 		/** @platform: XE platform enum */
 		enum xe_platform platform;
 		/** @subplatform: XE subplatform enum */
@@ -87,22 +85,25 @@ struct xe_device {
 		u8 tile_count;
 		/** @vm_max_level: Max VM level */
 		u8 vm_max_level;
+
+		/** @is_dgfx: is discrete device */
+		u8 is_dgfx:1;
 		/** @supports_usm: Supports unified shared memory */
-		bool supports_usm;
+		u8 supports_usm:1;
 		/** @has_asid: Has address space ID */
-		bool has_asid;
+		u8 has_asid:1;
 		/** @enable_guc: GuC submission enabled */
-		bool enable_guc;
+		u8 enable_guc:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
-		bool has_flat_ccs;
+		u8 has_flat_ccs:1;
 		/** @has_4tile: Whether tile-4 tiling is supported */
-		bool has_4tile;
+		u8 has_4tile:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
-		bool has_range_tlb_invalidation;
+		u8 has_range_tlb_invalidation:1;
 		/** @has_link_copy_engines: Whether the platform has link copy engines */
-		bool has_link_copy_engine;
+		u8 has_link_copy_engine:1;
 		/** @enable_display: display enabled */
-		bool enable_display;
+		u8 enable_display:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct xe_device_display_info {
-- 
2.39.2

