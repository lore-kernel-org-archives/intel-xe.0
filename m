Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8F9C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A26210E72D;
	Wed, 24 Jul 2024 15:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2EGN8pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0049010E72D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721834866; x=1753370866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w2mnbaB5JC/pJU3mUALpiDx1KeBlt2TZelkEipHOZT4=;
 b=m2EGN8prGU+zQmezFPk2kWHOyIGhfrMwOeuYmeKiVyImmQdPPF+VeDvY
 oVhWCTjDwsfm+upSnqvr/bQwam6w+tY8Uvh2pQc2NncU68LsRuXtpChYA
 5ur82IYBgDQp+nHHMfNaqo3aC9wmnujtEs/A/kVLT185BdKPdXG2XeY/c
 0PX0xgUVuCH81EPGG27SKPJ4ly8IkPaguCgwLGDVsaYjMCNgYZ6/mx6lV
 wFAo6+LyfYEHnsBPSdS/vVm3C92BIvr19nMXUAIAss5MK54yBUFvcx8Rd
 8dvQMpnWJNJ8D2UDbelE6M4iNbTvotF89NTyanmdsEogOv0tLDtl1C92x g==;
X-CSE-ConnectionGUID: N3tNSz2GRiazBHcnTzU4cA==
X-CSE-MsgGUID: 7JMDjCXzQsOx8KB3dVUwfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="42050731"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="42050731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:27:45 -0700
X-CSE-ConnectionGUID: tRp4RHzFTRCH8YBRw9gf8g==
X-CSE-MsgGUID: CCv1sT2XSbOi5Bc6AbZifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="57172400"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:27:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/xe: Move VM dma-resv lock from xe_exec_queue_create to
 __xe_exec_queue_init
Date: Wed, 24 Jul 2024 08:28:31 -0700
Message-Id: <20240724152831.1848325-1-matthew.brost@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The critical section which requires the VM dma-resv is the call
xe_lrc_create in __xe_exec_queue_init. Move this lock to
__xe_exec_queue_init holding it just around xe_lrc_create. Not only is
good practice, this also fixes a locking double of the VM dma-resv in
the error paths of __xe_exec_queue_init as xe_lrc_put tries to acquire
this too resulting in a deadlock.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Matthw Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 69867a7b7c77..0d72846af9bf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -105,22 +105,35 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
+	struct xe_vm *vm = q->vm;
 	int i, err;
 
+	if (vm) {
+		err = xe_vm_lock(vm, true);
+		if (err)
+			return err;
+	}
+
 	for (i = 0; i < q->width; ++i) {
 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
-			goto err_lrc;
+			goto err_unlock;
 		}
 	}
 
+	if (vm)
+		xe_vm_unlock(vm);
+
 	err = q->ops->init(q);
 	if (err)
 		goto err_lrc;
 
 	return 0;
 
+err_unlock:
+	if (vm)
+		xe_vm_unlock(vm);
 err_lrc:
 	for (i = i - 1; i >= 0; --i)
 		xe_lrc_put(q->lrc[i]);
@@ -140,15 +153,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (IS_ERR(q))
 		return q;
 
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto err_post_alloc;
-	}
-
 	err = __xe_exec_queue_init(q);
-	if (vm)
-		xe_vm_unlock(vm);
 	if (err)
 		goto err_post_alloc;
 
-- 
2.34.1

