Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2760A260E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iqUQOWuX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1036211280C;
	Fri, 20 Nov 2026 00:05:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0311D112808
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795133129; x=1826669129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y2X3lFm8oC5lUSfoxpq5KPcrNAYuE7FGYY/eMmLMtt0=;
 b=iqUQOWuXlmOwEv0fdrDqQTze72bXfRuMiQhEK6S9hjPCJ1FkebuSCGH9
 WaA+qLUlQqDNf5R6snwkkS18BCsRD96OEhAuz/WAeZ+4oXKoBQgq7bLEf
 5i4GFKfBaqIqP2hUVBLjNxBuEsjAVK0YBzjmT2XuQe3t1wmVOPZJ6QFz0
 Jrks0ujUJxFyJZEiDRTMZFjK4MS6QeciBCHlbv/vT1QVqoTFVazdH8/10
 DwX/HDh/If4FtCBTes6Pz0MhyKFN9+QF+lOHa19tZpy41UtGRNMZu8m6B
 VjI/as3b3b+5I+mJzKGxoMg7/uEyxWCmVUtSD8pw5iMU5iKX6mMAFNX0N Q==;
X-CSE-ConnectionGUID: NDbhD00eR1aFnPtVwUBgHg==
X-CSE-MsgGUID: S1sVpUCbQGCuQAGysxc6TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4032095"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4032095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 16:05:29 -0800
X-CSE-ConnectionGUID: 5staZPMxRey6sR4PUTuHAw==
X-CSE-MsgGUID: 4Wyk3iXaR5qzPHg4Vympyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10560547"
Received: from fyang16-desk.jf.intel.com ([10.24.81.66])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 16:05:28 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH] drm/xe: Serialize migrate ULLS enter against a pending exit
Date: Thu, 19 Nov 2026 16:10:53 -0800
Message-ID: <20261120001054.3901642-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fei Yang <fei.yang@intel.com>

xe_migrate_ulls_exit() clears ulls.enabled as soon as the ULLS_EXIT job is
pushed, and drops job_mutex without waiting for it. A page fault arriving
in that window finds ULLS disabled and pushes a ULLS_ENTER job while the
previous ULLS chain is still executing.

ULLS_ENTER is not chained, so submit_exec_queue() publishes its ring tail
with xe_lrc_set_ring_tail(). That only updates the saved tail in the
context image, which is what a context restore loads RING_TAIL from. It is
therefore correct for a context that is off the hardware - but the context
only leaves the hardware once the exit job has retired.

Submitted before then, that write races the postamble of the job preceding
the exit job. The postamble publishes the same saved tail, and RING_TAIL,
at the end of the exit job. If it lands after the CPU's write the tail is
rewound behind the enter job, which the command streamer never executes.
Its fence never signals, so job_cnt never drops, xe_exec_queue_is_idle()
stays false and the exit worker re-arms itself forever while the context
sits parked on the engine.

Wait for the exit job's fence in the exit worker before dropping
job_mutex. xe_migrate_ulls_enter() takes job_mutex to submit, so it is
serialized behind the exit job retiring. The exit job carries no batch
and is only pushed once the queue is idle, so the wait is short and
depends on nothing else on the queue.

Assisted-by: LLM
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d7a8d8ecffe63..a8deb5fa714ca 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -188,6 +188,18 @@
  * The PM reference is then dropped. If the queue was not idle, the worker
  * simply re-arms itself.
  *
+ * The worker waits for the "last" job to retire before dropping
+ * @xe_migrate.job_mutex, so a subsequent enter is serialized behind it. A
+ * "first" job is not chained, so it publishes its own ring tail with
+ * xe_lrc_set_ring_tail(), which updates the saved tail in the context image
+ * only. That is enough for a context which is off the hardware, since a
+ * context restore loads RING_TAIL from there, but the context is only off the
+ * hardware once the "last" job has retired. Submitted before then, the write
+ * races the postamble of the job preceding the "last" one, which puts that
+ * same saved tail - and RING_TAIL - at the end of the "last" job. The
+ * postamble landing second rewinds the tail behind the "first" job, which the
+ * command streamer then never executes.
+ *
  * Job state
  * ---------
  *
@@ -768,6 +780,9 @@ static void xe_migrate_ulls_exit(struct work_struct *work)
 	scoped_guard(mutex, &m->job_mutex) {
 		if (xe_exec_queue_is_idle(m->q, 1)) {
 			fence = __xe_migrate_job_push(m, job, ULLS_EXIT);
+
+			/* Keep enter out until the context is off the HW */
+			dma_fence_wait(fence, false);
 			dma_fence_put(fence);
 
 			xe_pm_runtime_put(xe);	/* Pairs with PM get in enter */
-- 
2.43.0

