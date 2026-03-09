Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252F0FCA180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 20:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23E610E5C5;
	Mon,  9 Mar 2026 20:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kq0FOij1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5166710E5C3
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773086875; x=1804622875;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ZHAoutYh0AH23mk2xCJRF9Wmvw9TKOWsgiYmZ+FyMRE=;
 b=Kq0FOij1R08xhTclXFBoGySJn8IBfL+LX1r8cBzq5iAaiZfRpDZkewXV
 w/mK6EZWTAdZJ2GgqnxLtOuEgi1GFDOi1pB/nwZgt0XUpskV4RslN1ZDl
 nHYmw2aeNnUaGvyxdZQXl4lnuaQACsFtBgfJCwxxmChzTyhyPdSyFQrn7
 i3hG3J8NCZVkcwSSCBGjaCUynFylN0P/tt36Y2/xCcSFizUFVDbFToKzo
 JnthnreJStVbdhfZDOp1geVt5JJQTm37/p5Far4FNt9FTieFwcEMjK7bx
 ab0JRNckpL/6RQF6RVq6+OAJnTf1RD349/UxBKoDwLuqWMpwNhERofLLL g==;
X-CSE-ConnectionGUID: Bte5iQkQQIOkMYhgQj4kUw==
X-CSE-MsgGUID: YrSLPFCKQRq+VClWoqEZOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="61694889"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="61694889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:55 -0700
X-CSE-ConnectionGUID: biHjp4wiTQ2lGKk8EC/Lbg==
X-CSE-MsgGUID: K072SiL4TxCcs7PR3VbZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="242879522"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 13:07:54 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 17:07:34 -0300
Subject: [PATCH v3 6/8] drm/xe/nvlp: Implement Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v3-6-0416900dd498@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  4 ++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
 drivers/gpu/drm/xe/xe_gt.c                | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+)

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
index 55ba01bc8f38..7a1d1f9072b1 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -3,3 +3,4 @@
 		PLATFORM(PANTHERLAKE)
 22019338487_display	PLATFORM(LUNARLAKE)
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
+14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index f3bb856aad2a..bbb2fb86d3cd 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm.h>
 
+#include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
 #include "instructions/xe_alu_commands.h"
@@ -451,6 +452,23 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
+static void wa_14026539277(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 val;
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
@@ -576,6 +594,15 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
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

