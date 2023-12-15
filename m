Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD8AC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 23:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF9D10EAB2;
	Fri, 15 Dec 2023 23:09:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71DBE10EA9C;
 Fri, 15 Dec 2023 23:09:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6D638AADE4;
 Fri, 15 Dec 2023 23:09:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_UBSAN_splat?=
 =?utf-8?q?_in_add=5Fpreempt=5Ffences=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 15 Dec 2023 23:09:02 -0000
Message-ID: <170268174244.27834.13927405294214651532@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215211245.718686-1-matthew.brost@intel.com>
In-Reply-To: <20231215211245.718686-1-matthew.brost@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Fix UBSAN splat in add_preempt_fences()
URL   : https://patchwork.freedesktop.org/series/127892/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c5f19dabc458d2d2faf9dcb0c9e9447512b47d45
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Dec 15 13:12:45 2023 -0800

    drm/xe: Fix UBSAN splat in add_preempt_fences()
    
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
    Fixes: 099192666a18 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
+ /mt/dim checkpatch c54005fdd0347a17088e7ff78070a55bf9103bc4 drm-intel
c5f19dabc drm/xe: Fix UBSAN splat in add_preempt_fences()


