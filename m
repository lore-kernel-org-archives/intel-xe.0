Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B89AC76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E2810E15D;
	Mon, 10 Apr 2023 18:39:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6787310E1B1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151969; x=1712687969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dsEYt6iGSpzV55sNIbghlHySDsRBEwczvphpYVDwThs=;
 b=h1MXoSbpK/vOsCpGbfmsGZuHJtwuzMb2D/+RHgiT2gAaQ+x2YM2hGkzK
 /FcvGPf4LH9i00jsu+snRcnqySs+XRMpzisB7QyrY1mmNfJ1eKQAe6RWs
 kMA/kCU5nWYJ0Vyk2pLShmSBC6lf2H/oQc2BZgBi5ak0yUCo5/L3dgSXy
 OPzK7xroz6RusEIYg4Bek0GDkyYZE/qYrcjHtRdFI/t0TJvWJyfluU9Ss
 KaRgaLFZJFh2mmuVMtkJFv36JAJgX80VHpyyn0Zz3rlIJ4ZWXido2cTUM
 nSAYlbAKGAOhkAzUa+M/vrWt1D1SNGSIC+4+V0hJ/kwU0benj4ROjg91k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327521140"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="327521140"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="752857965"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="752857965"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:39:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Apr 2023 11:39:09 -0700
Message-Id: <20230410183910.2696628-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410183910.2696628-1-matthew.d.roper@intel.com>
References: <20230410183910.2696628-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Track whether platform has LLC
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

Some driver initialization is conditional on the presence of an LLC.
Add an extra feature flag to support this.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9ce6e348dd29..42a82dd7631a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -98,6 +98,8 @@ struct xe_device {
 		u8 has_flat_ccs:1;
 		/** @has_4tile: Whether tile-4 tiling is supported */
 		u8 has_4tile:1;
+		/** @has_llc: Device as a shared CPU+GPU last level cache */
+		u8 has_llc:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
 		/** @has_link_copy_engines: Whether the platform has link copy engines */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b92d8b5a391e..4b01d8c538ae 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -56,6 +56,7 @@ struct xe_device_desc {
 	 * should eventually move entirely into the display code's own logic.
 	 */
 	u8 has_4tile:1;
+	u8 has_llc:1;
 };
 
 __diag_push();
@@ -176,6 +177,7 @@ static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_TIGERLAKE),
+	.has_llc = 1,
 	.require_force_probe = true,
 };
 
@@ -183,6 +185,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_S),
+	.has_llc = 1,
 	.require_force_probe = true,
 };
 
@@ -192,6 +195,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(XE_ALDERLAKE_P),
+	.has_llc = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
@@ -497,6 +501,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_4tile = desc->has_4tile;
+	xe->info.has_llc = desc->has_llc;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
-- 
2.39.2

