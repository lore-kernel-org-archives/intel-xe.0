Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DEC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05510EE62;
	Tue, 14 Jul 2026 22:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKsxvGB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1A010E0DF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784067669; x=1815603669;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=iJjcgS/nO8idwt9PVcTk9r95suxXcA7YRkWnLybR1NA=;
 b=TKsxvGB/z27n+w+pA/dkjiwjUUlNjV+bwzMZhws0IIJAjHfNU9Mf3Vz+
 c/sRpaFcqFqQ0r9qZVTufzlahInYfC/wFbu1ifR1fhq/dLYrwAAvsZarB
 4+iUwdavz+70m6c7BXqopg/GXffpDi8kpyz6n7LatwxqjV9ZMV8cKj8zA
 wKFhck/ogsE697rEKyROYc43RQpAUia4u9qhnMGOMCGrKYCrL6ZMSJ3M3
 bVHjTZ5J2PBzmn/5sQ7YusxHRxZ6rYe4MFKbhYXa8zEZHVP1FSEpaf/FQ
 M5hh8gS+D0luXpYWrTCLxSc1JKwAxB/GNGuP5yaItSVG1ZV+k84eF5Mhp Q==;
X-CSE-ConnectionGUID: kC4AbVroSneLOKd4UBabuA==
X-CSE-MsgGUID: MJpNNjUfQf6ObXJh/uHo8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102122221"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="102122221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 15:21:08 -0700
X-CSE-ConnectionGUID: lWN2NEndQMK0kfh4z4RTiw==
X-CSE-MsgGUID: Pw1knjMRShC49peOfgCQwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="286057192"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.121.64.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 15:21:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 14 Jul 2026 15:20:43 -0700
Subject: [PATCH] drm/xe/xe3p_lpg: Program TR_PTA_MODE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-tr_pta_mode-v1-1-6b6544af9d79@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3ZKi+IKSxPjc/JRU3SQT07SkJFNLY0sLcyWgjoKi1LTMCrBp0bG
 1tQCYiy/cXQAAAA==
X-Change-ID: 20260629-tr_pta_mode-b45fbb593987
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7352;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=iJjcgS/nO8idwt9PVcTk9r95suxXcA7YRkWnLybR1NA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqVrZUq+W+MLtfC0COIaiiMODsCkPOG+ISUcJ88
 Tv8r6ALD/CJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCala2VAAKCRBNeSQFyHKQ
 BAdcEACLcFY36l5YHUdL/1rJX2bZqX0KK2VK2sB5xjpm6C4MviM3TbZnP2aW7eGvNs9P4GGlkMQ
 5nrNqrrhuVd7rnCLHse07NH+UpEXRAbFTYa9pHgRic2Jovh62Bkp/19TG+BOlXgol8MQ4zJvj7/
 GBeV2sX++YG313G1du+jvCbLNC7tQkZdTRdV8vXg8tnRFmCrJTZVXaDCWyJToXXvcbvImp8PNdo
 gnB6UXWPTFN25R5HWOPchjfdCKJkXh8/R+EgBnom+R76JFSgJE/Pl+ykW29Sr06UkXN35ocAdKg
 MAUKfIE3jAYtRB39kxHloOWALR4nye5U12lfUwS/mnZDVTeU8kHt4EJ0tzdNpFkD55J1s4rq7UT
 IlhzAriwMB1FdORdqHk6A4SIPs5K2o7dz/fGYwRK4Vrb8lpkEZqeMcHAMmUP59cDFtd51mPbzpr
 O3zSrHre0yH35eGZIkrE7RvLOf2YDqmCVTgstAF6KI9Sq9wIrKMc9RZ0ju6z8a3xz4bqPXFUqM6
 073/XEOUzx1srV309mBkEsyq+vnSXtPaU6j/hOFemihF3XixW3SGupDNDGCI+KzFRGDKYi08NQL
 KLeQsxacTu/Feuipi0gx6oWqFyMuqiAqy43YS4sQHi4uHc/eyD2HNVmJXrPEhWkcmKxfBTjV3Dd
 Dm51au4qthywF8g==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Up until Xe3p_LPG, the PTA_MODE register controlled cacheability of
accesses to the page tables for both PPGTT and TRTT.  Starting with
Xe3p_LPG, PTA_MODE is now only responsible for the PPGTT accesses, and a
separate register, TR_PTA_MODE is used to control the TRTT accesses. The
currently recommeded value for TR_PTA_MODE differs from PTA_MODE on
Xe3p_LPG.  Track and program this value separately in the driver.

Note that even though the Xe3p_LP[G/M] IPs didn't add support for this
new TR_PTA_MODE register until b-stepping, it's safe us to ignore that
detail code-wise.  Writes of the unrecognized registers on a-step
hardware will be silently ignored, and the reads on a-step will come
back as 0x0 which happens to be the value we'd be trying to program on
these IP versions anyway (for both graphics and media).

