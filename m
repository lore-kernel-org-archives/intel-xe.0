Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B6C83F0F
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 10:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F043510E1AA;
	Tue,  8 Jul 2025 10:02:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8F10E0C4;
 Tue,  8 Jul 2025 10:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fair_DRM_scheduler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 10:02:00 -0000
Message-ID: <175196892065.142631.9972995051756614287@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
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

Series: Fair DRM scheduler
URL   : https://patchwork.freedesktop.org/series/151321/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa5cbdbcaaaf9ebf6456bc103d092fd9b0bfa566
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Jul 8 10:51:47 2025 +0100

    drm/sched: Embed run queue singleton into the scheduler
    
    Now that the run queue to scheduler relationship is always 1:1 we can
    embed it (the run queue) directly in the scheduler struct and save on
    some allocation error handling code and such.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 8b32b5509128873da8ecfc06beefcb58927eb50b drm-intel
bba96ecf8efc drm/sched: Add some scheduling quality unit tests
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
    0: prio=normal sync=0 elapsed_ms=1015ms (ideal_ms=1000ms) cycle_time(min,avg,max)=134,222,978 us latency_time(min,avg,max)=134,222,978

-:124: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#124: 
new file mode 100644

-:139: WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#139: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:11:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-:621: WARNING:REPEATED_WORD: Possible repeated word: 'from'
#621: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:493:
+	 * Same job stream from from two clients.

total: 0 errors, 4 warnings, 0 checks, 639 lines checked
c03733fb803d drm/sched: Add some more scheduling quality unit tests
-:25: WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-:54: CHECK:LINE_SPACING: Please don't use multiple blank lines
#54: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:630:
 
+

total: 0 errors, 1 warnings, 1 checks, 197 lines checked
5725a9e029ba drm/sched: Avoid double re-lock on the job free path
c2b5e0d988af drm/sched: Consolidate drm_sched_job_timedout
3677c55a613f drm/sched: Consolidate drm_sched_rq_select_entity_rr
675c8ba6e121 drm/sched: Implement RR via FIFO
bfe64945d5c2 drm/sched: Consolidate entity run queue management
886d457e7ffc drm/sched: Move run queue related code into a separate file
-:284: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#284: 
new file mode 100644

-:289: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#289: FILE: drivers/gpu/drm/scheduler/sched_rq.c:1:
+#include <linux/rbtree.h>

total: 0 errors, 2 warnings, 0 checks, 465 lines checked
ec98d2629035 drm/sched: Free all finished jobs at once
666ac0bb46f8 drm/sched: Account entity GPU time
-:36: CHECK:LINE_SPACING: Please don't use multiple blank lines
#36: FILE: drivers/gpu/drm/scheduler/sched_entity.c:35:
 
+

-:113: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#113: FILE: drivers/gpu/drm/scheduler/sched_internal.h:19:
+	spinlock_t	lock;

total: 0 errors, 0 warnings, 2 checks, 188 lines checked
29cd49c9dab2 drm/sched: Remove idle entity from tree
37818919bf50 drm/sched: Add fair scheduling policy
-:70: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#70: FILE: drivers/gpu/drm/scheduler/sched_entity.c:141:
+			p = max_t(s32,
+				 (s32)sched_list[0]->num_user_rqs - 1,

-:195: WARNING:LONG_LINE: line length of 249 exceeds 100 columns
#195: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");

total: 0 errors, 1 warnings, 1 checks, 248 lines checked
c338098b526e drm/sched: Remove FIFO and RR and simplify to a single run queue
-:304: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#304: FILE: drivers/gpu/drm/scheduler/sched_main.c:1100:
 {
+

total: 0 errors, 0 warnings, 1 checks, 478 lines checked
34ad051ebf79 drm/sched: Queue all free credits in one worker invocation
-:114: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#114: FILE: drivers/gpu/drm/scheduler/sched_main.c:937:
+			job_credits = sched_job->credits = sched->credit_limit;

total: 0 errors, 0 warnings, 1 checks, 181 lines checked
aa5cbdbcaaaf drm/sched: Embed run queue singleton into the scheduler


