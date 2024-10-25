Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F658D149F3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 21:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E194910E06F;
	Fri, 25 Oct 2024 21:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXMXUMAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728BD10E121
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Oct 2024 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729892584; x=1761428584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xp6wTW69ywc8Xig/OMl43HhPXjO+4kqx8ymj+rquFVU=;
 b=NXMXUMAAfPFvUb4Ca5s1L1X3chFlc6BvCfpW60qlZEpm/k9au9GuYeAw
 XuGKEJjIrjJ6VpA1TuvXdX9xeY+4BIVDHHCTzRPOlgfduK9uf/4bh1r/l
 HrpRNmR88rubpRpxrXTk0eHpV/wsW6Jukqw5wn9qju2NUPnNoDQgzyrt9
 dMYXATD2v6sw3oJCo/E7s4lzl0PWjmB8esLuyjoPFF+dix6AUeNxeRFDn
 B1OxP8culqd3Tmqm0LKZ+2LcmOuTp2TPPA03tylJfqehY+hVJHUdq7i4P
 HV6GoW9RlqQL5UUAaQNijBuh5FhlACIICMSfS+nUqLvHHwOXvY9tzvxH4 g==;
X-CSE-ConnectionGUID: plhh1M7vTr2/es0UHawp3Q==
X-CSE-MsgGUID: kCXYyr/5QgWyCuEoZ4VTTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33377857"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="33377857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:04 -0700
X-CSE-ConnectionGUID: dgxJtQAvRneqX2iOvDkA1w==
X-CSE-MsgGUID: PZQ47YWdQceMDpvhdJ12bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; d="scan'208";a="81189350"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 14:43:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: paulo.r.zanoni@intel.com
Subject: [PATCH v4 2/2] drm/xe: Upgrade job timeout message to warn
Date: Fri, 25 Oct 2024 14:43:30 -0700
Message-Id: <20241025214330.2010521-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025214330.2010521-1-matthew.brost@intel.com>
References: <20241025214330.2010521-1-matthew.brost@intel.com>
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

Ensure job timeout message shows up on distro configs for user bug
reports. Change job timeout message from notice to warn.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7afcc243037c..067cf2bfac1e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1154,9 +1154,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		process_name = q->vm->xef->process_name;
 		pid = q->vm->xef->pid;
 	}
-	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
-		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		     q->guc->id, q->flags, process_name, pid);
+	xe_gt_warn(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
+		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+		   q->guc->id, q->flags, process_name, pid);
 
 	trace_xe_sched_job_timedout(job);
 
-- 
2.34.1

