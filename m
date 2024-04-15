Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD5C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A373311278D;
	Mon, 15 Apr 2024 19:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wog1R1zG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1996D11218A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713207688; x=1744743688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TEyjCD4O9pXRGuP7ahgB3aI6jmF/ZH4r5xjGBOxdacc=;
 b=Wog1R1zGrDIFr/g4TyArHz0CdDQZxNSrhRUeAMAAPqqAAS/E6KiV9+df
 MfPktwwacgAxcH3NFU8nngo5Df3YTgWULZp/exmR60ubQnS4p/z0k7bwa
 1r33w6eb6Jd+hrVOqpWiawlmveBZwHkMZ/6JxajYHxL7HDQR2At/CkPAu
 9Dvu0vhuWsNO+SOZH7obZFP/Na4j+G0drdl45brkl3N/EF//40bBIyB+z
 F6T4mPFdYU21TQVhSBk0k+mwc67gU8/ItmHCQsgHuyghfbu8p13nbvmA8
 zUki3w0wLFoBcAsmwcNfOVJLyxRDYoBsOWatjmiUYIBvSDFDvpmFPSgyZ A==;
X-CSE-ConnectionGUID: r7BRakv4SJ21m2ETPLAaVw==
X-CSE-MsgGUID: GnY6rAQqRhG+G74+aeTJSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19765669"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19765669"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:26 -0700
X-CSE-ConnectionGUID: 761ZFPi5Rp2iFo4qy9GjgA==
X-CSE-MsgGUID: 8CjYKdUBTImDqS4UcFwyjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22094964"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:01:26 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 john.c.harrison@intel.com
Subject: [PATCH v5 2/4] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Date: Mon, 15 Apr 2024 11:46:06 -0700
Message-Id: <20240415184608.2918959-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
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
the two events in which it's possible for xe_sched_tdr_queue_imm to
wake the ufence waiter before the exec queue is banned, causing the
ufence waiter to miss the banned state.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---

v2: Expand on cause of race condition

 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb469..7b6c033a5496b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1428,8 +1428,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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

