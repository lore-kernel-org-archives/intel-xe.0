Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D775D5AE60
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 06:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECCE10E305;
	Thu,  7 Nov 2024 06:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwpPwtaD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46D10E305
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730959590; x=1762495590;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sdkg86yOsczTSECdge8uBYZMNCJT2zQOTHKYIF4mqcc=;
 b=kwpPwtaDakj8yy5LB4wlGaqTQBcGnxv9+Pa46LX8aHpB8SSAo0IfPHAX
 bRSCd79Uq86G3oLNlggyplmG9K63peQgIs34iQYR+U3jC3Legeos8cMAc
 NZFieehMsTGAz+CEArGqz3JPgrFw1JUmxLLS2sJ52zzaV3meFrh8i5826
 s9T32Gt0/7UPXDQeG685cpXbuqQexMpmXt0K7XAcKZnrs8OXs8j9SVuou
 IaKNfxV7wuTnc3hOlb3MvkGBtjyTwEveZmPJjZYk+RrlKSAwKhWPY8t8z
 tb3azJKexCLAffJ0GOrjDdCl/Zuu1e2s+tYtfzcMP7Kl3khPRgnE9sB3Z g==;
X-CSE-ConnectionGUID: 6UCMzfgrQNyC1EH4nyqWKw==
X-CSE-MsgGUID: 3hrDoygqRD6vLqazP/+ZeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33627763"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="33627763"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 22:06:30 -0800
X-CSE-ConnectionGUID: cs2rq2xST0mQuQSQkc/GTA==
X-CSE-MsgGUID: 5XLrSiFPSi6eOCUIXmNnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="122450268"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 22:06:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lindong Wu <lindong.wu@intel.com>,
 Caleb Callaway <caleb.callaway@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Felix J Degrood <felix.j.degrood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Add gt_id to xe_sched_job traces
Date: Wed,  6 Nov 2024 22:06:06 -0800
Message-ID: <20241107060606.3130885-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

In order to uniquely identify the jobs, xe_sched_job tracepoints need
to have the tuple (gt_id, guc_id). Find a "hole" where the next entry is
unaligned and add one more field.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 91130ad8999cd..de682978c4bfb 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -211,6 +211,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			     __string(dev, __dev_name_eq(job->q))
 			     __field(u32, seqno)
 			     __field(u32, lrc_seqno)
+			     __field(u8, gt_id)
 			     __field(u16, guc_id)
 			     __field(u32, guc_state)
 			     __field(u32, flags)
@@ -223,6 +224,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __assign_str(dev);
 			   __entry->seqno = xe_sched_job_seqno(job);
 			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
+			   __entry->gt_id = job->q->gt->info.id;
 			   __entry->guc_id = job->q->guc->id;
 			   __entry->guc_state =
 			   atomic_read(&job->q->guc->state);
@@ -232,9 +234,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
 			   ),
 
-		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
+		    TP_printk("dev=%s, fence=%p, seqno=%u, lrc_seqno=%u, gt=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
 			      __get_str(dev), __entry->fence, __entry->seqno,
-			      __entry->lrc_seqno, __entry->guc_id,
+			      __entry->lrc_seqno, __entry->gt_id, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
 );
-- 
2.47.0

