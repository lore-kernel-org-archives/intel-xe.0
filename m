Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C10C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 21:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2946C10EA89;
	Fri, 15 Dec 2023 21:12:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B3E10EA89
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702674742; x=1734210742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+S+yee00zDY78i9NehNKE0RNhNxvzVkBRo5okMNGlxs=;
 b=jJKnlXXBSHVtGNpMT9dqZOIM0j0IrMeRG52uDEiIvPdFdMVxVUUnyahI
 cBI+ouEo5ZhA8cuVZheqE+kpRWZrLdkT31tzmkklKKspKWD4LZTb1dkF8
 5TFR4q74Gq+mT7nZWfgZrCkOLGMeX6Sn1ZYGm++SEiTA7V2wQ6mEhUHkq
 fxqHdPaiIQJ2co7bdncBn8aYNrl8emUWRMzAXWVZmxuUZe22JhKT4/a+0
 LAOOvR9p63wzAoMGoBBgl+OOkQiAhuuyYWkGq935W3KQubOv5PLe4XQnX
 LIVpnoaxQb0TUKDggMewS99Gvvl9MaZdcufrwTEANVLLvDxIhii9WB/xr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="8751896"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8751896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="898265401"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="898265401"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 13:12:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Fix UBSAN splat in add_preempt_fences()
Date: Fri, 15 Dec 2023 13:12:45 -0800
Message-Id: <20231215211245.718686-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

add_preempt_fences() calls dma_resv_reserve_fences() with num_fences ==
0 resulting in the below UBSAN splat. Short circuit add_preempt_fences()
if num_fences == 0.

[   58.652241] ================================================================================
[   58.660736] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
[   58.667281] shift exponent 64 is too large for 64-bit type 'long unsigned int'
[   58.674539] CPU: 2 PID: 1170 Comm: xe_gpgpu_fill Not tainted 6.6.0-rc3-guc+ #630
[   58.674545] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
[   58.674547] Call Trace:
[   58.674548]  <TASK>
[   58.674550]  dump_stack_lvl+0x92/0xb0
[   58.674555]  __ubsan_handle_shift_out_of_bounds+0x15a/0x300
[   58.674559]  ? rcu_is_watching+0x12/0x60
[   58.674564]  ? software_resume+0x141/0x210
[   58.674575]  ? new_vma+0x44b/0x600 [xe]
[   58.674606]  dma_resv_reserve_fences.cold+0x40/0x66
[   58.674612]  new_vma+0x4b3/0x600 [xe]
[   58.674638]  xe_vm_bind_ioctl+0xffd/0x1e00 [xe]
[   58.674663]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[   58.674680]  drm_ioctl_kernel+0xc1/0x170
[   58.674686]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[   58.674703]  drm_ioctl+0x247/0x4c0
[   58.674709]  ? find_held_lock+0x2b/0x80
[   58.674716]  __x64_sys_ioctl+0x8c/0xb0
[   58.674720]  do_syscall_64+0x3c/0x90
[   58.674723]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[   58.674727] RIP: 0033:0x7fce4bd1aaff
[   58.674730] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[   58.674731] RSP: 002b:00007ffc57434050 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   58.674734] RAX: ffffffffffffffda RBX: 00007ffc574340e0 RCX: 00007fce4bd1aaff
[   58.674736] RDX: 00007ffc574340e0 RSI: 0000000040886445 RDI: 0000000000000003
[   58.674737] RBP: 0000000040886445 R08: 0000000000000002 R09: 00007ffc574341b0
[   58.674739] R10: 000055de43eb3780 R11: 0000000000000246 R12: 00007ffc574340e0
[   58.674740] R13: 0000000000000003 R14: 00007ffc574341b0 R15: 0000000000000001
[   58.674747]  </TASK>
[   58.674748] ================================================================================

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 322c1eccecca..6406370b2625 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -283,6 +283,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	if (err)
 		return err;
 
+	if (!vm->preempt.num_exec_queues)
+		goto out_unlock;
+
 	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
 	if (err)
 		goto out_unlock;
-- 
2.34.1

