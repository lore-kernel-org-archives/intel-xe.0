Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E7BC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 12:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3AD10EA65;
	Fri, 21 Feb 2025 12:12:34 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5152D10EA63;
 Fri, 21 Feb 2025 12:12:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/sched=3A_Job_queue_pe?=
 =?utf-8?q?ek/pop_helpers_and_struct_job_re-order_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 12:12:33 -0000
Message-ID: <174013995332.461006.6438796377746610873@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250221105038.79665-1-tvrtko.ursulin@igalia.com>
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

Series: drm/sched: Job queue peek/pop helpers and struct job re-order (rev2)
URL   : https://patchwork.freedesktop.org/series/144853/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d78ac561fe44b5a0a8ae1bebbc9a450ea60d6219
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Feb 21 10:50:38 2025 +0000

    drm/sched: Group exported prototypes by object type
    
    Do a bit of house keeping in gpu_scheduler.h by grouping the API by type
    of object it operates on.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch a22ac320a08377d760e73fa530c27782f0b68b6d drm-intel
bfd172ae0ae7 drm/sched: Add internal job peek/pop API
-:73: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#73: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 109 lines checked
0d14807276e0 drm/amdgpu: Pop jobs from the queue more robustly
944b0ca38fdc drm/sched: Remove a hole from struct drm_sched_job
e96bbf919101 drm/sched: Move drm_sched_entity_is_ready to internal header
23fcc803df6b drm/sched: Move internal prototypes to internal header
-:40: CHECK:LINE_SPACING: Please don't use multiple blank lines
#40: FILE: drivers/gpu/drm/scheduler/sched_internal.h:6:
 
+

total: 0 errors, 0 warnings, 1 checks, 100 lines checked
d78ac561fe44 drm/sched: Group exported prototypes by object type


