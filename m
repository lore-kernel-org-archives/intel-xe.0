Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FEDD6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 21:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4636F10E06F;
	Thu,  2 Apr 2026 21:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdBDm5QV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5B010E06F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775165439; x=1806701439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qxGyEPWzICW+Nq9VbNY/FLn3KDDax0tKX941T8qkAcI=;
 b=XdBDm5QVkDX4qZ2HNlBlRRC91JmJJWwPP8EddsUnXuO9ge3ZSh0Ne15T
 y+YpgRM9SgRoDeodOAdXNXFqNf7G9gNBIgV+MCAQNm0HLVfyXm0fQbYFt
 yPmR+jKr8gxLPvTTiTyGZuaTveZ2Wdew9WSRstg7wXZyqZXQcnQ9xxBED
 /4TI/6uAJmMMXBRKPJZ2+Z8tK22LfYli55Cu9jSy9kNgC/HbybyODJ6b3
 D2Ls7YvcpWNGb1uyS+LNpuP+zWLdp8einKTxKDoedNqp3SPtXUbhAM3W1
 VUWMU1xpmHzJzNl+dUfFzGbpY0ekFO0h1q8jLE7tbkjQeWTpNn9knzLSa A==;
X-CSE-ConnectionGUID: CuiJaYORQK6fxcD/4lwxiA==
X-CSE-MsgGUID: nfQwYAy7TBWrPpSDtZ6pxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86854264"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86854264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:30:38 -0700
X-CSE-ConnectionGUID: yBepppoWQ/uPMNG3deNsqQ==
X-CSE-MsgGUID: R/QaeZ3fRt+woMR3/Tac4w==
X-ExtLoop1: 1
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:30:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Suppress reset log for destroyed queues
Date: Thu,  2 Apr 2026 14:30:30 -0700
Message-ID: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
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

When a queue is destroyed while still active on the HW (for example
because the app owning it is exiting abruptly), the driver tells the GuC
to preempt it off the HW immediately and to reset it if it doesn't
preempt. This can cause a reset log to be printed to dmesg, which can
be confusing to users as resets are commonly tied to errors, while in
this case the reset is just done to speed up the cleanup.
Given that a queue is only destroyed once all refs on it have been
released (i.e., no one cares about it anymore), the log of it being
reset is not useful and therefore we can simply suppress it to avoid
confusion.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 10556156eaad..e6702bd99309 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
-		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
-		   atomic_read(&q->guc->state));
+	if (!exec_queue_destroyed(q))
+		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
+			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
+			   atomic_read(&q->guc->state));
 
 	trace_xe_exec_queue_reset(q);
 
-- 
2.43.0

