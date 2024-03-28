Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C133CD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 21:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231610EFFB;
	Thu, 28 Mar 2024 21:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQUmolWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75DF10EFFB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711662557; x=1743198557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4s34JrgIwECGYcX2ToTuruMUlTfE7TGNIswqYE3W5Jc=;
 b=eQUmolWIMv3zC1JMjlRYqAYTHgAd1ueqvyzKFUJj+FgYxrHJtZXQh0wM
 G8QpJzPUUrtb8o/vKQ3WxpJsnTWsIWIdAvu/kO8lJHGp36SASmge1r6kQ
 Smtc003p1+tNwjIOMYMFF3UdBUfcIHvVbaoHNrUPMTqb3adFfTZEyGVoL
 U4JaMgilOzAC79NOImOzajEHVk748vsA/tsNt49rTpG+JZuTUuVtbNOec
 U5TDOXeNbDcneR9y7hwa/FlwPvFxqK+0GCqG+aIjpv4EdvMLzWL4K2Lnh
 Jz7s3lE1dHs5k5emOuJNnsFizFojlxzVlyP3goUdShoMbJCGPr1pTqvj2 Q==;
X-CSE-ConnectionGUID: doMOOa+WQ/KvQzXYNMOWBg==
X-CSE-MsgGUID: I7WW5tAYQYSCkbw/98cIbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24339691"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="24339691"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16823565"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:49:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH 1/2] drm/xe/xe_guc_submit: Fix exec queue stop race condition
Date: Thu, 28 Mar 2024 14:33:57 -0700
Message-Id: <20240328213358.3506490-1-jonathan.cavitt@intel.com>
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

Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
guc_exec_queue_stop.  This prevents a possible race condition between
the two events.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13b7e195c7b57..294f40ab6aaf1 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1430,8 +1430,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			    !xe_sched_job_completed(job)) ||
 			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 			}
 		}
 	}
-- 
2.25.1

