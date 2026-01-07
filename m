Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33422CFD62D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 13:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA57F10E5E3;
	Wed,  7 Jan 2026 13:50:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8C910E5E4;
 Wed,  7 Jan 2026 13:50:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Simplify_idl?=
 =?utf-8?q?e_entity_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Jan 2026 13:50:00 -0000
Message-ID: <176779380069.132701.1617035706046400134@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
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

Series: drm/sched: Simplify idle entity check
URL   : https://patchwork.freedesktop.org/series/159736/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 593ab82421ca30cd18cd653df4080fa9209aa470
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Jan 7 13:44:05 2026 +0000

    drm/sched: Simplify idle entity check
    
    drm_sched_entity_is_idle() is called when flushing the entity before
    destroying it and currently decides on the idle status based either on
    number of jobs in its queue being zero, or whether the entity is not part
    of any run-queue.
    
    If entity is not part of a run-queue it is implied it can have no jobs in
    its queue, from which it follows it is redundant to look at the both and
    we can simplify to only look at the queue.
    
    The list_empty() check was added in
    a875f58e237a ("drm/scheduler: stop setting rq to NULL")
    where it replaced the entity->rq check which was added in
    741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").
    
    Since for the submit race involving exiting entities, explicit handling
    via entity->stopped was added soon after in
    62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")
    it indeed looks we are safe to remove the list_empty() check.
    
    This mean we can remove the memory barrier as well and fewer memory
    barriers the better.
    
    While at it, we add READ_ONCE annotation on the entity->stopped check to
    mark the unlocked read.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 77ca0c5f244b2796408d20cf3c0741094304e09f drm-intel
593ab82421ca drm/sched: Simplify idle entity check
-:19: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit a875f58e237a ("drm/scheduler: stop setting rq to NULL")'
#19: 
a875f58e237a ("drm/scheduler: stop setting rq to NULL")

-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").

-:21: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)")'
#21: 
741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").

-:25: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")'
#25: 
62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")

total: 3 errors, 1 warnings, 0 checks, 16 lines checked


