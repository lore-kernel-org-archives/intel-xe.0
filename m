Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBE7C3ABC5
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 06:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E5810E15C;
	Wed, 14 May 2025 06:12:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D045F10E137;
 Wed, 14 May 2025 06:12:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_=28drm=5Fsched=5F=7C?=
 =?utf-8?q?dma=5F=29fence_lifetime_issues_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 06:12:48 -0000
Message-ID: <174720316885.77415.5886558073672038712@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250513074513.81727-1-tvrtko.ursulin@igalia.com>
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

Series: Some (drm_sched_|dma_)fence lifetime issues (rev2)
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
commit 636b44b647b6b27e867b51f52c3ec750baa05f61
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue May 13 08:45:13 2025 +0100

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
+ /mt/dim checkpatch 4fd790cf2b20fd2ab205aa2a074cecd214562089 drm-intel
ee2b886611c9 dma-fence: Change signature of __dma_fence_is_later
4bc7eb42dffc dma-fence: Use a flag for 64-bit seqnos
1f4fabe8b696 dma-fence: Add helpers for accessing driver and timeline name
8c64a8b5f3b9 sync_file: Use dma-fence driver and timeline name helpers
36f60e347180 drm/amdgpu: Use dma-fence driver and timeline name helpers
-:31: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#31: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:168:
+			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))

-:40: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#40: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h:194:
+			     __string(timeline, dma_fence_timeline_name(&job->base.s_fence->finished))

total: 0 errors, 2 warnings, 0 checks, 33 lines checked
6354406be720 drm/i915: Use dma-fence driver and timeline name helpers
362c28e1835f dma-fence: Add safe access helpers and document the rules
-:18: WARNING:TYPO_SPELLING: 'contraints' may be misspelled - perhaps 'constraints'?
#18: 
contraints and adds helpers which a) drivers with potential to suffer from
^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 134 lines checked
dfcbd6bd374e sync_file: Protect access to driver and timeline name
100fb0599e79 drm/i915: Protect access to driver and timeline name
636b44b647b6 drm/xe: Make dma-fences compliant with the safe access rules


