Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E95D6409C
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241DA10E326;
	Sat,  9 Nov 2024 01:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiBRZ4vf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B3D10E33A
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m+WNv8cs4GWjktYo1aRapwx7SDzryUCtDcuOprI8F/U=;
 b=ZiBRZ4vfOirNiPyh85N/Fmb/WUfudRcIabc7gSDZ/XXiP9Ne+E4x57sF
 IiR4ZrYh7XYlN8BbyRhuMjDDBIh7GZIDpXK/NXvo+VDcoI3FjA0vMOMzO
 i5oAD2XMjd7FAvNBhrlwhLHRjGg4YarC1r9QVoxhk39Z/n6Qgh5aQG865
 1unLAl4YBXwRa53Sqh6bJJmbTcIhGkLH44lvBKMZtVgDHHbvlQGGzdQSa
 N9VeQqbUdtQYKzQPCkFALmSLWZ80V/O4qrSK0zMFItqkecJa9/GPO46se
 STnAdunZhKi1y10zxVvll9NgKYJSGN+cqH3y8Yjz+NQGRzP66djPshVtT w==;
X-CSE-ConnectionGUID: 8DMqkSyMTg+8vi2ICK1/YQ==
X-CSE-MsgGUID: Yf2uQZ27S82qQ/ylIq4B7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799511"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799511"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: 42EnTZ1PS0q+EWlUcJlrHQ==
X-CSE-MsgGUID: y1+AFfWYRXSNdEaqw01uiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369008"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 2/5] drm/xe: Trigger a devcoredump capture on a GT reset
Date: Fri,  8 Nov 2024 17:59:31 -0800
Message-ID: <20241109015934.2203462-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
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

The GT reset code does not have access to a scheduler job, and is
usually called from some error condition disconnected from the job
submisson flow. Hence it did not generate a devcoredump. However,
devcoredumps can now be triggered without a job, so do so.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index d6744be01a68..2fa1d0f07850 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -19,6 +19,7 @@
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_devcoredump.h"
 #include "xe_exec_queue.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
@@ -846,6 +847,9 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 	xe_gt_info(gt, "reset queued\n");
 	queue_work(gt->ordered_wq, &gt->reset.worker);
+
+	/* Capture system state for the user to include in a bug report */
+	xe_devcoredump_for_gt(gt);
 }
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
-- 
2.47.0

