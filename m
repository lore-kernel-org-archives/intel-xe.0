Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF260CDB463
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 23:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7368810E213;
	Thu, 13 Nov 2025 23:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqi/DRTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764C910E213
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 23:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763077246; x=1794613246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XXsuF+kezaEtzr8ce7TtizonsnbcuHND3/UujxX7wdM=;
 b=aqi/DRTVXSPBDiz2wGzo9VkQTtFqLDP0e0Jpj42+AQxSShv3BD5oqeTY
 hRyJkOf9ggh3oEdQVYpYS5zFCdDbayIxmcGxeYijZ/B2R52032ZAEWJr5
 xfQAvGx9WD+H61B4L4ximI/64vGY9ssfK4wXRm7Bdw0Otds3BKMJeF9oa
 UXZkBJqWHbIJdE8SRkA34Sla6TVn1XyGqgorzvUdxrL3ze1uk2ioi80TN
 QzmYksWlU/NYPRSjAtyHOR6ezLSAwRdfXeRMrFL49XL2QS1LhqPJJ0G5D
 4gzL+yY09jBkd7bBU8nvp4ZLaUGKQeO2JqWkUlyPBfyd9dhMxXI4wddVU w==;
X-CSE-ConnectionGUID: xSWCdNqgQkOYkeEP3bvW/w==
X-CSE-MsgGUID: hdxiUgosR8+MjLk29GXdJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64175357"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="64175357"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:40:46 -0800
X-CSE-ConnectionGUID: BAlJQW27SMWw2VbvU1kykQ==
X-CSE-MsgGUID: 4WMJIK8sSqmOxwx6DO6WPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="190398461"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:40:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe/kunit: Fix forcewake assertion in mocs test
Date: Thu, 13 Nov 2025 15:40:39 -0800
Message-ID: <20251113234038.2256106-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
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

The MOCS kunit test calls KUNIT_ASSERT_TRUE_MSG() with a condition of
'true;' this prevents the assertion from ever failing.  Replace
KUNIT_ASSERT_TRUE_MSG with KUNIT_FAIL_AND_ABORT to get the intended
failure behavior in cases where forcewake was not acquired successfully.

Fixes: 51c0ee84e4dc ("drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs")
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 0e502feaca81..6bb278167aaf 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -49,7 +49,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
 		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
+		KUNIT_FAIL_AND_ABORT(test, "Forcewake Failed.\n");
 	}
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
-- 
2.51.1

