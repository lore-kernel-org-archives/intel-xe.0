Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509F9D5B84D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 16:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1644610E080;
	Mon, 15 Dec 2025 16:13:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A669D10E067;
 Mon, 15 Dec 2025 16:13:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fair=28er=29_DRM_schedule?=
 =?utf-8?q?r?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 16:13:02 -0000
Message-ID: <176581518256.89561.13037688343080401739@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
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

Series: Fair(er) DRM scheduler
URL   : https://patchwork.freedesktop.org/series/159024/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9f5e7a782b0b7d84bc0344ab9db5ed0be8657474
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Dec 15 15:08:07 2025 +0000

    drm/sched: Remove drm_sched_init_args->num_rqs
    
    Remove member no longer used by the scheduler core and the drivers.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch cf9048712d2211b945ead6f47b6b94a93246dd16 drm-intel
9fe9dece3d76 drm/sched: Consolidate entity run queue management
c40635e8cdb1 drm/sched: Move run queue related code into a separate file
-:344: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#344: 
new file mode 100644

-:349: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#349: FILE: drivers/gpu/drm/scheduler/sched_rq.c:1:
+#include <linux/rbtree.h>

total: 0 errors, 2 warnings, 0 checks, 569 lines checked
d3e7d3cfa54d drm/sched: Add some scheduling quality unit tests
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
    0: prio=normal sync=0 elapsed_ms=1015ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,222,978 us latency_time(min,avg,max)=134,222,978

-:124: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#124: 
new file mode 100644

-:140: WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#140: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:12:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-:561: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#561: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:433:
+	unsigned	cycles;

-:729: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#729: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:601:
+	pr_info(

total: 0 errors, 4 warnings, 1 checks, 704 lines checked
d58a18a6f3be drm/sched: Add some more scheduling quality unit tests
-:25: WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-:54: CHECK:LINE_SPACING: Please don't use multiple blank lines
#54: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:695:
 
+

total: 0 errors, 1 warnings, 1 checks, 201 lines checked
12293e17d1e7 drm/sched: Implement RR via FIFO
0aa1c10765d3 drm/sched: Free all finished jobs at once
8701fd8303e0 drm/sched: Account entity GPU time
-:36: CHECK:LINE_SPACING: Please don't use multiple blank lines
#36: FILE: drivers/gpu/drm/scheduler/sched_entity.c:35:
 
+

-:116: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#116: FILE: drivers/gpu/drm/scheduler/sched_internal.h:23:
+	spinlock_t	lock;

total: 0 errors, 0 warnings, 2 checks, 188 lines checked
6d9216ccd8e7 drm/sched: Remove idle entity from tree
2fdec3faf96b drm/sched: Add fair scheduling policy
-:70: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#70: FILE: drivers/gpu/drm/scheduler/sched_entity.c:141:
+			p = max_t(s32,
+				 (s32)sched_list[0]->num_user_rqs - 1,

-:127: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#127: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default), " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair.");

total: 0 errors, 1 warnings, 1 checks, 384 lines checked
185e72b8f364 drm/sched: Favour interactive clients slightly
cbb16ec3654f drm/sched: Switch default policy to fair
-:37: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#37: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
530689ca4328 drm/sched: Remove FIFO and RR and simplify to a single run queue
1de04c5fd524 drm/sched: Embed run queue singleton into the scheduler
961ac01504cc accel/amdxdna: Remove drm_sched_init_args->num_rqs usage
bfc40b6df26b accel/rocket: Remove drm_sched_init_args->num_rqs usage
6c34c79ce77f accel/ethosu: Remove drm_sched_init_args->num_rqs usage
1c7220abe333 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
a88d0783c432 drm/etnaviv: Remove drm_sched_init_args->num_rqs usage
605f1f21f3a4 drm/imagination: Remove drm_sched_init_args->num_rqs usage
056b702407eb drm/lima: Remove drm_sched_init_args->num_rqs usage
0ab1f053b77a drm/msm: Remove drm_sched_init_args->num_rqs usage
1d060a979c9b drm/nouveau: Remove drm_sched_init_args->num_rqs usage
9391ed348604 drm/panfrost: Remove drm_sched_init_args->num_rqs usage
b6873864d6e1 drm/panthor: Remove drm_sched_init_args->num_rqs usage
b7173535c178 drm/sched: Remove drm_sched_init_args->num_rqs usage
9c67fd2f1c0b drm/v3d: Remove drm_sched_init_args->num_rqs usage
9e8e6d1f6909 drm/xe: Remove drm_sched_init_args->num_rqs usage
9f5e7a782b0b drm/sched: Remove drm_sched_init_args->num_rqs


