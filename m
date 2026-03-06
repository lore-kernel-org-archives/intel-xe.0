Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0A5FC9EC1
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 23:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E11810EE02;
	Fri,  6 Mar 2026 23:24:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322510EDFF;
 Fri,  6 Mar 2026 23:24:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fair=28er=29_DRM_schedule?=
 =?utf-8?q?r_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 23:24:38 -0000
Message-ID: <177283947890.329328.6363405627575354473@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260306163445.97243-1-tvrtko.ursulin@igalia.com>
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

Series: Fair(er) DRM scheduler (rev2)
URL   : https://patchwork.freedesktop.org/series/159024/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cbf6ae87e837938bf72260ff5ce1caf16bd1cf16
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Mar 6 16:34:45 2026 +0000

    drm/sched: Remove drm_sched_init_args->num_rqs
    
    Remove member no longer used by the scheduler core and the drivers.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
    Acked-by: Danilo Krummrich <dakr@kernel.org>
+ /mt/dim checkpatch fce8d7fb2107068c269b868d51aba5f9cf85998a drm-intel
2149b968e278 drm/sched: Disallow initializing entities with no schedulers
-:12: WARNING:TYPO_SPELLING: 'explictly' may be misspelled - perhaps 'explicitly'?
#12: 
scheduler by explictly rejecting that early.
             ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
d6aec060ced7 drm/sched: Consolidate entity run queue management
f4d2b5fc0886 drm/sched: Move run queue related code into a separate file
-:345: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#345: 
new file mode 100644

-:350: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#350: FILE: drivers/gpu/drm/scheduler/sched_rq.c:1:
+#include <linux/rbtree.h>

total: 0 errors, 2 warnings, 0 checks, 569 lines checked
e810f4ac64c9 drm/sched: Add some scheduling quality unit tests
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
    0: prio=normal sync=0 elapsed_ms=1015ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,222,978 us latency_time(min,avg,max)=134,222,978

-:125: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#125: 
new file mode 100644

-:141: WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#141: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:12:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-:562: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#562: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:433:
+	unsigned	cycles;

-:730: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#730: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:601:
+	pr_info(

total: 0 errors, 4 warnings, 1 checks, 704 lines checked
ceeaa7b96d6b drm/sched: Add some more scheduling quality unit tests
-:25: WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-:55: CHECK:LINE_SPACING: Please don't use multiple blank lines
#55: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:695:
 
+

total: 0 errors, 1 warnings, 1 checks, 201 lines checked
ca65f8d3b130 drm/sched: Implement RR via FIFO
154296f6ee16 drm/sched: Free all finished jobs at once
cc87790a0efa drm/sched: Account entity GPU time
-:61: CHECK:LINE_SPACING: Please don't use multiple blank lines
#61: FILE: drivers/gpu/drm/scheduler/sched_entity.c:35:
 
+

-:83: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#83: FILE: drivers/gpu/drm/scheduler/sched_entity.c:57:
+	stats = kzalloc(sizeof(*stats), GFP_KERNEL);

-:161: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#161: FILE: drivers/gpu/drm/scheduler/sched_internal.h:23:
+	spinlock_t	lock;

total: 0 errors, 1 warnings, 2 checks, 189 lines checked
c34cb730daaa drm/sched: Remove idle entity from tree
d996318a127f drm/sched: Add fair scheduling policy
-:71: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#71: FILE: drivers/gpu/drm/scheduler/sched_entity.c:156:
+			p = max_t(s32,
+				 (s32)sched_list[0]->num_user_rqs - 1,

-:128: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#128: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default), " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair.");

total: 0 errors, 1 warnings, 1 checks, 379 lines checked
024421199d31 drm/sched: Favour interactive clients slightly
fb7c43e06596 drm/sched: Switch default policy to fair
-:38: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#38: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
9c2338d7a37b drm/sched: Remove FIFO and RR and simplify to a single run queue
dc78e516dee9 drm/sched: Embed run queue singleton into the scheduler
5b384e8c8362 accel/amdxdna: Remove drm_sched_init_args->num_rqs usage
7cae7d46af18 accel/rocket: Remove drm_sched_init_args->num_rqs usage
ecde3f9eaf74 accel/ethosu: Remove drm_sched_init_args->num_rqs usage
60d5157608bf drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
d64ebbb16896 drm/etnaviv: Remove drm_sched_init_args->num_rqs usage
ad63c21695ec drm/imagination: Remove drm_sched_init_args->num_rqs usage
2fd3c17be10d drm/lima: Remove drm_sched_init_args->num_rqs usage
abe3f551cbc1 drm/msm: Remove drm_sched_init_args->num_rqs usage
215db0b944c1 drm/nouveau: Remove drm_sched_init_args->num_rqs usage
4a2ee70856f8 drm/panfrost: Remove drm_sched_init_args->num_rqs usage
0a3810c3c348 drm/panthor: Remove drm_sched_init_args->num_rqs usage
f2aa60312ab5 drm/sched: Remove drm_sched_init_args->num_rqs usage
580801c5f3b8 drm/v3d: Remove drm_sched_init_args->num_rqs usage
8b573dc5c265 drm/xe: Remove drm_sched_init_args->num_rqs usage
cbf6ae87e837 drm/sched: Remove drm_sched_init_args->num_rqs


