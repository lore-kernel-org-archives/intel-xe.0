Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196AD711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 22:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0515D10EBC0;
	Thu, 18 Dec 2025 22:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0h1AHtg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1410EBC0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766097952; x=1797633952;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZwiItx7V2PujOxrcp3g8UhBDo6z/w136e7JJuCwExLY=;
 b=m0h1AHtgAoPeviBJQuuuqhL+6pug/w6S2biJ7lzDhQfWmh/7SFkEJhqo
 ORYX4NX1U0cIjYYwuTi0L622Rmv2ZRnH8DuaLvZJCsh0SOvhbyUp4lUSN
 6pO4QYUCHT15WJcSMED6dVMsz68isLqMqkvBrtywxqjHf8tVdlS5Tl3bY
 V3itF5I7ZH9FYaCtHwVkGdDdSbokBJlb4prlnwlFKFPg5f+qYORsCSuBF
 4TzaTksl8THsHI3DsG2byqEKUSRL+OuHpq8FPGZ6mGa27dh/LmtyXzLfN
 ocDoEWJohxX4A2JSpYyuCIadZn0JGC8RbnVsi3xbZ7BDoWGfAcJeSo5bA g==;
X-CSE-ConnectionGUID: VsWBQ880R5ybEwLrFBWiFA==
X-CSE-MsgGUID: jyD0yO6wREmajtcS0IfAJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67812789"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67812789"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:45:52 -0800
X-CSE-ConnectionGUID: DITWcgteSoaZRMD6sr/akw==
X-CSE-MsgGUID: GfBxiBrNQj++aX2kB56Fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199178096"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:45:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Print GuC queue submission state on engine reset
Date: Thu, 18 Dec 2025 14:45:46 -0800
Message-Id: <20251218224546.4057424-1-matthew.brost@intel.com>
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

Print the GuC queue submission state when an engine reset occurs, as
this provides clues about the cause of the reset.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 259c4e1dcae7..0b590271c326 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3080,8 +3080,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
-		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
+	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
+		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
+		   atomic_read(&q->guc->state));
 
 	trace_xe_exec_queue_reset(q);
 
-- 
2.34.1

