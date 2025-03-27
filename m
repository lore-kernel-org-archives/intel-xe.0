Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A6AC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 20:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE39410E169;
	Thu, 27 Mar 2025 20:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+vNoCT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976EF10E169
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743106927; x=1774642927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v4rWenGHJokcG/P9I74i4cwG5nu+y7+LILIsaR/IdJs=;
 b=k+vNoCT/Mj3gCJOgSApcrQ9VPhb7flIGNkqqHqBQkF7NvsdScTIaoKV5
 VNI3Gj7GWIxBRpgZ7E1hFwcBaw18v9uuPIlX1Max7Yu/vZjXwby3yA5qa
 GuyGalCSgymnCopimdkzPwGJ04K35EPhgKYEhCCRG3BxkF2yuoLXhpjMj
 Rea8f9tp5NtnnARhPMT0HZpTCBgvDem1HmnDwuk1mQtkguvhUSwT+LHSe
 WVBX+X8o2uaCeYp6gmGKyYwVbj3H4vwTK87Wo3pwI9bwAvl7RGnKYdTeZ
 4UXD/ssX6tB5a+SghGWr3mzgNaJo9m/yqqiz6at8G1YHsJByL90z2Wy57 Q==;
X-CSE-ConnectionGUID: gFwNqGBNTVS6+8BWn/q5WA==
X-CSE-MsgGUID: 9EOfBp4PRVucFmkE3gjxqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55458729"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="55458729"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:22:07 -0700
X-CSE-ConnectionGUID: xypk1nmETF+dL8nUL832lw==
X-CSE-MsgGUID: 9WG0ngCwRZyvznYDM8aMuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125471357"
Received: from dut137arlu.fm.intel.com ([10.105.23.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:22:07 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: stuart.summers@intel.com, john.c.harrison@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Use drm_info for hwconfig missing message in
 execlist mode
Date: Thu, 27 Mar 2025 20:22:01 +0000
Message-Id: <20250327202201.15169-1-stuart.summers@intel.com>
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

When running in execlist mode we are explicitly not loading
the GuC firmware and the GuC is needed to provide the hwconfig
values. Currently we are printing an error message any time
we see the hwconfig couldn't be obtained for some reason which
is breaking the execlist specific CI.

Keep the error message for normal GuC based load, but when
the module is loaded with force_execlist=1, change this to
an info print.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 605aad3554e7..52ee2ead3b17 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -345,8 +345,18 @@ static unsigned int dss_per_group(struct xe_gt *gt)
 	 * Some older platforms don't have tables or don't have complete tables.
 	 * Newer platforms should always have the required info.
 	 */
-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
-		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000) {
+		const char *fallback_msg =
+			"GT%u: Slice/Subslice counts missing from hwconfig table; using typical fallback values\n";
+		struct drm_printer ip = xe_gt_info_printer(gt);
+		struct drm_printer ep = xe_gt_err_printer(gt);
+
+		/* In execlist, we don't load GuC, so this is expected. */
+		if (gt_to_xe(gt)->info.force_execlist)
+			drm_printf(&ip, fallback_msg, gt->info.id);
+		else
+			drm_printf(&ep, fallback_msg, gt->info.id);
+	}
 
 	if (gt_to_xe(gt)->info.platform == XE_PVC)
 		return 8;
-- 
2.34.1

