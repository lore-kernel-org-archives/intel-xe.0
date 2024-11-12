Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833BCD597A7
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1E10E66F;
	Tue, 12 Nov 2024 21:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l46r88W2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16E810E66F
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731447543; x=1762983543;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iwGvDQ0EjcZ2EBDchc/dTr/K4/+yNR3VJHivPTY2KSI=;
 b=l46r88W2j86BkYhfPY/VewWKXABoDGjue3dzeQD52foVgvMvcBPL7xfY
 G4qDEfdEyzCFB4EnBaGefmhZFTZE246ZCtgzdkWNmpEZp3/VBTQi9V/K9
 JNlOtyoERjX13PBlxKNnjrKNer8e7fK4Kb1KztsUj7A2DNHrqHuRv+Oc4
 dMQHp73Nqa0kD1GvO3/W5EBQAWo66sUjBnwSSUBx+5+oppEGEMfRJiGZl
 +7I+2x0w4UxyJRW+0X86fL9ryuUXn8OxkXko++Kef4Jk4qKHXh4zU6Hnk
 F8qEUAHVJ+0Ky3QGZNLbHd0GYykyd3H4LZI0SdQPIFw1ze7i0mm6vNueR Q==;
X-CSE-ConnectionGUID: TQRbT1UtS+CGhzW1MnrXTg==
X-CSE-MsgGUID: vUTHCWZbRwq4ml4u2r87QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31467454"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31467454"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:39:03 -0800
X-CSE-ConnectionGUID: JR45zhg4QhGES61wfzuh5w==
X-CSE-MsgGUID: SDcM7zY/Rt20BcCPg08/kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87561676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:39:03 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove redundant rebind from preempt rebind worker
Date: Tue, 12 Nov 2024 13:39:31 -0800
Message-Id: <20241112213931.1341201-1-matthew.brost@intel.com>
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

