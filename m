Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45844C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 04:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27DF10E66D;
	Fri,  1 Mar 2024 04:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U312a/TO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523DC10E66D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 04:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709266225; x=1740802225;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hMndsG5wSbS83niiTzPJ6yhu6rdGZGuasIZVbj/Y5cM=;
 b=U312a/TO8lYYjG+1JeZjwrZnEqbG3p94HG/zy4CbiDkdAVVfjXsuHABr
 GRd1sx2du1K6wQ10e9MfdMCE/YreYJUH/RlSYE72V3qLKKDh85eUU1p5g
 mRGOWQ8yj2sWLrRlIgVJjhjZlsGQWIBX9dd6O9NSdYZI31MqehvHReVLZ
 zWeMgxrIWNThBSWlMdyNTU1g0r18PE7Qs107HuLjs9ZgI6rxeNDJ079Rm
 dblMcUD33f69oYfiohvWz/QVYOxNlZZH16PuddZVt5Alt0cnDfZXM6gam
 CYuoUDvdcLjzGWGgaroi/8Dl8meygzbdeyHaM494HfDsNxsiOd57dPjzi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6738722"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="6738722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 20:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8484318"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 20:10:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix ref counting leak on page fault
Date: Thu, 29 Feb 2024 20:10:36 -0800
Message-Id: <20240301041036.238471-1-matthew.brost@intel.com>
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

If a page fault occurs on VM not in fault a ref can be leaked. Fix this.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c26e4fcca01e..73c535193a98 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -146,10 +146,12 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	/* ASID to VM */
 	mutex_lock(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
-	if (vm)
+	if (vm && xe_vm_in_fault_mode(vm))
 		xe_vm_get(vm);
+	else
+		vm = NULL;
 	mutex_unlock(&xe->usm.lock);
-	if (!vm || !xe_vm_in_fault_mode(vm))
+	if (!vm)
 		return -EINVAL;
 
 retry_userptr:
-- 
2.34.1

