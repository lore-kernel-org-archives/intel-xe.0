Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57459CF8860
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 15:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1577B10E2A9;
	Thu, 20 Nov 2025 15:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWtXWSn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3813B10E2A9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763651792; x=1795187792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kHzUVBPne+b38faQd3aQ2KgS7nSMqMpAkB25kLLlzhA=;
 b=UWtXWSn73c3ZSUY4vmqDy2DXTtrDuK+gA2Q7W2kPnsxYiWF+I8yYjVZW
 YE0ula0tMFTCe3HvSBT3vrzmRrnXBwyQIcZtHP9EQqrJavFiuTMLJGO1S
 VOIKY3SeUkZEzi0+/GFhjwZ7pe10D4iR5Q5ZkPrg2MiylAacfWZRE5sc2
 F3RqYNI6OI/nVwMwITs4LghcrgSHAtdlYWy6OCHxwxSz79xBWtwe9sgyF
 0SGssbLzbeJR/yIo6OXWkCToUrUrmM+KXWIjziYnt3Z+fLI/6ao7Rrry0
 AyMVkikoFr57biOUop9jOiEmihakVh+lMAvTEtWzWvEuEJkh9eTIe/lJ5 Q==;
X-CSE-ConnectionGUID: VSH6L4QRRzuFntZqBqBARA==
X-CSE-MsgGUID: hOCg8yO9RbmdO/fsh5Y06w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64731473"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64731473"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:16:32 -0800
X-CSE-ConnectionGUID: 0SQOfAL2RLKE7e1PlC/WaQ==
X-CSE-MsgGUID: feQNI5OfRq2Qzsi7QJRk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196366128"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:16:30 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 1/1] drm/xe/guc: Don't run jobs during GT reset
Date: Thu, 20 Nov 2025 16:16:11 +0100
Message-Id: <20251120151611.2205914-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120151611.2205914-1-jan.maslak@intel.com>
References: <20251120151611.2205914-1-jan.maslak@intel.com>
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

During GT reset, hardware is in an inconsistent state and jobs might not
execute correctly. Fail the job with -ECANCELED, allowing userspace to
retry after reset completes.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e0882074a99..1a5f5bfb05bb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -876,6 +876,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		     exec_queue_banned(q) || exec_queue_suspended(q));
 
+	/* Don't run jobs while GT reset is in progress */
+	if (work_busy(&guc_to_gt(guc)->reset.worker)) {
+		xe_sched_job_set_error(job, -ECANCELED);
+		return NULL;
+	}
+
 	trace_xe_sched_job_run(job);
 
 	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
-- 
2.34.1

