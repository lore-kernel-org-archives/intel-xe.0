Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2C6C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 18:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98B810E1CE;
	Tue, 21 May 2024 18:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMHybRRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5A710E1CE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 18:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716316680; x=1747852680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iFtlbI7ptCLLDxyQR81ugbR3yyOxDZ6SzEvOj3t1/+E=;
 b=kMHybRRzoZdzOj3B3bV+Cne3hgD2DOgFBzBwGW9xLI5DING3ALFxSk/I
 vKZJQX+yqMTkrA0CEIgrSNq1JJYBLfqht/TuBNhdcRhBSdW6ABaMbKovj
 JxzhwqusFRtEjtFs/rjX+nBGEIa9Le3L35xVnKn8FOcwtDewzSJIKIUR2
 YSgOxjr/5kbg9qWAhMPbHuFl7ecHtozl0dVQ9YbTll952zUChFO5DGjfs
 87UyAqWK0rIp8bUE8OaWponp/jPaxWhdDIHN8eqkzMGDiunDgkhpXWLGH
 hNJ1I5CHDG4K3CAXsKKp/toi5mDjsvv0aRTQkv4r+1vpN1HQeETpdlOfd Q==;
X-CSE-ConnectionGUID: K2vPsumJSySuifzPaaFMPA==
X-CSE-MsgGUID: AwnfPSO4TNSkNi+bJiP2Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30058094"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="30058094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 11:38:00 -0700
X-CSE-ConnectionGUID: 3c3mD1hoSoGxt7yDsqGX3Q==
X-CSE-MsgGUID: IEXTX1VISMyufxXxVggmhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="70431902"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 11:37:58 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v2] drm/xe: Add process name to devcoredump
Date: Tue, 21 May 2024 11:37:51 -0700
Message-ID: <20240521183751.184773-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Process name help us track what application caused the gpug hang, this
is crucial when running several applications at the same time.

v2:
- handle Xe KMD exec_queues without VM

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3d7980232be1c..8e436ff714103 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
@@ -166,12 +167,23 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
+	const char *process_name = "no process";
+	struct task_struct *task;
 	int i;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	rcu_read_lock();
+	if (q->vm) {
+		task = pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
+		if (task)
+			process_name = task->comm;
+	}
+	snprintf(ss->process_name, sizeof(ss->process_name), process_name);
+	rcu_read_unlock();
+
 	ss->gt = q->gt;
 	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 6f654b63c7f1c..923cdf72a816a 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -26,6 +26,8 @@ struct xe_devcoredump_snapshot {
 	ktime_t snapshot_time;
 	/** @boot_time:  Relative boot time so the uptime can be calculated. */
 	ktime_t boot_time;
+	/** @process_name: Name of process that triggered this gpu hang */
+	char process_name[TASK_COMM_LEN];
 
 	/** @gt: Affected GT, used by forcewake for delayed capture */
 	struct xe_gt *gt;
-- 
2.45.1

