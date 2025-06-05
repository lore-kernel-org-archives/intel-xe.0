Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D30BC678DA
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3584310E96C;
	Thu,  5 Jun 2025 15:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jE42YwYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3436F10E933
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1ZIIWQIdkOlXPqKEG8VXuIohZDiO0uCd8z51JV+gOs=;
 b=jE42YwYOVKC9idNrCyQX2/CSwzkJH/LfZyTyKuI1wnijx+vexZSDeSEl
 hpwJXQb/k8iQZbcxfF493DPMlMXuPt5Rf3iKQXRCHa9iyicujnPUHi9H0
 r0ENhDAblu8m3K5Q0phQG6oGLsrSJUBS4U2UHVSYrfT24e0AwuCAVCU4g
 9XJ7zClG4a31uJ6eERKp+vBO/FK83O1y2MQWVqz4BvffO2tdxFXsrLWA7
 /vUfDrFutUmCr0UeFUmCk8KxNk00GezbSL8RZ3QZ2j46bVoyI8MLC4/fT
 /29JckZA/efL8xIMw/tWYyNMjT9BcoMFwnZ1gdmYaKDiZ3vpMyJWGeHhT A==;
X-CSE-ConnectionGUID: kAwW5CBKT9aB9UZy4woKyA==
X-CSE-MsgGUID: Yvedw3AxRCaN42FjrtW7vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529495"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: soKPKOf/Qlmd5u6hW1v0/w==
X-CSE-MsgGUID: G9STJBLxSNqJ03lQZnhzYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502825"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 12/15] drm/xe: Enable ULLS migration jobs when opening LR VM
Date: Thu,  5 Jun 2025 08:32:20 -0700
Message-Id: <20250605153223.2789122-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Call xe_migration_lr_vm_get upon opening LR VM and
xe_migration_lr_vm_put upon close to enter / exit ULLS on the migration
exec queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0285938a4bb2..8373e776b504 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1807,6 +1807,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
+	if (flags & XE_VM_FLAG_LR_MODE) {
+		for_each_tile(tile, xe, id)
+			xe_migrate_lr_vm_get(tile->migrate);
+	}
+
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -1964,6 +1969,11 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	up_write(&vm->lock);
 
+	if (vm->flags & XE_VM_FLAG_LR_MODE) {
+		for_each_tile(tile, xe, id)
+			xe_migrate_lr_vm_put(tile->migrate);
+	}
+
 	down_write(&xe->usm.lock);
 	if (vm->usm.asid) {
 		void *lookup;
-- 
2.34.1

