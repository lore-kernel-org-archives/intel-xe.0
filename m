Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E7CCD183
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4A510E70F;
	Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIDi3ohQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AF310E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L9NrH6oeeVcjXIM5CwYAT377o7pwIfktfn6SbGJJ58w=;
 b=ZIDi3ohQTgR0/YnOrikprCIU9P5Uoo9MqKn/pf4C9fJ0flQfNVFvbpng
 0lbQVzttM7dQJz8KlDAjyUUGo5bzQBakoSz9HABOKX9H0PhDYLbf9AD3x
 GMJOOjWBU5BztvIIwAtRQWfKz8wgkAzDLTJscf9kOCO6wT4FKB5u8JF1W
 8r8V023N0hBioyUxjp5MhfGINlIvtslh8yHfcGEM7zxF7pMp4ZYrBbcm+
 cbe/lI/UqYpzZ1hiVU9DAQQyDaRkYMNuzd96BdMFxmQZxp8z0M5a8QLQf
 T6dpyUA2Rr8dy6CkZKquDNLQJSxeNJS9Dtf6f4fj4UZbl9deK+vYv31YY g==;
X-CSE-ConnectionGUID: kvU4CvH9SnqUm8TMo1rvBA==
X-CSE-MsgGUID: yk1wQBg3RmqR+P+iSG8KhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616754"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: 98gFu7JlQfWgB8EijqavWQ==
X-CSE-MsgGUID: FbYq8VxPSKOkKCdZ/jFOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631102"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 15/23] drm/xe: Handle Wa_22010954014 and Wa_14022085890 as
 device workarounds
Date: Tue,  7 Oct 2025 13:48:45 -0700
Message-ID: <20251007204829.1468209-40-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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
index a49e7cf8c73e..f7aec1c5959b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -334,6 +334,8 @@ static const struct xe_device_desc lnl_desc = {
 	.vm_max_level = 4,
 };
 
+static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0 };
+
 static const struct xe_device_desc bmg_desc = {
 	DGFX_FEATURES,
 	PLATFORM(BATTLEMAGE),
@@ -348,6 +350,10 @@ static const struct xe_device_desc bmg_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.subplatforms = (const struct xe_subplatform_desc[]) {
+		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
+		{ }
+	},
 	.va_bits = 48,
 	.vm_max_level = 4,
 };
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
index c60159a13001..aa1b69f48f6f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -1138,6 +1138,6 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
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

