Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270BDC48260
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 13:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E847C10E481;
	Thu,  8 Feb 2024 13:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fr/Gk3ue";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 08 Feb 2024 13:28:34 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F1E10E481
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707398915; x=1738934915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cy/TQmvZnCYQkk4SFBZjS1ZMfUSaPbxZe0LtKZNRlDc=;
 b=fr/Gk3ueiya7nnprVrpRCMWt4Krc93TO8AuOZEItWfoWlzFynVjF+NYL
 7IPT8wBqKx/11zF71oDPzZv+4BdBkjcQCtgaHUNTp4Ozmay4RmkgsjIkY
 V4Hm8XhswllZ78aw5ctA2Q8cvKl3HW6urNzQlWWiJRUqGkJf4kNtMbhsF
 kp/2DlU0EmJSUyNbZvXxFNZQsDLy6eycGZBUlnloNzf/LMMIkzhVmP3WQ
 rxSxYIHFDJ7BeLZvv+m8lJFxvY1qLRwrEzOJWVeqw+dldsSa3KAJFKIWw
 uOymiWruUv4dHLxoKdIJrQC/f34TUhYdvt/YpfXwMn1ecCfWzEnn6q54Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1083327"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1083327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:21:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="6279482"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:21:25 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/vm: Avoid reserving zero fences
Date: Thu,  8 Feb 2024 14:21:15 +0100
Message-ID: <20240208132115.3132-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The function xe_vm_prepare_vma was blindly accepting zero as the
number of fences and forwarded that to drm_exec_prepare_obj.

However, that leads to an out-of-bounds shift in the
dma_resv_reserve_fences() and while one could argue that the
dma_resv code should be robust against that, avoid attempting
to reserve zero fences.

Relevant stack trace:

[773.183188] ------------[ cut here ]------------
[773.183199] UBSAN: shift-out-of-bounds in ../include/linux/log2.h:57:13
[773.183241] shift exponent 64 is too large for 64-bit type 'long unsigned int'
[773.183254] CPU: 2 PID: 1816 Comm: xe_evict Tainted: G     U             6.8.0-rc3-xe #1
[773.183256] Hardware name: ASUS System Product Name/PRIME Z690-P D4, BIOS 2014 10/14/2022
[773.183257] Call Trace:
[773.183258]  <TASK>
[773.183260]  dump_stack_lvl+0xaf/0xd0
[773.183266]  dump_stack+0x10/0x20
[773.183283]  ubsan_epilogue+0x9/0x40
[773.183286]  __ubsan_handle_shift_out_of_bounds+0x10f/0x170
[773.183293]  dma_resv_reserve_fences.cold+0x2b/0x48
[773.183295]  ? ww_mutex_lock+0x3c/0x110
[773.183301]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
[773.183313]  xe_vm_prepare_vma+0x33/0x70 [xe]
[773.183375]  xe_vma_destroy_unlocked+0x55/0xa0 [xe]
[773.183427]  xe_vm_close_and_put+0x526/0x940 [xe]

Fixes: 2714d5093620 ("drm/xe: Convert pagefaulting code to use drm_exec")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9d2e8088d07e..836a6e849cda 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -995,9 +995,16 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 	int err;
 
 	XE_WARN_ON(!vm);
-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
-	if (!err && bo && !bo->vm)
-		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
+	if (num_shared)
+		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
+	else
+		err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
+	if (!err && bo && !bo->vm) {
+		if (num_shared)
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
+		else
+			err = drm_exec_lock_obj(exec, &bo->ttm.base);
+	}
 
 	return err;
 }
-- 
2.43.0

