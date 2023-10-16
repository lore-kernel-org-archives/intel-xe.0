Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DA4CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293F810E21D;
	Mon, 16 Oct 2023 15:42:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 057EB10E21D;
 Mon, 16 Oct 2023 15:42:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03F07ACC1F;
 Mon, 16 Oct 2023 15:42:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Mon, 16 Oct 2023 15:42:10 -0000
Message-ID: <169747093001.13510.4950550312422646219@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231016154025.3358622-1-fei.yang@intel.com>
In-Reply-To: <20231016154025.3358622-1-fei.yang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_x8?=
 =?utf-8?q?6/alternatives=3A_Disable_KASAN_in_apply=5Falternatives=28=29?=
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

Series: x86/alternatives: Disable KASAN in apply_alternatives()
URL   : https://patchwork.freedesktop.org/series/125179/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8d7d96593caaf61021dbb6e26f7dae57dfb74962
Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Date:   Mon Oct 16 08:40:24 2023 -0700

    x86/alternatives: Disable KASAN in apply_alternatives()
    
    Fei has reported that KASAN triggers during apply_alternatives() on
    a 5-level paging machine:
    
            BUG: KASAN: out-of-bounds in rcu_is_watching()
            Read of size 4 at addr ff110003ee6419a0 by task swapper/0/0
            ...
            __asan_load4()
            rcu_is_watching()
            trace_hardirqs_on()
            text_poke_early()
            apply_alternatives()
            ...
    
    On machines with 5-level paging, cpu_feature_enabled(X86_FEATURE_LA57)
    gets patched. It includes KASAN code, where KASAN_SHADOW_START depends on
    __VIRTUAL_MASK_SHIFT, which is defined with cpu_feature_enabled().
    
    KASAN gets confused when apply_alternatives() patches the
    KASAN_SHADOW_START users. A test patch that makes KASAN_SHADOW_START
    static, by replacing __VIRTUAL_MASK_SHIFT with 56, works around the issue.
    
    Fix it for real by disabling KASAN while the kernel is patching alternatives.
    
    [ mingo: updated the changelog ]
    
    Fixes: 6657fca06e3f ("x86/mm: Allow to boot without LA57 if CONFIG_X86_5LEVEL=y")
    Reported-by: Fei Yang <fei.yang@intel.com>
    Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
    Signed-off-by: Ingo Molnar <mingo@kernel.org>
    Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: stable@vger.kernel.org
    Link: https://lore.kernel.org/r/20231012100424.1456-1-kirill.shutemov@linux.intel.com
    (cherry picked from commit d35652a5fc9944784f6f50a5c979518ff8dacf61)
+ /mt/dim checkpatch ab7cd1b4af95baba2d6ce5487d35ffda523e895d drm-intel
8d7d96593 x86/alternatives: Disable KASAN in apply_alternatives()
-:27: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#27: 
Fix it for real by disabling KASAN while the kernel is patching alternatives.

-:31: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6657fca06e3f', maybe rebased or not pulled?
#31: 
Fixes: 6657fca06e3f ("x86/mm: Allow to boot without LA57 if CONFIG_X86_5LEVEL=y")

-:32: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#32: 
Reported-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

total: 0 errors, 3 warnings, 0 checks, 25 lines checked


