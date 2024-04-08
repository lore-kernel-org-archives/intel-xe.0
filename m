Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D0ECD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 15:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526310E025;
	Mon,  8 Apr 2024 15:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kmv6soSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20781126DC
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712589152; x=1744125152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2VBdVPYzn5lixA2PBeJ613629/s2u/hyrIyPgLHespI=;
 b=Kmv6soSgT0jzrxttcedmgKDijLAfjrVPIyTAqTfmmk7CSgfeDSyOLcj/
 5MTzr27OFhB0VIhEkOClhlccNXrg6jkWfselFU0c6JKUB3wSrA3lrlo1u
 IdT7J829j3dVVlwT7b7YtTKf9SKzkAFCXqcEhsuo/g1u9ZY1NIU3A2h3O
 ub8bIEu8b/TA4c54OOBK6mliNNS6+vhLSyxwSo88JsziSNAYlIlSfBJAi
 z07eG3Cnsry1H36Yd5Qs+OHGQjKyBTuHFswufH2+4A5v0kmjmG7gay2mR
 ztaBwPyqECxlTmJmxiBlyFjqGaFZT48E4v6if8yA1uAWVQrw+1EhAesYO g==;
X-CSE-ConnectionGUID: EJXiJ52YR9eIDg/xLkamjg==
X-CSE-MsgGUID: Pni5JVINSyuADAmsKDKujw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7728963"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7728963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 08:12:32 -0700
X-CSE-ConnectionGUID: fz01a68xRqWZ75e8rh+Ojg==
X-CSE-MsgGUID: Q6JgpcOhRP++vydFqyrysg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20006690"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 08:12:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Remove dead clock code
Date: Mon,  8 Apr 2024 08:13:12 -0700
Message-ID: <20240408151312.2100304-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_gt_clock_cycles_to_ns() is not called from anywhere after PMU
handling was removed in commit 90a8b23f9b85 ("drm/xe/pmu: Remove PMU
from Xe till uapi is finalized"). Drop it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 5 -----
 drivers/gpu/drm/xe/xe_gt_clock.h | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 937054e31d72..c7bca20f6b65 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -78,8 +78,3 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	gt->info.reference_clock = freq;
 	return 0;
 }
-
-u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count)
-{
-	return DIV_ROUND_CLOSEST_ULL(count * NSEC_PER_SEC, gt->info.reference_clock);
-}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index aa162722f859..44fa0371b973 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -11,5 +11,5 @@
 struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
-u64 xe_gt_clock_cycles_to_ns(const struct xe_gt *gt, u64 count);
+
 #endif
-- 
2.43.0

