Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F8FC76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 11:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5B010E16E;
	Mon,  3 Apr 2023 11:04:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080AC10E16E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680519857; x=1712055857;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NrJoT+5Tmd7m2pyMxoNhbePIPIb7qRbZCNUWRXAHDpI=;
 b=K/IdWRghs7PMsk0N+dakmk36324l4M+HDN2yF0Qyjuo81iLkaoxVGYQL
 GyF5jVMc92tskcQalW+ISyYmupnsmPxxHl15uuTnYzdHU3pUhajbUk+gO
 f5WhE03zTaJa9BQYgwYV/skuDHOuXAwjSMzZEI0Qk5T81x7eWvtVfHHV/
 0B57YHf58xr6VoybZuzpB4TZR2em5dqJ5UZrAuWYzhFwniJFgncdRE3pK
 9tn+gFVzyKa/4dlCPkD29PmZrPvLlZvp82P9Tpzk+8y+i/DsqRoUURAo0
 AJ6dbEy+lIKqllBXareHPtuG8obU2BjyV4ht6zfip/jW2B5DHuUC8yQo6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="339361832"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="339361832"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 04:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="809804635"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="809804635"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 03 Apr 2023 04:04:12 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.28.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5CB83580C63;
 Mon,  3 Apr 2023 04:04:11 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:04:08 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230403130408.3825ed6f@maurocar-mobl2>
In-Reply-To: <20230329000958.2188321-2-matthew.brost@intel.com>
References: <20230329000958.2188321-1-matthew.brost@intel.com>
 <20230329000958.2188321-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: Return NULL in run_job for
 long running jobs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matthew,

On Tue, 28 Mar 2023 17:09:58 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Return NULL in run_job for long running jobs, now to flow control the
> ring use prepare_job.
> 
> FIXME: Need to implement cleanup for long runnig engines that encounter
> errors.

Not sure if it was its original intent, but this one actually fixed the
probe issues with ADL-P.

That is reported by the CI.BAT test from this test. I also tested it
on an ADL-P machine here with and without the patch.

Without the patch:

