Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BFDECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 10:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E08E10E362;
	Mon,  9 Sep 2024 10:05:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A0210E362;
 Mon,  9 Sep 2024 10:05:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_linux-next=3A_build_failu?=
 =?utf-8?q?re_after_merge_of_the_kspp_tree?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 10:05:22 -0000
Message-ID: <172587632271.973609.15513378906008658030@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909195939.067c1c13@canb.auug.org.au>
In-Reply-To: <20240909195939.067c1c13@canb.auug.org.au>
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

Series: linux-next: build failure after merge of the kspp tree
URL   : https://patchwork.freedesktop.org/series/138397/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5da43ee5f5eb6adb37b1999e068bea3fe1f5ccfa
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Mon Sep 9 19:59:39 2024 +1000

    linux-next: build failure after merge of the kspp tree
    
    Hi all,
    
    After merging the kspp tree, today's linux-next build (x86_64
    allmodconfig) failed like this:
    
    drivers/gpu/drm/xe/xe_gt_idle.c:56:27: error: redefinition of 'str_up_down'
       56 | static inline const char *str_up_down(bool v)
          |                           ^~~~~~~~~~~
    In file included from include/linux/string_helpers.h:7,
                     from drivers/gpu/drm/xe/xe_assert.h:9,
                     from drivers/gpu/drm/xe/xe_force_wake.h:9,
                     from drivers/gpu/drm/xe/xe_gt_idle.c:8:
    include/linux/string_choices.h:62:27: note: previous definition of 'str_up_down' with type 'const char *(bool)' {aka 'const char *(_Bool)'}
       62 | static inline const char *str_up_down(bool v)
          |                           ^~~~~~~~~~~
    
    Caused by commit
    
      a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")
    
    interacting with commit
    
      0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")
    
    from the drm-xe tree.
    
    I have applied the following patch for today.
    
    From: Stephen Rothwell <sfr@canb.auug.org.au>
    Date: Mon, 9 Sep 2024 19:40:17 +1000
    Subject: [PATCH] fix up for "lib/string_choices: Add str_up_down() helper"
    
    interacting wit commit "drm/xe/xe_gt_idle: add debugfs entry for
    powergating info" from the drm-xe tree.
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
+ /mt/dim checkpatch 62212ed3e75612eb3e50899f90c81922a0a76220 drm-intel
5da43ee5f5eb linux-next: build failure after merge of the kspp tree
-:28: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#28: 
  0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")

-:28: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")'
#28: 
  0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")

total: 1 errors, 1 warnings, 0 checks, 11 lines checked


