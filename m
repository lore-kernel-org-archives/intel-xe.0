Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C6C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 05:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373D10E00B;
	Fri, 24 May 2024 05:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjR9Au15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7246910E00B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716527368; x=1748063368;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mCJn2c9HZP7docVfcjRWzEtVJec7MGbQwL/t3qz8Ums=;
 b=QjR9Au156jtIgJQKSFTU8wPwod/2JUS+kwC4KQelv2cCjL2ApPXlA8RY
 H+GCCc5wmiM59VPMMWB08qtYHqMaVX5vzs1YOs8qEc3ICoWhtmS5wZYvo
 SvHJeUcFCM3G6CvROWdgrZAE9AmLNaAulcvofbO53RwRiKCKB/vsTlZfN
 jwVzxeomRZoi2BmoHERKi/Mrv+sFYyQv+uMukHCQ5jnTPOI+Ki9CLGII8
 Ay5j8HtpADDp6vaRFhqkgVswPqY3NFfGVlXC/HZZVhqoo0Y6Le2u9FGgR
 9BxyEQwLkQxNhuaP7NsamMvKsXoFelGAfLL2Pd1rbDNqsgTgjM4YpYCCK w==;
X-CSE-ConnectionGUID: +lrN6IFmSayvJILEuatQqA==
X-CSE-MsgGUID: lXM/6RumQtik9Yyod1uPiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12763052"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12763052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 22:09:26 -0700
X-CSE-ConnectionGUID: KJU+N9RYSjGwVUhLbnb6BA==
X-CSE-MsgGUID: f6dF6yCkRimqs0+i2ksXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="38892194"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 22:09:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Don't accumulate exec_queue stats if being killed
Date: Thu, 23 May 2024 22:09:21 -0700
Message-Id: <20240524050921.1340921-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

CI run only

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 54778189cfd5..abb14c45f265 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -763,7 +763,8 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 
-	xe_exec_queue_update_runtime(job->q);
+	if (!exec_queue_killed(job->q))
+		xe_exec_queue_update_runtime(job->q);
 
 	trace_xe_sched_job_free(job);
 	xe_sched_job_put(job);
-- 
2.34.1

