Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF49EE77183
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A1B10E594;
	Mon,  9 Dec 2024 23:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mu98mL6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDE210E58D
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733786882; x=1765322882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ir51JvVaoMyex9X9oYRd/o5oTA0Vudhh3qrGb7VTDQg=;
 b=Mu98mL6XI3znXqHoqmQQgyCytJYcTNauyBHKQOvARzc6wpIsG9S1UxOM
 dOGl96mIRBS4UycIsVaHJvIQYPLesRLGGfGKGtmUPx3cKF4Or3jYVDehI
 HT1La07lEOp7lgBxdGhx2twP8zBByL/yGI6PWp53zlYxSQhbxmvCYyfUG
 GQCncRd3aPEGFwbz+evf78JQ4HUwl78k85TBHOJgAXuv7EESUCmQ9iHeg
 G8cXvcIVleZXQm1nFwduPhRTBF8jveHfpZh37jk42+qeOZPF+z8i1fXDq
 iIqeIynvyO7k9ay6gACwlg3Uk2sXdPSd+OOc5QBd3fXbEP+8PCM5AtYhd g==;
X-CSE-ConnectionGUID: gJfCPf7ZSCOUQ4kzyfSCVA==
X-CSE-MsgGUID: NE92TXtGQ2yc7YAYe8twPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44581854"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="44581854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:01 -0800
X-CSE-ConnectionGUID: 8t8hywDkTbGOJ9faHa9UEQ==
X-CSE-MsgGUID: whZidUWeSkuCHjPXrBcBQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="100268964"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 15:28:00 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, ashutosh.dixit@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 5/5] drm/xe: Apply whitelist to engine save-restore
Date: Mon,  9 Dec 2024 15:27:39 -0800
Message-ID: <20241209232739.147417-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

Instead of handling the whitelist directly in the GuC ADS
initialization, make it follow the same logic as other engine registers
that are save-restored. Main benefit is that then the SW tracking then
shows it in debugfs and there's no risk of an engine workaround to write
to the same nopriv register that is being passed directly to GuC.

This means that xe_reg_whitelist_process_engine() only has to process
the RTP and convert them to entries for the hwe.  With that all the
registers should be covered by xe_reg_sr_apply_mmio() to write to the HW
and there's no special handling in GuC ADS to also add these registers
to the list of registers that is passed to GuC.

Example for DG2:

	# cat  /sys/kernel/debug/dri/0000\:03\:00.0/gt0/register-save-restore
	...
	Engine
	rcs0
		...
		REG[0x24d0] clr=0xffffffff set=0x1000dafc masked=no mcr=no
		REG[0x24d4] clr=0xffffffff set=0x1000db01 masked=no mcr=no
		REG[0x24d8] clr=0xffffffff set=0x0000db1c masked=no mcr=no
	...
	Whitelist
	rcs0
		REG[0xdafc-0xdaff]: allow read access
		REG[0xdb00-0xdb1f]: allow read access
		REG[0xdb1c-0xdb1f]: allow rw access

v2:
  - Use ~0u for clr bits so it's just a write (Matt Roper)
  - Simplify helpers now that unused slots are not written

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c            |  4 +--
 drivers/gpu/drm/xe/xe_guc_ads.c       |  7 -----
 drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
 drivers/gpu/drm/xe/xe_reg_sr.c        | 45 ---------------------------
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 37 ++++++++++++++++++++++
 5 files changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d6744be01a687..41ab7fbebc193 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	for_each_hw_engine(hwe, gt, id) {
+	for_each_hw_engine(hwe, gt, id)
 		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
-		xe_reg_sr_apply_whitelist(hwe);
-	}
 
 	/* Get CCS mode in sync between sw/hw */
 	xe_gt_apply_ccs_mode(gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index b0afb89d9d90c..943146e5b460d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
 			count++;
 
-	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
-
 	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
 
 	if (XE_WA(gt, 1607983814))
@@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 	xa_for_each(&hwe->reg_sr.xa, idx, entry)
 		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
 
-	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
-		guc_mmio_regset_write_one(ads, regset_map,
-					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
-					  count++);
-
 	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
 		if (e->skip)
 			continue;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c3..b193667441488 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
 
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
-	xe_reg_sr_apply_whitelist(hwe);
 
 	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
 						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 0a5c0e62d6e88..9475e3f749580 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -24,7 +24,6 @@
 #include "xe_hw_engine_types.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
-#include "xe_reg_whitelist.h"
 #include "xe_rtp_types.h"
 
 static void reg_sr_fini(struct drm_device *drm, void *arg)
@@ -192,50 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
 }
 
-void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
-{
-	struct xe_reg_sr *sr = &hwe->reg_whitelist;
-	struct xe_gt *gt = hwe->gt;
-	struct xe_reg_sr_entry *entry;
-	struct drm_printer p;
-	u32 mmio_base = hwe->mmio_base;
-	unsigned long reg;
-	unsigned int slot = 0;
-	unsigned int fw_ref;
-
-	if (xa_empty(&sr->xa))
-		return;
-
-	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
-
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
-		goto err_force_wake;
-
-	p = xe_gt_dbg_printer(gt);
-	xa_for_each(&sr->xa, reg, entry) {
-		if (slot == RING_MAX_NONPRIV_SLOTS) {
-			xe_gt_err(gt,
-				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
-				  hwe->name, RING_MAX_NONPRIV_SLOTS);
-			break;
-		}
-
-		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
-		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
-				reg | entry->set_bits);
-		slot++;
-	}
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
-	return;
-
-err_force_wake:
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
-}
-
 /**
  * xe_reg_sr_dump - print all save/restore entries
  * @sr: Save/restore entries
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 3996934974fa0..edab5d4e3ba5e 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -10,7 +10,9 @@
 #include "regs/xe_oa_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_gt_types.h"
+#include "xe_gt_printk.h"
 #include "xe_platform_types.h"
+#include "xe_reg_sr.h"
 #include "xe_rtp.h"
 #include "xe_step.h"
 
@@ -89,6 +91,40 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{}
 };
 
+static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
+{
+	struct xe_reg_sr *sr = &hwe->reg_whitelist;
+	struct xe_reg_sr_entry *entry;
+	struct drm_printer p;
+	unsigned long reg;
+	unsigned int slot;
+
+	xe_gt_dbg(hwe->gt, "Add %s whitelist to engine\n", sr->name);
+	p = xe_gt_dbg_printer(hwe->gt);
+
+	slot = 0;
+	xa_for_each(&sr->xa, reg, entry) {
+		struct xe_reg_sr_entry hwe_entry = {
+			.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
+			.set_bits = entry->reg.addr | entry->set_bits,
+			.clr_bits = ~0u,
+			.read_mask = entry->read_mask,
+		};
+
+		if (slot == RING_MAX_NONPRIV_SLOTS) {
+			xe_gt_err(hwe->gt,
+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			break;
+		}
+
+		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
+		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
+
+		slot++;
+	}
+}
+
 /**
  * xe_reg_whitelist_process_engine - process table of registers to whitelist
  * @hwe: engine instance to process whitelist for
@@ -102,6 +138,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
 	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
+	whitelist_apply_to_hwe(hwe);
 }
 
 /**
-- 
2.47.0

