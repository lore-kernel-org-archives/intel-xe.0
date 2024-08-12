Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BCFC531DC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C5510E073;
	Mon, 12 Aug 2024 02:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pwow76Xb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CFB10E052
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3bwKl/fGKJd1E5Zr8c6FNA/bguBX3Q0IXtte1vqeX8=;
 b=Pwow76XbHtXIxWFxUbdtsDYPiAWVZS/dsNQfCjZBPOp/pidheP7rhNxB
 QauaynqKiIY7QE1mk+1nnVgaHpC5BGefIjYlhz/dUk0PcAIw50jsIFINd
 JHDdaV3r6R17C7CujGQUxYxk4Y0Hp6CI20E9Wp/dnhq7D+FHqdD4XSsnx
 mNgGmjP+0YCZ/CVbAPXCLNksK8A8ZY0P5uuuA7yUvmS9XkoDCj6m0bvF2
 3BHNRqfSb9Kv5HorAy3oBllSh9i+c8ZiYib6wHagqE1gcqmkbCioUOC0I
 gVcTvmWlKtPEX4OffpjvdF58XWdRIW3NKFEf7nKzKOedNRHWuY6OBXfiL A==;
X-CSE-ConnectionGUID: ZBG2sM1MRsaRYZ9cy6FgbA==
X-CSE-MsgGUID: 0MwHfE7MT3KT5TsARMM1SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099524"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099524"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:29 -0700
X-CSE-ConnectionGUID: lp7khpbSTE2LxwZCkz+CTg==
X-CSE-MsgGUID: vM7OsIJNQnaZi7aeaJ2pWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256306"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 8/8] drm/xe: Enable ULLS migration jobs when opening LR VM
Date: Sun, 11 Aug 2024 19:47:17 -0700
Message-Id: <20240812024717.3584636-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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
xe_migration_lr_vm_put upon close.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dab2a3b2e17f..a1b19ec796a1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1508,6 +1508,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
+	if (flags & XE_VM_FLAG_LR_MODE) {
+		for_each_tile(tile, xe, id)
+			xe_migrate_lr_vm_get(tile->migrate);
+	}
+
 	mutex_lock(&xe->usm.lock);
 	if (flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode++;
@@ -1627,6 +1632,11 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	up_write(&vm->lock);
 
+	if (vm->flags & XE_VM_FLAG_LR_MODE) {
+		for_each_tile(tile, xe, id)
+			xe_migrate_lr_vm_put(tile->migrate);
+	}
+
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
-- 
2.34.1

