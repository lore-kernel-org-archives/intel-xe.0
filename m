Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF01D74941
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD2410E3B8;
	Tue, 29 Oct 2024 21:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhzHUOT5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93FA10E3B1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238257; x=1761774257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vUafYDPdth1xpwRxaC1SKxS39KAcVFNpeuF6HJVMevI=;
 b=VhzHUOT51E/6n2U7UwQyy9HsM2a0iU7VRN3DjEbbyciXdzyFvBJLyfXq
 YxPMJLgTqCDLuBEud94373+SIbxOwhsqNUmm2BYtJQWIlohHaiSIw97ly
 42wTb1NhfuO8nG/VvA6gl1Y/+Pz5vp9t18D8rkIYb84suTJe0k33LxrnP
 ocjHdrJGQ0xvvl0dQO1QSlTQlXxf2h68JxPq3zRTgoKIkuAmHIHbwSAPb
 QJ+s4Oxhd217yJLwBeW5coCJOANJjj+iiDqSR3Lnl9ciK0j7w0iq35ajQ
 g1R1KYt9Vvw+4zlM0I4YloVhi6G03h3AadOXfzyorc2YnL04DXimwNV0j A==;
X-CSE-ConnectionGUID: bIEt5vFOR8CQGpPxzVVwBg==
X-CSE-MsgGUID: 5/kw3GltSseP10dL5p0fhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40523810"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40523810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
X-CSE-ConnectionGUID: /ZZPbTwMQAeJqXS2yQtRZg==
X-CSE-MsgGUID: zPZ3nFDIQLiV47AUoBm1yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="119579597"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 2/4] drm/xe: Stop accumulating LRC timestamp on job_free
Date: Tue, 29 Oct 2024 14:43:49 -0700
Message-ID: <20241029214351.776293-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
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

The exec queue timestamp is only really useful when it's being queried
through the fdinfo. There's no need to update it so often, on every
job_free. Tracing a simple app like vkcube running shows an update
rate of ~ 120Hz. In case of discrete, the BO is on vram, creating a lot
of pcie transactions.

The update on job_free() is used to cover a gap: if exec
queue is created and destroyed rapidly, before a new query, the
timestamp still needs to be accumulated and accounted for in the xef.

Initial implementation in commit 6109f24f87d7 ("drm/xe: Add helper to
accumulate exec queue runtime") couldn't do it on the exec_queue_fini
since the xef could be gone at that point. However since commit
ce8c161cbad4 ("drm/xe: Add ref counting for xe_file") the xef is
refcounted and the exec queue always holds a reference, making this safe
now.

Improve the fix in commit 2149ded63079 ("drm/xe: Fix use after free when
client stats are captured") by reducing the frequency in which the
update is needed.

Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d098d2dd1b2d8..fd0f3b3c9101d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -260,8 +260,14 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 {
 	int i;
 
+	/*
+	 * Before releasing our ref to lrc and xef, accumulate our run ticks
+	 */
+	xe_exec_queue_update_run_ticks(q);
+
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_put(q->lrc[i]);
+
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e5d7c767a7447..ebe4665d91598 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -747,8 +747,6 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
-	xe_exec_queue_update_run_ticks(job->q);
-
 	trace_xe_sched_job_free(job);
 	xe_sched_job_put(job);
 }
-- 
2.47.0

