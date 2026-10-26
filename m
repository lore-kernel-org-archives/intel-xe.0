Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2D606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 22:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AWst3bJc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3B810F18D;
	Mon, 26 Oct 2026 22:08:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D877510F18D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 22:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793052486; x=1824588486;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=IJBOqg7UN0lTkLJLlZPbuGBKkIaZX06bExn23evgsD8=;
 b=AWst3bJcDMfs3VMz6IBx67kD5cWYSKmrwzcZI3STOHq8evFbyD0r51au
 nIMeh6wq5+AyaDV8/KWl1C7W5WCvd6kalyQHIT58WluC6wGtTNQFLaOb8
 5wPqG4dJB1dJXq+5BA6VPTwhKb9a1Jkr5Td9KcmoeIjNdtMkMY1NRgoTd
 SAhbekgFSl/bIPO7V2AKpN4zxKPQDxCBMsZT2kS59RRZoN24k6Ce0r2KP
 ZXAbS4+R1gaiweYEczTudDM2U5umSHovs8TJ+pnxegHISZiS3kdE44eVi
 gYk/38KiUnEvWx4BL8GVo1BVKrhVZaQfVSGrM+5TCo60/l1S5E0ALeZne Q==;
X-CSE-ConnectionGUID: 3+uQjE+fTvqdS+aHgzsldg==
X-CSE-MsgGUID: 6qu5T/GsTN2Nqg2HXOTSIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1613820"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1613820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:06 -0700
X-CSE-ConnectionGUID: muKOxaHYSESlypKB4ecEhQ==
X-CSE-MsgGUID: FRC99C0CQN+oGgUWacyTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4336211"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 15:08:04 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 26 Oct 2026 19:06:48 -0300
Subject: [PATCH v4 2/3] Revert "drm/xe/nvlp: Implement Wa_14026539277"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wa_14026539277-v4-2-54e40d3e92aa@intel.com>
References: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
In-Reply-To: <20261026-wa_14026539277-v4-0-54e40d3e92aa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.15-dev
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 0919b266456d81e71277c5963d4e806e85b65232.

The definition of Wa_14026539277 has been updated in the workaround
database and requires a different implementation.  So let's revert the
current implementation; a follow-up change will add the proper
handling for this workaround.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ----
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 -
 drivers/gpu/drm/xe/xe_gt.c                | 39 -------------------------------
 3 files changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f5cd3a94e47f..1d396bc5833b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -487,10 +487,6 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
-#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
-#define   CECTRL				REG_GENMASK(2, 1)
-#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
-
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
 #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425..356b4707dafe 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -3,7 +3,6 @@
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
-14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 60d35ada2853..45fb074812a2 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -12,7 +12,6 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
-#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
@@ -460,35 +459,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
-static void wa_14026539277(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u32 val;
-
-	/*
-	 * FIXME: We currently can't use FUNC(xe_rtp_match_not_sriov_vf) in the
-	 * rules for Wa_14026539277 due to xe_wa_process_device_oob() being
-	 * called before xe_sriov_probe_early(); and we can't move the call to
-	 * the former to happen after the latter because MMIO read functions
-	 * already depend on a device OOB workaround.  This needs to be fixed by
-	 * allowing workaround checks to happen at different stages of driver
-	 * initialization.
-	 */
-	if (IS_SRIOV_VF(xe))
-		return;
-
-	if (!XE_DEVICE_WA(xe, 14026539277))
-		return;
-
-	if (!xe_gt_is_main_type(gt))
-		return;
-
-	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
-	val &= ~CECTRL;
-	val |= CECTRL_CENODATA_ALWAYS;
-	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
-}
-
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
@@ -622,15 +592,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	else
 		gt->info.has_wmtp_disabled = 0;
 
-	/*
-	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
-	 * as an entry in gt_was[]) for two reasons: it is actually a device
-	 * workaround that happens to involve programming a GT register; and it
-	 * needs to be applied early to avoid getting the hardware in a bad
-	 * state before we have a chance to do the necessary programming.
-	 */
-	wa_14026539277(gt);
-
 	return 0;
 }
 

-- 
2.56.0

