Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA49CD5BAC
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 10:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0D610E039;
	Sat, 23 May 2026 10:39:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5460D10E02A;
 Sat, 23 May 2026 10:39:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Assign_queue_na?=
 =?utf-8?q?me_in_time_for_drm=5Fsched=5Finit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 May 2026 10:39:49 -0000
Message-ID: <177953278934.2445.2532899116280311506@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260523103418.61832-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260523103418.61832-1-tvrtko.ursulin@igalia.com>
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

Series: drm/xe: Assign queue name in time for drm_sched_init (rev2)
URL   : https://patchwork.freedesktop.org/series/167105/
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
commit 8c16aa682f632a33f719f81beb683313d4dcd9f5
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Sat May 23 11:34:18 2026 +0100

    drm/xe: Assign queue name in time for drm_sched_init
    
    Currently the queue name is only assigned after the drm scheduler instance
    has been created. This loses information with all logging or debug
    workqueue facilities so lets re-order things a bit so the name gets
    assigned in time.
    
    To be able to assign a GuC ID early we split the allocation into
    reservation and publish phases.
    
    First, with the submission state lock held, we reserve the ID in the GuC
    ID manager, which serves as an authoritative source of truth. Then we can
    drop the lock and reserve entries in the exec queue lookup XArray. This
    can be lockless since the NULL entries are invisible both to the kernel
    and userspace. Only after the queue has been fully created we replace the
    reserved entries with the queue pointer, which can be done locklessly for
    single width queues.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch ca274c47b66d01ca8986007a2d7d395aa5cf247f drm-intel
8c16aa682f63 drm/xe: Assign queue name in time for drm_sched_init
-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:447:
+		ret = xa_insert(&guc->submission_state.exec_queue_lookup,
+				 q->guc->id + i, NULL, GFP_KERNEL);

total: 0 errors, 0 warnings, 1 checks, 142 lines checked


