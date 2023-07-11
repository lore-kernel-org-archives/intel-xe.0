Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E6CEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 00:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DBB10E16D;
	Tue, 11 Jul 2023 00:21:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A3B310E16D;
 Tue, 11 Jul 2023 00:21:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 36D5FA73C7;
 Tue, 11 Jul 2023 00:21:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 11 Jul 2023 00:21:05 -0000
Message-ID: <168903486522.18664.3209654821161645095@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230710221544.1882405-1-matthew.brost@intel.com>
In-Reply-To: <20230710221544.1882405-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_multiple_engine_=28un=29bind_races?=
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

Series: Fix multiple engine (un)bind races
URL   : https://patchwork.freedesktop.org/series/120482/
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
commit fb93f7ff541cde439f1808aab38b2eb76d4cbb09
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 10 15:15:44 2023 -0700

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
    
    Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
27675355c drm/xe: Introduce a range-fence utility
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 221 lines checked
fb93f7ff5 drm/xe: Make bind engines safe
-:28: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#28: 
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 296 lines checked


