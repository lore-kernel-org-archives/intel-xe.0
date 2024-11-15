Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A5D6DDF8
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 12:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F61E10E09D;
	Fri, 15 Nov 2024 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXdpgdCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8DC10E09D
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731675443; x=1763211443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGxOfazFpRmC9J8crdBbiHJg8QRSsHtYPb+Rf3ZOYNM=;
 b=OXdpgdCzZ08CQdneXIlUIxsiDrhX7DCYAWnEB9mzGv1T2a+LR6Oo4CBh
 3fMPUlPh46VAnath7K7nQ9JQyRQio1pcYXcsWR79iCLMaIWUc9erwd3QB
 hBc6qaucWJkxUbQD5mQpf0Qsh7drX+9hAbtS60TUxrVg34JlW1Nrra3A/
 ZTsW/Hy1JScWuNbqHpQJj39zB0v/2sYmaVxdwTQJNCIQWhLanAl57D3n+
 i5npbKmbvVSOGf81ZzBEmamj5eX8G4BIhkMyOqoncNuMyGBp+sYgouEYk
 b7EoJJfIyhlFZcetKsIJc0ATDn2IRy7+v9csqllZBLq4xUxbDUs8pNE6b g==;
X-CSE-ConnectionGUID: igglibBhTAeqPEYto0Rg7Q==
X-CSE-MsgGUID: YlFGkQ25QKa/B+Cl1YcRrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31600814"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31600814"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 04:57:22 -0800
X-CSE-ConnectionGUID: YYyF6LaZRYuGBxbeaow+0w==
X-CSE-MsgGUID: b2ZRcu98R8G+0vX7f1ROzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="88436694"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa010.jf.intel.com with ESMTP; 15 Nov 2024 04:57:20 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/throttle: Log throttle reasons
Date: Fri, 15 Nov 2024 18:26:14 +0530
Message-Id: <20241115125614.857611-1-raag.jadav@intel.com>
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

Log throttle register MMIO reads which will be useful for debugging.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
index 03b225364101..0ce21ffc08dc 100644
--- a/drivers/gpu/drm/xe/xe_gt_throttle.c
+++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
@@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
 
 u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	bool media = xe_gt_is_media_type(gt);
 	u32 reg;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
-	if (xe_gt_is_media_type(gt))
+	xe_pm_runtime_get(xe);
+	if (media)
 		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
 	else
 		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
-	xe_pm_runtime_put(gt_to_xe(gt));
+	xe_pm_runtime_put(xe);
 
+	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);
 	return reg;
 }
 
-- 
2.34.1

