Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0244C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 20:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9E310F193;
	Wed, 22 May 2024 20:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwEQC6kS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671D10F193
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716408734; x=1747944734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vhOrYSXnsybYw2yo+ARW0VcApDPOQ/z1lSPfVmWQSgQ=;
 b=PwEQC6kSALMMH8lllRT8uvrWP1Wn/RjExL0uRQKNixvZOaEiLlz1vTJf
 KtbAri42nqmE4Rded2FNBiCjd8TW57ysNPZx6OYiJZh7/c+hV8ygNsgZ1
 /fc1dYCu8YA2ik3pzX/pQMp8Uv74LpQICz2A7vjjfJ822QP1tvfO1Dd+R
 3lXaFztuSWDp9QL11uzmShvqWOOxrYDKxD5kzYsA6E8QDOBC8y4rAhuvv
 OMo2mkItX5xrIDOgnVc9tnVqmdBBPnGoEOZvodJuSg3i2aH1TkkUQ1eNl
 GiZX5ZJisPNcz7HfgnB9A8elF9+JIyGYFC8llsnBy8AlHkmnjFuzE9qvB A==;
X-CSE-ConnectionGUID: ubXNizlnQOuxQZqtJ5bB3w==
X-CSE-MsgGUID: 9JCwcR/TQC+3hqo9pKBVgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15637676"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="15637676"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:12:13 -0700
X-CSE-ConnectionGUID: 3f19prk0RvyHNN5jEi33AQ==
X-CSE-MsgGUID: 2cjw3aIEQXSPnmvcqZ/XQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33512104"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:12:12 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v3] drm/xe: Add process name to devcoredump
Date: Wed, 22 May 2024 13:12:03 -0700
Message-ID: <20240522201203.145403-1-jose.souza@intel.com>
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

v3:
- use get_pid_task() (suggested by Nirmoy)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index e70aef7971930..1643d44f8bc42 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
@@ -166,12 +167,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
+	const char *process_name = "no process";
+	struct task_struct *task = NULL;
+
 	int i;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	if (q->vm) {
+		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
+		if (task)
+			process_name = task->comm;
+	}
+	snprintf(ss->process_name, sizeof(ss->process_name), process_name);
+	if (task)
+		put_task_struct(task);
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

