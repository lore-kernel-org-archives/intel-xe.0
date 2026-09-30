Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9FACA5FC3
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 09:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB7F10E9FA;
	Wed, 30 Sep 2026 09:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDTDa2A4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247610E965
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790761259; x=1822297259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gokNzLY5ajBSzDazjnj5mWgduyQ3qlbqNjKdF+P+o20=;
 b=jDTDa2A4+QEKOCGVZNGQ9YDgrDPMPKoJPp7HIYZpN8D5bylzu5IJgaJ3
 r/PwagWk4+lhhiAkH8RtsTMmKPfYaiW1pUsYl3FRyIf7TbEDp7B4mHvdN
 B44CQ6xH7IXXH+iXJldFMQGJxFuQBNVTAkLNxlxa8Rrsa3KHrTEAJCXWk
 xBi4cH8tYQ7r4a1xsEBMlhkEflgMxXReP2j7MOBkvYbjRFM51F4dgKyMf
 LtVaQEBZeErBC5CKzl2VAIFNgEFGiVfUHR2n4AUXUKecgGxI/pF1fy15m
 kVXnpajQcTb/7VR8Emh8tpV7ueW9RejD0n8diWd8xbiPdCIRNx7AceBbX w==;
X-CSE-ConnectionGUID: o3Nv99gzSN2LPIVjZd4Glw==
X-CSE-MsgGUID: wdTjm9mwQtuyHKqSpDA5bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95303819"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95303819"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:58 -0700
X-CSE-ConnectionGUID: m936NQWlRsCNfnseK64Xtw==
X-CSE-MsgGUID: 4jV4P20jQKaQK+RMinHjng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274768716"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:57 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 3/3] drm/xe/guc: Rewind the LRC ring head when replaying a
 ULLS job
Date: Wed, 30 Sep 2026 15:10:35 +0530
Message-ID: <20260930094031.3365707-8-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930094031.3365707-5-varun.gupta@intel.com>
References: <20260930094031.3365707-5-varun.gupta@intel.com>
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

On GT reset replay, guc_exec_queue_start() rewinds the software ring
tail to the first unsignalled job's head and sets the LRC tail to the
LRC head. This assumes the saved head has not passed an unstarted job,
which holds for ordinary submission as the CS cannot run past a job it
has not executed.

A ULLS job's slot is covered by a tail its predecessor published from
within the ring, so the CS can consume the slot and idle without the
job having run, leaving the saved head past it. On replay the job is
re-emitted behind the head, the context restarts with head == tail and
the job never starts.

Rewind the LRC head to the job's head as well when the first pending
job is a ULLS job, so the re-emitted job is ahead of it. Non-ULLS
replay is unchanged.

Fixes: 40c756bdbbee ("drm/xe: Add ULLS migration job support to GuC submission")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1d98ec67c5c6..0b231228bde8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3058,6 +3058,15 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 				 * increasing as jobs are written out.
 				 */
 				q->lrc[i]->ring.tail = job->ptrs[i].head;
+				/*
+				 * A ULLS job's slot can have been consumed by
+				 * the CS without the job running, leaving the
+				 * saved head past it. Rewind so the re-emitted
+				 * job is ahead of the head, not behind it.
+				 */
+				if (xe_sched_job_is_ulls(job))
+					xe_lrc_set_ring_head(q->lrc[i],
+							     job->ptrs[i].head);
 				xe_lrc_set_ring_tail(q->lrc[i],
 						     xe_lrc_ring_head(q->lrc[i]));
 			}
-- 
2.43.0

