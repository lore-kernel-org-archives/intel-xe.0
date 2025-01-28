Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8444FC0218D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 11:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4BB10E668;
	Tue, 28 Jan 2025 11:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfyQzOIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBF10E668
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738062655; x=1769598655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sLOfR7P1TAB5lxj4SUacwrJd3lTyYbitWXIFp8LmjzI=;
 b=ZfyQzOIBsQlJ9BppftvI2qoBLbfajlkiaCfw5MWlx7MLyDb2FrAeX7es
 v1mSOOyYpNzaZuFIpEX0Y7IkGWNUWnYeZfErB5KPvsfCrV2h0ZjQ64q4R
 OuzAiCwrGdNXICFNoAhYJcghC4iDW0qKrdwdtkMyqZQ0xcD2UFDQE3CkD
 PBT7vte6CIssQC510QGb8FtNfpzyRQRzThhFpDaBgOIVnU3Y0GiIt4/eY
 rS4jUfl3CWyfz4IZzXlTfm8Wce84tKvzTYwUV0GYeOz7XX835L4+DncT5
 IAklBo0xrq0K4DF72HvIFBpfPFEwSZRM6dwSkJDGGYkz14n/JWXJka0nu g==;
X-CSE-ConnectionGUID: Hgz/GHdmS1WMm99KHP/DBw==
X-CSE-MsgGUID: 3ulN24r5StSpk2jr+WfgBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38246465"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38246465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 03:10:55 -0800
X-CSE-ConnectionGUID: //55sZCNTK6q17A9pXm8Vw==
X-CSE-MsgGUID: 7nO2hgdKTveNUDW76qpGUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132001593"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 03:10:53 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 1/1] drm/xe/pf: Add runtime registers for graphics gen >= 30
Date: Tue, 28 Jan 2025 11:03:00 +0000
Message-Id: <20250128110300.2840596-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
References: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add missing runtime registers for graphics versions of 3000 or higher.
This is required for Xe3 where additionally we have
MIRROR_L3BANK_ENABLE register.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 23 ++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index 924e75b94aec..6b5f849a0722 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -176,11 +176,32 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
 	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
 };
 
+static const struct xe_reg ver_3000_runtime_regs[] = {
+	RPM_CONFIG0,			/* _MMIO(0x0d00) */
+	XEHP_FUSE4,			/* _MMIO(0x9114) */
+	MIRROR_FUSE3,			/* _MMIO(0x9118) */
+	MIRROR_FUSE1,			/* _MMIO(0x911c) */
+	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
+	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
+	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
+	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
+	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
+	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
+	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
+	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
+	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
+	CTC_MODE,			/* _MMIO(0xa26c) */
+	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
+};
+
 static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
 {
 	const struct xe_reg *regs;
 
-	if (GRAPHICS_VERx100(xe) >= 2000) {
+	if (GRAPHICS_VERx100(xe) >= 3000) {
+		*count = ARRAY_SIZE(ver_3000_runtime_regs);
+		regs = ver_3000_runtime_regs;
+	} else if (GRAPHICS_VERx100(xe) >= 2000) {
 		*count = ARRAY_SIZE(ver_2000_runtime_regs);
 		regs = ver_2000_runtime_regs;
 	} else if (GRAPHICS_VERx100(xe) >= 1270) {
-- 
2.25.1

