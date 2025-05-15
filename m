Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5488EC2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 10:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC6F10E830;
	Thu, 15 May 2025 10:48:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62710E82F;
 Thu, 15 May 2025 10:48:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_=28drm=5Fsched=5F=7C?=
 =?utf-8?q?dma=5F=29fence_lifetime_issues_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 10:48:14 -0000
Message-ID: <174730609451.84248.12953105165886272705@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
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

Series: Some (drm_sched_|dma_)fence lifetime issues (rev3)
URL   : https://patchwork.freedesktop.org/series/148825/
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
commit 6b1ffa111678313d9014631a8b4ddc1d9b637716
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu May 15 10:50:04 2025 +0100

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
+ /mt/dim checkpatch fbf1cb830ae7cca1f6094630da357a8418596a5b drm-intel
a02caf874c03 dma-fence: Change signature of __dma_fence_is_later
bf8f01a172bf dma-fence: Use a flag for 64-bit seqnos
-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/dma-buf/dma-fence.c:994:
+^I         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)$

-:56: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#56: FILE: drivers/dma-buf/dma-fence.c:994:
+__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
+	         spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)

-:58: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#58: FILE: drivers/dma-buf/dma-fence.c:996:
+	BUG_ON(!lock);

-:59: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#59: FILE: drivers/dma-buf/dma-fence.c:997:
+	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);

total: 1 errors, 2 warnings, 1 checks, 176 lines checked
577c404ffa86 dma-fence: Add helpers for accessing driver and timeline name
0feb5d5bbff0 sync_file: Use dma-fence driver and timeline name helpers
cec34290a3cd drm/i915: Use dma-fence driver and timeline name helpers
847ac0aea662 dma-fence: Add safe access helpers and document the rules
-:18: WARNING:TYPO_SPELLING: 'contraints' may be misspelled - perhaps 'constraints'?
#18: 
contraints and adds helpers which a) drivers with potential to suffer from
^^^^^^^^^^

-:232: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#232: FILE: include/trace/events/dma_fence.h:43:
+DECLARE_EVENT_CLASS(dma_fence_unsignaled,
+

-:237: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#237: FILE: include/trace/events/dma_fence.h:48:
+	TP_STRUCT__entry(

-:244: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#244: FILE: include/trace/events/dma_fence.h:55:
+	TP_fast_assign(

-:257: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#257: FILE: include/trace/events/dma_fence.h:68:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
 

-:265: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#265: FILE: include/trace/events/dma_fence.h:75:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
 

-:274: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#274: FILE: include/trace/events/dma_fence.h:89:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
 

-:282: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#282: FILE: include/trace/events/dma_fence.h:96:
+DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
 

total: 0 errors, 1 warnings, 7 checks, 218 lines checked
52d641f3807b sync_file: Protect access to driver and timeline name
727517d78f40 drm/i915: Protect access to driver and timeline name
6b1ffa111678 drm/xe: Make dma-fences compliant with the safe access rules


