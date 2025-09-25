Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33BCCA46F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5677010E9D7;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1a68Ilc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495DE10E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8IDXKd45qgKMfGvd1a8cnGV4PtD5kCqYmKaLxZNDbuk=;
 b=Y1a68Ilck7yAl7TgbB3P+F19Q0xuILWk3h9G0trtgsw/rgoYOpZdVRK5
 ra5Y7+wPudXWpT2fb8V6mP+S8SHg35xvXR5F2C6VDXGfBkVoyyJKzayzs
 JMzLUwHcB616mQ0ZQ3efycAGIuicADIXVWHX2CKUsp9N/7QO68ie9/2pp
 sXuQNB/wm2l5eIUZmefKvDpCXGwnio+fqYdv6cmcA846thkHhLnjYjTJF
 peRXKcS/uZjX6fuPRilK0O6f/vaWCpvw6iOncyVZRK6J5iz57zeEhqh7G
 ZHMl/2BOLjYS8Q4CPjdv8AlmwOrF+gt1MwoxHeL8vL/JM4Lai/4pVFM9M A==;
X-CSE-ConnectionGUID: 0rH6vov6S3OQ1fui2FKDIw==
X-CSE-MsgGUID: pdTJ+QJlTaC+5D0cLcvI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817676"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: 7FA80SgfRnSb6abHSvJBBQ==
X-CSE-MsgGUID: UeWnaNZiROiBS7iERi9H/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852986"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 14/22] drm/xe: Handle Wa_22010954014 and Wa_14022085890 as
 device workarounds
Date: Thu, 25 Sep 2025 16:46:42 -0700
Message-ID: <20250925234628.2112163-38-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

When Wa_22010954014 and Wa_14022085890 were first implemented, we didn't
have a device workaround infrastructure so we hacked them into the GT
workaround list.  Now that we have proper device workaround support,
move them to the proper place.  Note that Wa_14022085890 specifically
applies to BMG-G21 platforms, so this requires defining a BMG
subplatform to capture the correct subset of device IDs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 2 ++
 drivers/gpu/drm/xe/xe_guc_pc.c            | 3 ++-
 drivers/gpu/drm/xe/xe_pci.c               | 6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h    | 1 +
 drivers/gpu/drm/xe/xe_wa.c                | 2 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules        | 5 -----
 include/drm/intel/pciids.h                | 7 +++++--
 7 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 3cc93f0e77f8..55ba01bc8f38 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1,3 +1,5 @@
+22010954014	PLATFORM(DG2)
 15015404425     PLATFORM(LUNARLAKE)
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
+14022085890	SUBPLATFORM(BATTLEMAGE, G21)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..ff22235857f8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
+#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_slpc_abi.h"
@@ -886,7 +887,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	if (XE_GT_WA(tile->primary_gt, 14022085890))
+	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
 		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
 
 out:
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index bd21940a6541..84b373dccee1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -322,6 +322,8 @@ static const struct xe_device_desc lnl_desc = {
 	.needs_scratch = true,
 };
 
+static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
+
 static const struct xe_device_desc bmg_desc = {
 	DGFX_FEATURES,
 	PLATFORM(BATTLEMAGE),
@@ -336,6 +338,10 @@ static const struct xe_device_desc bmg_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
+		{ }
+	},
 };
 
 static const struct xe_device_desc ptl_desc = {
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index d08574c4cdb8..3e332214c7bb 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -34,6 +34,7 @@ enum xe_subplatform {
 	XE_SUBPLATFORM_DG2_G10,
 	XE_SUBPLATFORM_DG2_G11,
 	XE_SUBPLATFORM_DG2_G12,
+	XE_SUBPLATFORM_BATTLEMAGE_G21,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index cd03891654a1..68987e2825ad 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -1127,6 +1127,6 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 	if (IS_SRIOV_VF(tile->xe))
 		return;
 
-	if (XE_GT_WA(tile->primary_gt, 22010954014))
+	if (XE_DEVICE_WA(tile->xe, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index eb761d30e066..113a62f1b541 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -14,7 +14,6 @@
 14016763929	SUBPLATFORM(DG2, G10)
 		SUBPLATFORM(DG2, G12)
 16017236439	PLATFORM(PVC)
-22010954014	PLATFORM(DG2)
 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
 14015076503	MEDIA_VERSION(1300)
 16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
@@ -74,9 +73,5 @@
 16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
 
-# SoC workaround - currently applies to all platforms with the following
-# primary GT GMDID
-14022085890	GRAPHICS_VERSION(2001)
-
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 69d4ae92d822..452c1de606ff 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -849,7 +849,7 @@
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
 /* BMG */
-#define INTEL_BMG_IDS(MACRO__, ...) \
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
@@ -858,7 +858,10 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
+
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
-- 
2.51.0

