Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD70D597A9
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7AB10E66F;
	Tue, 12 Nov 2024 21:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZ0LqNtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A77F10E66F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731447635; x=1762983635;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iwGvDQ0EjcZ2EBDchc/dTr/K4/+yNR3VJHivPTY2KSI=;
 b=iZ0LqNtNGnvhjF63c1msQJkhAmNHWBWWuOGi8ahbvXqyVA6TxghGpwrG
 YxGzhOyZAYvJALhT+H69UzSgGyOyBfFvDy2xlADafwHTU13Vwdh2XFTt8
 eXul2zG5qMVfrETUfdQ/2sd3aOwJpERXGaw1MusMlUqEfrp6cL9/+hEvZ
 SNLrekPrKsUrdikb23jQZDB/jkJVGo8uN0Ehmrf3dgBwqAjPPlz3T8oVU
 o0hViw52rS8o9Dn2f2i7r9xhkSiQv8d+IX/h8bcGpCLGS2Xd5EDIS7fBs
 7erHPHUR7HptgXBKXiANALtKEk10L0S9Bm558yYVhM/EJ+9MQ8gLdLfp5 w==;
X-CSE-ConnectionGUID: NVY7KWpbQsScLvgN363vSw==
X-CSE-MsgGUID: tHT7AtamTea3vt7mnrBTnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42415116"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42415116"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:40:35 -0800
X-CSE-ConnectionGUID: xIKPJnY0RnW0v3iWK7nnaA==
X-CSE-MsgGUID: VvQuxAjQRMef1/D+jLZJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="118486399"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:40:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
Date: Tue, 12 Nov 2024 13:41:04 -0800
Message-Id: <20241112214104.1341240-1-matthew.brost@intel.com>
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

We issue a rebind in xe_preempt_work_begin so no need to call
xe_vm_rebind again in the preempt rebind worker.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 624133fae5f5..756c72cd6048 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -525,10 +525,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	err = xe_vm_rebind(vm, true);
-	if (err)
-		goto out_unlock;
-
 	/* Wait on rebinds and munmap style VM unbinds */
 	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
-- 
2.34.1

