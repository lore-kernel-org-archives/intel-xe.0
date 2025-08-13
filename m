Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CB7C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0EB10E6DB;
	Wed, 13 Aug 2025 10:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W6h92pOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714E210E6D9
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755079992; x=1786615992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BisMnL3GXFcUwmvsevtHWMNS+TnxAoJy+FmRuavYYEM=;
 b=W6h92pOmomIORM/SQmXZa6++/GBfeZd4d9i82tZiJ7TOGT9T9FPfwg8i
 984zyho4U0h7N3q24+pjcUyAHnqk0eGPr/t94Y5XeHYn2arcn1zi95Bct
 W928cxHpJbexoqHjpquwptwyG6RupYmf8soo93KSE+LhrAdQEifktwM49
 LZbOW3FZgGgdHDcVKlB9wtY+mPR2H5KDNmYa44OV8tQ0br6ngJkAqj1DA
 bpT1SehOtUufMjZOhnLdF7DlJJp+TCYdXj7v7P9bRwcLqtL1tPTMcVYtl
 c3o7RgyXDBvus6zQjabqYblJLlQqv0Jjb8wbEFFwh/PYWCTNf8p5SvX53 g==;
X-CSE-ConnectionGUID: 46ZyGmEASC2FOJX1gzU8rg==
X-CSE-MsgGUID: uWxQpkRHT9KjudW+nkSo6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68745131"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="68745131"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:54 -0700
X-CSE-ConnectionGUID: ATjK18kUS4aolo/bpdbkbg==
X-CSE-MsgGUID: Ymsw8CVaQ6q3NY09O0mB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166061908"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:12:53 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/2] drm/xe: Fix vm_bind_ioctl double free bug
Date: Wed, 13 Aug 2025 12:12:30 +0200
Message-ID: <20250813101231.196632-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250813101231.196632-1-christoph.manszewski@intel.com>
References: <20250813101231.196632-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

If the argument check during an array bind fails, the bind_ops are freed
twice as seen in [1]. Fix this by setting bind_ops to NULL after freeing.

[1]:
==================================================================
BUG: KASAN: double-free in xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
Free of addr ffff88813bb9b800 by task xe_vm/14198

CPU: 5 UID: 0 PID: 14198 Comm: xe_vm Not tainted 6.16.0-xe-eudebug-cmanszew+ #520 PREEMPT(full)
Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
Call Trace:
 <TASK>
 dump_stack_lvl+0x82/0xd0
 print_report+0xcb/0x610
 ? __virt_addr_valid+0x19a/0x300
 ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
 kasan_report_invalid_free+0xc8/0xf0
 ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
 ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
 check_slab_allocation+0x102/0x130
 kfree+0x10d/0x440
 ? should_fail_ex+0x57/0x2f0
 ? xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
 xe_vm_bind_ioctl+0x1b2/0x21f0 [xe]
 ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
 ? __lock_acquire+0xab9/0x27f0
 ? lock_acquire+0x165/0x300
 ? drm_dev_enter+0x53/0xe0 [drm]
 ? find_held_lock+0x2b/0x80
 ? drm_dev_exit+0x30/0x50 [drm]
 ? drm_ioctl_kernel+0x128/0x1c0 [drm]
 drm_ioctl_kernel+0x128/0x1c0 [drm]
 ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
 ? find_held_lock+0x2b/0x80
 ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
 ? should_fail_ex+0x57/0x2f0
 ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
 drm_ioctl+0x352/0x620 [drm]
 ? __pfx_drm_ioctl+0x10/0x10 [drm]
 ? __pfx_rpm_resume+0x10/0x10
 ? do_raw_spin_lock+0x11a/0x1b0
 ? find_held_lock+0x2b/0x80
 ? __pm_runtime_resume+0x61/0xc0
 ? rcu_is_watching+0x20/0x50
 ? trace_irq_enable.constprop.0+0xac/0xe0
 xe_drm_ioctl+0x91/0xc0 [xe]
 __x64_sys_ioctl+0xb2/0x100
 ? rcu_is_watching+0x20/0x50
 do_syscall_64+0x68/0x2e0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7fa9acb24ded
Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
RSP: 002b:00007fff189e1370 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: ffffffffffffff68 RCX: 00007fa9acb24ded
RDX: 00007fff189e19f0 RSI: 0000000040886445 RDI: 0000000000000003
RBP: 00007fff189e13c0 R08: 0000000000000000 R09: 00005561d3fb47d0
R10: 00007fa9ace29be0 R11: 0000000000000246 R12: 00007fff189e19f0
R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000000003
 </TASK>

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d40d2d43c041..6fd28b205453 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3442,6 +3442,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 free_bind_ops:
 	if (args->num_binds > 1)
 		kvfree(*bind_ops);
+	*bind_ops = NULL;
 	return err;
 }
 
@@ -3548,7 +3549,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
-	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops;
 	struct dma_fence *fence;
 	int err;
-- 
2.47.1

