Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED5CCD18F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8216E10E4A7;
	Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjlTJDix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D610E4AA
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372713; x=1791908713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pd/9RM/mGMiwW7W+BzE0UqgUMDb8WxBfFyvGut20afk=;
 b=MjlTJDix+lCCk1QV1oB9w6MJwgc//s/BnGrJcLrGYyzfUro1UnUkIVe6
 MSW1ysDuEs8Ovjvxq4GPMUjl8zokXVFKvpdkznnhObijqe+NxEy/wQtTD
 5/vCl1iC39UIb75c/ikmsIZcVANSFISS3PYqs4y9hPZybs9ZDSUfDSJN5
 SxVEHaMK/EtDLnC2GtDZSuGJ9RF9TarikehX0Wi3Vb5VgLOjHYeMLMbEl
 VI4M1RasDcgkpxD6do4VxtUk33nL60tYVRJRrbYfZIPmL2dpZddl+tG2z
 KHydCwXO2ZYFXri+a6VQ671X5CGBvZezxR07fPankJEUEYAvdzjvxuq5b w==;
X-CSE-ConnectionGUID: hNew0wkDSmWTChu+nXGQJg==
X-CSE-MsgGUID: w+qc44enSw6FsmAcSvnnWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73963502"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73963502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:13 -0700
X-CSE-ConnectionGUID: 81WGDXpQQ8Oxroug+i3u9Q==
X-CSE-MsgGUID: 5V74lJxITrqOT0BQaC3QPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185651413"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:12 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Date: Mon, 13 Oct 2025 16:25:03 +0000
Message-Id: <20251013162504.7768-7-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013162504.7768-1-stuart.summers@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
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

Right now we are using the state of the GPU scheduler
to determine whether we send and receive messages. There
are some states, however, where we might intentionally
pause the scheduler, like a device wedge, and expect that
messages are resumed later once the user has taken the
hardware state and is attempting to reset, like an unbind.

Remove these checks in the XeKMD and let the GPU scheduler
handle state checks internally.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f91e06d03511..d9d6fb641188 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -7,8 +7,7 @@
 
 static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->base.pause_submit))
-		queue_work(sched->base.submit_wq, &sched->work_process_msg);
+	queue_work(sched->base.submit_wq, &sched->work_process_msg);
 }
 
 static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
@@ -43,9 +42,6 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
 
-	if (READ_ONCE(sched->base.pause_submit))
-		return;
-
 	msg = xe_sched_get_msg(sched);
 	if (msg) {
 		sched->ops->process_msg(msg);
-- 
2.34.1

