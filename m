Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D3CC021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CDF10EB29;
	Fri, 21 Feb 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1j4FRgH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA3310EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163961; x=1771699961;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CjkLeHnU8+VlH+B8O+2iFzWgLdTzW7QdmN9uHnhMNvQ=;
 b=G1j4FRgHfy4iPkXwFY9z+gO0GpRht5CJxZgu2pP1nU0UpJUmX2PI4tIK
 ImJuI1u/pstkoNMU1ehHXITUgP4DnU6noYqdqSlG3F+MAialVECm0ZxiG
 xOSVsyqtBcAG+/+4AD5MQ5otT5vfzXTtmGDAAnTtsOhYS5IqEsEzU9Dir
 rTIbcgcGnDVoFCtpkX6eYtyk2VqqVGdorglSgz9apqMTx4ezTdqO5LF93
 tfvMFc1BM0g8nMz/GBUWc2Ml1OB6AmstM6VSsPZNvmw1sRUw2sXfRePkG
 gR7Qfk99wR2Rn2R0CRISFCAi2WqLyryzdEay34LN0XIN1r2sNwanmvlRv w==;
X-CSE-ConnectionGUID: dEwISUprTiW0IoTMvmiOkQ==
X-CSE-MsgGUID: lH586gKtT4mP/kjnUoTbfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403686"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403686"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:41 -0800
X-CSE-ConnectionGUID: pJ750a+BSaKXC9TJSdz+qQ==
X-CSE-MsgGUID: VaGMJKEUTce3GHpxjXDAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071338"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:40 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:44 -0300
Subject: [PATCH v2 5/7] drm/xe: Convert pre-GMDID IPs to struct xe_ip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-5-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

We have now a struct xe_ip to fully describe an IP, but we are only
using that for GMDID-based IPs.

For pre-GMDID IPs, we still describe release info (version and name) via
feature descriptors (struct xe_{graphics,media}_desc). Let's convert
those to use struct xe_ip.

With this, we have a uniform way of describing IPs in the xe driver
instead of having different approaches based on whether the IPs use
GMDIDs or not.

A nice side-effect of this change is that now we have an easy way to
lookup, in the source code, mappings between versions, names and
features for all supported IPs.

v2:
  - Store pointers to struct xe_ip instead xe_{graphics,media}_desc in
    struct xe_device_desc.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |   2 +-
 drivers/gpu/drm/xe/xe_pci.c       | 112 ++++++++++++++++++--------------------
 drivers/gpu/drm/xe/xe_pci_types.h |   8 ---
 3 files changed, 53 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 5132c1961472f7d039783193d608721a717252da..1d3e2e50c35509cf8de039052784d54227bfd1d9 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -110,7 +110,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 
 	xe_info_init_early(xe, desc, subplatform_desc);
