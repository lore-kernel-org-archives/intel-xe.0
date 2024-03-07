Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643E6C54E49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 06:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA6010F0CC;
	Thu,  7 Mar 2024 06:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcDftmIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97FB10F0CC
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709793557; x=1741329557;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DjvJLaG6SNM7tAXCzNOENOG2+yuCm9G8QZWg4/0xYyE=;
 b=DcDftmIgfhzUF2yHWWOJ8yMRf0UwhyPs0T0/p3heuw4o+qROOPzmeAO6
 LbsFdZgMgTcUdXlqzCcoGikziva70+EuWPi7H81FWl1mBa7zxU8UN509Z
 PeEqy/L4hKhZuiDcnxwgwReApX+K/E8t8d+i8txmTRhbCqqMvcaHr210u
 FW7lNeNJCiK9pDjhuFi3D24kp0wDGLj+LhnPeQU3QbrRIK9eHkkgo4Z5f
 vcUBy8jkyZVx3gJUeQEgG5RRWM3ezFGAZIi7WFxdxcq7qkeVk9M5MXsDV
 Ney8St7jv1fSjuO4E6iHgk2OzlyVJeMMywPloXSZ2bEn0xT9k/F429xXX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4304387"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4304387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 22:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9903208"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 06 Mar 2024 22:39:15 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/vm : Remove duplicate assignment of XE_VM_FLAG_LR_MODE
 flag.
Date: Thu,  7 Mar 2024 12:22:13 +0530
Message-Id: <20240307065213.1968688-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

vm->flags are already assigned with passed flags. Remove the redundant
assignment.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..b2d2852341c0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1369,9 +1369,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (flags & XE_VM_FLAG_LR_MODE) {
+	if (vm->flags & XE_VM_FLAG_LR_MODE) {
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
-		vm->flags |= XE_VM_FLAG_LR_MODE;
 		vm->batch_invalidate_tlb = false;
 	}
 
-- 
2.25.1

