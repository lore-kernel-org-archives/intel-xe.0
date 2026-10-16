Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED2CCA48B
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF43811261A;
	Fri, 16 Oct 2026 07:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDA911260C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135132; x=1823671132;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hT0n6CYiqOM16/uvm98RcPbdYg0OV6cFMH8v71NXZxY=;
 b=MKXd/BWWoh0qx5hm0Oyzem97W/QpaKG0pFM26woqbPZ/0hWUz8jFHe31
 U/0UEWlb5LtNBoseavtdNxlePBH4ONJGyOO9WNiwmHL4JgAFdijs43W3I
 SF1gKKeP0dlowJAFH6/AfXT4MNKzQl0SmWZsWIihjqpXaxL717EIm5Z0P
 PPJNj7TeD+EjNtNlF00TVe78of63rCBleHotNaZyMQKYEls3JvPYqdwbN
 usq2LMBgt6sJkBoIwMH7QC4A7US8EshP9vdBUhMUABesEjIfty2XzPs3l
 4ODNR317YHNT+iHNhi/u509cQq1E7ka4Zf9Sfu7bfVm5TjkI4ezk1lN+/ w==;
X-CSE-ConnectionGUID: yOf4DptzTe+WoU1Pia5KOg==
X-CSE-MsgGUID: wuDyUkWLR8++QQx+Rp2snw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813642"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:47 -0700
X-CSE-ConnectionGUID: ho/5d/D7Szya9DOkMdhL2A==
X-CSE-MsgGUID: o8/oJYrvTD2uahOeeWbhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787254"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:46 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 06/18] drm/xe: Drop queued page faults when device I/O is
 blocked
Date: Fri, 16 Oct 2026 12:48:16 +0530
Message-ID: <20261016071832.222574-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW

Page-fault work may still be queued when PCI error recovery starts or
the device becomes permanently wedged. Servicing these faults can migrate
memory or update page tables after device I/O has been blocked.

Check the device state while popping queued faults. Release queued
entries instead of passing them to a worker when device I/O is blocked.

Hold the device I/O gate across fault servicing so wedge isolation waits
for faults already in progress. Faults that start after the block are
rejected at the gate.

v2:
- Move the blocked-device check into the queue pop path. (Matt)
- Drop queued faults while holding the queue lock. (Matt)
- Remove weak checks around fault servicing. (Matt)

v3:
- Hold the common device I/O gate across fault servicing. (Thomas)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805e..c9458688684b 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -270,6 +270,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
+	int io_idx;
 	int err;
 	bool atomic;
 	u32 asid = FIELD_GET(XE_PAGEFAULT_ASID_MASK, pf->consumer.id);
@@ -278,13 +279,17 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
 		return -EFAULT;
 
+	err = xe_device_io_get(xe, &io_idx);
+	if (err)
+		return err;
+
 	vm = xe_pagefault_asid_to_vm(pf, asid);
 	if (IS_ERR(vm)) {
 		err = PTR_ERR(vm);
 		trace_xe_pagefault_fail(xe, NULL, NULL, asid,
 					xe_pagefault_addr(pf),
 					xe_pagefault_get_error(pf), err);
-		return err;
+		goto out_io;
 	}
 
 	xe_migrate_ulls_enter(gt_to_tile(gt)->migrate);
@@ -328,6 +333,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	up_read(&vm->lock);
 	xe_vm_put(vm);
 
+out_io:
+	xe_device_io_put(io_idx);
 	return err;
 }
 
@@ -517,6 +524,12 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 		    XE_PAGEFAULT_ALLOC_STATE_QUEUED)
 			continue;
 
+		if (xe_device_io_blocked(xe)) {
+			lpf->consumer.alloc_state =
+				XE_PAGEFAULT_ALLOC_STATE_FREE;
+			continue;
+		}
+
 		if (xe_pagefault_try_chain(pf_queue, lpf))
 			continue;
 
-- 
2.43.0

