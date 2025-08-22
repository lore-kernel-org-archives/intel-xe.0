Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C29DCA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 18:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0396F10EB8A;
	Fri, 22 Aug 2025 18:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNg4aJLJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2310EB84
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755887311; x=1787423311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pHQzLmeYLJc7RnYAdEg/Z2qkigtSwBrsFhzI2S0Y2/A=;
 b=kNg4aJLJICPNu+TiaPhLcG5oPQiw7g6brYJPqsf5czvjlTbvWZ9DLgya
 Q/sZHsxIt8sT3oXgpF2aETmCLefMRIdiG6B+3nub49ZpTGC/nVztFQiVk
 yrmNjgyXgTqHb08cF4Hlee/B0NjwuzahzQTa0vJw9jDBghny3bF/y14FS
 UYqRNOvk97w+7vz8JM3Wp5L0mURWRFE2+HpwMpo0LJz5+vR3dLdGNWNGe
 emy7Km/sHklWSdRhBAK2u6h2Woq9IRzJCBrbwQhDQCAJOPrCK8PRsVLDh
 o+qW6iQm/lgtUblyRYjxxFEXETLya+pr8/Sj91oLzQPZ3R3AFWrWDSB/x A==;
X-CSE-ConnectionGUID: bFp2AcvVTv2qDvFN9RYoNA==
X-CSE-MsgGUID: TGCcfDhbR2GDzisfAiB8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75656970"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75656970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 11:28:30 -0700
X-CSE-ConnectionGUID: r2JAo3G3SkSHhwNAxdPFrg==
X-CSE-MsgGUID: UUoLHvkjROiY3aw2op/2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168277921"
Received: from unknown (HELO DUT137ARLU.fm.intel.com) ([10.105.23.75])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 11:28:30 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Move device sysfs init to before GT init
Date: Fri, 22 Aug 2025 18:28:28 +0000
Message-Id: <20250822182828.107965-1-stuart.summers@intel.com>
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

I'm seeing the following splat if running one of the fault
injection tests in a loop for long enough:
[  591.853234] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/lb_fan_control_version'
[  591.853241] CPU: 6 UID: 0 PID: 10800 Comm: xe_fault_inject Kdump: loaded Not tainted 6.17.0-rc2+ #74 PREEMPT(voluntary)
[  591.853245] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.4064.A02.2302091143 02/09/2023
[  591.853246] Call Trace:
[  591.853247]  <TASK>
[  591.853249]  dump_stack_lvl+0xc2/0xf0
[  591.853256]  dump_stack+0x10/0x20
[  591.853258]  sysfs_warn_dup+0xd9/0x120
[  591.853264]  sysfs_add_file_mode_ns+0x296/0x3e0
[  591.853269]  sysfs_create_file_ns+0x12d/0x1e0
[  591.853273]  ? __pfx_sysfs_create_file_ns+0x10/0x10
[  591.853276]  ? pcode_mailbox_rw+0xce/0x180 [xe]
[  591.853414]  ? mutex_unlock+0x12/0x20
[  591.853417]  ? xe_pcode_read+0x59/0x80 [xe]
[  591.853542]  xe_device_sysfs_init+0x2cd/0x350 [xe]
[  591.853646]  ? __pfx_xe_device_sysfs_init+0x10/0x10 [xe]
[  591.853750]  ? __devm_add_action+0xa6/0xe0
[  591.853757]  xe_device_probe+0xb09/0x1bf0 [xe]
[  591.853871]  ? add_dr+0x180/0x230
[  591.853879]  ? __pfx_xe_device_probe+0x10/0x10 [xe]
[  591.853994]  ? xe_pm_init_early+0x345/0x420 [xe]
[  591.854124]  xe_pci_probe+0x8f8/0x11f0 [xe]
[  591.854257]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
[  591.854383]  local_pci_probe+0xe4/0x1b0
[  591.854389]  pci_device_probe+0x5b4/0x870
[  591.854393]  ? __pfx_pci_device_probe+0x10/0x10
[  591.854395]  ? kernfs_put+0x1d/0x60
[  591.854398]  ? sysfs_do_create_link_sd+0x91/0x120
[  591.854402]  ? sysfs_create_link+0x44/0xc0
[  591.854408]  really_probe+0x1fa/0x950
[  591.854414]  __driver_probe_device+0x307/0x410
[  591.854418]  device_driver_attach+0xc9/0x200
[  591.854423]  bind_store+0xd4/0x150
[  591.854425]  ? __pfx_bind_store+0x10/0x10
[  591.854429]  drv_attr_store+0x6a/0xc0
[  591.854431]  ? __pfx_sysfs_kf_write+0x10/0x10
[  591.854435]  ? __pfx_drv_attr_store+0x10/0x10
[  591.854437]  sysfs_kf_write+0xdc/0x130
[  591.854441]  ? __pfx_sysfs_kf_write+0x10/0x10
[  591.854444]  kernfs_fop_write_iter+0x373/0x550
[  591.854449]  vfs_write+0xa5f/0x1380
[  591.854456]  ? __pfx_vfs_write+0x10/0x10
[  591.854464]  ? lock_acquire+0x172/0x300
[  591.854468]  ? __kasan_check_read+0x11/0x20
[  591.854474]  ksys_write+0x115/0x220
[  591.854478]  ? __pfx_ksys_write+0x10/0x10
[  591.854482]  ? __rseq_handle_notify_resume+0x56e/0xda0
[  591.854488]  __x64_sys_write+0x72/0xc0
[  591.854492]  x64_sys_call+0x18ec/0x2740
[  591.854496]  do_syscall_64+0x8f/0xf70
[  591.854501]  ? trace_irq_disable+0xd9/0x120
[  591.854506]  ? trace_irq_enable+0xd9/0x120
[  591.854510]  ? do_syscall_64+0x1c0/0xf70
[  591.854513]  ? do_syscall_64+0x1c0/0xf70
[  591.854516]  ? irqentry_exit+0x77/0xb0
[  591.854519]  ? exc_page_fault+0x95/0x130
[  591.854523]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  591.854525] RIP: 0033:0x79d8b8b1c574
[  591.854529] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
[  591.854531] RSP: 002b:00007ffeb4a9bb48 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[  591.854534] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000079d8b8b1c574
[  591.854536] RDX: 000000000000000c RSI: 00007ffeb4a9cfd0 RDI: 0000000000000005
[  591.854537] RBP: 000000000000000c R08: 0000000000000073 R09: 0000000000000000
[  591.854538] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffeb4a9cfd0
[  591.854540] R13: 0000000000000005 R14: 00005d144cd2fc00 R15: 000079d8b8ff7000
[  591.854549]  </TASK>

It looks like for some reason there is a chance this can race with
the GT teardown (based on when each of their respective drmm fini
handlers are called). If we start the new driver quick enough (just
a while loop with no delay), it seems like we try to create a sysfs
entry before the one from the prior driver load has completed being
removed.

Add stricter initialization ordering between the sysfs files and the
GT subsystem by moving the sysfs initialization earlier in the probe
sequence.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3e0402dff423..f57007faa024 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -876,6 +876,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_device_sysfs_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
 		if (err)
@@ -922,10 +926,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	err = xe_device_sysfs_init(xe);
-	if (err)
-		goto err_unregister_display;
-
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
-- 
2.34.1

