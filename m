Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BEBFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 16:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91AE10EC30;
	Tue, 28 Apr 2026 16:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuWBe+rK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1468010EC30
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777392829; x=1808928829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GgalbcMzdtS9Bo3qYukJ4jUWgNIP8yLaVWgCXorx7Fk=;
 b=YuWBe+rKQXwFNkEzV0RApPv9YTrPOFgr/Avx2ssSWuiqh55tJPNSHSxn
 M+E6fr/iTyRwVJEkm2+nPrDVTeNT4Cc7himlTvNUMsTdAN3VQGFu05glf
 WNqV6ZrD3S4MYVQW3coj9iuWNf8oGHAyVdaWFndivgvtfytaq+VogcF9/
 F/WCoXRY1qtmBfhVvs/oh1Xg2rgoPqCBZQ3ncE+YIIbf9G3OzLNHshLXy
 G0syBP3kSegrk6YMLg+Y93LDs/eHNKimFMRHIPrVF4kVe6gnAB7fWVctL
 MV8qttV17pNawEKzu1UXsM+bIdMW8dBZiXchtfy9FXrAb7fAmoclzwIGe A==;
X-CSE-ConnectionGUID: 5yK0HY2oQHa8MjHYOv5a0Q==
X-CSE-MsgGUID: 7/H5dzcwQAyAowFNxSWsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78367785"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78367785"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 09:13:48 -0700
X-CSE-ConnectionGUID: t8XlvWXmSBygiqA6UWN8SA==
X-CSE-MsgGUID: UDpuH0ATQ327kwVnmCik3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="257557281"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2026 09:13:48 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/xe_exec: Avoid potential lockdep cycle with
 xe_pm_block_map
Date: Tue, 28 Apr 2026 16:13:48 +0000
Message-ID: <20260428161347.848905-2-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
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

With the EUDEBUG patch series [1], lockdep will report multiple
circular locking dependencies originating from xe_exec_ioctl that
close through discovery_lock.

The vm->lock -> xe_pm_block_map comes from calling
xe_pm_block_on_suspend() inside of the vm->lock critical section. The
xe_pm_block_map annotation was added by commit f73f6dd312a5
("drm/xe/pm: Add lockdep annotation for the pm_block completion") and
made existing lockdep ordering visible.

Some lockdep cycle variants are observed through the preempt rebind
worker, SVM garbage collector worker, and the mode_sem lock in xe_exec.

To prevent problematic ordering, probe for pending suspend and if the
block is needed, drop held locks before blocking, removing the common
ordering between all 3 cycles (vm->lock -> xe_pm_block_map) and prevent
another possible cycle (mode_sem -> xe_pm_block_map) from forming.

As reference, the cycles closed by inclusion of the discovery_lock are:

Cycle A: discovery_lock -> mode_sem -> vm->lock -> xe_pm_block_map ->
clientlist_mutex -> discovery_lock

Cycle B: discovery_lock -> work_completion(rebind_work) -> vm->lock ->
xe_pm_block_map -> clientlist_mutex -> discovery_lock

Cycle C: discovery_lock -> work_completion(garbage_collector.work) ->
vm->lock -> xe_pm_block_map -> clientlist_mutex -> discovery_lock

[1] https://patchwork.freedesktop.org/series/161979/

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e05dabfcd43c..0717bf0c0d31 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -257,13 +257,19 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	/*
-	 * It's OK to block interruptible here with the vm lock held, since
-	 * on task freezing during suspend / hibernate, the call will
-	 * return -ERESTARTSYS and the IOCTL will be rerun.
+	 * If suspend is pending, drop held locks then perform the
+	 * block on suspend, avoiding potential lockdep cycle.
+	 * On task freezing the wait itself returns -ERESTARTSYS via the freezer
+	 * signal path; either way the caller is restarted.
 	 */
-	err = xe_pm_block_on_suspend(xe);
-	if (err)
-		goto err_unlock_list;
+	if (!try_wait_for_completion(&xe->pm_block)) {
+		up_read(&vm->lock);
+		if (mode == EXEC_MODE_DMA_FENCE)
+			xe_hw_engine_group_put(group);
+		xe_pm_block_on_suspend(xe);
+		err = -ERESTARTSYS;
+		goto err_syncs;
+	}
 
 	if (!xe_vm_in_lr_mode(vm)) {
 		vm_exec.vm = &vm->gpuvm;
-- 
2.43.0

