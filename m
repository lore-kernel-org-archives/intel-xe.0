Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371D1F30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E981B10E286;
	Thu,  5 Mar 2026 12:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fYVinjbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8B610E286
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712194; x=1804248194;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uZVGxW0+mC4OLR5yJH7/h9zHkPaqilzePYiyn7M2tw8=;
 b=fYVinjbrAyD5oY0VQonuQhBmmACIj+Ehf4rwHJQI62Tzy6NmVY5ogTPJ
 Wt/NskvJGzyL6OUu/nn1hqItCIOdQxgPuiBkD3qSFtskJ3Z57yo8Xwh3D
 yTiaDiez08QExHsCYCnIeKPqUGSBpg8GeXInVrcbrL4D4VgNR6ac5HUZ7
 XIjkrDoVxh0HJckA+0kzqUjOg0lsxXxYwr7UJoX7fR5vKk0yprMrW3kEu
 vBNKvYdHQx+e3XBMr9+H4b08QwIcUvE8vYIwTU+J5cLtLqkxKambeFrQy
 yLB649Vr1CDLFrRaVnbou4uZokj7NgnMG+7M3GQ3xouCSb7wUbGTFauPe Q==;
X-CSE-ConnectionGUID: 7Fe8fVExSKGDzAqXM6/mpg==
X-CSE-MsgGUID: Ula9eZx4RZ6KY8aPhLx4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702521"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:14 -0800
X-CSE-ConnectionGUID: Gd8WYh/fRZStdDpMCXmN6w==
X-CSE-MsgGUID: dYB2TaZbSseJh8zoY6UAxA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:13 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:32 -0300
Subject: [PATCH 5/7] drm/xe/nvlp: Implement Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-5-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules   |  2 ++
 3 files changed, 33 insertions(+)

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
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..3c8692f9b8cf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -450,6 +450,25 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 	return err;
 }
 
+static void xe_gt_wa_14026539277(struct xe_gt *gt)
+{
+	u32 val;
+
+	if (!XE_GT_WA(gt, 14026539277))
+		return;
+
+	/*
+	 * L2COMPUTESIDECTRL has a specific offset for media and the GSI offset
+	 * does not apply.
+	 */
+	xe_gt_assert(gt, xe_gt_is_main_type(gt));
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
@@ -575,6 +594,14 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	 */
 	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
 
+	/*
+	 * Wa_14026539277 can't be implemented as a regular GT workaround (i.e.
+	 * as an entry in gt_was[]) because we would get the hardware already in
+	 * a bad state by the time it would be applied.  Hence, we implement it
+	 * as an OOB workaround and apply it early to prevent that.
+	 */
+	xe_gt_wa_14026539277(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 80b54b195f20..7f42436df6ab 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -58,3 +58,5 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+
+14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510)

-- 
2.52.0

