Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B9C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87CD10F123;
	Wed,  9 Sep 2026 12:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWHLIxnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6CE10F110
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957721; x=1820493721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BRnJWnNmIhP6JoQ7en+ddTHm2pYyplHlvrjlvMju66k=;
 b=HWHLIxnlbgqM4rgB2LkoLOweg7J7KQOM9zFT7fdkKpQqyghPwXLmt46n
 4V4mz3/dC+o8DFUbVxDnqeGbU9+HqRBAfmOkKkDXlX1w44Clmo0U8bIak
 Ke2IHiCb//E6QWuisw47/J903NwXIp7/bqAs0sSUM39DV0eMdU8t3/WyE
 D62zaAX9DoBAaWLbZzTugFz0S+zlJXwsuWFl8tYceJ9NTJ+Ww7C0YbvWN
 q7XaPExzbHTq+XJ1lRoo37OPsQgTJRSGyaBkkIW7dJU7WdXvgJABblsTo
 TRQIRKVqIz8DP4WsFZjQp0vSFWAc3xw2NJHfJorX2nEgzlz0wTQA2Ok4V w==;
X-CSE-ConnectionGUID: d6m71ZMBRyWadCt3Itvz3w==
X-CSE-MsgGUID: F85tA/LPRHGi/sqy+6EqRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715509"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715509"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:00 -0700
X-CSE-ConnectionGUID: TRIIhFvLStSGJOTpfBW1FQ==
X-CSE-MsgGUID: UQ+ETSrKQkucSHnffzpvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246580"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:41:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 07/21] drm/xe/pf: Use xe_device_asid_to_vm in
 xe_pagefault_save_to_vm
Date: Wed,  9 Sep 2026 18:15:01 +0530
Message-ID: <20260909124457.1610890-30-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

xe_pagefault_save_to_vm() open-codes the ASID-to-VM lookup that
xe_device_asid_to_vm() already provides. Replace the duplicate
logic with a call to the existing helper.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index f710b5cbb509..f4b0c0e5113a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -529,26 +529,13 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
 static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
 {
 	struct xe_vm *vm;
+	u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
 
-	/*
-	 * Pagefault may be asociated to VM that is not in fault mode.
-	 * Perform asid_to_vm behavior, except if VM is not in fault
-	 * mode, return VM anyways.
-	 */
-	down_read(&xe->usm.lock);
-	vm = xa_load(&xe->usm.asid_to_vm,
-		     FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id));
-	if (vm)
-		xe_vm_get(vm);
-	else
-		vm = ERR_PTR(-EINVAL);
-	up_read(&xe->usm.lock);
-
+	vm = xe_device_asid_to_vm(xe, asid);
 	if (IS_ERR(vm))
 		return;
 
 	xe_vm_add_fault_entry_pf(vm, pf);
-
 	xe_vm_put(vm);
 }
 
-- 
2.43.0

