Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B12ECD6F7
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 23:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5B610E66E;
	Wed, 11 Feb 2026 23:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJPb/YHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6610E66B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852862; x=1802388862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pgeBFT/+ag59MAUFTIUV2zjVn3GLTAkSnQwZ/vjyX3Y=;
 b=aJPb/YHBohMS4tfyYUMbRZn467nHq0+X3VQvmngHmx41L4RVdeKB24vC
 VSLonXwEw+cGRoj280AGWjKSUKBvEwD10dXin8rAqRl/aZNFFqIMlWj34
 YkSMo9kN1ODxMj7COHYHIdUL0gpkVkGP1y33sHoBMZigWOi285aFNYlYS
 xyLzkUZPO1JPIrdz60tLnKFfcPKJhcszggThbE7aPBpUy991VzDpUBZWp
 J2noAXth+F0DBu6Db+68sB1oXUCwvqs02YjoJCqL8eOHjnP2F5GE11r4i
 OgUff9gMYJ3kWLOnwLZDDv4JRdMhMTZLbgh6NyAxvFvkkXEG69tdZUOg1 Q==;
X-CSE-ConnectionGUID: vr313/isSR6XKkTaC6yFRA==
X-CSE-MsgGUID: 08GpmZUuT5GySWRPhJimGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59585371"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="59585371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:22 -0800
X-CSE-ConnectionGUID: 9HB898eBRL6kxydauHySjQ==
X-CSE-MsgGUID: m7O3L+E3SbqeY1Tqm0zCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="216931320"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:34:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/4] drm/xe/reg_sr: Don't process gt/hwe lists in VF
Date: Wed, 11 Feb 2026 15:34:13 -0800
Message-ID: <20260211233411.614951-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211233411.614951-6-matthew.d.roper@intel.com>
References: <20260211233411.614951-6-matthew.d.roper@intel.com>
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

There are a few different reg_sr lists managed by the driver for
workarounds/tuning:

 - gt->reg_sr
 - hwe->reg_sr
 - hwe->reg_lrc

The first two are not relevant to SRIOV VFs; a VF KMD does not have
access to the registers that appear on this list and it is the PF KMD's
responsibility to apply such programming on behalf of the entire system.
However the third list contains per-client values that the VF KMD needs
to ensure are incorporated whenever a new LRC is created.

Handling of reg_sr lists comes in two steps: processing an RTP table to
build a reg_sr from the relevant entries, and then applying the contents
of the reg_sr.  Skipping the RTP processing (resulting in an empty
reg_sr) or skipping the application of a reg_sr are both valid ways to
avoid having a VF accidentally try to write registers it doesn't have
access to.  In commit c19e705ec981 ("drm/xe/vf: Stop applying
save-restore MMIOs if VF") and commit 92a5bd302458 ("drm/xe/vf: Unblock
xe_rtp_process_to_sr for VFs") we adjusted the drivers behavior to
always process the RTP table into a reg_sr and just skipped the
application step.  This works fine functionally, but can lead to
confusion during debugging since facilities like the debugfs
'register-save-restore' will still report a bunch of registers that the
VF KMD isn't actually trying to handle.  It will also mislead other
upcoming debug changes.

Let's go back to skipping the RTP => reg_sr processing step, but only
for GT / hwe tables this time.  This will allow LRC reg_sr handling to
continue to work, but will ensure that gt->reg_sr and hwe->reg_sr remain
empty and that debugfs reporting more accurately reflects the KMD's
behavior.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++++--
 drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
 drivers/gpu/drm/xe/xe_wa.c     | 6 ++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index d3e13ea33123..1ac911fc6e94 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -13,6 +13,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
@@ -169,8 +170,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	if (xa_empty(&sr->xa))
 		return;
 
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
-		return;
+	/*
+	 * We don't process non-LRC reg_sr lists in VF, so they should have
+	 * been empty in the check above.
+	 */
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
 
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 316f5e2b2e48..ddd8519f3f19 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -15,6 +15,7 @@
 #include "xe_gt_types.h"
 #include "xe_platform_types.h"
 #include "xe_rtp.h"
+#include "xe_sriov.h"
 
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
@@ -197,6 +198,9 @@ void xe_tuning_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  gt->tuning_active.gt,
 						  ARRAY_SIZE(gt_tunings));
@@ -208,6 +212,9 @@ void xe_tuning_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+		return;
+
 	xe_rtp_process_ctx_enable_active_tracking(&ctx,
 						  hwe->gt->tuning_active.engine,
 						  ARRAY_SIZE(engine_tunings));
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 843ce9fe7aab..92547280a5b6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -1003,6 +1003,9 @@ void xe_wa_process_gt(struct xe_gt *gt)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
 						  ARRAY_SIZE(gt_was));
 	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
@@ -1021,6 +1024,9 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 {
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
+	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
+		return;
+
 	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
 						  ARRAY_SIZE(engine_was));
 	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg_sr);
-- 
2.53.0

