Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B6CF07A9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 06:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424310E2B1;
	Thu, 10 Oct 2024 06:08:54 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4707410E17E;
 Thu, 10 Oct 2024 06:08:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_linux-next=3A_build_failu?=
 =?utf-8?q?re_after_merge_of_the_random_tree_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 06:08:53 -0000
Message-ID: <172854053328.1213877.13188620957700743306@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001134423.62b12a80@canb.auug.org.au>
In-Reply-To: <20241001134423.62b12a80@canb.auug.org.au>
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

Series: linux-next: build failure after merge of the random tree (rev2)
URL   : https://patchwork.freedesktop.org/series/139356/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e52eeac10490fc7aaff8255c2b91375c37c44130
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Oct 10 15:38:55 2024 +1100

    linux-next: build failure after merge of the random tree
    
    Hi all,
    
    On Tue, 1 Oct 2024 13:44:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
    >
    > After merging the random tree, today's linux-next build (x86_64
    > allmodconfig) failed like this:
    >
    >
    > Caused by commit
    >
    >   38d1a9d296c8 ("random: Do not include <linux/prandom.h> in <linux/random.h>")
    >
    > interacting with commit
    >
    >   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
    >
    > from the drm-xe tree.
    >
    > I have applied the following merge fix patch for today.
    
    The patch is now:
    
    From: Stephen Rothwell <sfr@canb.auug.org.au>
    Date: Tue, 1 Oct 2024 13:33:48 +1000
    Subject: [PATCH] fix up for "random: Do not include <linux/prandom.h> in
     <linux/random.h>"
    
    interacting with commit
    
      5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
    
    from the drm-xe tree.
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
+ /mt/dim checkpatch e1aba2bf4f79f2f8ae7ce538124d445fc91df852 drm-intel
e52eeac10490 linux-next: build failure after merge of the random tree
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
On Tue, 1 Oct 2024 13:44:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

-:20: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")'
#20: 
>   5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

-:35: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")'
#35: 
  5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")

total: 2 errors, 1 warnings, 0 checks, 8 lines checked


