Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88425CD98D6
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DCC10EF03;
	Thu, 11 Jun 2026 12:45:47 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E8010EF11;
 Thu, 11 Jun 2026 12:45:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Replace_comp?=
 =?utf-8?q?letion_with_a_flush?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 12:45:45 -0000
Message-ID: <178118194553.68367.12760426103230728025@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611123423.39819-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260611123423.39819-1-tvrtko.ursulin@igalia.com>
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

Series: drm/sched: Replace completion with a flush
URL   : https://patchwork.freedesktop.org/series/168353/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 049c82d838220ce4824540e7d4a2588e6b8282c1
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jun 11 13:34:23 2026 +0100

    drm/sched: Replace completion with a flush
    
    Due the scheduler locking design, and the inability to always lock both
    the entity and the run-queue in the consistent order, a completion exists
    which effectively marks the entity as in use from a call path which is not
    able to lock it.
    
    When entity is selected from the run job worker, its completion is marked
    as non-idle all until the code is sure it will not be dereferencing it any
    more, at which point it signals it as idle, releasing the potential
    parallel cleanup path.
    
    We can remove the need for this completion by implementing the identical
    guarantee by simply flushing the run job work from the cleanup path, after
    having removed the entity from the run queue.
    
    We then know that the entity is no longer reachable by the run queue
    selection logic, so as soon as any pending work is done the cleanup can
    safely proceed. And because we have marked the entity as stopped, we also
    know that the entity cannot re-enter the run queue.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
    Cc: amd-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
+ /mt/dim checkpatch cea7f67c2db10faab5c62646dc91a335c2addb27 drm-intel
049c82d83822 drm/sched: Replace completion with a flush
-:89: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#89: FILE: drivers/gpu/drm/scheduler/sched_entity.c:586:
+
+	}

total: 0 errors, 0 warnings, 1 checks, 149 lines checked


