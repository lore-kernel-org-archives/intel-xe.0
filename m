Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A40606A329
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fFe4Y1ek
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5DC10F572;
	Tue,  3 Nov 2026 12:40:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FB410F571
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793709592; x=1825245592;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y4YpLaTpEJyNgBmltq2zbFKemTnRPP3Rce25NTwLvVs=;
 b=fFe4Y1ekQ/JVBSt5Sj869o5kzRLq28FN+N73V+HqKFXHX2M/BujvE17K
 gm3PDRbtau9oV7HltEbjQniuQ6lOy2KY/n3772Cr0iHoCX6PAhnUcW3Mf
 pimEELTSy/HtuQflNf/DRzJtHuc7Gs0lIe6PZjUJNND0KLkB39v9E8G/K
 xmDchDkONP46uUQxR4RJlXt9Zbv1/T31Kmvzqhot6B+EvPxeuJNmCUCrj
 sYF+9yS5t4rHN2QJaPDT638AEoBH+h7DPUwpzy8wO7Nvwcn+IXyWEKAKa
 4opoUlzU43A5wOFS1ryzaYiqbi2d6sI9B22drw6l4dLNLc5z7FGen/gpJ Q==;
X-CSE-ConnectionGUID: GZ04JdWbQwmBWipf7bVl2w==
X-CSE-MsgGUID: 5eAsbCcvQ/yon2b3KAwjUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425635"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2425635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:39:51 -0800
X-CSE-ConnectionGUID: XsQrZ9HyRWmTsR4PbOw0ng==
X-CSE-MsgGUID: K8fuVjzCQ7i1AKS0mn1e3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6509344"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 04:39:50 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 1/3] drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64
 support
Date: Tue,  3 Nov 2026 18:07:25 +0530
Message-ID: <20261103123727.2465599-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Wa_16029281913 recommends using the MI_SEMAPHORE_WAIT_64 instruction
instead of the legacy MI_SEMAPHORE_WAIT, due to an issue with the legacy
semaphore on some Xe3p platforms.

Add the MI_SEMAPHORE_WAIT_64 instruction definition and a has_sem64 bit
to the graphics/media IP descriptors, set on every Xe3p platform that
supports it. Graphics version 35.10 and Media version 35.00 only gain
support at stepping B0, so that exception is applied when resolving
the final gt->info.has_sem64 value.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Assisted-by: LLM
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 ++
 drivers/gpu/drm/xe/xe_pci.c                   | 20 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 ++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 835ef75bbeb1..186c9ac35e5b 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -34,6 +34,7 @@
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
+/* Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p, use MI_SEMAPHORE_WAIT_64 */
 #define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
 #define   MI_SEMW_GGTT			REG_BIT(22)
 #define   MI_SEMW_REGISTER_POLL		REG_BIT(16)
@@ -48,6 +49,11 @@
 #define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
 #define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
 
+#define MI_SEMAPHORE_WAIT_64		(__MI_INSTR(0x3b) | XE_INSTR_NUM_DW(7))
+#define   MI_SEMW64_INTERRUPT		REG_BIT(20) /* raises the semaphore-fail interrupt */
+#define   MI_SEMW64_32B_COMPARE		REG_BIT(19) /* 0: 64b compare (default), 1: 32b compare */
+#define   MI_SEMW64_INHIBIT_CTX_SWITCH	REG_BIT(15) /* poll in place, don't switch out on fail */
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c00a7c171f80..cc7d6adb6aec 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -167,6 +167,8 @@ struct xe_gt {
 		 * error reporting support
 		 */
 		u8 has_uncorrectable_error_reporting:1;
+		/** @info.has_sem64: GT supports the MI_SEMAPHORE_WAIT_64 instruction */
+		u8 has_sem64:1;
 		/**
 		 * @info.has_xe2_blt_instructions: GT supports Xe2-style MEM_SET
 		 * and MEM_COPY blitter functionality.  Note that despite the
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d13599d79ae9..380568cf08e2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -127,6 +127,7 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
 	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
 	.num_geometry_xecore_fuse_regs = 3,
 	.num_compute_xecore_fuse_regs = 3,
+	.has_sem64 = 1,
 };
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
@@ -153,11 +154,20 @@ static const struct xe_media_desc media_xelpmp = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-		BIT(XE_HW_ENGINE_GSCCS0)
+		BIT(XE_HW_ENGINE_GSCCS0),
+};
+
+static const struct xe_media_desc media_xe3p_lpm = {
+	.hw_engine_mask =
+		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
+		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
+		BIT(XE_HW_ENGINE_GSCCS0),
+	.has_sem64 = 1,
 };
 
 static const struct xe_media_desc media_xe3p_hpm = {
 	.has_uncorrectable_error_reporting = 1,
+	.has_sem64 = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
@@ -198,7 +208,7 @@ static const struct xe_ip media_ips[] = {
 	{ 2000, "Xe2_LPM", &media_xelpmp },
 	{ 3000, "Xe3_LPM", &media_xelpmp },
 	{ 3002, "Xe3_LPM", &media_xelpmp },
-	{ 3500, "Xe3p_LPM", &media_xelpmp },
+	{ 3500, "Xe3p_LPM", &media_xe3p_lpm },
 	{ 3503, "Xe3p_HPM", &media_xe3p_hpm },
 };
 
@@ -900,6 +910,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 	gt->info.has_uncorrectable_error_reporting =
 		graphics_desc->has_uncorrectable_error_reporting;
+	/* excludes configs that don't support sem64 */
+	gt->info.has_sem64 = graphics_desc->has_sem64 &&
+		!(GRAPHICS_VERx100(xe) == 3510 && xe->info.step.graphics < STEP_B0);
 	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
 	if (!xe_configfs_get_enable_multi_queue(to_pci_dev(xe->drm.dev))) {
 		xe_gt_info(gt, "Multi-queue disabled via configfs\n");
@@ -950,6 +963,9 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
 	gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
 	gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 	gt->info.has_uncorrectable_error_reporting = media_desc->has_uncorrectable_error_reporting;
+	/* excludes configs that don't support sem64 */
+	gt->info.has_sem64 = media_desc->has_sem64 &&
+		!(MEDIA_VERx100(xe) == 3500 && xe->info.step.media < STEP_B0);
 	gt->info.engine_mask = media_desc->hw_engine_mask;
 
 	return gt;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index ce0b0f6c5b18..d7bba320d9e5 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -84,6 +84,7 @@ struct xe_graphics_desc {
 	u8 has_usm:1;
 	u8 has_64bit_timestamp:1;
 	u8 has_uncorrectable_error_reporting:1;
+	u8 has_sem64:1;
 };
 
 struct xe_media_desc {
@@ -91,6 +92,7 @@ struct xe_media_desc {
 
 	u8 has_indirect_ring_state:1;
 	u8 has_uncorrectable_error_reporting:1;
+	u8 has_sem64:1;
 };
 
 struct xe_ip {
-- 
2.46.0

