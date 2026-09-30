Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A7BCA5FC3
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 09:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FD510E8BF;
	Wed, 30 Sep 2026 09:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBiiXxsI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358CF10E8BF
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790761254; x=1822297254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2EWREhoN8jIF8cF+95vOdkcItxEn+QkyUr6qUzzd4Q=;
 b=SBiiXxsII0FzCpmSXFUOO5hQgEYKHG92tQLYdEuG/YONs4/HAEpSd/ra
 ydmhD8z0x0uS1SiE72w66SizPskLac6+DuCpNX7uxYa5Rsb/r5yhihUxn
 fD8mQx9EioW7HEtbYuEX+snXrstq8wFxC048gS6zG7zlV28rTEZfwCn/V
 cm9A6u7vs4ojT7DvXT1wrwt4n805Q4f4iyix9lJMyfcTDXKzNf5skEipp
 AhSaH6j2GajV+irB1fNFTtcaR95Y9yNUUmNcWG3lbR+vNtUA/REzSS7DA
 Ka95PWHbAyCDN+S0Blf0979Qud7BHKRGUgDNeUZZoUpKoEiU690nAqxIQ g==;
X-CSE-ConnectionGUID: g0ekDsQaT1WbPxWNwGLCEg==
X-CSE-MsgGUID: ya74OYaWSOKln+4m/6I+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95303806"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95303806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:54 -0700
X-CSE-ConnectionGUID: MxRYUaCvS32GGJD3fgEspQ==
X-CSE-MsgGUID: SvRp+c5tRIKLv55ipgqPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="274768703"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 02:40:52 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 1/3] drm/xe: Park on the ULLS semaphore before publishing the
 next job's tail
Date: Wed, 30 Sep 2026 15:10:33 +0530
Message-ID: <20260930094031.3365707-6-varun.gupta@intel.com>
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

The ULLS postamble publishes the next job's ring tail and only then
parks on that job's semaphore. The CS fetches ring contents up to the
tail while parked, so it can fetch the next job's slot while it still
holds padding NOOPs. When the CPU later writes the job and signals the
semaphore, the CS executes the stale fetch, drains to the tail and
idles. The job never runs and its fence never signals.

This is hit whenever the CS parks before the next chained job is
written, e.g. when there is a pause between entering ULLS and the next
migration job. A lost ULLS_EXIT is silent as the next job's seqno write
covers its fence, but a lost ULLS_ACTIVE hangs the migration queue and
the subsequent kernel job timeout wedges the device.

Park first and publish the tail after the wait. The CS never fetches
beyond RING_TAIL, so the next slot cannot be fetched until the job is
in place. This puts the non-posted tail write on the wake-up path,
which the original order was chosen to avoid, but that order is not
safe.

Fixes: 6ec0b87160be ("drm/xe: Add ULLS migration job support to ring ops")
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: LLM
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 32 +++++++++++++++++---------------
 drivers/gpu/drm/xe/xe_ring_ops.c | 14 ++++++++++----
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0dfc54ba3b8f..fffb3eb6c76e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -116,19 +116,19 @@
  *	<copy timestamp, start seqno store>
  *	<batch buffer start(s)>			(skipped on first/last job)
  *	<seqno write + user interrupt>
- *	postamble:	SDI saved ring tail = end of next job
+ *	postamble:	wait on semaphore[seqno + 1]
+ *			SDI saved ring tail = end of next job
  *			LRI RING_TAIL = end of next job
- *			wait on semaphore[seqno + 1]
  *						(skipped on the last job)
  *	pad:		MI_NOOP up to ULLS_JOB_SIZE_DW
  *
  * The preamble clears the current job's semaphore so it can be reused once
  * the seqno space wraps. The postamble is what keeps the engine busy: it
- * advances the ring tail over the next job and then blocks on that job's
- * semaphore, which is only signaled when the job is actually submitted. It
- * advances the saved tail as well as the tail register, keeping the two in
- * step without any help from the CPU, so a context save and restore can not
- * rewind the tail behind work which has already been published.
+ * blocks on the next job's semaphore, which is only signaled when that job is
+ * actually submitted, and then advances the ring tail over it. It advances
+ * the saved tail as well as the tail register, keeping the two in step
+ * without any help from the CPU, so a context save and restore can not rewind
+ * the tail behind work which has already been published.
  *
  * The tail register write must be non-posted, i.e. it must not carry
  * MI_LRI_FORCE_POSTED. Posted, the new tail is free to land after the command
@@ -137,10 +137,12 @@
  * A parked context can be switched off the hardware, and the fast path below
  * has no H2G with which to ask GuC to bring it back.
  *
- * The tail is published ahead of the semaphore wait rather than after it so
- * that the non-posted write drains while the engine is parked anyway, keeping
- * a register round trip off the path between the semaphore being signaled and
- * the next job running.
+ * The tail must be published after the semaphore wait, not before it. The
+ * command streamer fetches ring contents up to the tail while it is parked,
+ * so a tail published ahead of the wait lets it fetch the next job's slot
+ * before the CPU has written the job there. Once released it then executes
+ * the MI_NOOPs it fetched instead of the job, that job's fence never signals,
+ * and the engine drains and idles with nothing left to wake it.
  *
  * Submission fast path
  * --------------------
@@ -151,10 +153,10 @@
  *	xe_lrc_set_ulls_semaphore(lrc, seqno);		release previous job
  *
  * The XE_GUC_ACTION_SCHED_CONTEXT H2G is suppressed, and so is the write of
- * the saved ring tail: the previous job's postamble has already published
- * this job's tail both in the tail register and in the context image, so the
- * semaphore signal is all that is left. The previous job's semaphore wait is
- * satisfied and the engine walks straight into this job.
+ * the saved ring tail: the previous job's postamble is parked on this job's
+ * semaphore and publishes this job's tail, both in the tail register and in
+ * the context image, as soon as it is released. The semaphore signal is all
+ * that is left, and the engine walks straight into this job.
  *
  * This does assume the context stays resident for as long as ULLS mode is
  * active. Nothing else is scheduled on the reserved engine, so the only ways
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc4dea606b38..ad63181938e3 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -537,12 +537,18 @@ static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
 	return i;
 }
 
-/* Publish the next job's tail, then park the engine on its semaphore */
+/*
+ * Park the engine on the next job's semaphore, then publish its tail.
+ *
+ * The tail must not be published before the wait. The command streamer
+ * fetches ring contents up to the tail while parked, so it would fetch the
+ * next job's slot while it still holds MI_NOOPs and execute those once
+ * released, rather than the job the CPU writes there later. Publishing after
+ * the wait keeps the slot beyond the tail until the job is in place.
+ */
 static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
 			       int i, u32 seqno, u32 head)
 {
-	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
-
 	dw[i++] = MI_SEMAPHORE_WAIT |
 		MI_SEMW_GGTT |
 		MI_SEMW_POLL |
@@ -552,7 +558,7 @@ static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
 	dw[i++] = 0;
 	dw[i++] = 0;
 
-	return i;
+	return emit_ulls_ring_tail(gt, lrc, dw, i, head);
 }
 
 /* Pad out to the fixed ULLS job size */
-- 
2.43.0

