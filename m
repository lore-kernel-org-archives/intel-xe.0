Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ABDC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 02:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B1E10E044;
	Tue, 20 Feb 2024 02:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE4jRCVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A5C10E044
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 02:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708395285; x=1739931285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ubjW5VpVCr/mcOqo4LJmu26VmI/5WQJb2ncCw4mQpEs=;
 b=OE4jRCVVGM/a5/npNW0Iz99pwCXRnzF1Rbx2bQjbwP1ibsBUeIQUZLL5
 Wmy6mn5gkpk8xJuaaDUYG6vJcB7RlpRl8oX801IN+9c/SEaqZSNkmYQ9S
 c0d8cecZLMuEmlikLv8c/vbvrl0UMBh44ErWMWKWqPR/XX/aiUeDuen0d
 FZDx9gCmp7zM5L7XiQViC3wZRDaxa2HSe9GkH2CAHKjwn4GzfXJsRddug
 4FYJzS99Y2nJEBkUbhRxSGBp80cE7vzc0yzsZotzgWXAnZnkro9tPBV1t
 jqzT8gxMVS2XeRz9OAh7yi22BRecitRZyS9fNj0xhOipAzyaduiBU5OLY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2590759"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="2590759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 18:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="42131286"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.61])
 by orviesa001.jf.intel.com with ESMTP; 19 Feb 2024 18:14:43 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is disabled
Date: Tue, 20 Feb 2024 02:13:56 +0000
Message-Id: <20240220021356.3514454-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Suspend may cause the TLB invalidation time out as below log.
Skip the log print if ct is disabled to make log clean.
"
[  228.812266] xe_gt_tlb_invalidation_wait enter
[  228.812311] xe_gt_suspend enter
[  228.812782] xe 0000:03:00.0: [drm] GT0: suspended
[  228.812786] xe_gt_suspend enter
[  228.813508] xe 0000:03:00.0: [drm] GT1: suspended
…
[  229.067007] xe 0000:03:00.0: [drm] *ERROR* TILE0 [GTT] GT0: TLB invalidation time'd out, seqno=321, recv=319
[  229.067099] xe 0000:03:00.0: [drm] *ERROR* GT0: CT disabled
"

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 7b3a54748b49..8aac12efea84 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -330,11 +330,18 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 	if (!ret) {
 		struct drm_printer p = xe_gt_err_printer(gt);
 
-		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
-					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
-					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
-		xe_guc_ct_print(&guc->ct, &p, true);
-		return -ETIME;
+		/*
+		 * guc ct may be disabled during the waiting period and lead to the timeout.
+		 * Such as power suspend just after this tlb invalidation wait.
+		 * Skip the error log print if ct is disabled.
+		 */
+		if (xe_guc_ct_enabled(&guc->ct)) {
+			xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
+						    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
+						    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
+			xe_guc_ct_print(&guc->ct, &p, true);
+			return -ETIME;
+		}
 	}
 
 	return 0;
-- 
2.25.1

