Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B361D5E12D
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2110E1CA;
	Fri,  8 Nov 2024 05:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+wvZ0L+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB2410E920
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044022; x=1762580022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jw4jQBflRd4jyOLXJKN3vbqZpgEnVUCJFfUMrNeYkHI=;
 b=I+wvZ0L+gpoMyGcasvXIDhn3ko4JLZcGJssaCGA/h22XeuJ2Qknp+G3R
 P2PA2S18ioMqifVJ8nQhvwRKzVFFF50JXvdA93wmEFRZ/GGs0du0LTq5A
 EKRBJ2Du4rHJQaShEB3e6JmM/goERD4orxfH/SjTye07SHzd9xI5AYg5/
 OWJbDNPa0u1v1r7JliTi05l7PGcN04bNDSW6yGiMUXeyW08/Z7/RmnUc0
 9sXsYgzhfxD1brNhrIolYrAlgFMg0coCwamzkFOFODnYgayEPqNWMexpo
 t1Y+DHeee2eysIDCc9Gi+0tVNWMxaAuFpblNEGczF8ZP18Ov7swoOMiOD g==;
X-CSE-ConnectionGUID: kIjfQNLnTsGsNEEWTwnoeQ==
X-CSE-MsgGUID: /A2YoG0TTnufLIWijCRerw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30316581"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30316581"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:42 -0800
X-CSE-ConnectionGUID: X15APp0gSyWBba5buj450w==
X-CSE-MsgGUID: /FdL/fQNTq6RV+Dem4SDog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="90037102"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:33:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 1/3] drm/xe: Wait on killed exec queues
Date: Thu,  7 Nov 2024 21:33:16 -0800
Message-ID: <20241108053318.3483678-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108053318.3483678-1-lucas.demarchi@intel.com>
References: <20241108053318.3483678-1-lucas.demarchi@intel.com>
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

v2: Do not update pending_removal before validating user args
    (Matthew Auld)
v3: Move wait on pending to be done before getting any timestamp
    so it's more likely for the gpu and exec queue timestamps to
    be closer together

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
 drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bccca63c8a48c..fffbb7d1c40b4 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -607,6 +607,11 @@ struct xe_file {
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
index 22f0f1a6dfd55..dd4e16a84874c 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -280,6 +280,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	u64 gpu_timestamp;
 	unsigned int fw_ref;
 
+	/*
+	 * Wait for any exec queue going away: their cycles will get updated on
+	 * context switch out, so wait for that to happen
+	 */
+	wait_var_event(&xef->exec_queue.pending_removal,
+		       !atomic_read(&xef->exec_queue.pending_removal));
+
 	xe_pm_runtime_get(xe);
 
 	/* Accumulate all the exec queues from this client */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101d..ff556773c1063 100644
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
@@ -826,7 +829,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 
 	mutex_lock(&xef->exec_queue.lock);
 	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
+	if (q)
+		atomic_inc(&xef->exec_queue.pending_removal);
 	mutex_unlock(&xef->exec_queue.lock);
+
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-- 
2.47.0