The new TRTT-specific register also does not exist on Xe3p_XPC
platforms.

Bspec: 79814, 71582
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 +++
 drivers/gpu/drm/xe/xe_pat.c          | 47 ++++++++++++++++++++++++++++++------
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..de5acc994ce6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -404,6 +404,10 @@ struct xe_device {
 		const struct xe_pat_table_entry *pat_primary_pta;
 		/** @pat.pat_media_pta: media GT PAT entry for page table accesses */
 		const struct xe_pat_table_entry *pat_media_pta;
+		/** @pat.pat_primary_tr_pta: primary GT PAT entry for TRTT page table accesses */
+		const struct xe_pat_table_entry *pat_primary_tr_pta;
+		/** @pat.pat_media_tr_pta: media GT PAT entry for TRTT page table accesses */
+		const struct xe_pat_table_entry *pat_media_tr_pta;
 		u16 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index fad5b5a5ed4a..cde59270acc4 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -25,6 +25,7 @@
 								   0x4800, 0x4804, \
 								   0x4848, 0x484c)
 #define _PAT_PTA				0x4820
+#define _PAT_TR_PTA				0x48cc
 
 #define XE2_NO_PROMOTE				REG_BIT(10)
 #define XE2_COMP_EN				REG_BIT(9)
@@ -256,6 +257,7 @@ static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
 
 static const struct xe_pat_table_entry xe3p_primary_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 3);
 static const struct xe_pat_table_entry xe3p_media_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 2);
+static const struct xe_pat_table_entry xe3p_pat_tr_pta = XE2_PAT(0, 0, 0, 0, 0, 0);
 
 static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
 	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
@@ -311,15 +313,18 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
 
-static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
+static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt, bool trtt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (xe_gt_is_main_type(gt))
+	if (xe_gt_is_main_type(gt) && !trtt)
 		return xe->pat.pat_primary_pta;
-
-	if (xe_gt_is_media_type(gt))
+	if (xe_gt_is_main_type(gt) && trtt)
+		return xe->pat.pat_primary_tr_pta;
+	if (xe_gt_is_media_type(gt) && !trtt)
 		return xe->pat.pat_media_pta;
+	if (xe_gt_is_media_type(gt) && trtt)
+		return xe->pat.pat_media_tr_pta;
 
 	xe_assert(xe, false);
 	return NULL;
@@ -329,7 +334,8 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 			int n_entries)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
@@ -342,13 +348,17 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
 
 	if (pta_entry)
 		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), pta_entry->value);
+
+	if (tr_pta_entry)
+		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_TR_PTA), tr_pta_entry->value);
 }
 
 static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
 			    int n_entries)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
 
 	for (int i = 0; i < n_entries; i++) {
 		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
@@ -361,6 +371,9 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
 
 	if (pta_entry)
 		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
+
+	if (tr_pta_entry)
+		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), pta_entry->value);
 }
 
 static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
@@ -531,6 +544,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "Page Table Access:\n");
 	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 
+	if (gt_pta_entry(gt, true)) {
+		if (xe_gt_is_media_type(gt))
+			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_TR_PTA));
+		else
+			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_TR_PTA));
+
+		drm_printf(p, "TRTT Page Table Access:\n");
+		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
+	}
+
 	if (xe_gt_is_media_type(gt))
 		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_ATS));
 	else
@@ -577,6 +600,8 @@ void xe_pat_init_early(struct xe_device *xe)
 		if (!IS_DGFX(xe)) {
 			xe->pat.pat_primary_pta = &xe3p_primary_pat_pta;
 			xe->pat.pat_media_pta = &xe3p_media_pat_pta;
+			xe->pat.pat_primary_tr_pta = &xe3p_pat_tr_pta;
+			xe->pat.pat_media_tr_pta = &xe3p_pat_tr_pta;
 		}
 		xe->pat.n_entries = ARRAY_SIZE(xe3p_lpg_pat_table);
 		xe->pat.idx[XE_CACHE_NONE] = 3;
@@ -700,7 +725,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
+	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
+	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
 	char label[PAT_LABEL_LEN];
 
 	if (!xe->pat.table || !xe->pat.n_entries)
@@ -731,6 +757,13 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
 		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 	}
 
+	if (tr_pta_entry) {
+		u32 pat = tr_pta_entry->value;
+
+		drm_printf(p, "TRTT Page Table Access:\n");
+		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
+	}
+
 	if (xe->pat.pat_ats) {
 		u32 pat = xe->pat.pat_ats->value;
 

---
base-commit: 9cf91140eff27765d402aedeea89505d52db121e
change-id: 20260629-tr_pta_mode-b45fbb593987

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

