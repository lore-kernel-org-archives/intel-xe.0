Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E26ACAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 06:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180D910E78E;
	Thu,  2 Oct 2025 06:01:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C1610E78E;
 Thu,  2 Oct 2025 06:01:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_DRM_scheduler_layerin?=
 =?utf-8?q?g_violations_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 06:01:12 -0000
Message-ID: <175938487254.385426.9212948375298524369@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251002051604.1865322-1-matthew.brost@intel.com>
In-Reply-To: <20251002051604.1865322-1-matthew.brost@intel.com>
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

Series: Fix DRM scheduler layering violations in Xe
URL   : https://patchwork.freedesktop.org/series/155314/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f68169114399f5a6a4aa710e4123a2ec8a47e9c
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 1 22:16:04 2025 -0700

    drm/xe: Stop abusing DRM scheduler internals
    
    Use new pending job list iterator and new helper functions in Xe to
    avoid reaching into DRM scheduler internals.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5f87abb254011980c8332008cfff72d2cfab4952 drm-intel
3ea8291237e0 drm/sched: Add pending job list iterator
-:60: ERROR:SPACING: space required after that ';' (ctx:VxO)
#60: FILE: include/drm/gpu_scheduler.h:741:
+	     __drm_sched_iter_pending_job_end(_T);,
 	                                         ^

-:62: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#62: FILE: include/drm/gpu_scheduler.h:743:
+	     struct drm_gpu_scheduler * __sched, bool __stopped);

-:76: WARNING:TYPO_SPELLING: 'stoppped' may be misspelled - perhaps 'stopped'?
#76: FILE: include/drm/gpu_scheduler.h:757:
+ * enforcing locking rules (either scheduler fully stoppped or correctly takes
                                                    ^^^^^^^^

-:79: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#79: FILE: include/drm/gpu_scheduler.h:760:
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__job' - possible side-effects?
#79: FILE: include/drm/gpu_scheduler.h:760:
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sched' - possible side-effects?
#79: FILE: include/drm/gpu_scheduler.h:760:
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

-:79: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__entitiy' - possible side-effects?
#79: FILE: include/drm/gpu_scheduler.h:760:
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

-:79: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__entitiy' may be better as '(__entitiy)' to avoid precedence issues
#79: FILE: include/drm/gpu_scheduler.h:760:
+#define drm_sched_for_each_pending_job(__job, __sched, __entitiy, __stopped)	\
+	scoped_guard(drm_sched_iter_pending_job, __sched, __stopped)		\
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

-:81: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#81: FILE: include/drm/gpu_scheduler.h:762:
+	list_for_each_entry(__job, &(__sched)->pending_list, list)		\
+	for_each_if(!__entitiy || (__job)->entity == (__entitiy))

total: 3 errors, 2 warnings, 4 checks, 68 lines checked
50de46faaa3d drm/sched: Add several job helpers to avoid drivers touching scheduler state
22b3e7bd3988 drm/xe: Add dedicated message lock
0f6816911439 drm/xe: Stop abusing DRM scheduler internals


