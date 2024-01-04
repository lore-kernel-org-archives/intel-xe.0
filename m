Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711FBC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 08:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF6510E3C6;
	Thu,  4 Jan 2024 08:08:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C1C10E3D4
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 08:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704355720; x=1735891720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WDO+j/KmsGHTn19M22Xs65hENb+PV/HXcOg8qI6yPwY=;
 b=euoa8u9prNq9b7mc9rNIJRawy3vIgvYssmC2cBFfNCjXQtHatjF2hVa3
 QzNXi5oEY+fJXIcxLzJMdUE4gX7eF2HIA609vFCeSRw9j3eaIcHKOzGfz
 FlG4v3S8JkQMJonRH2tlam5KPydPRw55tRL7xPT3Zu8TxG84/2p74FMda
 bTudIo8q5cdEJ5HCT0Nr+JGJSifZ4Fq0itqPx/7n5wpxxNOcQ/yHz9sGw
 J887S1LoQf97UPXcgH1YVFfujahsoqao/vWKM5kFaBfVHZNop6QGy/iB8
 cMA1ffXMad17pc7deiuoYoaEIbE6jUgwEoiw5SFmFahbfiQIBkprODXwD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4511580"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4511580"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 00:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="1111638750"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="1111638750"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 00:08:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Fix exec IOCTL long running exec queue ring full
 condition
Date: Thu,  4 Jan 2024 00:09:09 -0800
Message-Id: <20240104080909.1271480-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The intent is to return -EWOULDBLOCK to the user if a long running exec
queue is full during the exec IOCTL. -EWOULDBLOCK aliases to -EAGAIN
which results in the exec IOCTL doing a retry loop. Fix this by ensuring
the retry loop is broken when returning -EWOULDBLOCK.

Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
Reported-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index d30c0d0689bc..c68e1bd15e6a 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -115,7 +115,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
-	bool write_locked;
+	bool write_locked, skip_eagain = false;
 	ktime_t end = 0;
 	int err = 0;
 
@@ -227,7 +227,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
-		err = -EWOULDBLOCK;
+		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
+		skip_eagain = true;
 		goto err_exec;
 	}
 
@@ -337,7 +338,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		up_write(&vm->lock);
 	else
 		up_read(&vm->lock);
-	if (err == -EAGAIN)
+	if (err == -EAGAIN && !skip_eagain)
 		goto retry;
 err_syncs:
 	for (i = 0; i < num_syncs; i++)
-- 
2.34.1

