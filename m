Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769E7C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 12:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B678D10EAB1;
	Tue, 21 May 2024 12:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="tJZJ8/rh";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA610E5E4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 12:53:30 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716296003; bh=P3EPAlSH+v5ivGPkn4CIyY6GsSqULBv0yjmkttQHT3A=;
 h=From:To:Cc:Subject:Date:From;
 b=tJZJ8/rh0gyNUOvNHSrzVzS0zbAPq63xx+s3TnWOMBkqlPFxTbyoVvAndOco/aMsL
 /73LJg3sI0G+ziwIv3N32Q2JkPfezmFn0t3iqP0rXBmTzPkbcXWDPjX8BhFbbbBVbb
 J+GX8DLPo5uhIR3/Qgh6L3Vb75a2oRJnZ1SfQOJbxpZK71U11HrwoOFMCzgHwPCcAD
 cJLTJua+wD/hR4S4j+Y2PzAGlRzHtPBIRfjJqi33mGYo2UZgTdGhwX6Q0RjSEjLgbT
 RhVcQhPu8xc64tljTlKY/yLntit8fvBfAVjmwcYssWSrhd0qTFt2mQ7Kbm0fhG9CIk
 2JIsGuQ/RAbCw==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 44LCrHcD428788; Tue, 21 May 2024 15:53:17 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, farah.kassabri@intel.com
Subject: [PATCH v2] drm/xe: add wopcm device info and set region into Guc
 registers
Date: Tue, 21 May 2024 15:53:14 +0300
Message-Id: <20240521125314.428775-1-fkassabri@habana.ai>
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
Keep the xe_wopcm_size function and return the new attribute
from it.

---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_ggtt.c         |  1 -
 drivers/gpu/drm/xe/xe_pci.c          | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_wopcm.c        | 12 +-----------
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5c5e36de452a..383a7d216cc8 100644
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
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0d541f55b4fc..c6f0b9596f42 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -187,7 +187,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->pt_ops = &xelpg_pt_ops;
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
-
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682eafd84901..cc0ef48a65c1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -58,6 +58,8 @@ struct xe_device_desc {
 
 	enum xe_platform platform;
 
+	u32 wopcm_size;
+
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
@@ -226,6 +228,7 @@ static const struct xe_device_desc tgl_desc = {
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
@@ -311,6 +315,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -320,6 +325,7 @@ static const struct xe_device_desc dg2_desc = {
 
 	DG2_FEATURES,
 	.has_display = true,
+	.wopcm_size = SZ_2M,
 };
 
 static const struct xe_device_desc pvc_desc = {
@@ -329,6 +335,7 @@ static const struct xe_device_desc pvc_desc = {
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -336,12 +343,14 @@ static const struct xe_device_desc mtl_desc = {
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
@@ -349,6 +358,7 @@ static const struct xe_device_desc bmg_desc __maybe_unused = {
 	PLATFORM(XE_BATTLEMAGE),
 	.has_display = true,
 	.require_force_probe = true,
+	.wopcm_size = SZ_4M,
 };
 
 #undef PLATFORM
@@ -573,7 +583,7 @@ static int xe_info_init_early(struct xe_device *xe,
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

