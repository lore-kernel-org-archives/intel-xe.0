Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED55C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 11:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED04610F0D3;
	Wed, 20 Mar 2024 11:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIglEIUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40910F0D3
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710934107; x=1742470107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d5HXzw1+9bP/DWuRxL05w1ZCynES83W7qTMZJdVTOis=;
 b=WIglEIUUCkjfN5cHg0p1IysHIb5etQu2sASUrfxTA51RdfItsBrL7krg
 PboHeCAVq6ermZduYPaN8ejU8t6Q1kjNZScgLpqT2/eGzOgD0ntEu8JHH
 E0lJQKrfIQ9xjr3k6sE9EiX7F9PI6zqj/E96aL5MI4Vx9HLb4iuyB6laI
 0v/72HUzdjzx7aMStqWH5AM40ptQ6Q1E2KskYRwxdZVMcEKlAqTIYY814
 2I78C0b1Aph9Tk4B8W/pkBOTzAasHejgICDylQXQJm50MAtsTmriUT7/7
 3N1XnyohXAibVt0X3WwSO02VnWdTltgZhikFhJwOAEOKNeZohSMjGSHcr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9647743"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="9647743"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14016086"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.48])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:28:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/2] drm/xe/bb: assert width in xe_bb_create_job()
Date: Wed, 20 Mar 2024 11:27:31 +0000
Message-ID: <20240320112730.219854-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

The queue width will determine the number of batch buffer emitted into
the ring. In the case of xe_bb_create_job() we pass exactly one batch
address, therefore add an assert for the width to make sure we don't go
out of bounds. While here also convert to the helper to determine if the
queue is migration based.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index 7c124475c428..a35e0781b7b9 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -96,7 +96,8 @@ struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
 {
 	u64 addr = xe_sa_bo_gpu_addr(bb->bo);
 
-	xe_gt_assert(q->gt, !(q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION));
+	xe_gt_assert(q->gt, !xe_sched_job_is_migration(q));
+	xe_gt_assert(q->gt, q->width == 1);
 	return __xe_bb_create_job(q, bb, &addr);
 }
 
-- 
2.44.0

