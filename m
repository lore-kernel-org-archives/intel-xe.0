Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB8CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 19:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836CE10E1C7;
	Mon, 17 Nov 2025 19:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJyWRb6a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4F010E1C7
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763408930; x=1794944930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9K1S4zHVmw55o99X24UvcSkpsJvyyK0ZmPgyi6wSZc=;
 b=JJyWRb6a1QoKNtFlfxaWJ4mupDCl2OMQP0Ho42bjBz4i6K9B/dAyxd0I
 J49flMyC9IjjYDtGK6YfYbG6jfMpH7kC0ER2XLz0JiZuoXuvGkbXR0QW/
 x/xJf6rST0RTLqPBE0DprQjAHDcJO9YVD9/nXLEyTUzUTBbBETafLoyeT
 D8kGo8oJYSj0jh+J0QloAcBgMILOVSheytFkR2vcMFH33rsRrzBdoIBss
 /YW4U9/z85mK61Y/GNcHHu5ZFaySEwTafIUjq13D6mwjdcosGvyzqOXc8
 9IuerT911Q09ddALcvF31vQmKXMrlmxSjtRLAZTKpHRlAGb/2YYFNkRV8 g==;
X-CSE-ConnectionGUID: hsf+szb1SGy79k6fz07Srw==
X-CSE-MsgGUID: sH+ylnNARqODScJlpRlDbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="52991953"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="52991953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:48:49 -0800
X-CSE-ConnectionGUID: EMveLEshRKmNYVF1EZ588Q==
X-CSE-MsgGUID: v5Hc7IscRbyB/uyuRpiT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190571152"
Received: from hchegond-desk.jf.intel.com ([10.88.27.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:48:49 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/1] drm/xe: Fix conversion from clock ticks to milliseconds
Date: Mon, 17 Nov 2025 11:48:43 -0800
Message-ID: <1562f1b62d5be3fbaee100f09107f3cc49e40dd1.1763408584.git.harish.chegondi@intel.com>
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

When tick counts are large and multiplication by MSEC_PER_SEC is larger
than 64 bits, the conversion from clock ticks to milliseconds can go bad.

Use mul_u64_u32_div() instead.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 00f5972c14dc..bfc25c46f798 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -74,11 +74,6 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	return 0;
 }
 
-static u64 div_u64_roundup(u64 n, u32 d)
-{
-	return div_u64(n + d - 1, d);
-}
-
 /**
  * xe_gt_clock_interval_to_ms - Convert sampled GT clock ticks to msec
  *
@@ -89,5 +84,5 @@ static u64 div_u64_roundup(u64 n, u32 d)
  */
 u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
 {
-	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
+	return mul_u64_u32_div(count, MSEC_PER_SEC, gt->info.reference_clock);
 }
-- 
2.43.0

