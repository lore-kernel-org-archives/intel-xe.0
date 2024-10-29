Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0757D74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8610E3B1;
	Tue, 29 Oct 2024 21:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq/cZOwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073010E3B1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238257; x=1761774257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2kXpp6mtUv5jxhwOvkVuEqPJimYsh5jVxAj14JOHU8=;
 b=Oq/cZOwSahaCwOic0xuYbZLybHpHITqdJCZds8BpoxtO4IIFU6CsUivt
 zwrqF0dRZBGvtUCTK+fIJ6lcfO5JMu25fEFnb72x3pzwYvtMKmJNIyst8
 /tumFzsFuG+6Rt1y48zInSx5zuPO5WFe7hIwOytyO/RWV+JUT1Mah0GSp
 NkxcUUK7brWY/N3mcbvrAPURBz8ikNjWw8RXQkFdfoipeNJqhEpXxD/yD
 xsRR/kLOSBU2mGTGAJHKePYHyLJQXIuVtaQYITNqqgSHb16SxFTq9A0uY
 o54voOM/2mUE041Liz+TrhCx+wf/zakezEhyGTbm+AWLVMHgzmXdKxl9B A==;
X-CSE-ConnectionGUID: XfGiKf9ERX6/hLNeVdJCyg==
X-CSE-MsgGUID: 7CpliGTpQP2WL9LfMGs3xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40523813"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40523813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
X-CSE-ConnectionGUID: yzCmyHVKRrCN1ndp61ox0w==
X-CSE-MsgGUID: Ju9+GtdEQJyif/ln4EGahQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="119579604"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Wait on killed exec queues
Date: Tue, 29 Oct 2024 14:43:51 -0700
Message-ID: <20241029214351.776293-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
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

When an exec queue is killed it triggers an async process of asking the
GuC to schedule the context out. The timestamp in the context image is
only updated when this process completes. In case a userspace process
kills an exec and tries to read the timestamp, it may not get an updated
runtime.

Add synchronization between the process reading the fdinfo and the exec
queue being killed. After reading all the timestamps, wait on exec
queues in the process of being killed. When that wait is over,
xe_exec_queue_fini() was already called and updated the timestamps.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ef7412d653d2e..b949376ca388a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -614,6 +614,11 @@ struct xe_file {
 		 * which does things while being held.
 		 */
 		struct mutex lock;
+		/**
+		 * @exec_queue.pending_removal: items pending to be removed to
+		 * synchronize GPU state update with ongoing query.
+		 */
+		atomic_t pending_removal;
 	} exec_queue;
 
 	/** @run_ticks: hw engine class run time in ticks for this drm client */
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 22f0f1a6dfd55..24a0a7377abf2 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		break;
 	}
 
+	/*
+	 * Wait for any exec queue going away: their cycles will get updated on
+	 * context switch out, so wait for that to happen
+	 */
+	wait_var_event(&xef->exec_queue.pending_removal,
+		       !atomic_read(&xef->exec_queue.pending_removal));
+
 	xe_pm_runtime_put(xe);
 
 	if (unlikely(!hwe))
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101d..58dd35beb15ad 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	/*
 	 * Before releasing our ref to lrc and xef, accumulate our run ticks
+	 * and wakeup any waiters.
 	 */
 	xe_exec_queue_update_run_ticks(q);
+	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
+		wake_up_var(&q->xef->exec_queue.pending_removal);
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_put(q->lrc[i]);
@@ -824,6 +827,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
+	atomic_inc(&xef->exec_queue.pending_removal);
 	mutex_lock(&xef->exec_queue.lock);
 	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
 	mutex_unlock(&xef->exec_queue.lock);
-- 
2.47.0

