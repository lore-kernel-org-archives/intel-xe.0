Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B9C369CA
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 19:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FBA10E3B3;
	Thu, 17 Apr 2025 19:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG3CqNHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EF710E3AF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744919536; x=1776455536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYEv0C2VUQq9kDaVYUFD2kB2dWBQ/i5ZsZ59i6XsqzY=;
 b=cG3CqNHfp40sKjGI1AqV7eoD9VaTgZjhKAyvAHvVmapFqrxvY/RHw+BI
 /HZ+wa2tPLbehG0CBSrBmw0YsT+GvHLVJlPbtd8LZyfS8cNCsdpQQLL4o
 oY9JMuNNZBjwpj+HUORGHgxLIxeUc4B+jOxoeoNoGWfnyibDFrRMVUgeV
 VPhACYwOJ+4X0RLZ+CGiSLv63xHQ/Ic+qy50gL8fdTmd4cjJDqX0pc9T9
 syNlUCe/Ct/nU0LCNY2n1wR8RGD4PMbLa7IDONVEs4Y8xJXORC8lzWIZW
 y2q0FeHaQfFl5W8QtaBHXxI9L4VWqu/afUtGvo0o65uq5gMTHHt6H3NYT g==;
X-CSE-ConnectionGUID: 0wcRcgw/RQq143UTbN89MA==
X-CSE-MsgGUID: ajfOSyclQa2/qSMSNpqAWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46456366"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46456366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:52:16 -0700
X-CSE-ConnectionGUID: mBL4CeoBRSiJoOnvv6hHYA==
X-CSE-MsgGUID: kh/mX4StRwi/vBhcGtd90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135765213"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 17 Apr 2025 12:52:15 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Use the steering flag when printing registers
Date: Thu, 17 Apr 2025 12:52:13 -0700
Message-ID: <20250417195215.3002210-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The printing code was doing a test on which list a register was in to
decide whether it is steered or not. That might be valid at this
moment but there may be other reasons for extended lists in the
future. Plus, there is a flag specifically for identifying steered
registers. So, just use that instead - it is simpler and safer.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_capture.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 9095618648bc..f4b08136e472 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -1672,18 +1672,16 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 {
 	struct xe_gt *gt = snapshot->hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_guc *guc = &gt->uc.guc;
 	struct xe_devcoredump *devcoredump = &xe->devcoredump;
 	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
 	struct gcap_reg_list_info *reginfo = NULL;
 	u32 i, last_value = 0;
-	bool is_ext, low32_ready = false;
+	bool low32_ready = false;
 
 	if (!list || !list->list || list->num_regs == 0)
 		return;
 	XE_WARN_ON(!devcore_snapshot->matched_node);
 
-	is_ext = list == guc->capture->extlists;
 	reginfo = &devcore_snapshot->matched_node->reginfo[type];
 
 	/*
@@ -1749,7 +1747,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
 			 */
 			XE_WARN_ON(low32_ready);
 
-			if (is_ext) {
+			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
 				int dss, group, instance;
 
 				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
-- 
2.49.0

