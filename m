Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FDC3ABA3
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 04:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832ED10E099;
	Fri,  2 May 2025 04:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blLJ3Rwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EC610E099
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 04:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746159114; x=1777695114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A5KZqebENMC2/v3cpYed3iric9JGAYBBYYHfe/fSDEM=;
 b=blLJ3RwbopFCSATWyNiIse8RxhCwHttN6UZIK4TGnFIeAKXLduhBXaO7
 OKMrv9jl3FmXoF/qPO4o7G5+UugOkq1bJ/u4Zlk2IouM9YiofRMIB5B4n
 ZsbWYY3PMGI4p2OUnZYllpWJ2Lc/XFL0nUrdNXAygO1JbW99R5tiMLyoJ
 0xLxwaAoattoR2+eIS7H00ppmfFZoIPQAPv5s0oApOzyDzv7KJe52YSZS
 hFsKORXaCweFnpI6DGsm1WqzKgHt86ghqKk5N2mDRvWXd0JDMZUvfTanD
 ml/nAe0Cc1M1GZZQEGhndbBrmtQI/sTT545Gw7Vu1TRp1EuAkKRA3dIAR g==;
X-CSE-ConnectionGUID: T0kliDSrQUenFyWzOuLV+A==
X-CSE-MsgGUID: sYgI6YqTQl6V9N8t4QNK9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58049070"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="58049070"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 21:11:51 -0700
X-CSE-ConnectionGUID: X09KXXRqQJGU5wF0s2edrQ==
X-CSE-MsgGUID: ZGHH3Z8ySV2G9l1aTznF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; d="scan'208";a="134497154"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa007.fm.intel.com with ESMTP; 01 May 2025 21:11:49 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Call svm worker only when svm is enabled
Date: Fri,  2 May 2025 04:07:57 +0000
Message-Id: <20250502040757.1722973-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

It is in order to avoid below warning:
"
[  453.132028] ------------[ cut here ]------------
[  453.132527] WARNING: CPU: 9 PID: 4491 at kernel/workqueue.c:4205 __flush_work+0x379/0x3a0
[  453.133355] Modules linked in: xe drm_ttm_helper ttm gpu_sched drm_buddy drm_suballoc_helper drm_gpuvm drm_exec
[  453.134352] CPU: 9 UID: 0 PID: 4491 Comm: xe_exec_mix_mod Tainted: G     U  W           6.15.0-rc3+ #7 PREEMPT(full)
[  453.135405] Tainted: [U]=USER, [W]=WARN
...
[  453.136921] RIP: 0010:__flush_work+0x379/0x3a0
[  453.137417] Code: 8b 45 00 48 8b 55 08 89 c7 48 c1 e8 04 83 e7 08 83 e0 0f 83 cf 02 89 c6 48 0f ba 6d 00 03 e9 d5 fe ff ff 0f 0b e9 db fd ff ff <0f> 0b 45 31 e4 e9 d1 fd ff ff 0f 0b e9 03 ff ff ff 0f 0b e9 d6 fe
[  453.139250] RSP: 0018:ffffc90000c67b18 EFLAGS: 00010246
[  453.139782] RAX: 0000000000000000 RBX: ffff888108a24000 RCX: 0000000000002000
[  453.140521] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881016d61c8
[  453.141253] RBP: ffff8881016d61c8 R08: 0000000000000000 R09: 0000000000000000
[  453.141985] R10: 0000000000000000 R11: 0000000008a24000 R12: 0000000000000001
[  453.142709] R13: 0000000000000002 R14: 0000000000000000 R15: ffff888107db8c00
[  453.143450] FS:  00007f44853d4c80(0000) GS:ffff8882f469b000(0000) knlGS:0000000000000000
[  453.144276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  453.144853] CR2: 00007f4487629228 CR3: 00000001016aa000 CR4: 00000000000406f0
[  453.145594] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  453.146320] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  453.147061] Call Trace:
[  453.147336]  <TASK>
[  453.147579]  ? tick_nohz_tick_stopped+0xd/0x30
[  453.148067]  ? xas_load+0x9/0xb0
[  453.148435]  ? xa_load+0x6f/0xb0
[  453.148781]  __xe_vm_bind_ioctl+0xbd5/0x1500 [xe]
[  453.149338]  ? dev_printk_emit+0x48/0x70
[  453.149762]  ? _dev_printk+0x57/0x80
[  453.150148]  ? drm_ioctl+0x17c/0x440
[  453.150544]  ? __drm_dev_vprintk+0x36/0x90
[  453.150983]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[  453.151575]  ? drm_ioctl_kernel+0x9f/0xf0
[  453.151998]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[  453.152560]  drm_ioctl_kernel+0x9f/0xf0
[  453.152968]  drm_ioctl+0x20f/0x440
[  453.153332]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
[  453.153893]  ? ioctl_has_perm.constprop.0.isra.0+0xae/0x100
[  453.154489]  ? memory_bm_test_bit+0x5/0x60
[  453.154935]  xe_drm_ioctl+0x47/0x70 [xe]
[  453.155419]  __x64_sys_ioctl+0x8d/0xc0
[  453.155824]  do_syscall_64+0x47/0x110
[  453.156228]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
"

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2a9d58a4471c..9d2a15575122 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3418,9 +3418,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 	/* Ensure all UNMAPs visible */
 	if (xe_vm_in_fault_mode(vm))
 		flush_work(&vm->svm.garbage_collector.work);
+#endif
 
 	err = down_write_killable(&vm->lock);
 	if (err)
-- 
2.25.1

