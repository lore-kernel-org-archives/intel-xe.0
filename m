Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB634C54E58
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 06:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B1310F845;
	Fri,  8 Mar 2024 06:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP6B7KGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9110F845
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709880637; x=1741416637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5+0gU1UpOPtz3tV5K+Xtm1tuvlcjKT3CkO9VtvT07N8=;
 b=PP6B7KGmyFVkfu/9DVwv9VccMBHJ9E/XsPiZoSgucO69chV+5uj2WWgT
 MTzQRneYELE9BTz3UL0w4qeRkEJyB6iC77OhYsXOkrRCK9IbMqlPvJLpr
 gAwaQA9RmVmMyOlD6vahzEy8U/caUGRFaJkeV8ZZvUujc+UV4BTkoR/Zm
 pMzbLK/caYjp9WEHWaGNuuKI7QGK4nxsebbRmqnn35m7S6Rr1QgpInNCT
 pLPX5iMOSe4XYkU6qLqjrWh9vhfoghWBvxru+c7b+fRxn9ZznzpLdjswo
 s8xOQA0r/PYWKr671/Zpn8TIcCWZe3Yd9TKzD8YBAHRuaKA7JY+p6l5sa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4457059"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4457059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10254355"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 22:50:35 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/gt: Remove redundant num_engine check
Date: Fri,  8 Mar 2024 12:33:08 +0530
Message-Id: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

In __xe_gt_apply_ccs_mode num_engines will never be 0
as it is already checked by parent function.

Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 529fc286cd06..2bbd7b203cc2 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -22,7 +22,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 
 	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
 
-	xe_assert(xe, num_engines && num_engines <= num_slices);
+	xe_assert(xe, num_engines <= num_slices);
 	xe_assert(xe, !(num_slices % num_engines));
 
 	/*
-- 
2.25.1

