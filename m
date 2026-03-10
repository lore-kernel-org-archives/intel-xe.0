Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59BEFCC9A6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 00:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B49A10E60B;
	Tue, 10 Mar 2026 00:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnUuGvv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EC310E604
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773103384; x=1804639384;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wzxeTKkZNgPLewA6z5zLx9u84OGUwuqwUxtPjrCIw1k=;
 b=UnUuGvv9i9AvXc5v5l5sRo58B+MEOCm1uFZSPjPASILJ6EsPbCIGO1ln
 GLCOtCsrKNIzjYu2kHFEBbEJW7QBAMg8wVgEfGI11X07+3jaCJmFj/nxM
 usw00Cb5Q/CFxNwfRbFahfEf4NfYdaQoi8tbI5geTHHsD/x2VqjaRP017
 p//ce8b2KMvyB81ncqu6BY6iKM7HuzN6z6/PG43bG3X+5qp9TMgptK3AS
 hvdzzuYWTizSvBKXQYvPgGcFx5UN41Ng/FBE6HlhMpCDJUMiXq5EZXmr5
 DqO7ZhlzxCub+dl+4u76DvggCSzYXaa+jItT56AlepCk/VJi3OM0QcOJZ w==;
X-CSE-ConnectionGUID: +UhHtsonRi2NUkTF4nz09Q==
X-CSE-MsgGUID: A17OeOe3SN6ZStmUZu4qsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74183498"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="74183498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:03 -0700
X-CSE-ConnectionGUID: n3O4vZWXTDOdIaWasxgZ9A==
X-CSE-MsgGUID: LN+EYB49Q/aeMGEm73lsYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219063570"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 17:43:02 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 21:42:10 -0300
Subject: [PATCH v5 5/7] drm/xe/nvlp: Implement Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v5-5-be9c902ee34e@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v5-0-be9c902ee34e@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Implement the KMD part of Wa_14026539277, which applies to NVL-P A0.
The KMD implementation is just one component of the workaround, which
also depends on Pcode to implement its part in order to be complete.

v2:
  - Add FUNC(xe_rtp_match_not_sriov_vf) to skip applying the workaround
    to SRIOV VFs. (Matt)
v3:
  - Make Wa_14026539277 a device workaround instead of a GT workaround.
    (Matt)
v4:
  - Drop FUNC(xe_rtp_match_not_sriov_vf) and use a direct check with
    IS_SRIOV_VF() in the workaround implementation. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v3
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_gt.c                | 39 +++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 66ddad767ad4..a83cafbe03fd 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -452,6 +452,10 @@
 
 #define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
 
+#define L2COMPUTESIDECTRL			XE_REG_MCR(0xb1c0)
+#define   CECTRL				REG_GENMASK(2, 1)
+#define   CECTRL_CENODATA_ALWAYS		REG_FIELD_PREP(CECTRL, 0x0)
+
 #define XE2_GLOBAL_INVAL			XE_REG(0xb404)
 
 #define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 55ba01bc8f38..d129cddb6ead 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -3,3 +3,4 @@
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
+14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index f3bb856aad2a..bae895fa066a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
@@ -451,6 +452,35 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
+static void wa_14026539277(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 val;
+
+	/*
+	 * FIXME: We currently can't use FUNC(xe_rtp_match_not_sriov_vf) in the
+	 * rules for Wa_14026539277 due to xe_wa_process_device_oob() being
+	 * called before xe_sriov_probe_early(); and we can't move the call to
+	 * the former to happen after the latter because MMIO read functions
+	 * already depend on a device OOB workaround.  This needs to be fixed by
+	 * allowing workaround checks to happen at different stages of driver
+	 * initialization.
+	 */
+	if (IS_SRIOV_VF(xe))
+		return;
+
+	if (!XE_DEVICE_WA(xe, 14026539277))
+		return;
+
+	if (!xe_gt_is_main_type(gt))
+		return;
+
+	val = xe_gt_mcr_unicast_read_any(gt, L2COMPUTESIDECTRL);
+	val &= ~CECTRL;
+	val |= CECTRL_CENODATA_ALWAYS;
+	xe_gt_mcr_multicast_write(gt, L2COMPUTESIDECTRL, val);
+}
+
 int xe_gt_init_early(struct xe_gt *gt)
 {
 	int err;
@@ -576,6 +606,15 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
+	/*
+	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
+	 * as an entry in gt_was[]) for two reasons: it is actually a device
+	 * workaround that happens to involve programming a GT register; and it
+	 * needs to be applied early to avoid getting the hardware in a bad
+	 * state before we have a chance to do the necessary programming.
+	 */
+	wa_14026539277(gt);
+
 	return 0;
 }
 

-- 
2.52.0

