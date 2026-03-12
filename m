Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AC3106705A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 15:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DE410E3DB;
	Thu, 12 Mar 2026 15:40:30 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4606A10E3DB;
 Thu, 12 Mar 2026 15:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_always_keep_tra?=
 =?utf-8?q?ck_of_remap_prev/next?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Mar 2026 15:40:29 -0000
Message-ID: <177333002926.351130.9734686787018255944@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312134648.286641-2-matthew.auld@intel.com>
In-Reply-To: <20260312134648.286641-2-matthew.auld@intel.com>
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

Series: drm/xe: always keep track of remap prev/next
URL   : https://patchwork.freedesktop.org/series/163121/
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
commit 4c9823faf8076f41606a4e29e575e4acd89100c4
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Mar 12 13:46:49 2026 +0000

    drm/xe: always keep track of remap prev/next
    
    During 3D workload, user is reporting hitting:
    
    [  413.361679] WARNING: drivers/gpu/drm/xe/xe_vm.c:1217 at vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe], CPU#7: vkd3d_queue/9925
    [  413.361944] CPU: 7 UID: 1000 PID: 9925 Comm: vkd3d_queue Kdump: loaded Not tainted 7.0.0-070000rc3-generic #202603090038 PREEMPT(lazy)
    [  413.361949] RIP: 0010:vm_bind_ioctl_ops_unwind+0x1e2/0x2e0 [xe]
    [  413.362074] RSP: 0018:ffffd4c25c3df930 EFLAGS: 00010282
    [  413.362077] RAX: 0000000000000000 RBX: ffff8f3ee817ed10 RCX: 0000000000000000
    [  413.362078] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
    [  413.362079] RBP: ffffd4c25c3df980 R08: 0000000000000000 R09: 0000000000000000
    [  413.362081] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8f41fbf99380
    [  413.362082] R13: ffff8f3ee817e968 R14: 00000000ffffffef R15: ffff8f43d00bd380
    [  413.362083] FS:  00000001040ff6c0(0000) GS:ffff8f4696d89000(0000) knlGS:00000000330b0000
    [  413.362085] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
    [  413.362086] CR2: 00007ddfc4747000 CR3: 00000002e6262005 CR4: 0000000000f72ef0
    [  413.362088] PKRU: 55555554
    [  413.362089] Call Trace:
    [  413.362092]  <TASK>
    [  413.362096]  xe_vm_bind_ioctl+0xa9a/0xc60 [xe]
    
    Which seems to hint that the vma we are re-inserting for the ops unwind
    is either invalid or overlapping with something already inserted in the
    vm. It shouldn't be invalid since this is a re-insertion, so must have
    worked before. Leaving the likely culprit as something already placed
    where we want to insert the vma.
    
    Following from that, for the case where we do something like a rebind in
    the middle of a vma, and one or both mapped ends are already compatible,
    we skip doing the rebind of those vma and set next/prev to NULL.
    However, if we need to do an ops unwind later, we currently need to know
    the next/prev when removing the two end vma, before then re-inserting
    the original vma we tried to split. If we don't remove the prev/end vma,
    then the re-insertion could fail since the two end vma are overlapping
    the range we want to re-insert. This could explain the user bug, and
    does seem to fit.
    
    With that keep prev/next intact, and rely on skip prev/next.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3ccc0e3404591e404d0dee79406cd013f377356a drm-intel
4c9823faf807 drm/xe: always keep track of remap prev/next
-:110: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 51 lines checked


