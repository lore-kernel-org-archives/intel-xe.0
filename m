Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB4D0C604
	for <intel-xe@archiver.kernel.org>; Sat, 26 Oct 2024 17:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0110E045;
	Sat, 26 Oct 2024 17:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKTOk83S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95DC10E430
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Oct 2024 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729962615; x=1761498615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MAGouAwClj/J/WNsHAA7MpiV14Iy2Xvb6ZX6Oi2b/Us=;
 b=EKTOk83ScAIs245w9MwpYbRorlKQu48Wva4e4EupqaKamOFJaDroiNc9
 xLcm46R3I4NSJEL4oFZdgbVTpqXdGv0oBTbOg8DtIRTIXwFRyTcIV58f4
 LPtR52qOJskYD0tT4PexQYcDQ0BqVKEK7xaw/PxYCZMV3CJ5BsA4JsmNI
 O5BbyY8RXiSSJdMPEoBQaWEVSIo+i7rZ5LCM1mLFPCowjOQlDf6PUmFLX
 euvSj4UhOPEo61UNkgDnUbM3akmf0uffXJQs7zuq590SU31XjIqzSagej
 vn2CKIsWjr3b9oTKqrkBa2mOgMMUOW6ZZDZ6f2E/pL4rj29WD+WBBFkI0 w==;
X-CSE-ConnectionGUID: p4TakXBSTW60rB8usRHU3g==
X-CSE-MsgGUID: XfibSoTHROWkOIxB5nbrKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29568962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29568962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:15 -0700
X-CSE-ConnectionGUID: 5Ax7DYOaRuCatV/zPSmbKg==
X-CSE-MsgGUID: l/ctm6M/Sgq3pnbuarKRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85970124"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.191])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 10:10:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] drm/xe: Stop accumulating LRC timestamp on job_free
Date: Sat, 26 Oct 2024 12:08:48 -0500
Message-ID: <20241026170952.94670-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026170952.94670-2-lucas.demarchi@intel.com>
References: <20241026170952.94670-2-lucas.demarchi@intel.com>
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
rate of ~ 120Hz.

The update on job_free() is used to cover a gap: if exec
queue is created and destroyed rapidily, before a new query, the
timestamp still needs to be accumulated and accounted on the xef.
Initial implementation in commit 6109f24f87d7 ("drm/xe: Add helper to
accumulate exec queue runtime") couldn't do it on the exec_queue_fini
since the xef could be gone at that point. However since commit
ce8c161cbad4 ("drm/xe: Add ref counting for xe_file") the xef is
refcounted and the exec queue has a reference.

Improve the fix in commit 2149ded63079 ("drm/xe: Fix use after free when
client stats are captured") by reducing the frequency in which the
update is needed.

Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 6 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 --
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b15ca84b2422..bc2fc917e0de 100644
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
index e5d7c767a744..ebe4665d9159 100644
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

