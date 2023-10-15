Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BE9CDB47E
	for <intel-xe@archiver.kernel.org>; Sun, 15 Oct 2023 12:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFE910E055;
	Sun, 15 Oct 2023 12:23:18 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B575A10E055
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Oct 2023 12:23:16 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1697372592; bh=+jY2CKQS1yo6nuS+X/oraU+7W7d8ke9fAmkoSHnY2+M=;
 h=From:To:Subject:Date:From;
 b=JJnqrh6FIxGuHcfZ2MJt49d5Ss59YejKlv4SjQMFnGu0uSl2rxGkD6m1N+b4wDsBs
 j88KOtpTfMbswy/fL0Byd65FjNQD3YrymMmtFkMOCIGQF6+2FM8hNtbnlHfx5kvziS
 OJV3gOn+go6prHZJXt1YD9BdqJZpKfXRL7BBKsLCsMkjfCZZInAOpfZcj/admcmel/
 Da8ljADGOZhRwq6HbTwalF6MLq+9q6JR6iSbDfsNMObyv0c7DU3ywWOgdP9VL1u35c
 7DIJqpcN+aeYw4X5jAXfnNvDhPbtaTNVs7uPTYRlR3QYE6o3BFihz5FNIuS0UtsORv
 1s4rjDps2GQ9w==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 39FCN7Zc1191695
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Oct 2023 15:23:07 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Sun, 15 Oct 2023 15:23:07 +0300
Message-Id: <20231015122307.1191684-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: add has_pcode flag
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

Per device, this flag indicates whether PCODE uC exists.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c        |  9 +++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bc375ddda5a7..8e327673c05c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -257,6 +257,8 @@ struct xe_device {
 		u8 bypass_mtcfg:1;
 		/** @supports_mmio_ext: supports MMIO extension/s */
 		u8 supports_mmio_ext:1;
+		/** @has_pcode: device has a PCODE uC */
+		u8 has_pcode:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 99ccee07f8cd..2aac0f4df50c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -61,6 +61,7 @@ struct xe_device_desc {
 	u8 has_llc:1;
 	u8 bypass_mtcfg:1;
 	u8 supports_mmio_ext:1;
+	u8 has_pcode:1;
 };
 
 __diag_push();
@@ -212,6 +213,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
@@ -236,6 +239,7 @@ static const struct xe_device_desc adl_s_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
 		{},
 	},
+	.has_pcode = true,
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -251,6 +255,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -260,6 +265,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 #define DGFX_FEATURES \
@@ -272,6 +278,7 @@ static const struct xe_device_desc dg1_desc = {
 	PLATFORM(XE_DG1),
 	.has_display = true,
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
@@ -295,6 +302,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc dg2_desc = {
@@ -304,6 +312,7 @@ static const struct xe_device_desc dg2_desc = {
 
 	DG2_FEATURES,
 	.has_display = true,
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc pvc_desc = {
@@ -312,6 +321,7 @@ static const struct xe_device_desc pvc_desc = {
 	PLATFORM(XE_PVC),
 	.has_display = false,
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -319,11 +329,13 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.has_display = true,
+	.has_pcode = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(XE_LUNARLAKE),
 	.require_force_probe = true,
+	.has_pcode = true,
 };
 
 #undef PLATFORM
@@ -576,6 +588,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
+	xe->info.has_pcode = desc->has_pcode;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 4a240acf7625..d895cb1e16c7 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
 {
 	int err;
 
+	if (!gt_to_xe(gt)->info.has_pcode)
+		return 0;
+
 	lockdep_assert_held(&gt->pcode.lock);
 
 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
@@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
 	int timeout_us = 180000000; /* 3 min */
 	int ret;
 
+	if (!gt_to_xe(gt)->info.has_pcode)
+		return 0;
+
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
@@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
 {
 	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
 
+	if (!gt_to_xe(gt)->info.has_pcode)
+		return 0;
+
 	if (!IS_DGFX(gt_to_xe(gt)))
 		return 0;
 
-- 
2.34.1

