Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B769CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 20:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E081710E349;
	Thu, 16 Oct 2025 20:55:24 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A896510E349;
 Thu, 16 Oct 2025 20:55:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_DRM_scheduler_layerin?=
 =?utf-8?q?g_violations_in_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 20:55:23 -0000
Message-ID: <176064812368.23602.5343741302379811056@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016204826.284077-1-matthew.brost@intel.com>
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
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

Series: Fix DRM scheduler layering violations in Xe (rev3)
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
commit 7aafb4b1d67f2a1f3cf5ece9403ed23bd8525235
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Oct 16 13:48:26 2025 -0700

    drm/xe: Only toggle scheduling in TDR if GuC is running
    
    If the firmware is not running during TDR (e.g., when the driver is
    unloading), there's no need to toggle scheduling in the GuC. In such
    cases, skip this step.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1f32baee68e7a3010d6092c3303516354f7b2298 drm-intel
373c2a0263bd drm/sched: Add pending job list iterator
-:72: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#72: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

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

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__job' - possible side-effects?
#72: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sched' - possible side-effects?
#72: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:72: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__entity' - possible side-effects?
#72: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

total: 1 errors, 0 warnings, 3 checks, 56 lines checked
38ce964a0a6a drm/sched: Add several job helpers to avoid drivers touching scheduler state
df6d14c1e2fc drm/xe: Add dedicated message lock
cd167e8c3001 drm/xe: Stop abusing DRM scheduler internals
a8cf1d3e7a32 drm/xe: Do not deregister queues in TDR
ab6b79ce99a0 drm/xe: Remove special casing for LR queues in submission
7aafb4b1d67f drm/xe: Only toggle scheduling in TDR if GuC is running


