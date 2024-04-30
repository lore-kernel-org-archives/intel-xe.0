Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D42C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 12:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101A410EDA6;
	Tue, 30 Apr 2024 12:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6AXYTNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E47E10E8D5
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714481930; x=1746017930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eNnu6bqk0/EHdWi24kP02rnNcT0jKmnUv3zFLSUtM/s=;
 b=d6AXYTNCNPH4XZvuqYqtEnZv2H8mMNlrCJXjBJo3SoPZOjTLvwm7dhKm
 yKNL3ssyuEk3E9OPHq7iZ2p2df4RiTcAf8WXKWisYChk/WnONChzzxhmH
 IfkALtLYIif/SRxBQz4fPZ7f3D7OVgC6rdKUG3GgugA1X2yW8gvPRkTiT
 rJVsTAf3cBcZ7ZUlJPusu4oePvEt0bhqoPL3yfmRR0dxNyHhzdHTeRGVJ
 6PwmS7aSt5/OWtxCKwi0HSP/D+2aqa6LghCRySKXalyZPMAl+sbbZyrbT
 mfMtN++BLP/PWAv/XJk4d5WwGt6y832nicsvxd6Lj5F9HGGJOteTpEh8N w==;
X-CSE-ConnectionGUID: KxmSlJPTTBySV4vPGd+DoA==
X-CSE-MsgGUID: w1MvFPLAQC6UWBzx1IGwXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10347859"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10347859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 05:58:49 -0700
X-CSE-ConnectionGUID: +Syh0j8rQZ6v2H/DGdlotg==
X-CSE-MsgGUID: ReZ8rgmAQPCcFo7gylgD8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="49654934"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa002.fm.intel.com with ESMTP; 30 Apr 2024 05:58:48 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe: skip error capture when exec queue is killed
Date: Tue, 30 Apr 2024 18:42:29 +0530
Message-Id: <20240430131229.2228809-1-tejas.upadhyay@intel.com>
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

When user closes exec queue soon after job submission,
we are generating error coredump. Instead check if
exec queue is killed during job timeout then skip
error coredump capture.

V2:
  - Just skip error capture - MattB

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d274a139010b..2c0aa3443cd9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -980,8 +980,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
 		   "VM job timed out on non-killed execqueue\n");
 
-	simple_error_capture(q);
-	xe_devcoredump(job);
+	if (!exec_queue_killed(q)) {
+		simple_error_capture(q);
+		xe_devcoredump(job);
+	}
 
 	trace_xe_sched_job_timedout(job);
 
-- 
2.25.1