-	xe_info_init(xe, desc->graphics, desc->media);
+	xe_info_init(xe, desc);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2c00b37e2e835a7c2edad1475a2b76964ee85b8c..b533251300bd4d086618d2a98b44eae52e996847 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -46,9 +46,9 @@ struct xe_subplatform_desc {
 
 struct xe_device_desc {
 	/* Should only ever be set for platforms without GMD_ID */
-	const struct xe_graphics_desc *graphics;
+	const struct xe_ip *pre_gmdid_graphics_ip;
 	/* Should only ever be set for platforms without GMD_ID */
-	const struct xe_media_desc *media;
+	const struct xe_ip *pre_gmdid_media_ip;
 
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
@@ -82,10 +82,6 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 #define NOP(x)	x
 
 static const struct xe_graphics_desc graphics_xelp = {
-	.name = "Xe_LP",
-	.ver = 12,
-	.rel = 0,
-
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.va_bits = 48,
@@ -93,10 +89,6 @@ static const struct xe_graphics_desc graphics_xelp = {
 };
 
 static const struct xe_graphics_desc graphics_xelpp = {
-	.name = "Xe_LP+",
-	.ver = 12,
-	.rel = 10,
-
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
 	.va_bits = 48,
@@ -109,10 +101,6 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.vm_max_level = 3
 
 static const struct xe_graphics_desc graphics_xehpg = {
-	.name = "Xe_HPG",
-	.ver = 12,
-	.rel = 55,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
@@ -125,10 +113,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
-	.name = "Xe_HPC",
-	.ver = 12,
-	.rel = 60,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
 		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
@@ -175,20 +159,12 @@ static const struct xe_graphics_desc graphics_xe2 = {
 };
 
 static const struct xe_media_desc media_xem = {
-	.name = "Xe_M",
-	.ver = 12,
-	.rel = 0,
-
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
 };
 
 static const struct xe_media_desc media_xehpm = {
-	.name = "Xe_HPM",
-	.ver = 12,
-	.rel = 55,
-
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
@@ -201,6 +177,12 @@ static const struct xe_media_desc media_xelpmp = {
 		BIT(XE_HW_ENGINE_GSCCS0)
 };
 
+/* Pre-GMDID Graphics IPs */
+static const struct xe_ip graphics_ip_xelp = { 1200, "Xe_LP", &graphics_xelp };
+static const struct xe_ip graphics_ip_xelpp = { 1210, "Xe_LP+", &graphics_xelpp };
+static const struct xe_ip graphics_ip_xehpg = { 1255, "Xe_HPG", &graphics_xehpg };
+static const struct xe_ip graphics_ip_xehpc = { 1260, "Xe_HPC", &graphics_xehpc };
+
 /* GMDID-based Graphics IPs */
 static const struct xe_ip graphics_ips[] = {
 	{ 1270, "Xe_LPG", &graphics_xelpg },
@@ -212,6 +194,10 @@ static const struct xe_ip graphics_ips[] = {
 	{ 3001, "Xe3_LPG", &graphics_xe2 },
 };
 
+/* Pre-GMDID Media IPs */
+static const struct xe_ip media_ip_xem = { 1200, "Xe_M", &media_xem };
+static const struct xe_ip media_ip_xehpm = { 1255, "Xe_HPM", &media_xehpm };
+
 /* GMDID-based Media IPs */
 static const struct xe_ip media_ips[] = {
 	{ 1300, "Xe_LPM+", &media_xelpmp },
@@ -221,8 +207,8 @@ static const struct xe_ip media_ips[] = {
 };
 
 static const struct xe_device_desc tgl_desc = {
-	.graphics = &graphics_xelp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(TIGERLAKE),
 	.dma_mask_size = 39,
 	.has_display = true,
@@ -231,8 +217,8 @@ static const struct xe_device_desc tgl_desc = {
 };
 
 static const struct xe_device_desc rkl_desc = {
-	.graphics = &graphics_xelp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ROCKETLAKE),
 	.dma_mask_size = 39,
 	.has_display = true,
@@ -243,8 +229,8 @@ static const struct xe_device_desc rkl_desc = {
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
 
 static const struct xe_device_desc adl_s_desc = {
-	.graphics = &graphics_xelp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_S),
 	.dma_mask_size = 39,
 	.has_display = true,
@@ -260,8 +246,8 @@ static const struct xe_device_desc adl_s_desc = {
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
 
 static const struct xe_device_desc adl_p_desc = {
-	.graphics = &graphics_xelp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_P),
 	.dma_mask_size = 39,
 	.has_display = true,
@@ -275,8 +261,8 @@ static const struct xe_device_desc adl_p_desc = {
 };
 
 static const struct xe_device_desc adl_n_desc = {
-	.graphics = &graphics_xelp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	PLATFORM(ALDERLAKE_N),
 	.dma_mask_size = 39,
 	.has_display = true,
@@ -289,8 +275,8 @@ static const struct xe_device_desc adl_n_desc = {
 	.is_dgfx = 1
 
 static const struct xe_device_desc dg1_desc = {
-	.graphics = &graphics_xelpp,
-	.media = &media_xem,
+	.pre_gmdid_graphics_ip = &graphics_ip_xelpp,
+	.pre_gmdid_media_ip = &media_ip_xem,
 	DGFX_FEATURES,
 	PLATFORM(DG1),
 	.dma_mask_size = 39,
@@ -315,8 +301,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 	}
 
 static const struct xe_device_desc ats_m_desc = {
-	.graphics = &graphics_xehpg,
-	.media = &media_xehpm,
+	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
+	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.require_force_probe = true,
 
@@ -326,8 +312,8 @@ static const struct xe_device_desc ats_m_desc = {
 };
 
 static const struct xe_device_desc dg2_desc = {
-	.graphics = &graphics_xehpg,
-	.media = &media_xehpm,
+	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
+	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
 	.require_force_probe = true,
 
@@ -336,7 +322,7 @@ static const struct xe_device_desc dg2_desc = {
 };
 
 static const struct xe_device_desc pvc_desc = {
-	.graphics = &graphics_xehpc,
+	.pre_gmdid_graphics_ip = &graphics_ip_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
 	.dma_mask_size = 52,
@@ -548,17 +534,21 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
  * media is optional.
  */
 static void handle_pre_gmdid(struct xe_device *xe,
-			     const struct xe_graphics_desc *graphics,
-			     const struct xe_media_desc *media)
+			     const struct xe_device_desc *desc,
+			     const struct xe_graphics_desc **graphics,
+			     const struct xe_media_desc **media)
 {
-	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
-	xe->info.graphics_name = graphics->name;
-
-	if (media) {
-		xe->info.media_verx100 = media->ver * 100 + media->rel;
-		xe->info.media_name = media->name;
+	xe->info.graphics_verx100 = desc->pre_gmdid_graphics_ip->verx100;
+	xe->info.graphics_name = desc->pre_gmdid_graphics_ip->name;
+	*graphics = desc->pre_gmdid_graphics_ip->desc;
+
+	if (desc->pre_gmdid_media_ip) {
+		xe->info.media_verx100 = desc->pre_gmdid_media_ip->verx100;
+		xe->info.media_name = desc->pre_gmdid_media_ip->name;
+		*media = desc->pre_gmdid_media_ip->desc;
 	} else {
 		xe->info.media_name = "none";
+		*media = NULL;
 	}
 
 }
@@ -660,25 +650,27 @@ static int xe_info_init_early(struct xe_device *xe,
  * present in device info.
  */
 static int xe_info_init(struct xe_device *xe,
-			const struct xe_graphics_desc *graphics_desc,
-			const struct xe_media_desc *media_desc)
+			const struct xe_device_desc *desc)
 {
 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
+	const struct xe_graphics_desc *graphics_desc;
+	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
-	 * descriptor to use from hardware registers. desc->graphics will only
-	 * ever be set at this point for platforms before GMD_ID. In that case
-	 * the IP descriptions and versions are simply derived from that.
+	 * descriptor to use from hardware registers.
+	 * desc->pre_gmdid_graphics_ip will only ever be set at this point for
+	 * platforms before GMD_ID. In that case the IP descriptions and
+	 * versions are simply derived from that.
 	 */
-	if (graphics_desc) {
-		handle_pre_gmdid(xe, graphics_desc, media_desc);
+	if (desc->pre_gmdid_graphics_ip) {
+		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
 		xe->info.step = xe_step_pre_gmdid_get(xe);
 	} else {
-		xe_assert(xe, !media_desc);
+		xe_assert(xe, !desc->pre_gmdid_media_ip);
 		handle_gmdid(xe, &graphics_desc, &media_desc,
 			     &graphics_gmdid_revid, &media_gmdid_revid);
 		xe->info.step = xe_step_gmdid_get(xe,
@@ -861,7 +853,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
-	err = xe_info_init(xe, desc->graphics, desc->media);
+	err = xe_info_init(xe, desc);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index f46426ef8ed8555af5587137601de0be4d1f2f82..e9b9bbc138d37733ee2b808724ea1cd5f283f8f5 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -9,10 +9,6 @@
 #include <linux/types.h>
 
 struct xe_graphics_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
@@ -28,10 +24,6 @@ struct xe_graphics_desc {
 };
 
 struct xe_media_desc {
-	const char *name;
-	u8 ver;
-	u8 rel;
-
 	u64 hw_engine_mask;	/* hardware engines provided by media IP */
 
 	u8 has_indirect_ring_state:1;

-- 
2.48.1

