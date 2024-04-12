Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C75C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 11:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587D810E135;
	Fri, 12 Apr 2024 11:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eys311JE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22110E651
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712921569; x=1744457569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hLwpJPb5tv1oQGYOIy3yt+eib0eFMTwnMVTGMVAEHvo=;
 b=Eys311JEfvQYA6/dUNil/uvrEep/oh0P6/UuG21N/xDZvTZDo8Zrfm5S
 w4/GLHR4kPU9Z4ikwFa0GREwWm4y5LyiCBZZFJSU7ACMDSs+WElytx1AN
 5/jK4rqmPhTHZZ67eFlRqAgPXT0vHFa2syYafy2tys2UnxQOzbbR+fabb
 1DLPUgwhhndew/aKO2GSXDANXnOC3V5l9P6MNFhPKEl9ieiH4J1Fk0DO+
 6XjluN0s6HiC3AtlZ0O4oiN2BHcG2kAPWtkpvhK+0ddcHH8B2ruzP/Cnx
 MLQKHnG+CsWplBiQkz4rlEsAt5T+QHyCeFvUeUTHb7KsI2967TkavB63E w==;
X-CSE-ConnectionGUID: zDiJCknaTumyCEPNl1zISQ==
X-CSE-MsgGUID: +vr+LzYPQ4yJgcdKtsIOSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11335423"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11335423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:47 -0700
X-CSE-ConnectionGUID: mOLOzkSWRLWwjzIejiTfHQ==
X-CSE-MsgGUID: nR3xZK0GTb6kn+6NDBMGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21272574"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 04:32:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] drm/xe/vm: prevent UAF with asid based lookup
Date: Fri, 12 Apr 2024 12:31:45 +0100
Message-ID: <20240412113144.259426-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

The asid is only erased from the xarray when the vm refcount reaches
zero, however this leads to potential UAF since the xe_vm_get() only
works on a vm with refcount != 0. Since the asid is allocated in the vm
create ioctl, rather erase it when closing the vm, prior to dropping the
potential last ref. This should also work when user closes driver fd
without explicit vm destroy.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1594
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_vm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a196dbe65252..c5c26b3d1b76 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1581,6 +1581,16 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe->usm.num_vm_in_fault_mode--;
 	else if (!(vm->flags & XE_VM_FLAG_MIGRATION))
 		xe->usm.num_vm_in_non_fault_mode--;
+
+	if (vm->usm.asid) {
+		void *lookup;
+
+		xe_assert(xe, xe->info.has_asid);
+		xe_assert(xe, !(vm->flags & XE_VM_FLAG_MIGRATION));
+
+		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
+		xe_assert(xe, lookup == vm);
+	}
 	mutex_unlock(&xe->usm.lock);
 
 	for_each_tile(tile, xe, id)
@@ -1596,24 +1606,15 @@ static void vm_destroy_work_func(struct work_struct *w)
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
 	u8 id;
-	void *lookup;
 
 	/* xe_vm_close_and_put was not called? */
 	xe_assert(xe, !vm->size);
 
 	mutex_destroy(&vm->snap_mutex);
 
-	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
+	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
 
-		if (xe->info.has_asid && vm->usm.asid) {
-			mutex_lock(&xe->usm.lock);
-			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-			xe_assert(xe, lookup == vm);
-			mutex_unlock(&xe->usm.lock);
-		}
-	}
-
 	for_each_tile(tile, xe, id)
 		XE_WARN_ON(vm->pt_root[id]);
 
-- 
2.44.0

