Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA60FD3774
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 16:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2607B10E88D;
	Wed, 25 Feb 2026 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZP8CUdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901F10E88D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772038082; x=1803574082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1A2BXPnh07/q3/7HZ7KBoBHEqE/htaaVma6ycho/iyg=;
 b=fZP8CUdI+51N+otYkNUMumumAlv50PYp151YsV/X0rhzweVK203qKdIE
 dTT/37RqcitirF4SuYeZZRba3gOFgVQsEy5XoeDPQ6QUvHHh6IvuwOI5X
 MJ0VLWT0camAT97Q+9yqJ9iXd/U8ZDxTSYBMuN0c8qPetSl3UQzoU4oSR
 agEm01WYtoahn/cDl09AyS/gCyI/LEJ9TTj6hN6JQc5qtP37IV8bfn8Ug
 5ztaEiYYU+unzTKD8+FQ7ATXie0ozjASYo1MX7KXbKs5FQLaSHkYfgz4L
 OXXVGwyLHSj9s3LbW7sE46x3KBiUfi0GTRlA1VLno/f3wZexEnh6MuBlx Q==;
X-CSE-ConnectionGUID: YVoQutrJRYW3ohiOdlHc3g==
X-CSE-MsgGUID: DpqmFNS9SYOl4yBC7avwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72957977"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72957977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 08:48:01 -0800
X-CSE-ConnectionGUID: yHXFnIVZQf+PJ37MHZHoIQ==
X-CSE-MsgGUID: R5BdefmRS126+bFHMxqCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215392966"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 08:48:00 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v2] drm/xe/guc: Skip access counter queue init for unsupported
 platforms
Date: Wed, 25 Feb 2026 22:17:48 +0530
Message-ID: <20260225164748.2302380-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Add a has_access_counter feature flag to the graphics IP descriptor
and skip writing parameters for the access counter queue in
guc_um_init_params(), leaving queue_params[2] zero-initialized
to signal unavailability to the GuC.

The queue_params[] array layout is fixed by firmware ABI, so we
maintain the structure with queues 0 and 1 (page fault request/response)
always configured, and queue 2 conditionally skipped based on the
has_access_counter flag.

Bspec: 59323
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Varun Gupta <varun.gupta1@intel.com>
---
v2:
 - Replace platform check with has_access_counter feature flag in
   graphics IP descriptor (Matt Roper)
 - Add Bspec trailer (Matt Roper)
 - Make commit message generic instead of CRI-specific
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_ads.c      | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pci.c          |  4 ++++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f3ef836541e..78ecfd7414e8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -151,6 +151,8 @@ struct xe_device {
 
 		/** @info.force_execlist: Forced execlist submission */
 		u8 force_execlist:1;
+		/** @info.has_access_counter: Device supports access counter */
+		u8 has_access_counter:1;
 		/** @info.has_asid: Has address space ID */
 		u8 has_asid:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f4cbc030f4c8..81b5f01b1f65 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -819,6 +819,7 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
 {
 	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
 	struct xe_guc *guc = ads_to_guc(ads);
+	struct xe_device *xe = ads_to_xe(ads);
 	u64 base_dpa;
 	u32 base_ggtt;
 	bool with_dpa;
@@ -830,6 +831,16 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
 	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
 
 	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
+		/*
+		 * Some platforms support USM but not access counters.
+		 * Skip ACCESS_COUNTER queue initialization for such
+		 * platforms, leaving queue_params[2] zero-initialized
+		 * to signal unavailability to the GuC.
+		 */
+		if (i == GUC_UM_HW_QUEUE_ACCESS_COUNTER &&
+		    !xe->info.has_access_counter)
+			continue;
+
 		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
 			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
 		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 56a768f2cfca..3a16d89fc044 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -81,6 +81,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	XE_HP_FEATURES,
 
+	.has_access_counter = 1,
 	.has_asid = 1,
 	.has_atomic_enable_pte_bit = 1,
 	.has_usm = 1,
@@ -98,6 +99,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 };
 
 #define XE2_GFX_FEATURES \
+	.has_access_counter = 1, \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
@@ -123,6 +125,7 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
+	.has_access_counter = 0,
 	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
@@ -923,6 +926,7 @@ static int xe_info_init(struct xe_device *xe,
 		media_desc = NULL;
 	}
 
+	xe->info.has_access_counter = graphics_desc->has_access_counter;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 470d31a1f0d6..658cb30de50d 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -69,6 +69,7 @@ struct xe_graphics_desc {
 	u8 num_geometry_xecore_fuse_regs;
 	u8 num_compute_xecore_fuse_regs;
 
+	u8 has_access_counter:1;
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
 	u8 has_indirect_ring_state:1;
-- 
2.43.0

