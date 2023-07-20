Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D98EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 04:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E6010E029;
	Thu, 20 Jul 2023 04:20:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92A9410E029;
 Thu, 20 Jul 2023 04:20:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 91802AADD6;
 Thu, 20 Jul 2023 04:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 20 Jul 2023 04:20:38 -0000
Message-ID: <168982683859.20750.12471679691647002705@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230720041751.119121-1-matthew.brost@intel.com>
In-Reply-To: <20230720041751.119121-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Introduce_a_range-fence_?=
 =?utf-8?q?utility?=
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

Series: series starting with [1/2] drm/xe: Introduce a range-fence utility
URL   : https://patchwork.freedesktop.org/series/121015/
State : warning

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
commit b19930963c5c28b31f73178ad67b4172e93186da
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 19 21:17:51 2023 -0700

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
    
    To fix use range-fence utility to track cross bind engine conflicts. In
    the above example bind A would insert an dependency into the range-fence
    tree with a key of 0x0-0x7fffffffff, bind B would find that dependency
    and its bind job would scheduled behind the unsatisfied in-fence and
    bind A's job.
    
    Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
    Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f5459dca41d325590391d4512e937d8ffc2ce126 drm-intel
a4a0e5654 drm/xe: Introduce a range-fence utility
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 238 lines checked
b19930963 drm/xe: Make bind engines safe
-:29: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#29: 
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 289 lines checked


