Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CC0C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 16:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAA610E3E2;
	Mon, 16 Jun 2025 16:06:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECBB10E347;
 Mon, 16 Jun 2025 16:06:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-fence=3A_Fix_sparse_w?=
 =?utf-8?q?arnings_due_=5F=5Frcu_annotations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Jun 2025 16:06:02 -0000
Message-ID: <175008996290.83004.17847292474769411538@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616155952.24259-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250616155952.24259-1-tvrtko.ursulin@igalia.com>
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

Series: dma-fence: Fix sparse warnings due __rcu annotations
URL   : https://patchwork.freedesktop.org/series/150338/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e155c5dae42435ad7fbb50d05e8bcf7d99005e2f
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Jun 16 16:59:52 2025 +0100

    dma-fence: Fix sparse warnings due __rcu annotations
    
    __rcu annotations on the return types from dma_fence_driver_name() and
    dma_fence_timeline_name() cause sparse to complain because both the
    constant signaled strings, and the strings return by the dma_fence_ops are
    not __rcu annotated.
    
    For a simple fix it is easiest to cast them with __rcu added and undo the
    smarts from the tracpoints side of things. There is no functional change
    since the rest is left in place. Later we can consider changing the
    dma_fence_ops return types too, and handle all the individual drivers
    which define them.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202506162214.1eA69hLe-lkp@intel.com/
    Cc: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch dea7240e83c9e58ec755a3d68e7db10068df6b76 drm-intel
e155c5dae424 dma-fence: Fix sparse warnings due __rcu annotations
-:4: WARNING:EMAIL_SUBJECT: A patch subject line should describe the change not the tool that found it
#4: 
Subject: [PATCH] dma-fence: Fix sparse warnings due __rcu annotations

-:93: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#93: FILE: include/trace/events/dma_fence.h:18:
+DECLARE_EVENT_CLASS(dma_fence,
 

-:102: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#102: FILE: include/trace/events/dma_fence.h:43:
+DEFINE_EVENT(dma_fence, dma_fence_emit,
 

-:110: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#110: FILE: include/trace/events/dma_fence.h:50:
+DEFINE_EVENT(dma_fence, dma_fence_init,
 

-:119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#119: FILE: include/trace/events/dma_fence.h:64:
+DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
 

-:127: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#127: FILE: include/trace/events/dma_fence.h:71:
+DEFINE_EVENT(dma_fence, dma_fence_signaled,
 

total: 0 errors, 1 warnings, 5 checks, 91 lines checked


