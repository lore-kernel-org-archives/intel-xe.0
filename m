Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28814C83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 15:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83C310E955;
	Thu, 24 Jul 2025 15:31:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA7610E3F0;
 Thu, 24 Jul 2025 15:31:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fair_DRM_scheduler_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 15:31:12 -0000
Message-ID: <175337107295.187679.10555881421861606056@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
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

Series: Fair DRM scheduler (rev2)
URL   : https://patchwork.freedesktop.org/series/151321/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c72b95a54870bf9038bdf08a86f0ffda7316bb63
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 24 15:19:21 2025 +0100

    drm/sched: Embed run queue singleton into the scheduler
    
    Now that the run queue to scheduler relationship is always 1:1 we can
    embed it (the run queue) directly in the scheduler struct and save on
    some allocation error handling code and such.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 2fe30dbc18cd98a593fa26398fe0147381ca716a drm-intel
5a66905b6282 drm/sched: Add some scheduling quality unit tests
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
    0: prio=normal sync=0 elapsed_ms=1015ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,222,978 us latency_time(min,avg,max)=134,222,978

-:124: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#124: 
new file mode 100644

-:140: WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#140: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:12:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-:630: WARNING:REPEATED_WORD: Possible repeated word: 'from'
#630: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:502:
+	 * Same job stream from from two clients.

total: 0 errors, 4 warnings, 0 checks, 648 lines checked
606dd2efa10d drm/sched: Add some more scheduling quality unit tests
-:25: WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-:54: CHECK:LINE_SPACING: Please don't use multiple blank lines
#54: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:639:
 
+

total: 0 errors, 1 warnings, 1 checks, 197 lines checked
341b6171e03f drm/sched: Implement RR via FIFO
8ad766ff30ae drm/sched: Consolidate entity run queue management
546efb148873 drm/sched: Move run queue related code into a separate file
-:289: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#289: 
new file mode 100644

-:294: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#294: FILE: drivers/gpu/drm/scheduler/sched_rq.c:1:
+#include <linux/rbtree.h>

total: 0 errors, 2 warnings, 0 checks, 475 lines checked
084d90032758 drm/sched: Free all finished jobs at once
5747d040b768 drm/sched: Account entity GPU time
-:36: CHECK:LINE_SPACING: Please don't use multiple blank lines
#36: FILE: drivers/gpu/drm/scheduler/sched_entity.c:35:
 
+

-:113: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#113: FILE: drivers/gpu/drm/scheduler/sched_internal.h:19:
+	spinlock_t	lock;

total: 0 errors, 0 warnings, 2 checks, 188 lines checked
f7c49bb242a9 drm/sched: Remove idle entity from tree
1b13cde4a9ab drm/sched: Add fair scheduling policy
-:70: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#70: FILE: drivers/gpu/drm/scheduler/sched_entity.c:141:
+			p = max_t(s32,
+				 (s32)sched_list[0]->num_user_rqs - 1,

-:127: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#127: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");

total: 0 errors, 1 warnings, 1 checks, 330 lines checked
51d0aed23fef drm/sched: Break submission patterns with some randomness
-:69: ERROR:INITIALISED_STATIC: do not initialise statics to 0
#69: FILE: drivers/gpu/drm/scheduler/sched_rq.c:152:
+			static bool r = 0;

total: 1 errors, 0 warnings, 0 checks, 16 lines checked
2dd4b5d314ed drm/sched: Remove FIFO and RR and simplify to a single run queue
-:304: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#304: FILE: drivers/gpu/drm/scheduler/sched_main.c:1145:
 {
+

total: 0 errors, 0 warnings, 1 checks, 524 lines checked
c72b95a54870 drm/sched: Embed run queue singleton into the scheduler


