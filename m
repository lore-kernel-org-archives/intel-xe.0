Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C36C25B77
	for <intel-xe@archiver.kernel.org>; Sun, 19 May 2024 11:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D623110E0B7;
	Sun, 19 May 2024 11:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Dd5jX4BX";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A9310E0B7
 for <intel-xe@lists.freedesktop.org>; Sun, 19 May 2024 11:41:01 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716118862; bh=Rcmt6xQAQuYUU1TKZoncYYBe44yD+Oju8F6CyUmb7KY=;
 h=From:To:Cc:Subject:Date:From;
 b=Dd5jX4BXQgpnTNX5PkwT9JuMZEKaoxCBwvS+bJ9qFDIQOobwt5lzYZdX3vaQt1ghk
 51pyWmyskldK36ZwLlT9Xivca7aMTm4ezClnuEfnz715X+iUm29XMyjXY0/S5LsQI3
 O9XtBOYYbZGIVLoMKXrqahqK1zifH63P6d832g7/rM2MvMyz2lr8PAn7aFOIRXJAkY
 XlA1KsjHqwzXpg5Q5CHFOQ1hG1/kcGpXzPR/T3rHXTIVSNettCOOCLTmHwxDUBw00D
 8FaJdB9q2v9C7s/bnb2KUqZCvO+l2cy6OeJdPJk7QbZEG+QrJ/onTtCLg0+Uz3S/8X
 8Hp8z+fScy+HA==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 44JBemSh277341; Sun, 19 May 2024 14:40:48 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
Subject: [PATCH v2 5/5] drm/xe: add wopcm region size to the device info
Date: Sun, 19 May 2024 14:40:44 +0300
Message-Id: <20240519114044.277328-1-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

As each product may have different wopcm region size,
it's better to have this information as part of the device
descriptor, that way we won't need to keep adding more
else cases to the function which retrieve that size for
future products.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Changes in v2:
Keep xe_wopcm_size function and change it to just return
the wopcm size from the descriptor.

---
 drivers/gpu/drm/xe/xe_device_types.h       |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_wopcm.c              | 12 +-----------
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 2e62450d86e1..fa3c7ca2f2d4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -230,6 +230,8 @@ struct xe_device {
 		u32 media_verx100;
 		/** @info.mem_region_mask: mask of valid memory regions */
 		u32 mem_region_mask;
+		/** @info.wopcm_size: wopcm region size */
+		u32 wopcm_size;
 		/** @info.platform: XE platform enum */
 		enum xe_platform platform;
 		/** @info.subplatform: XE subplatform enum */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 79116ad58620..fd391ba77fa5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1932,7 +1932,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
+	u64 hole_min_start = gt_to_xe(gt)->info.wopcm_size;
 	u64 hole_start, hole_end, hole_size;
 	u64 spare, avail, total = 0;
 	char buf[10];
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a0cf5dd803c2..55f977124647 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -57,6 +57,8 @@ struct xe_device_desc {
 
 	enum xe_platform platform;
 
+	u32 wopcm_size;
+
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
@@ -221,6 +223,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -282,6 +285,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
@@ -306,6 +310,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -315,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
 
 	DG2_FEATURES,
 	.has_display = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc pvc_desc = {
@@ -324,6 +330,7 @@ static const struct xe_device_desc pvc_desc = {
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -331,18 +338,21 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.has_display = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(XE_LUNARLAKE),
 	.has_display = true,
 	.require_force_probe = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc bmg_desc __maybe_unused = {
 	DGFX_FEATURES,
 	PLATFORM(XE_BATTLEMAGE),
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 #undef PLATFORM
@@ -567,7 +577,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
-
+	xe->info.wopcm_size = desc->wopcm_size;
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				  xe_modparam.enable_display &&
 				  desc->has_display;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index d3a99157e523..35878b5384a1 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -45,14 +45,6 @@
  * The top part of the WOPCM is reserved for hardware contexts (e.g. RC6
  * context).
  */
-
-/* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
-/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
-#define DGFX_WOPCM_SIZE			SZ_4M
-/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
-#define MTL_WOPCM_SIZE			SZ_4M
-#define WOPCM_SIZE			SZ_2M
-
 #define MAX_WOPCM_SIZE			SZ_8M
 
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
@@ -179,9 +171,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 
 u32 xe_wopcm_size(struct xe_device *xe)
 {
-	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
-		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
-		WOPCM_SIZE;
+	return xe->info.wopcm_size;
 }
 
 /**
-- 
2.34.1

