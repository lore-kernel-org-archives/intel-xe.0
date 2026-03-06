Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCFFCC04F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB76410EE05;
	Fri,  6 Mar 2026 17:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGp3bTLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC5C10EDFA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 17:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772818133; x=1804354133;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MkcY3vdrMYbnIb6JXWGi2ZaIGVT/39wpGhqA7826408=;
 b=HGp3bTLXrrBkk6T0Vtjx1D74tbgCITk2CJ3UJln9zLPtILAtEctJKhO2
 3eUM+nRIYP8Lxot15p1ieucLBfbJh50IPkHduDgy6CtDeT2gQ53AMnLmO
 6lXdprVeQJSJw3ekioIkbgelpJU1KQDdkU8x0uTVef3SVdwU5juYDuZ4R
 aCeZcBexpLoLfNfVYZHCtBMHD8vzpJvtfBDgSLjXKufwbeBdF1BnU8wxn
 6eeo+sXVN1pjHvYp41Mx3swcjS/0vrbnmPRYDixBUzv/kCytxbee4MjMs
 cEXK9jkjzmXX3w9i5uMOSjV1KW1Xm81BsVwYHClGYMQb+imW3Uf7FOFAM Q==;
X-CSE-ConnectionGUID: xLdEt/qgQNyu+GS+SUGIDg==
X-CSE-MsgGUID: l/siD4lYTZSEmILljoaLww==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73899635"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="73899635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:53 -0800
X-CSE-ConnectionGUID: 2jMsx/rMQMSVt8AYjRJx2A==
X-CSE-MsgGUID: x9aGorHORTexptLsfP+Q/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="218229627"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.22])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:28:52 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Mar 2026 14:28:25 -0300
Subject: [PATCH v2 5/7] drm/xe/nvlp: Implement Wa_14026539277
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-extra-nvl-p-enabling-patches-v2-5-53dcfa6b44e4@intel.com>
References: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
In-Reply-To: <20260306-extra-nvl-p-enabling-patches-v2-0-53dcfa6b44e4@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
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
index 80b54b195f20..03a0bf0aeb6e 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -58,3 +58,5 @@
 
 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
 		GRAPHICS_VERSION_RANGE(2004, 3005)
+
+14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0), GRAPHICS_VERSION(3510), FUNC(xe_rtp_match_not_sriov_vf)

-- 
2.52.0

