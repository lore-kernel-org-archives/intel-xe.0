Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CCD597AA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 22:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F3D10E678;
	Tue, 12 Nov 2024 22:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsEpe21H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3F710E671
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731448858; x=1762984858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w3tTq3dAHnA5IYy5L3bwOX9q+Roue+Jszmrorhiqs6A=;
 b=KsEpe21HOfThrdqdggDSs4rm9fSs820Tpp7W1JnPTKhYwDxwGBaVFjBs
 ZuPzAWTE6JMqw4pT/DvzE0YA+4lzSQKLZJyk063wcyBt8/CWbCBTi02mE
 rkuB/q/D/XLFS1rx0/AO39zl1M9vVzh57F17+E1+xge9hNaXWuN9pfDF8
 XVmM+d/h2k1xf3SE6b6rXncd+C1hB1j8g7g7+sibuX/sSX2c4k71ZU5Zj
 ij7sTja6nGhbp22JLh9CeUP+cI0emTsgGJC/xpfu13kHRqq/7PPbyvZhg
 CdBCPb7vFPkF/4E6dT6GFOdUv4i+h1J2g6jdAOi/gBv8RU/0z238g4nRl w==;
X-CSE-ConnectionGUID: wVYFiD8gRuunh9HsvI4X8Q==
X-CSE-MsgGUID: KN7I+p5bSMCWBkuStCBEdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31403999"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31403999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:57 -0800
X-CSE-ConnectionGUID: SBHcSWkrTJmc/J76URAS6w==
X-CSE-MsgGUID: VQX6LZg4Sc6/eReKgCHXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118605702"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 14:00:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/xe: Wire devcoredump to LR TDR
Date: Tue, 12 Nov 2024 14:01:27 -0800
Message-Id: <20241112220127.1369527-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112220127.1369527-1-matthew.brost@intel.com>
References: <20241112220127.1369527-1-matthew.brost@intel.com>
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

LR queues can hang, cause engine reset, or cause IOMMU CAT errors.
Collect an error capture when this occurs.

v2:
 - s/queue's/queues (Jonathan)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 985a21a72da4..29099497429d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -896,13 +896,17 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 !exec_queue_pending_disable(q) ||
 					 xe_guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			xe_gt_warn(q->gt, "Schedule disable failed to respond\n");
+			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n");
+			xe_devcoredump(q, NULL);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
 	}
 
+	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
+		xe_devcoredump(q, NULL);
+
 	xe_sched_submission_start(sched);
 }
 
-- 
2.34.1

