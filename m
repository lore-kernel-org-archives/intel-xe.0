Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E25CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 07:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ED610EAED;
	Tue, 19 May 2026 07:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msFTfQJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418410EAED
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779176538; x=1810712538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3hIsISCVTPH0EQKueOEFFXhsxHwXcccPYq7/eFktsxo=;
 b=msFTfQJPWi4OHpMNhVvVED+aoEtQirsjIsGm/S1gRt4oIdXgEVZDunEe
 hKROrrkQB2DOF6Qq3Xza6bVjBMMQ2QEPk4sZOJ3vl4byr/4YzOoKn/Mds
 KyfIqQ9hfQJ4z7W8j554ntF6T3+PXWIndUc5uh0DOe++hagNMicTAhYd/
 6MRzQ79m8eY3rBbQ6SikiQrRs1kupCe1xcQAoJKMYgc/vuduoS6TU+Zav
 DCbGM3q7KYyLqfHNRuqOLqR7OB26BVDxEWAYxH5YKmvw1wBrAb+pWJHan
 CCDRxfr00m3s7xrOOtjkaY3Lxz9vMFgBZV4cUqpE5FKs57ZXPvXb8YmDJ A==;
X-CSE-ConnectionGUID: PPfJJgPwR0qsYeger+cL4Q==
X-CSE-MsgGUID: XeyE7mEHTiOz3fDUcRmnQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80025935"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80025935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 00:42:15 -0700
X-CSE-ConnectionGUID: TbYNip3lRyGEJZIYxGIQ1g==
X-CSE-MsgGUID: IzBxqd6vTlmJdYSsUZS4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239561932"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa008.jf.intel.com with ESMTP; 19 May 2026 00:42:12 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, stable@vger.kernel.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915/color: Fix HDR pre-CSC LUT programming loop
Date: Tue, 19 May 2026 13:23:08 +0530
Message-Id: <20260519075308.383877-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

The integer lut programming loop never executes completely due to
incorrect condition (i++ > 130).

Fix to properly program 129th+ entries for values > 1.0.

Cc: <stable@vger.kernel.org> #v6.19
Fixes: 82caa1c8813f ("drm/i915/color: Program Pre-CSC registers")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2d318e922671..3bfe09d81a4c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3976,7 +3976,7 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 				intel_de_write_dsb(display, dsb,
 						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
 						   (1 << 24));
-			} while (i++ > 130);
+			} while (i++ < 130);
 		} else {
 			for (i = 0; i < lut_size; i++) {
 				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
-- 
2.34.1

