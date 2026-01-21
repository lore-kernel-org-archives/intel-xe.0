Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0494EC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24E210E10B;
	Wed, 21 Jan 2026 23:03:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431810E0FB;
 Wed, 21 Jan 2026 23:03:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Move_=5FTHIS=5F?=
 =?utf-8?q?IP=5F_usage_from_xe=5Fvm=5Fcreate=28=29_to_dedicated_function?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 23:03:14 -0000
Message-ID: <176903659418.180247.9416857978234135561@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
In-Reply-To: <20260121-xe-vm-fix-clang-goto-error-v1-1-7e121d81512e@kernel.org>
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

Series: drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function
URL   : https://patchwork.freedesktop.org/series/160453/
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
commit f237fb0434993e63c80fd30b8fad5f11b57ed189
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Jan 21 15:57:35 2026 -0700

    drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function
    
    After commit a3866ce7b122 ("drm/xe: Add vm to exec queues association"),
    building for an architecture other than x86 (which defines its own
    _THIS_IP_) with clang fails with:
    
      drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect goto statement to one of its possible targets
       1586 |                 drm_exec_retry_on_contention(&exec);
            |                 ^
      include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
        123 |                         goto *__drm_exec_retry_ptr;             \
            |                         ^
      drivers/gpu/drm/xe/xe_vm.c:1542:3: note: possible target of indirect goto statement
       1542 |                 might_lock(&vm->exec_queues.lock);
            |                 ^
      include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
        553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
            |                                        ^
      include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
         10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
            |                                         ^
      drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable with __attribute__((cleanup))
       1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
            |         ^
      drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
        189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
            |         ^
      include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
        442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
            |         ^
      include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guard'
        433 |         for (CLASS(_name, scope)(args);                                 \
            |                           ^
      drivers/gpu/drm/xe/xe_vm.c:1542:3: note: jump enters a statement expression
       1542 |                 might_lock(&vm->exec_queues.lock);
            |                 ^
      include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
        553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
            |                                        ^
      include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
         10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
            |                    ^
    
    While this is a false positive error because __drm_exec_retry_ptr is
    only ever assigned the label in drm_exec_until_all_locked() (thus it can
    never jump over the cleanup variable), this error is not unreasonable in
    general because the only supported use case for taking the address of a
    label is computed gotos [1]. The kernel's use of the address of a label
    in _THIS_IP_ is considered problematic by both GCC [2][3] and clang [4]
    but they need to provide something equivalent before they can break this
    use case.
    
    Hide the usage of _THIS_IP_ by moving the CONFIG_PROVE_LOCKING if
    statement to its own function, avoiding the error. This is similar to
    commit 187e16f69de2 ("drm/xe: Work around clang multiple goto-label
    error") but with the sources of _THIS_IP_.
    
    Fixes: a3866ce7b122 ("drm/xe: Add vm to exec queues association")
    Link: https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html [1]
    Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44298 [2]
    Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [3]
    Link: https://github.com/llvm/llvm-project/issues/138272 [4]
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
+ /mt/dim checkpatch ad2a046603cba140214aed34015ed5027441e85a drm-intel
f237fb043499 drm/xe: Move _THIS_IP_ usage from xe_vm_create() to dedicated function
-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
    553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \

total: 0 errors, 1 warnings, 0 checks, 36 lines checked


