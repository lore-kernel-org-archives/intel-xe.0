Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7BC001B0
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342BA10E49E;
	Wed, 26 Jul 2023 16:46:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1B10E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690389987; x=1721925987;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+pCGr/wLx0co4vTHPTKRyZlsNK88J0LGVTCu3/8/dO8=;
 b=JOpnTKhGCjKrKCOhvbGjf+iIvMTgl5ZYU56DA43eohIlBGczx6S6ceh/
 +5rGYsad8qzWc8Wd578Jk5kDVBgKpRiwZE30kmITw8fqhkPYXCl6qGeWR
 CPe5YURaG80K9XgiDf10fMl4vgmEAqwBeIONPVGXkXWVcuUivVq8TCGaU
 xrk3sqbJrYshrj61HkJHF8iCg4cz86BlFsq8UZh25vMTBXGmJsm/dILXi
 JjFsonaZyP3KJUy4ypAGlUvdX/U1y73XbcSuup5+qkImhVwAioUCtDLTK
 568tWBWu/ly5JDWD8i4yf/lLzgsPp0/2OwzPh2+YWBTNwx7bngJSoxeUm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="454443098"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="454443098"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="761736388"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="761736388"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:46:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 09:46:24 -0700
Message-Id: <20230726164624.358822-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Signal out-syncs on VM binds if no
 operations
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

If no operations are generated for VM binds the out-syncs must still be
signaled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6429d6e5113d..ddb1b4af6458 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3374,6 +3374,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
+	for (i = 0; err == -ENODATA && i < num_syncs; i++)
+		xe_sync_entry_signal(&syncs[i], NULL, dma_fence_get_stub());
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
-- 
2.34.1

