Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732D606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mj0Q2Kvm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B56710E00D;
	Fri, 30 Oct 2026 20:23:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CBF10E0F8
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793391786; x=1824927786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MRhN8LP+njU01JEaMHu1dOx6UzVKmPITyC4Vh0navAI=;
 b=Mj0Q2KvmZm327VR483Fc11BXzTEJDCCYt2Tmx/C56RWMNr7EfQdNv4eD
 jGk4+aVzcOzzaNOrFa0Rz9/2b4DgFX0bgWUtVKgWiTbcucQE52o4oZkaa
 aHO78BLyF0/ijf7FumGeSIrJRcd1uz2ebRmhaZ62XPRfqHEjWvA9lZJEo
 w44TcD6iVpmGwwvn54b7ICGzOiZT3hCV921F3iwDgTgPQwZFJjG9xfWr2
 pQ8VJEGhSVcTknwDAwF7txh3ZE1t8m9IrmedY6/vrMDM2Q8b0HcDiUr0a
 JuaTUoxehxYKpJLZdBGo4Z/JeQsoetZYivzJ9AdiY+W8JnOfWTMxvUExc w==;
X-CSE-ConnectionGUID: aKiQFs1iRBuRuX6cCz47pA==
X-CSE-MsgGUID: xA+tdIonRemd4ABfFmd+sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2168491"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2168491"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:23:06 -0700
X-CSE-ConnectionGUID: iiceosnFS5aW0EGrkCR3nA==
X-CSE-MsgGUID: GOFR5MuWRqC2v21d8vd0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5543121"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2026 13:23:05 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Fei Yang <fei.yang@intel.com>,
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH v5] drm/xe/cri: Implement Wa_14028586678
Date: Fri, 30 Oct 2026 13:19:08 -0700
Message-ID: <20261030201908.297018-1-daniel.charles@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Fei Yang <fei.yang@intel.com>

Implement the documented Wa_14028586678 hardware workaround on
Crescent Island by updating the L3 class-of-service and caching-policy
fields in DWNSTRM_ACCESS_MODE (0x144154). Change bits [7:4] from 0x3
to 0xc to select L3 class of service 3 and write-back caching, while
preserving the other register fields.

v2:
  - Move this workaround into a dedicated MERT table instead of
    placing it in gt_was, since MERT registers are device-level and
    accessed through root-tile MMIO, outside GT forcewake and GT
    save/restore bookkeeping.
  - Add an RTP helper for full-register device MMIO writes and apply
    the MERT table during probe and after pcode is ready on system or
    D3cold resume. Match Crescent Island and skip devices without MERT
    and SR-IOV VFs.

v3:
  - Use PLATFORM(CRESCENTISLAND) instead of GRAPHICS_VERSION(3511),
    because device-level OOB processing has no GT context and the
    graphics-version matcher requires one.

v4:
  - Switching from RTP to OOB removes the need for the MERT-specific
    table and RTP helper proposed in v2. The v2 and v3 notes are retained
    as revision history; this version uses the device OOB rule through
    the existing per-tile workaround helper.
  - Program the register on every tile, assuming the workaround values
    are identical across tiles.
  - Use a masked read-modify-write to set [7:6] to 0x3 and [5:4] to
    0x0, preserving all other register fields.
v5:
  - Apply tile workarounds after PCODE initialization completes on system
    resume, matching the runtime resume ordering.

BSpec: 73603
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mert_regs.h    |  4 ++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_pm.c                | 10 +++++++---
 drivers/gpu/drm/xe/xe_wa.c                |  9 +++++++++
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index 99e5a26da6572..8139263f2746a 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -8,6 +8,10 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
+#define   DWNSTRM_ACCESS_MODE_L3_COS		REG_GENMASK(7, 6)
+#define   DWNSTRM_ACCESS_MODE_L3_POLICY		REG_GENMASK(5, 4)
+
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
 #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 356b4707dafea..753b2a4a10067 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -6,3 +6,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+14028586678	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 89d64aa6577d1..462357844cb48 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -241,13 +241,13 @@ int xe_pm_resume(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Resuming device\n");
 	trace_xe_pm_resume(xe, __builtin_return_address(0));
 
-	for_each_tile(tile, xe, id)
-		xe_wa_apply_tile_workarounds(tile);
-
 	err = xe_pcode_ready(xe, true);
 	if (err)
 		return err;
 
+	for_each_tile(tile, xe, id)
+		xe_wa_apply_tile_workarounds(tile);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_resume_early(gt);
 
@@ -687,6 +687,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
  */
 int xe_pm_runtime_resume(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	u8 id;
 	int err = 0;
@@ -702,6 +703,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		for_each_tile(tile, xe, id)
+			xe_wa_apply_tile_workarounds(tile);
+
 		for_each_gt(gt, xe, id)
 			xe_gt_resume_early(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c94fe7753f9a9..539850614902b 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -16,7 +16,9 @@
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_mert_regs.h"
 #include "regs/xe_regs.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt_types.h"
@@ -1031,4 +1033,11 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 
 	if (XE_DEVICE_WA(tile->xe, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
+
+	if (xe_device_has_mert(tile->xe) &&
+	    XE_DEVICE_WA(tile->xe, 14028586678))
+		xe_mmio_rmw32(mmio, DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS,
+			      DWNSTRM_ACCESS_MODE_L3_COS |
+			      DWNSTRM_ACCESS_MODE_L3_POLICY,
+			      REG_FIELD_PREP(DWNSTRM_ACCESS_MODE_L3_COS, 3));
 }
-- 
2.43.0

