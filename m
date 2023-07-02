Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD6FEB64DA
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jul 2023 22:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0907510E011;
	Sun,  2 Jul 2023 22:19:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C73AD10E02C;
 Sun,  2 Jul 2023 22:19:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C3EB6AADD6;
 Sun,  2 Jul 2023 22:19:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sun, 02 Jul 2023 22:19:51 -0000
Message-ID: <168833639179.16145.1043980766267340331@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230702221710.1332629-1-matthew.brost@intel.com>
In-Reply-To: <20230702221710.1332629-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_An?=
 =?utf-8?q?other_attempt_to_fix_two_bind_races?=
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

Series: Another attempt to fix two bind races
URL   : https://patchwork.freedesktop.org/series/120121/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c5c9b5d2a325f1177c6db1b6a2079fc99619b7f
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Jul 2 15:17:10 2023 -0700

    drm/xe: Make bind engines safe
    
    We currently have a race between bind engines which can result in
    corrupted page tables leading to faults.
    
    A simple example:
    bind A 0x0000-0x1000, engine A, has unsatisfied in-fence
    bind B 0x1000-0x2000, engine B, no in-fences
    exec A uses 0x1000-0x2000
    
    Bind B will pass bind A and exec A will fault. This occurs as bind A
    programs the root of the page table in a bind job which is held up by an
    in-fence. Bind B in this case just programs a leaf entry of the
    structure.
    
    To fix this introduce a per VM maple tree to track cross engine
    conflicts. In the above example bind A would insert an dependency in the
    maple tree with a key of 0x0-0x7fffffffff, bind B would find that
    dependency and its bind job would scheduled behind the unsatisfied
    in-fence and bind A's job.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 53bd6056f6ec9a4f6c341d4f24122ede47a43de9 drm-intel
a10aebd21 drm/xe: Make page-table updates using the default engine
3c5c9b5d2 drm/xe: Make bind engines safe


