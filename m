Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74162C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 22:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AA910E44D;
	Mon,  6 Nov 2023 22:15:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687C410E44D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 22:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699308939; x=1730844939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BKoiln8xuX1r0dgNrVnbRzYtIQgh9R9S5cHqdgzSQwU=;
 b=LTlIhyFmtosVKKe4UPkIRAqjz6dne6rISfxyKl9DzOBYJM+R8b0RYe+t
 Gim/89/G4DioBFqhEIrdGCcT52LfDDIbSQhso31hU4sH4FTPfU5YSGkbE
 T8XoTYH+BSMOANsFk6DFZ5HhqgjOFSbWZaZ6QiIVC/Eq8crm0v9VDM0w0
 TeGAHMVfGmAUMP+c0xDKKeV2ZkrDPsuV0TmvXQCSr44rc+4fqzk5R24BJ
 B6CdRCs7LzXy2FIMsmoLulntat6YsmbZ46YR5C3ASeQFh0qXMpN7ogmaw
 DgpZmeewtPFH0G0iiVvQnCu/6i3DxWnGc1o/0BJpm39mZjkncLQ+xlASB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393272732"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="393272732"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 14:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="828362942"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="828362942"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 14:15:38 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 14:15:38 -0800
Message-Id: <20231106221538.14505-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix unbind of unaccessed VMA (fault mode)
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

In fault mode, page table binding is deferred until fault handler.
Thus vma->tile_present will be unset unless the VMA is accessed by GPU.

During a later unbind, the logic doesn't account for the fact that local
fence variable will be NULL in this case, leading to pass NULL into
dma_fence_add_callback() and causing few WARN_ONs to print to console.
The fix is already present in the code, just hoist the fence variable
computation to be done earlier.

Resolves warnings seen with igt@xe_exec_fault_mode@once-invalid-fault

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d26c90f0d702..d45f4f1d490f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1738,14 +1738,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		}
 	}
 
+	fence = cf ? &cf->base : !fence ?
+		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
 	if (last_op) {
 		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
-					     cf ? &cf->base : fence);
+			xe_sync_entry_signal(&syncs[i], NULL, fence);
 	}
 
-	return cf ? &cf->base : !fence ?
-		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
+	return fence;
 
 err_fences:
 	if (fences) {
-- 
2.38.0

