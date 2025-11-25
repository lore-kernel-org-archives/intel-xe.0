Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B850DD0E6C4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 10:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAEF10E3BB;
	Tue, 25 Nov 2025 10:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by5v/fow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D34F10E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764068254; x=1795604254;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=3pjDcrQzaJAHWMLahiMFlSJqrqTjXrWdYJmsOUp8SSc=;
 b=by5v/fowPWu/8VuQcz/7OkbylqATQz7PkPEPEcRS4KLPWgVnfJypotqo
 LrSxV8ez9F32/wrfL38hDjn/S1kuhz25vzQeY45YaiKMoTmNPL8m9lyrV
 PFXHP9CGV0W2um2nYXgkpyX4AjzUh1Ob6jh3UidVjFnmeJNQBF5akC/LW
 Po5SFyU0pUmTTop3BMKPFumC3XUymHhMlpLWd/3X1kI0E5DlkAUMdC5ZB
 SyR0uahko8UFxtxK0eQod1sJjidUX4dP1Y7LNeywmLRhzxa9hMrpN3sYB
 g31Gbi2SAHTxIsobQ2dMkWVb5X8D646iuu5KKyoV20L/5n7peuwO9t4fV A==;
X-CSE-ConnectionGUID: 0vRfiljgQYm1HoDdzikiCA==
X-CSE-MsgGUID: S3hJthOmS86PgT9c3EfSyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76407037"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="76407037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:57:33 -0800
X-CSE-ConnectionGUID: HZvr7IZ4T3CCxDS9N9+Low==
X-CSE-MsgGUID: QCHUDlD0RP2TJXNXWi8wcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="196771509"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:57:32 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 11:56:14 +0100
Subject: [PATCH] drm/xe/xe_file: change pid type from pid_t to pid pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-change_pid_t_to_ppid-v1-1-6ddd817a953e@intel.com>
X-B4-Tracking: v=1; b=H4sIAE2LJWkC/yWM0QrCMAxFf2Xk2YDpmDp/RaR0a+byYFfSIsLYv
 xu3t3sunLNCYRUucG9WUP5IkSUZ0KmBcQ7pxSjRGNzZdUSuw+P1WaKvvi4+20Jqr+1EfLnFvgd
 Ts/Ik3z37eBoPoTAOGtI4/2NR31glw7b9AG8P2buAAAAA
X-Change-ID: 20251125-change_pid_t_to_ppid-1373f1e68d99
To: intel-xe@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=3pjDcrQzaJAHWMLahiMFlSJqrqTjXrWdYJmsOUp8SSc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJYtXjv3SAMuX5P5AQk4YP/7955P4tX4w9/09M
 pGJIIa5kOSJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSWLVwAKCRAjYrKT3hD9
 108BDACkqAFxpEU+P7U57bItXVPoYuSbvrz+fwZVn7bKFriGnvb9mlBnhTzDyiVmxGkHPj+1gxA
 V3B+CcHdahheURuv7HgZgyaf9YOpsPRLM3FJgp0uHYEFIFQtrUae7gb9xl3waYGPGounDhQNevA
 +yIxPj8+zJSEkIpcrEaFrCgL5kQWeXYNBKfqlpwDxAa8D8gk8MLjq1BCns/pAu7vE3es70T4Uqy
 JWhFj+3+G7gudQCjopIIkdqfw04NBTfkiw4op8dGGGZdyiqJbvQ3sjqA4honp1FBl1T+ATXQZox
 oQtkbQxJMVGWc0hUmkb5xjBXZCbpU6K9WbvYmsa7O9XtkahI/KGoZ9007hO78WHQfZzHAtrFcPX
 Etp4SxUneIQTC8OY6vKzkKakWsnNXzXj5whERQR6mO0j/5fMN1qNtoqcPvZh9WLV91OJ8TKP7fJ
 +fYFxIAMtvR61kPlHB6uaQK8W/nAxbfuPfYhNAgO+La0s14L/LVi0S6ChRReCqVqXnNXo=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Some xe structures can outlive xef->drm pointer, but they need to
access associated process info. struct pid is refcounted (in contrast to
drm_file), so it's life can be safely prolonged till end of xe_file life.

The patch is necessary for incoming eudebug feature.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  | 2 +-
 drivers/gpu/drm/xe/xe_device.c       | 5 +++--
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
 drivers/gpu/drm/xe/xe_guc_submit.c   | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index bf347714b5e090a408301d778d9c75af559ebaf6..2caddad2b09cc7907025eb1f6d2f2925060d8cf1 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -335,7 +335,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 
 	if (q->vm && q->vm->xef) {
 		process_name = q->vm->xef->process_name;
-		ss->pid = q->vm->xef->pid;
+		ss->pid = pid_nr(q->vm->xef->pid);
 	}
 
 	strscpy(ss->process_name, process_name);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1197f914ef777ab9d466853e5893adc744d59210..b11b7bb70d9afea4b3d108ed5e505c81755d41bd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -108,10 +108,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
-	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
+	xef->pid = get_pid(rcu_access_pointer(file->pid));
+	task = get_pid_task(xef->pid, PIDTYPE_PID);
 	if (task) {
 		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
-		xef->pid = task->pid;
 		put_task_struct(task);
 	}
 
@@ -126,6 +126,7 @@ static void xe_file_destroy(struct kref *ref)
 	mutex_destroy(&xef->exec_queue.lock);
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
+	put_pid(xef->pid);
 
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6ce3247d1bd8eff33ebc7b55338df013f26108e7..a8bfcf7b1fcc39f5c3419d51ee1c09df390e4f2d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -706,10 +706,10 @@ struct xe_file {
 	char *process_name;
 
 	/**
-	 * @pid: pid for file handle, used to safely output uring error
-	 * situations where xe file can outlive process
+	 * @pid: pid for file handle, used to safely access process info
+	 * in situations where xe file can outlive drm_file
 	 */
-	pid_t pid;
+	struct pid *pid;
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7e0882074a992c7022a2e3901a4218a6041b38d6..6cc1b830a318f9c2fc8c5040a310e92b6602c226 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1350,7 +1350,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	if (q->vm && q->vm->xef) {
 		process_name = q->vm->xef->process_name;
-		pid = q->vm->xef->pid;
+		pid = pid_nr(q->vm->xef->pid);
 	}
 
 	if (!exec_queue_killed(q))

---
base-commit: c9ffb8a8ab1294c1870e017e0502cb8089d3d8b8
change-id: 20251125-change_pid_t_to_ppid-1373f1e68d99

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

