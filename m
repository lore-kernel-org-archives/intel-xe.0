Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4FFCCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 21:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3559D10E356;
	Tue, 21 Oct 2025 21:56:52 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD5410E356;
 Tue, 21 Oct 2025 21:56:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enforce_DRM_scheduler_rec?=
 =?utf-8?q?laim_rules?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 21:56:50 -0000
Message-ID: <176108381044.37900.4775879858860891924@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021213952.746900-1-matthew.brost@intel.com>
In-Reply-To: <20251021213952.746900-1-matthew.brost@intel.com>
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

Series: Enforce DRM scheduler reclaim rules
URL   : https://patchwork.freedesktop.org/series/156283/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5f598983400229ce2e030c77c3a0bf4deff3cf9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Oct 21 14:39:52 2025 -0700

    drm/sched: Prevent adding dependencies to an armed job
    
    According to the DMA scheduler documentation, once a job is armed, it
    must be pushed. Drivers should avoid calling the failing code path that
    attempts to add dependencies after a job has been armed. This change
    enforces that rule.
    
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
3dd7c3f7c08f workqueue: Add an interface to taint workqueue lockdep with reclaim
-:24: CHECK:LINE_SPACING: Please don't use multiple blank lines
#24: FILE: include/linux/workqueue.h:556:
 
+

-:35: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#35: FILE: include/linux/workqueue.h:567:
+extern void taint_reclaim_workqueue(struct workqueue_struct *wq, gfp_t gfp);

total: 0 errors, 0 warnings, 2 checks, 40 lines checked
111dbb83a4b6 drm/sched: Taint workqueues with reclaim
a5f598983400 drm/sched: Prevent adding dependencies to an armed job


