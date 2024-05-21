Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8598C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 17:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78910ED8F;
	Tue, 21 May 2024 17:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJjc/qKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F23610ED8F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716313914; x=1747849914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0VIfMnoV+oH6reZz07v3hPvjFKIMa33ZZHU0lECt0fk=;
 b=IJjc/qKZcM2zSBay94lWOCSxVaGFV91whQbHPqgbh2Fk0lO5U9LgoamO
 u0uBfbVhlrgC9NpWkHf8ugBQWRto6tLsmL55dUsuz/sIE9qK5+zPLTkdr
 7fDlZ8i2eRdYgZb39I8scYD0h+dppQGeFjSxTAJoA45vzmpXgjj3lq2It
 9HohkPRpXyFrdM77SAIB948p4nmn57c6VCxiXaXofKqkuMQL8cvNgieZ4
 RXsqFPDNdH2Cfmi+EXhJSr41dssvbE0zy+5jclv5DSqdYbZ4AJFKmz+QG
 LV456R8gmTczfdldgK05ukMPB6Nc+/8uIrzh70xAhOxQFFUrpuN3OVaZo g==;
X-CSE-ConnectionGUID: mZlOW3e1RXWepelGvfV6mg==
X-CSE-MsgGUID: dgnfZEwISai4nZhspxKpzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12368782"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12368782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 10:51:53 -0700
X-CSE-ConnectionGUID: aN/FPfY7TD6zne2A7h/9ew==
X-CSE-MsgGUID: ZG8pmMeLQJeqtn00M5i7aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="33065876"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 10:51:51 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Add process name to devcoredump
Date: Tue, 21 May 2024 10:51:43 -0700
Message-ID: <20240521175143.100511-1-jose.souza@intel.com>
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3d7980232be1c..69968d7feb8bc 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
 	ts = ktime_to_timespec64(ss->boot_time);
 	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
+	drm_printf(&p, "Process: %s\n", ss->process_name);
 	xe_device_snapshot_print(xe, &p);
 
 	drm_printf(&p, "\n**** GuC CT ****\n");
@@ -166,12 +167,19 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	enum xe_hw_engine_id id;
 	u32 adj_logical_mask = q->logical_mask;
 	u32 width_mask = (0x1 << q->width) - 1;
+	struct task_struct *task;
 	int i;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	rcu_read_lock();
+	task = pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
+	if (task)
+		strscpy(ss->process_name, task->comm, sizeof(ss->process_name));
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

