Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F87FC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 19:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B17610EAED;
	Thu,  8 Feb 2024 19:18:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4E210EAED;
 Thu,  8 Feb 2024 19:18:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pt=3A_Allow_for_st?=
 =?utf-8?q?ricter_type-_and_range_checking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Feb 2024 19:18:06 -0000
Message-ID: <170741988684.1109599.14323280702494454155@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240208162258.6388-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240208162258.6388-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/pt: Allow for stricter type- and range checking
URL   : https://patchwork.freedesktop.org/series/129686/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf021a881bef66759183eb5291cb1a6dbbadeda1
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Feb 8 17:22:58 2024 +0100

    drm/xe/pt: Allow for stricter type- and range checking
    
    Distinguish between xe_pt and the xe_pt_dir subclass when
    allocating and freeing. Also use a fixed-size array for the
    xe_pt_dir page entries to make life easier for dynamic range-
    checkers. Finally rename the page-directory child pointer array
    to "children".
    
    While no functional change, this fixes ubsan splats similar to:
    
    [   51.463021] ------------[ cut here ]------------
    [   51.463022] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/xe/xe_pt.c:47:9
    [   51.463023] index 0 is out of range for type 'xe_ptw *[*]'
    [   51.463024] CPU: 5 PID: 2778 Comm: xe_vm Tainted: G     U             6.8.0-rc1+ #218
    [   51.463026] Hardware name: ASUS System Product Name/PRIME B560M-A AC, BIOS 2001 02/01/2023
    [   51.463027] Call Trace:
    [   51.463028]  <TASK>
    [   51.463029]  dump_stack_lvl+0x47/0x60
    [   51.463030]  __ubsan_handle_out_of_bounds+0x95/0xd0
    [   51.463032]  xe_pt_destroy+0xa5/0x150 [xe]
    [   51.463088]  __xe_pt_unbind_vma+0x36c/0x9b0 [xe]
    [   51.463144]  xe_vm_unbind+0xd8/0x580 [xe]
    [   51.463204]  ? drm_exec_prepare_obj+0x3f/0x60 [drm_exec]
    [   51.463208]  __xe_vma_op_execute+0x5da/0x910 [xe]
    [   51.463268]  ? __drm_gpuvm_sm_unmap+0x1cb/0x220 [drm_gpuvm]
    [   51.463272]  ? radix_tree_node_alloc.constprop.0+0x89/0xc0
    [   51.463275]  ? drm_gpuva_it_remove+0x1f3/0x2a0 [drm_gpuvm]
    [   51.463279]  ? drm_gpuva_remove+0x2f/0xc0 [drm_gpuvm]
    [   51.463283]  xe_vm_bind_ioctl+0x1a55/0x20b0 [xe]
    [   51.463344]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
    [   51.463414]  drm_ioctl_kernel+0xb6/0x120
    [   51.463416]  drm_ioctl+0x287/0x4e0
    [   51.463418]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
    [   51.463481]  __x64_sys_ioctl+0x94/0xd0
    [   51.463484]  do_syscall_64+0x86/0x170
    [   51.463486]  ? syscall_exit_to_user_mode+0x7d/0x200
    [   51.463488]  ? do_syscall_64+0x96/0x170
    [   51.463490]  ? do_syscall_64+0x96/0x170
    [   51.463492]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
    [   51.463494] RIP: 0033:0x7f246bfe817d
    [   51.463498] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
    [   51.463501] RSP: 002b:00007ffc1bd19ad0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
    [   51.463502] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f246bfe817d
    [   51.463504] RDX: 00007ffc1bd19b60 RSI: 0000000040886445 RDI: 0000000000000003
    [   51.463505] RBP: 00007ffc1bd19b20 R08: 0000000000000000 R09: 0000000000000000
    [   51.463506] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc1bd19b60
    [   51.463508] R13: 0000000040886445 R14: 0000000000000003 R15: 0000000000010000
    [   51.463510]  </TASK>
    [   51.463517] ---[ end trace ]---
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 22d626404cb81d7818ab55e5b14885e31a998dfd drm-intel
bf021a881 drm/xe/pt: Allow for stricter type- and range checking
-:57: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#57: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 139 lines checked


