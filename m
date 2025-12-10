Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E8D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 10:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9276C10E393;
	Wed, 10 Dec 2025 10:38:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D6010E393;
 Wed, 10 Dec 2025 10:38:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_DRM_sched_support_fun?=
 =?utf-8?q?ctions_to_avoid_driver_side_layering_violations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 10:38:14 -0000
Message-ID: <176536309487.73489.5826562081031423883@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209200039.1366764-1-matthew.brost@intel.com>
In-Reply-To: <20251209200039.1366764-1-matthew.brost@intel.com>
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

Series: Add DRM sched support functions to avoid driver side layering violations (rev2)
URL   : https://patchwork.freedesktop.org/series/158714/
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
commit 823258fe5217bcf35b604ee64437f66d88c905f2
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 9 12:00:39 2025 -0800

    drm/sched: Add pending job list iterator
    
    Stop open coding pending job list in drivers. Add pending job list
    iterator which safely walks DRM scheduler list asserting DRM scheduler
    is stopped.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 2a9deeb5c3fd4dddbed361f10b26ce567072a985 drm-intel
65ee51ac8e4b drm/sched: Add several job helpers to avoid drivers touching scheduler state
823258fe5217 drm/sched: Add pending job list iterator
-:81: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#81: FILE: include/drm/gpu_scheduler.h:748:
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

-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__job' - possible side-effects?
#81: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__sched' - possible side-effects?
#81: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

-:81: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__entity' - possible side-effects?
#81: FILE: include/drm/gpu_scheduler.h:748:
+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
+			for_each_if(!(__entity) || (__job)->entity == (__entity))

total: 1 errors, 0 warnings, 3 checks, 64 lines checked


