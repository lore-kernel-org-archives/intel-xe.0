Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED704C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 04:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6817F10E084;
	Fri, 29 Dec 2023 04:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1869C10E084
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 04:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703824573; x=1735360573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7WOzVUxT9KBzMA4KdljXVVwAFnIvkRG1ogFbHh30kI=;
 b=aK0FVACtJsNkxz/m+Nhf3xIyov4Vr5gWI2tdMSQTrCA0bHuhPxfgQ/mE
 6NYqc03ZVojZi32iqPvc+Mu6/H5KoOKyi3QDY/ObBhajGFlYhJ/p5LgM4
 FIdyHR/LBKrbbuJLsh+2WNqHUTW8nSZEMCGgzsUS6EfPO0OuSN51Gsyey
 2ZrxshNUXSu0h9Vj2SKVl9s+dqZgVLg7ei4g1juCpWWv8l93lK9uvgnLx
 YruagUIH/BAuKBW7PnBqC46efgBT0Edkztr22ciW6Zw+2nw43GwU8d188
 XxgjwtqAUfyEQ62PcR5X1rFEwEVCso1HaEv6MepGHOATHEMKmvTtSNBLw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3916606"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; 
   d="scan'208";a="3916606"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="902140269"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="902140269"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 20:34:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/xe: Move TLB invalidation reset before HW reset
Date: Thu, 28 Dec 2023 20:35:05 -0800
Message-Id: <20231229043507.1002411-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229043507.1002411-1-matthew.brost@intel.com>
References: <20231229043507.1002411-1-matthew.brost@intel.com>
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

This is a software reset which can be done immediately after stopping
the UC.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec1295..c647f41b2751 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -619,12 +619,12 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_reset(gt);
 	if (err)
 		goto err_out;
 
-	xe_gt_tlb_invalidation_reset(gt);
-
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.34.1

