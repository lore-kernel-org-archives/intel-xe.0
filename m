Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC0FD73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 18:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3223E10E012;
	Thu, 29 Jan 2026 18:21:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113F810E012;
 Thu, 29 Jan 2026 18:21:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_CFI_pan?=
 =?utf-8?q?ic_due_to_function_signature_mismatch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Meenakshisundaram, Mohanram" <mohanram.meenakshisundaram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jan 2026 18:21:28 -0000
Message-ID: <176971088807.206949.1161878921810596894@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129183659.492395-1-mohanram.meenakshisundaram@intel.com>
In-Reply-To: <20260129183659.492395-1-mohanram.meenakshisundaram@intel.com>
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

Series: drm/xe/guc: Fix CFI panic due to function signature mismatch
URL   : https://patchwork.freedesktop.org/series/160857/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eac1e118d3ba46c9d7070dc8ffe18c6cedc92b3a
Author: Meenakshisundaram, Mohanram <mohanram.meenakshisundaram@intel.com>
Date:   Fri Jan 30 00:06:59 2026 +0530

    drm/xe/guc: Fix CFI panic due to function signature mismatch
    
    When reading GuC debugfs file (/sys/kernel/debug/dri/0/gt0/uc/guc_info)
    with CFI (Control Flow Integrity) enabled, the kernel panics at
    guc_debugfs_show+0x9f.
    
    Root cause: guc_debugfs_show() declares a function pointer expecting
    int (*print)(struct xe_guc *, struct drm_printer *),
    but xe_guc_print_info() was defined with void return type.
    CFI detects this type mismatch at the indirect call site.
    
    Fix: Change xe_guc_print_info() to return int instead of void, matching
    the expected function signature. Return -ETIMEDOUT on force_wake failure
    and 0 on success.
    
    Panic trace:
    RIP: 0010:guc_debugfs_show+0x9f/0xe0 [xe]
    Code: 30 4c 8b 79 18 4c 89 f7 e8 0e 1c ea ff 48 81 c3 c8 0e 00 00 48 8d
    75 a8 48 89 df 4d 89 fb 41 ba ce f8 df 2b 45 03 53 f1 74 02 <0f> 0b 2e
    2e 2e 41 ff d3 89 c3 4c 89 f7 e8 9f 1c ea ff 65 48 8b 05
    RSP: 0018:ffffa92527137c78 EFLAGS: 00010296
    RAX: 0000000000000000 RBX: ffff97ccc794cef0 RCX: 0000000000000000
    RDX: 0000000000000000 RSI: ffffa92527137c78 RDI: ffff97ccc794cef0
    RBP: ffffa92527137cd0 R08: 0000000000000000 R09: 0000000000000000
    R10: 00000000f2ce2a60 R11: ffffffffc0a225b0 R12: 0000000000000001
    R13: ffffa92527137d40 R14: ffff97ccc793c000 R15: ffffffffc0a225b0
    FS:  00007ef156f07f88(0000) GS:ffff97d08452f000(0000) knlGS:0000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000607d74864115 CR3: 00000001708d8003 CR4: 0000000000f72eb0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? __cfi___drm_printfn_seq_file+0x10/0x10
     ? __cfi___drm_puts_seq_file+0x10/0x10
     seq_read_iter+0x1e0/0x4e0
     seq_read+0x126/0x160
     full_proxy_read+0xa0/0x150
     vfs_read+0xf2/0x380
     ? putname+0x5c/0x70
     ksys_read+0x75/0xf0
     __x64_sys_read+0x1a/0x30
     x64_sys_call+0x2581/0x2ce0
     do_syscall_64+0x62/0xfa0
     ? exc_page_fault+0x83/0xd0
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    
    Signed-off-by: Meenakshisundaram, Mohanram <mohanram.meenakshisundaram@intel.com>
+ /mt/dim checkpatch 801974e4224e85dcbe9371ca5a9b303921744709 drm-intel
eac1e118d3ba drm/xe/guc: Fix CFI panic due to function signature mismatch
-:95: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 32 lines checked


