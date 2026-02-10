Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AEAEB26F5
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 18:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22610E22B;
	Tue, 10 Feb 2026 18:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAS0mtNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701E010E22B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770747924; x=1802283924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yb3QvTavkbEYYgUfYLVKGUAJIaInXy8HuqUfNp93v1U=;
 b=KAS0mtNHKNbvWFpsRG4Qf7Px3idNCsUh1xbB0JeUV0FZQnGiQydNRx64
 p7kcGRH0mjIOqltDMMl/+prV8/gdoCv6C1n4W8KxKhLrHXp9C1jbF0YnZ
 Gz4e1rdCN7IYoBh5p0PkdU+3lypkjE6VzhD43akn3tfmkhyHEJQTDMaJS
 QveD42FF2EQOij8+LJc0JBjIN7RKSgutUd3iKKuSdolKoxhg0AYsddwwo
 tXkHMh/oooH5uil/m0zYiMM12D4jJE2CeaU4GICY/szMvePtNtaMkncV4
 STPAdvcoAlSQywqaxovAiUi7bGcOCZFC6ncRyRmqO8GtZA9nCRzS98v7e g==;
X-CSE-ConnectionGUID: xa0S1qJZTTWHCElxc/MCqg==
X-CSE-MsgGUID: BagZivVsTB+Eo/u1RmzSXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71872893"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71872893"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 10:25:23 -0800
X-CSE-ConnectionGUID: uQGstucfT0C06YcSVhI89g==
X-CSE-MsgGUID: +oQzV1meTRSQKIm7QCa51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216159229"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 10:25:23 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/xe3p_xpc: Add new XeCore fuse registers to VF runtime
 regs
Date: Tue, 10 Feb 2026 10:25:19 -0800
Message-ID: <20260210182519.206952-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.53.0
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

SRIOV VFs do not automatically have access to the XeCore fuse registers.
Add the two new registers that show up on Xe3p_XPC to the runtime
register list to grant VFs access.  Since there's a single runtime
register list for all Xe3p, this will technically also grant access on
Xe3p_LPG platforms where the registers don't exist, but that should be
harmless since even if a VF tries to read a non-existent register on
those platforms it will just get back a sensible value of 0x0.

Fixes: e8100643ff01 ("drm/xe/xe3p_xpc: XeCore mask spans four registers")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index b5e0a5b7723e..6586df2fcb91 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -111,6 +111,8 @@ static const struct xe_reg ver_35_runtime_regs[] = {
 	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
 	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
 	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
+	XE3P_XPC_GT_GEOMETRY_DSS_3,	/* _MMIO(0x915c) */
+	XE3P_XPC_GT_COMPUTE_DSS_3,	/* _MMIO(0x9160) */
 	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
 };
 
-- 
2.53.0

