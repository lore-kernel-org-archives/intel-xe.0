Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204E4D132D8
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 14:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCEC10E454;
	Mon,  4 Nov 2024 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePxDLn5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64C810E0AC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730731113; x=1762267113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UozPn5ibE1l6FamlIYNlb5it4/hoNjrKBeGdwiKNzMg=;
 b=ePxDLn5WIQwKh/w3FRx1Sx5kLAMrTDA0dexFfUKYC7RHU290vnlTyWC2
 JU27Y9d1dZFV9NVn0ayfj+OwL51DBD/HY70qXHvQ/ZskGoZg4BzBIIWoL
 tQ0J+aJFP69wj8phD1wUlLklmRhIUBBpyP4VQT/NlYYBWj0W8Fp+8A8L4
 gWDqva5B7p14xsaWRqU4idhKscc1PzTb7aYdikFHjs4GqIrZW/iOhiqvh
 6D/e7Klucl5YCJf15PiZ6bTBrnJYIY1wldi0jBQOeWq4tIyuc2x4MkjRh
 NI6f5ifX0F+85+mXi1Ukambno2yy5y+vHmfScbKwW5XR4MwLdixeLCmUO g==;
X-CSE-ConnectionGUID: EyCqHM/3RjebDEMchWvhmQ==
X-CSE-MsgGUID: 10G5G/mfS9ai+txQjTRSLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55831410"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="55831410"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
X-CSE-ConnectionGUID: 22VaNpsnSFandfgt6kjPBQ==
X-CSE-MsgGUID: By5otbJqRJ2vMGHoBUfZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88244305"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 06:38:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v3 2/5] drm/xe: Stop accumulating LRC timestamp on job_free
Date: Mon,  4 Nov 2024 06:38:12 -0800
Message-ID: <20241104143815.2112272-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104143815.2112272-1-lucas.demarchi@intel.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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
index 7afcc243037c8..9a8564ea06b59 100644
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

