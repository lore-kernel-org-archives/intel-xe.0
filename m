Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A726C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4585F10E633;
	Mon, 13 Mar 2023 20:46:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95A10E62C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740359; x=1710276359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ataU1Dh+5OyymOEDRqk9jYsQAa3HyTrDrGNAap5WkTs=;
 b=Q620Fz3OMp02OutqJD0Y4nDApZIoxOjqA4Sb+vcusJKH8ZNA0B7I0gth
 T/wRzRhqdiyL5cY3Jj6QChasJamOJqwUpOO3hQGVjzB4mZeI1YGrhd8sg
 yCGtK39+eYoxl3RSusPwDOutF0XZzMlCR+nybJbKFA6DS2hDSwThc88n7
 yHiEJ+UHl5z2yrNbSwbH0FlSn44Ugp2hMycU0LLNMeg0dpFum+axqPEsd
 FX3KXwh6G4Za7MpnX2LHEhMpEAaY0ls+Wij+kmAYXYLbKk3S812WK+UL+
 QifWDiEMHgZ5XzSQfri/tAjPxT1C7DXyJDWFj04Ft88LTCWrAtYjprV6q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733895"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733895"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650122"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650122"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:45:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:15 +0100
Message-Id: <20230313204519.158888-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe/migrate: Update cpu page-table updates
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

Don't wait for GPU to be able to update page-tables using CPU. Putting
ourselves to sleep may be more of a problem than using GPU for
page-table updates. Also allow the vm to be NULL since the migrate
kunit test uses NULL for vm.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c0523d8fe944..39ed63829224 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -979,25 +979,13 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	int err;
 	u32 i;
 
-	/* Wait on BO moves for 10 ms, then fall back to GPU job */
-	if (bo) {
-		long wait;
+	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
+					  DMA_RESV_USAGE_KERNEL))
+		return ERR_PTR(-ETIME);
 
-		wait = dma_resv_wait_timeout(bo->ttm.base.resv,
-					     DMA_RESV_USAGE_KERNEL,
-					     true, HZ / 100);
-		if (wait <= 0)
-			return ERR_PTR(-ETIME);
-	}
-	if (wait_vm) {
-		long wait;
-
-		wait = dma_resv_wait_timeout(&vm->resv,
-					     DMA_RESV_USAGE_BOOKKEEP,
-					     true, HZ / 100);
-		if (wait <= 0)
-			return ERR_PTR(-ETIME);
-	}
+	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
+					       DMA_RESV_USAGE_BOOKKEEP))
+		return ERR_PTR(-ETIME);
 
 	if (ops->pre_commit) {
 		err = ops->pre_commit(pt_update);
@@ -1011,8 +999,10 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 			      update->ofs, update->qwords, update);
 	}
 
-	trace_xe_vm_cpu_bind(vm);
-	xe_device_wmb(vm->xe);
+	if (vm) {
+		trace_xe_vm_cpu_bind(vm);
+		xe_device_wmb(vm->xe);
+	}
 
 	fence = dma_fence_get_stub();
 
-- 
2.39.2

