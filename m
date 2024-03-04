Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3D3C5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DBB1121CA;
	Mon,  4 Mar 2024 14:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlSZ6rhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869F1121C9
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709561127; x=1741097127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZM/mmokSShifbmq7KRlBR/IK5Cvc2luiDbDquP39O0=;
 b=jlSZ6rhSobviZYciDAHrPxFHtjfHb/zhsvVwdnQapuHcVxsd5DMXQlph
 nMppCTUmcRtOm/tSwtRdb2+Cu1GhvE8xmUD7vBqhg2uZ/adjGFc+ST7tE
 H/kVRMCV4VygpTDaDbJ2NX01nZ0zZCxAJiacCF101Xc0HkexAH0JSIcsz
 trLaxY+/clyOZSRQ6aAQ08Fo2dOxnRL3UIdM4LS+lHxyGl3bfRl2umfCS
 DOea1k9nj01o06xPdDYuH8pqI7hHBTH4LlorcH0dIDgQ+DDK3f7M7nm3l
 XOg5U5DRf3enCZ9qEJd9lv4uDPtTvMvN9EfkvmJzj7wj07iR+aGYECEQj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4175445"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4175445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8920951"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:05:25 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 3/4] drm/xe/devcoredump: Lock snap_mutex earlier
Date: Mon,  4 Mar 2024 06:05:13 -0800
Message-ID: <20240304140514.24768-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304140514.24768-1-jose.souza@intel.com>
References: <20240304140514.24768-1-jose.souza@intel.com>
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

In case job gets signaled while snapshot capture is running this
prevents UMD from unbind VMAs that needs to be captured.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 7 +++++++
 drivers/gpu/drm/xe/xe_vm.c          | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 4ab0feca55cdd..24d27f1c9efc6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -162,6 +162,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	int i;
 	bool cookie;
 
+	if (q->vm)
+		mutex_lock(&q->vm->snap_mutex);
+
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
@@ -197,6 +200,10 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 	queue_work(system_unbound_wq, &ss->work);
 
 	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+
+	if (q->vm)
+		mutex_unlock(&q->vm->snap_mutex);
+
 	dma_fence_end_signalling(cookie);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f7d20bf9b33a9..544907b09289a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3328,7 +3328,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 	if (!vm)
 		return NULL;
 
-	mutex_lock(&vm->snap_mutex);
 	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
 		if (gpuva->flags & XE_VMA_DUMPABLE)
 			num_snaps++;
@@ -3373,7 +3372,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
 	}
 
 out_unlock:
-	mutex_unlock(&vm->snap_mutex);
 	return snap;
 }
 
-- 
2.44.0

