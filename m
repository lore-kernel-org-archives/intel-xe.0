Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE08C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 12:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993E110E455;
	Wed, 14 Aug 2024 12:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="cXUx0nAc";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC1D10E455
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 12:04:49 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1723637081; bh=eYGdp2GigXyiUaTzNWdpTJucqzTuYTKdAZCwzIhpudw=;
 h=From:To:Cc:Subject:Date:From;
 b=cXUx0nAcBiKgBTcnVnI7p7gphvsAegh3D3lei+iydgeH6fBg9duA/PgX4tIzlm6CI
 Is/Y++9QI105CU0U7MbXqL6ICdAi2p9l5lb/LmuorOw0CLTmw57Jg1IHdKOP4ABuRZ
 o4C/figJxrzKg63+gGhx4f1979Mqo/itphQ7BbCbBNfK9VyhQOqJahYlfCyE94zG2W
 kP98ybpVOWl7cj/gn8J6yQb+2FbUESZSMaFaLgH1IuFCA/auZTB6C8NDfPMP+AlVgQ
 SouOshW+89s7iZCkENPspWtR0cJRf3z6tEcslYQk/0wKN0L4J9lCkbN2mEadcuxWvT
 Yl/El7fPas7zg==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 47EC4ZTC2040525; Wed, 14 Aug 2024 15:04:35 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: farah.kassabri@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH v2] drm/xe: add wopcm device info and set region into Guc
 registers
Date: Wed, 14 Aug 2024 15:04:32 +0300
Message-Id: <20240814120432.2040511-1-fkassabri@habana.ai>
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

Guc FW is loaded to the DSM WOPCM region.
Guc DMA engine reads the WOPCM base address and size from
guc registers DMA_GUC_WOPCM_OFFSET and GUC_WOPCM_SIZE, do some sanity
checks and alignmnets, then load the FW there.
This patch will set the region size at init.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Changes in v2:
Keep the xe_wopcm_size function and return the new attribute
from it.
---

 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c         |  1 -
 drivers/gpu/drm/xe/xe_pci.c          | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_wopcm.c        | 12 +-----------
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66d..013d61d11288 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -241,6 +241,8 @@ struct xe_device {
 		u32 media_verx100;
 		/** @info.mem_region_mask: mask of valid memory regions */
 		u32 mem_region_mask;
+		/** @info.wopcm_size: wopcm region size */
+		u32 wopcm_size;
 		/** @info.platform: XE platform enum */
 		enum xe_platform platform;
 		/** @info.subplatform: XE subplatform enum */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0cdbc1296e88..6d3b3ab50b93 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -227,7 +227,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
-
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7bb811b4a057..fc7dbf5ef74d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -54,6 +54,8 @@ struct xe_device_desc {
 
 	enum xe_platform platform;
 
+	u32 wopcm_size;
+
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
@@ -223,6 +225,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -287,6 +290,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
@@ -312,6 +316,7 @@ static const struct xe_device_desc ats_m_desc = {
 	DG2_FEATURES,
 	.has_display = false,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -321,6 +326,7 @@ static const struct xe_device_desc dg2_desc = {
 
 	DG2_FEATURES,
 	.has_display = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc pvc_desc = {
@@ -330,6 +336,7 @@ static const struct xe_device_desc pvc_desc = {
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -337,12 +344,14 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
 	.has_display = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.has_display = true,
 	.require_force_probe = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -351,6 +360,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_display = true,
 	.require_force_probe = true,
 	.has_heci_cscfi = 1,
+	.wopcm_size = SZ_4M,
 };
 
 #undef PLATFORM
@@ -620,7 +630,7 @@ static int xe_info_init_early(struct xe_device *xe,
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