[  543.815703] xe 0000:00:02.0: vgaarb: deactivate vga console
[  543.833107] GT topology dss mask (geometry): 00000000,0000003f
[  543.833113] GT topology dss mask (compute):  00000000,00000000
[  543.833116] GT topology EU mask per DSS:     0000ffff
[  543.950635] xe 0000:00:02.0: [drm] HuC disabled
[  544.041872] xe REG[0x2340-0x235f]: allow read access
[  544.041883] xe REG[0x7010-0x7017]: allow rw access
[  544.041887] xe REG[0x7018-0x701f]: allow rw access
[  544.042593] xe REG[0x223a8-0x223af]: allow read access
[  544.043360] xe REG[0x1c03a8-0x1c03af]: allow read access
[  544.044104] xe REG[0x1d03a8-0x1d03af]: allow read access
[  544.044815] xe REG[0x1c83a8-0x1c83af]: allow read access
[  545.185282] xe 0000:00:02.0: [drm] *ERROR* gt0, hwe vcs0, guc_id=1, emit_nop_job,nop_e failed=-62
[  545.186059] ------------[ cut here ]------------
[  545.186084] WARNING: CPU: 10 PID: 2088 at drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x53/0x2d0 [xe]
[  545.188417] Modules linked in: xe(+) drm_ttm_helper gpu_sched drm_suballoc_helper i2c_algo_bit ttm drm_display_helper drm_kms_helper syscopyarea sysfillrect sysimgblt drm_buddy cfbfillrect cfbimgblt cfbcopyarea fb fbdev xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink xt_addrtype iptable_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter overlay fuse x86_pkg_temp_thermal coretemp kvm_intel pmt_telemetry mei_pxp mei_hdcp pmt_class kvm asix phylink irqbypass usbnet mii wmi_bmof mei_me mei intel_vsec drm drm_panel_orientation_quirks ip_tables x_tables e1000e crct10dif_pclmul ptp crc32_pclmul ghash_clmulni_intel i2c_i801 pps_core i2c_smbus video wmi
[  545.189511] CPU: 10 PID: 2088 Comm: modprobe Tainted: G     U             6.3.0-rc4-xe-public-cbd8b47f2826+ #2
[  545.189549] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
[  545.189575] RIP: 0010:xe_hw_fence_irq_finish+0x53/0x2d0 [xe]
[  545.190697] Code: e8 c2 01 6b e0 49 8b 44 24 60 49 39 c5 75 13 48 83 c4 28 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 83 05 45 4a 4d 00 01 <0f> 0b 48 83 05 43 4a 4d 00 01 48 83 05 43 4a 4d 00 01 e8 16 54 00
[  545.190701] RSP: 0018:ffff8881062ef690 EFLAGS: 00010202
[  545.190706] RAX: ffff888123562958 RBX: ffff88812bbc2118 RCX: ffffffffa0dc9ffe
[  545.190709] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffff88812bbc4ba8
[  545.190712] RBP: ffff88812bbc4da0 R08: 0000000000000001 R09: ffffed1020c5deb7
[  545.190715] R10: ffff8881062ef5b7 R11: ffffed1020c5deb6 R12: ffff88812bbc4b48
[  545.190718] R13: ffff88812bbc4ba8 R14: ffff88812bbc3ce8 R15: ffff88812bbc4bc0
[  545.190721] FS:  00007fdca90ee740(0000) GS:ffff888460b00000(0000) knlGS:0000000000000000
[  545.190724] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  545.190727] CR2: 0000563a9cf9cec0 CR3: 000000012f5ea005 CR4: 0000000000f70ee0
[  545.190731] PKRU: 55555554
[  545.190734] Call Trace:
[  545.190738]  <TASK>
[  545.190749]  xe_gt_init+0x3ea/0x730 [xe]
[  545.190950]  xe_device_probe+0x4cd/0x620 [xe]
[  545.191139]  xe_pci_probe+0x81d/0xa20 [xe]
[  545.191342]  pci_device_probe+0x100/0x210
[  545.191352]  really_probe+0x215/0x560
[  545.191360]  ? __pfx___driver_attach+0x10/0x10
[  545.191365]  __driver_probe_device+0xc7/0x220
[  545.191370]  ? __pfx___driver_attach+0x10/0x10
[  545.191374]  driver_probe_device+0x49/0xf0
[  545.191380]  __driver_attach+0x101/0x200
[  545.191385]  ? __pfx___driver_attach+0x10/0x10
[  545.191389]  bus_for_each_dev+0xd4/0x140
[  545.191394]  ? __pfx_bus_for_each_dev+0x10/0x10
[  545.191398]  ? __list_add_valid+0x3a/0xe0
[  545.191407]  bus_add_driver+0x1aa/0x300
[  545.191414]  driver_register+0xa5/0x1d0
[  545.191419]  ? __pfx_init_module+0x10/0x10 [xe]
[  545.191604]  xe_register_pci_driver+0x2b/0x40 [xe]
[  545.191873]  xe_init+0x44/0x90 [xe]
[  545.192069]  do_one_initcall+0xbd/0x350
[  545.192076]  ? __pfx_do_one_initcall+0x10/0x10
[  545.192080]  ? do_init_module+0xbc/0x340
[  545.192088]  ? kasan_unpoison+0x27/0x60
[  545.192095]  ? kasan_unpoison+0x27/0x60
[  545.192102]  do_init_module+0xe4/0x340
[  545.192109]  load_module+0x3505/0x3760
[  545.192126]  ? __pfx_load_module+0x10/0x10
[  545.192133]  ? kernel_read_file+0x312/0x350
[  545.192149]  ? __pfx_userfaultfd_unmap_complete+0x10/0x10
[  545.192160]  ? __do_sys_finit_module+0x110/0x1b0
[  545.192164]  __do_sys_finit_module+0x110/0x1b0
[  545.192168]  ? __pfx___do_sys_finit_module+0x10/0x10
[  545.192181]  ? __fget_files+0x14b/0x210
[  545.192186]  ? mark_held_locks+0x24/0x90
[  545.192193]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[  545.192198]  ? syscall_enter_from_user_mode+0x21/0x50
[  545.192206]  do_syscall_64+0x3c/0x90
[  545.192211]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  545.192216] RIP: 0033:0x7fdca8d2989d
[  545.192221] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 f5 0c 00 f7 d8 64 89 01 48
[  545.192224] RSP: 002b:00007ffcdec21038 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  545.192230] RAX: ffffffffffffffda RBX: 00005578e7918080 RCX: 00007fdca8d2989d
[  545.192233] RDX: 0000000000000000 RSI: 00005578e7920590 RDI: 0000000000000013
[  545.192236] RBP: 0000000000040000 R08: 0000000000000000 R09: 000000000000001e
[  545.192239] R10: 0000000000000013 R11: 0000000000000246 R12: 00005578e7920590
[  545.192242] R13: 0000000000000000 R14: 00005578e79181b0 R15: 00005578e7918080
[  545.192253]  </TASK>
[  545.192256] irq event stamp: 332801
[  545.192259] hardirqs last  enabled at (332807): [<ffffffff811f43bb>] __up_console_sem+0x6b/0x80
[  545.192265] hardirqs last disabled at (332812): [<ffffffff811f43a0>] __up_console_sem+0x50/0x80
[  545.192269] softirqs last  enabled at (332092): [<ffffffff82520a55>] __do_softirq+0x385/0x485
[  545.192275] softirqs last disabled at (332087): [<ffffffff8111be85>] irq_exit_rcu+0x95/0xc0
[  545.192280] ---[ end trace 0000000000000000 ]---
[  545.206520] xe: probe of 0000:00:02.0 failed with error -62
[  545.220779] xe 0000:00:02.0: [drm] *ERROR* GuC PC Shutdown failed
[  545.220841] ------------[ cut here ]------------
[  545.220844] WARNING: CPU: 6 PID: 2088 at drivers/gpu/drm/xe/xe_guc_pc.c:879 pc_fini+0x239/0x2d0 [xe]
[  545.221055] Modules linked in: xe(+) drm_ttm_helper gpu_sched drm_suballoc_helper i2c_algo_bit ttm drm_display_helper drm_kms_helper syscopyarea sysfillrect sysimgblt drm_buddy cfbfillrect cfbimgblt cfbcopyarea fb fbdev xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink xt_addrtype iptable_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter overlay fuse x86_pkg_temp_thermal coretemp kvm_intel pmt_telemetry mei_pxp mei_hdcp pmt_class kvm asix phylink irqbypass usbnet mii wmi_bmof mei_me mei intel_vsec drm drm_panel_orientation_quirks ip_tables x_tables e1000e crct10dif_pclmul ptp crc32_pclmul ghash_clmulni_intel i2c_i801 pps_core i2c_smbus video wmi
[  545.221172] CPU: 6 PID: 2088 Comm: modprobe Tainted: G     U  W          6.3.0-rc4-xe-public-cbd8b47f2826+ #2
[  545.221176] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
[  545.221179] RIP: 0010:pc_fini+0x239/0x2d0 [xe]
[  545.221358] Code: 54 d0 4d 00 01 49 39 c4 0f 84 1f ff ff ff 48 83 05 4b d0 4d 00 01 eb 3b 48 83 05 89 d0 4d 00 01 eb 8d 48 83 05 07 e0 4d 00 01 <0f> 0b 48 83 05 05 e0 4d 00 01 e9 ec fd ff ff 48 83 05 a8 cf 4d 00
[  545.221362] RSP: 0018:ffff8881062ef668 EFLAGS: 00010202
[  545.221366] RAX: 00000000fffffffb RBX: ffff8881103f6040 RCX: dffffc0000000000
[  545.221369] RDX: 0000000000000003 RSI: 0000000000000008 RDI: ffff8884609450c0
[  545.221372] RBP: ffff88812bbc47a0 R08: ffffffff8121d043 R09: fffffbfff073edd1
[  545.221375] R10: ffffffff839f6e87 R11: fffffbfff073edd0 R12: ffff88812bbc0000
[  545.221378] R13: ffff8881103f6958 R14: ffff8881103f6960 R15: ffffffffa0dbbc50
[  545.221380] FS:  00007fdca90ee740(0000) GS:ffff888460900000(0000) knlGS:0000000000000000
[  545.221383] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  545.221386] CR2: 0000563a9d052858 CR3: 000000012f5ea005 CR4: 0000000000f70ee0
[  545.221389] PKRU: 55555554
[  545.221391] Call Trace:
[  545.221395]  <TASK>
[  545.221399]  drm_managed_release+0x1f4/0x2a0 [drm]
[  545.221498]  drm_dev_release+0x4f/0x90 [drm]
[  545.221568]  devm_drm_dev_init_release+0xb1/0x100 [drm]
[  545.221670]  release_nodes+0x59/0x190
[  545.221677]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[  545.221682]  ? _raw_spin_unlock_irqrestore+0x51/0x70
[  545.221691]  devres_release_all+0xf8/0x140
[  545.221696]  ? __pfx_devres_release_all+0x10/0x10
[  545.221706]  device_unbind_cleanup+0x16/0xc0
[  545.221712]  really_probe+0x17a/0x560
[  545.221718]  ? __pfx___driver_attach+0x10/0x10
[  545.221723]  __driver_probe_device+0xc7/0x220
[  545.221729]  ? __pfx___driver_attach+0x10/0x10
[  545.221734]  driver_probe_device+0x49/0xf0
[  545.221740]  __driver_attach+0x101/0x200
[  545.221746]  ? __pfx___driver_attach+0x10/0x10
[  545.221751]  bus_for_each_dev+0xd4/0x140
[  545.221755]  ? __pfx_bus_for_each_dev+0x10/0x10
[  545.221760]  ? __list_add_valid+0x3a/0xe0
[  545.221770]  bus_add_driver+0x1aa/0x300
[  545.221778]  driver_register+0xa5/0x1d0
[  545.221783]  ? __pfx_init_module+0x10/0x10 [xe]
[  545.221981]  xe_register_pci_driver+0x2b/0x40 [xe]
[  545.222177]  xe_init+0x44/0x90 [xe]
[  545.222362]  do_one_initcall+0xbd/0x350
[  545.222368]  ? __pfx_do_one_initcall+0x10/0x10
[  545.222372]  ? do_init_module+0xbc/0x340
[  545.222379]  ? kasan_unpoison+0x27/0x60
[  545.222385]  ? kasan_unpoison+0x27/0x60
[  545.222393]  do_init_module+0xe4/0x340
[  545.222399]  load_module+0x3505/0x3760
[  545.222416]  ? __pfx_load_module+0x10/0x10
[  545.222423]  ? kernel_read_file+0x312/0x350
[  545.222438]  ? __pfx_userfaultfd_unmap_complete+0x10/0x10
[  545.222448]  ? __do_sys_finit_module+0x110/0x1b0
[  545.222451]  __do_sys_finit_module+0x110/0x1b0
[  545.222456]  ? __pfx___do_sys_finit_module+0x10/0x10
[  545.222468]  ? __fget_files+0x14b/0x210
[  545.222473]  ? mark_held_locks+0x24/0x90
[  545.222479]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[  545.222483]  ? syscall_enter_from_user_mode+0x21/0x50
[  545.222490]  do_syscall_64+0x3c/0x90
[  545.222495]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  545.222499] RIP: 0033:0x7fdca8d2989d
[  545.222503] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 f5 0c 00 f7 d8 64 89 01 48
[  545.222506] RSP: 002b:00007ffcdec21038 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  545.222511] RAX: ffffffffffffffda RBX: 00005578e7918080 RCX: 00007fdca8d2989d
[  545.222514] RDX: 0000000000000000 RSI: 00005578e7920590 RDI: 0000000000000013
[  545.222517] RBP: 0000000000040000 R08: 0000000000000000 R09: 000000000000001e
[  545.222520] R10: 0000000000000013 R11: 0000000000000246 R12: 00005578e7920590
[  545.222523] R13: 0000000000000000 R14: 00005578e79181b0 R15: 00005578e7918080
[  545.222534]  </TASK>
[  545.222536] irq event stamp: 350617
[  545.222539] hardirqs last  enabled at (350623): [<ffffffff811f43bb>] __up_console_sem+0x6b/0x80
[  545.222544] hardirqs last disabled at (350628): [<ffffffff811f43a0>] __up_console_sem+0x50/0x80
[  545.222548] softirqs last  enabled at (350312): [<ffffffff82520a55>] __do_softirq+0x385/0x485
[  545.222552] softirqs last disabled at (350301): [<ffffffff8111be85>] irq_exit_rcu+0x95/0xc0
[  545.222557] ---[ end trace 0000000000000000 ]---
[  545.227421] ------------[ cut here ]------------
[  545.227424] Memory manager not clean during takedown.
[  545.227458] WARNING: CPU: 6 PID: 2088 at drivers/gpu/drm/drm_mm.c:999 drm_mm_takedown+0x4e/0x60 [drm]
[  545.227543] Modules linked in: xe(+) drm_ttm_helper gpu_sched drm_suballoc_helper i2c_algo_bit ttm drm_display_helper drm_kms_helper syscopyarea sysfillrect sysimgblt drm_buddy cfbfillrect cfbimgblt cfbcopyarea fb fbdev xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink xt_addrtype iptable_filter iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter overlay fuse x86_pkg_temp_thermal coretemp kvm_intel pmt_telemetry mei_pxp mei_hdcp pmt_class kvm asix phylink irqbypass usbnet mii wmi_bmof mei_me mei intel_vsec drm drm_panel_orientation_quirks ip_tables x_tables e1000e crct10dif_pclmul ptp crc32_pclmul ghash_clmulni_intel i2c_i801 pps_core i2c_smbus video wmi
[  545.227666] CPU: 6 PID: 2088 Comm: modprobe Tainted: G     U  W          6.3.0-rc4-xe-public-cbd8b47f2826+ #2
[  545.227670] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR5 RVP, BIOS ADLPFWI1.R00.2411.A02.2110081023 10/08/2021
[  545.227673] RIP: 0010:drm_mm_takedown+0x4e/0x60 [drm]
[  545.227755] Code: 43 38 48 39 e8 75 07 5b 5d c3 cc cc cc cc 48 c7 c7 80 f9 31 a0 48 83 05 57 ab 12 00 01 e8 1a dc e3 e0 48 83 05 52 ab 12 00 01 <0f> 0b 48 83 05 50 ab 12 00 01 5b 5d c3 cc cc cc cc 90 90 90 90 90
[  545.227759] RSP: 0018:ffff8881062ef650 EFLAGS: 00010202
[  545.227765] RAX: 0000000000000000 RBX: ffff8881458a20e0 RCX: 0000000000000027
[  545.227769] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff888460938808
[  545.227772] RBP: ffff8881458a2118 R08: ffffffff8132f16e R09: ffffed108c127102
[  545.227774] R10: ffff88846093880b R11: ffffed108c127101 R12: ffff88812bbc0000
[  545.227777] R13: ffff888122a48958 R14: ffff888122a48960 R15: ffffffffa0d9fd20
[  545.227780] FS:  00007fdca90ee740(0000) GS:ffff888460900000(0000) knlGS:0000000000000000
[  545.227784] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  545.227787] CR2: 0000563a9d052858 CR3: 000000012f5ea005 CR4: 0000000000f70ee0
[  545.227790] PKRU: 55555554
[  545.227792] Call Trace:
[  545.227795]  <TASK>
[  545.227798]  ggtt_fini_noalloc+0x39/0x2a0 [xe]
[  545.227998]  drm_managed_release+0x1f4/0x2a0 [drm]
[  545.228084]  drm_dev_release+0x4f/0x90 [drm]
[  545.228157]  devm_drm_dev_init_release+0xb1/0x100 [drm]
[  545.228229]  release_nodes+0x59/0x190
[  545.228234]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[  545.228239]  ? _raw_spin_unlock_irqrestore+0x51/0x70
[  545.228247]  devres_release_all+0xf8/0x140
[  545.228252]  ? __pfx_devres_release_all+0x10/0x10
[  545.228261]  device_unbind_cleanup+0x16/0xc0
[  545.228266]  really_probe+0x17a/0x560
[  545.228272]  ? __pfx___driver_attach+0x10/0x10
[  545.228276]  __driver_probe_device+0xc7/0x220
[  545.228282]  ? __pfx___driver_attach+0x10/0x10
[  545.228285]  driver_probe_device+0x49/0xf0
[  545.228291]  __driver_attach+0x101/0x200
[  545.228296]  ? __pfx___driver_attach+0x10/0x10
[  545.228300]  bus_for_each_dev+0xd4/0x140
[  545.228304]  ? __pfx_bus_for_each_dev+0x10/0x10
[  545.228309]  ? __list_add_valid+0x3a/0xe0
[  545.228318]  bus_add_driver+0x1aa/0x300
[  545.228325]  driver_register+0xa5/0x1d0
[  545.228329]  ? __pfx_init_module+0x10/0x10 [xe]
[  545.228515]  xe_register_pci_driver+0x2b/0x40 [xe]
[  545.228762]  xe_init+0x44/0x90 [xe]
[  545.228947]  do_one_initcall+0xbd/0x350
[  545.228952]  ? __pfx_do_one_initcall+0x10/0x10
[  545.228956]  ? do_init_module+0xbc/0x340
[  545.228963]  ? kasan_unpoison+0x27/0x60
[  545.228969]  ? kasan_unpoison+0x27/0x60
[  545.228977]  do_init_module+0xe4/0x340
[  545.228984]  load_module+0x3505/0x3760
[  545.229001]  ? __pfx_load_module+0x10/0x10
[  545.229008]  ? kernel_read_file+0x312/0x350
[  545.229022]  ? __pfx_userfaultfd_unmap_complete+0x10/0x10
[  545.229032]  ? __do_sys_finit_module+0x110/0x1b0
[  545.229036]  __do_sys_finit_module+0x110/0x1b0
[  545.229040]  ? __pfx___do_sys_finit_module+0x10/0x10
[  545.229053]  ? __fget_files+0x14b/0x210
[  545.229058]  ? mark_held_locks+0x24/0x90
[  545.229063]  ? lockdep_hardirqs_on_prepare+0x136/0x210
[  545.229068]  ? syscall_enter_from_user_mode+0x21/0x50
[  545.229074]  do_syscall_64+0x3c/0x90
[  545.229079]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  545.229083] RIP: 0033:0x7fdca8d2989d
[  545.229087] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 f5 0c 00 f7 d8 64 89 01 48
[  545.229090] RSP: 002b:00007ffcdec21038 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  545.229095] RAX: ffffffffffffffda RBX: 00005578e7918080 RCX: 00007fdca8d2989d
[  545.229098] RDX: 0000000000000000 RSI: 00005578e7920590 RDI: 0000000000000013
[  545.229100] RBP: 0000000000040000 R08: 0000000000000000 R09: 000000000000001e
[  545.229103] R10: 0000000000000013 R11: 0000000000000246 R12: 00005578e7920590
[  545.229106] R13: 0000000000000000 R14: 00005578e79181b0 R15: 00005578e7918080
[  545.229117]  </TASK>
[  545.229120] irq event stamp: 363225
[  545.229122] hardirqs last  enabled at (363231): [<ffffffff811f43bb>] __up_console_sem+0x6b/0x80
[  545.229127] hardirqs last disabled at (363236): [<ffffffff811f43a0>] __up_console_sem+0x50/0x80
[  545.229131] softirqs last  enabled at (353948): [<ffffffff82520a55>] __do_softirq+0x385/0x485
[  545.229136] softirqs last disabled at (353943): [<ffffffff8111be85>] irq_exit_rcu+0x95/0xc0
[  545.229140] ---[ end trace 0000000000000000 ]---


After the patch:

[10766.319381] xe 0000:00:02.0: vgaarb: deactivate vga console
[10766.337075] GT topology dss mask (geometry): 00000000,0000003f
[10766.337081] GT topology dss mask (compute):  00000000,00000000
[10766.337084] GT topology EU mask per DSS:     0000ffff
[10766.451614] xe 0000:00:02.0: [drm] HuC disabled
[10766.538902] xe REG[0x2340-0x235f]: allow read access
[10766.538914] xe REG[0x7010-0x7017]: allow rw access
[10766.538918] xe REG[0x7018-0x701f]: allow rw access
[10766.539566] xe REG[0x223a8-0x223af]: allow read access
[10766.540255] xe REG[0x1c03a8-0x1c03af]: allow read access
[10766.540960] xe REG[0x1d03a8-0x1d03af]: allow read access
[10766.541636] xe REG[0x1c83a8-0x1c83af]: allow read access
[10766.646687] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
[10766.653794] modprobe (2326) used greatest stack depth: 22552 bytes left
[10767.899306] xe 0000:00:02.0: [drm] GT suspended

So, if you decide to apply this patch:

Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
