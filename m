Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C5AC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 12:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04B010E30C;
	Mon,  9 Jun 2025 12:59:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BF410E311;
 Mon,  9 Jun 2025 12:59:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fixing_some_dma-fence_use?=
 =?utf-8?q?-after-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 12:59:52 -0000
Message-ID: <174947399209.59983.6622435528348091194@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
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

Series: Fixing some dma-fence use-after-free
URL   : https://patchwork.freedesktop.org/series/149982/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 20c9e2b98c22e9273084941c25a4c20fe822f542
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Jun 9 12:03:30 2025 +0100

    drm/xe: Make dma-fences compliant with the safe access rules
    
    Xe can free some of the data pointed to by the dma-fences it exports. Most
    notably the timeline name can get freed if userspace closes the associated
    submit queue. At the same time the fence could have been exported to a
    third party (for example a sync_fence fd) which will then cause an use-
    after-free on subsequent access.
    
    To make this safe we need to make the driver compliant with the newly
    documented dma-fence rules. Driver has to ensure a RCU grace period
    between signalling a fence and freeing any data pointed to by said fence.
    
    For the timeline name we simply make the queue be freed via kfree_rcu and
    for the shared lock associated with multiple queues we add a RCU grace
    period before freeing the per GT structure holding the lock.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 36e403828da1c008ec882e90d76d706ceff20fde drm-intel
64ab21bd2a3c dma-fence: Add safe access helpers and document the rules
-:18: WARNING:TYPO_SPELLING: 'contraints' may be misspelled - perhaps 'constraints'?
#18: 
contraints and adds helpers which a) drivers with potential to suffer from
^^^^^^^^^^

-:238: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#238: FILE: include/trace/events/dma_fence.h:43:
+DECLARE_EVENT_CLASS(dma_fence_unsignaled,
+

-:243: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#243: FILE: include/trace/events/dma_fence.h:48:
+	TP_STRUCT__entry(

-:250: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#250: FILE: include/trace/events/dma_fence.h:55:
+	TP_fast_assign(

-:263: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#263: FILE: include/trace/events/dma_fence.h:68:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
 

-:271: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#271: FILE: include/trace/events/dma_fence.h:75:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
 

-:280: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#280: FILE: include/trace/events/dma_fence.h:89:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
 

-:288: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#288: FILE: include/trace/events/dma_fence.h:96:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
 

total: 0 errors, 1 warnings, 7 checks, 223 lines checked
b6e66a0b9bf1 sync_file: Protect access to driver and timeline name
dad4b5e18a19 drm/i915: Protect access to driver and timeline name
20c9e2b98c22 drm/xe: Make dma-fences compliant with the safe access rules


