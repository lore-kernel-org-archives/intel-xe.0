Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE7CC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A1210F14C;
	Fri,  2 Feb 2024 22:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNrURIlg";
	dkim-atps=neutral
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 22:56:27 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC3210F148
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914587; x=1738450587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pr86xM7cNzB+yzVGwrBLXR8RWHmvdGPCZJ/EVBmvMJE=;
 b=cNrURIlgimdROtgdCkzp5zKpCwaeEuPiw+GioINVNxnEBX5dZDV1fjBB
 h1UL/0adPbfl/iRLhRSyzMu6egWjMIof8E1z48AN9miut17EBv2rLD50s
 7KGfYzQ72b6/3hj8jPHUf2GDwVbkhJVRlzC9vyxUAyqcQVyIBYlXx7hjC
 KqmoWtjXlpXr9JwSaW66Nw8m8zC78g2BfiRzQWKzCAoImaucK9z9XacP7
 1ohooUW78gcd48JEBXjKCCIbRmCYh2tFqlQe8kN/AbTH7OH8GplgDMHok
 j0Q4KeikndtUDOSSder50NxpI1kYLKyOA36DjrDgy7V25081Vui7Pryyb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="160217"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="160217"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:56:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="31000629"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:56:27 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH] drm/xe/xe_gt_idle: Drop redundant newline in name
Date: Fri,  2 Feb 2024 14:56:23 -0800
Message-ID: <20240202225623.3225443-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Newline in name is redunant and produces an unnecessary empty line during
'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
stringify the argument to avoid potential vulnerability")'.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 9358f73368896..9fcae65b64699 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -145,10 +145,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	}
 
 	if (xe_gt_is_media_type(gt)) {
-		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
+		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
 	} else {
-		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
+		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_rc6_residency;
 	}
 
-- 
2.41.0

