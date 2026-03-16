Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437F5D58B21
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 04:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0842210E213;
	Mon, 16 Mar 2026 04:52:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8BF10E213;
 Mon, 16 Mar 2026 04:52:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_dep_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 04:52:02 -0000
Message-ID: <177363672222.359733.6751089448473456424@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316043255.226352-1-matthew.brost@intel.com>
In-Reply-To: <20260316043255.226352-1-matthew.brost@intel.com>
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

Series: Introduce DRM dep queue
URL   : https://patchwork.freedesktop.org/series/163245/
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
commit 0addcc98864b4015e80378996857ecd76628ef30
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Mar 15 21:32:55 2026 -0700

    drm/panthor: Convert to drm_dep scheduler layer
    
    Replace drm_gpu_scheduler/drm_sched_entity with the drm_dep layer
    (struct drm_dep_queue / struct drm_dep_job) across all Panthor
    submission paths: the CSF queue scheduler and the VM_BIND scheduler.
    
    panthor_sched.c — CSF queue scheduler:
      struct panthor_queue drops the inline struct drm_gpu_scheduler and
      struct drm_sched_entity, replacing them with an embedded struct
      drm_dep_queue q.  The 1:1 scheduler:entity pairing that drm_sched
      required collapses into the single queue object.  queue_run_job() and
      queue_timedout_job() updated to drm_dep signatures and return types.
      queue_timedout_job() guards the reset path so it only fires once;
      returns DRM_DEP_TIMEDOUT_STAT_JOB_SIGNALED.  Stop/start on reset
      updated to drm_dep_queue_stop/start.  The timeout workqueue is
      accessed via drm_dep_queue_timeout_wq() for mod_delayed_work() calls.
      Queue teardown simplified from a multi-step disable_delayed_work_sync
      / entity_destroy / sched_fini sequence to drm_dep_queue_put().
    
      struct panthor_job drops struct drm_sched_job base and struct kref
      refcount in favour of struct drm_dep_job base.  panthor_job_get/put()
      updated to drm_dep_job_get/put().  job_release() becomes the .release
      vfunc on struct drm_dep_job_ops; job_release() body moves to
      job_cleanup() which is called from both the release vfunc and the
      init error path.  drm_sched_job_init replaced with drm_dep_job_init.
      panthor_job_update_resvs() updated to use drm_dep_job_finished_fence()
      instead of sched_job->s_fence->finished.
    
    panthor_mmu.c — VM_BIND scheduler:
      struct panthor_vm drops the inline struct drm_gpu_scheduler and struct
      drm_sched_entity in favour of a heap-allocated struct drm_dep_queue *q.
      The queue is allocated with kzalloc_obj and freed via
      drm_dep_queue_put().  Queue init gains
      DRM_DEP_QUEUE_FLAGS_JOB_PUT_IRQ_SAFE and
      DRM_DEP_QUEUE_FLAGS_BYPASS_SUPPORTED flags appropriate for the VM_BIND
      path.  panthor_vm_bind_run_job() and panthor_vm_bind_timedout_job()
      updated to drm_dep signatures; timedout returns
      DRM_DEP_TIMEDOUT_STAT_JOB_SIGNALED.  panthor_vm_bind_job_release()
      becomes the .release vfunc; the old panthor_vm_bind_job_put() wrapper
      is replaced with drm_dep_job_put().  VM stop/start on reset path and
      destroy path updated to drm_dep_queue_stop/start/put.
      drm_dep_job_finished_fence() used in place of s_fence->finished.
    
    Cc: Boris Brezillon <boris.brezillon@collabora.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: David Airlie <airlied@gmail.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: Liviu Dudau <liviu.dudau@arm.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Steven Price <steven.price@arm.com>
    Cc: Sumit Semwal <sumit.semwal@linaro.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
+ /mt/dim checkpatch f0700a5f37f7cb00aced6fb9a16f86fdf2f493aa drm-intel
34808508881d workqueue: Add interface to teach lockdep to warn on reclaim violations
-:126: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#126: FILE: include/linux/workqueue.h:586:
+extern bool workqueue_is_reclaim_annotated(struct workqueue_struct *wq);

total: 0 errors, 0 warnings, 1 checks, 74 lines checked
4f19843221ed drm/dep: Add DRM dependency queue layer
-:111: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#111: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:111: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#111: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:141: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#141: 
new file mode 100644

-:355: WARNING:MEMORY_BARRIER: memory barrier without comment
#355: FILE: drivers/gpu/drm/dep/drm_dep_fence.c:199:
+	return dma_fence_get(smp_load_acquire(&dfence->parent));

-:1768: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#1768: FILE: drivers/gpu/drm/dep/drm_dep_queue.c:469:
+		if (WARN_ON(DRM_DEP_JOB_FENCE_PREALLOC == f))

-:2978: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#2978: FILE: drivers/gpu/drm/dep/drm_dep_queue.h:26:
+}
+static inline void drm_dep_queue_push_job_end(struct drm_dep_queue *q)

-:3565: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#3565: FILE: include/drm/drm_dep.h:576:
+class_drm_dep_queue_pending_job_iter_lock_ptr(

-:3582: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#3582: FILE: include/drm/drm_dep.h:593:
+#define drm_dep_queue_for_each_pending_job(__job, __q)			\
+	scoped_guard(drm_dep_queue_pending_job_iter, (__q))		\
+		list_for_each_entry((__job), &(__q)->job.pending, pending_link)

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

-:3582: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__q' - possible side-effects?
#3582: FILE: include/drm/drm_dep.h:593:
+#define drm_dep_queue_for_each_pending_job(__job, __q)			\
+	scoped_guard(drm_dep_queue_pending_job_iter, (__q))		\
+		list_for_each_entry((__job), &(__q)->job.pending, pending_link)

total: 2 errors, 4 warnings, 3 checks, 3416 lines checked
663c14512bde drm/xe: Use WQ_MEM_WARN_ON_RECLAIM on all workqueues in the reclaim path
53412ad5b72a drm/xe: Issue GGTT invalidation under lock in ggtt_node_remove
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Signed-by:
#14: 
Signed-by: Matthew Brost <matthew.brost@intel.com>

-:37: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 17 lines checked
e98932b20831 drm/xe: Return fence from xe_sched_job_arm and adjust job references
c21c19f8df2b drm/xe: Convert to DRM dep queue scheduler layer
-:55: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#55: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:55: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#55: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:446: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#446: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:62:
+		  uint32_t hw_submission, long timeout,

-:521: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#521: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, long timeout,

total: 1 errors, 1 warnings, 2 checks, 1272 lines checked
30ad8e3475af drm/xe: Make scheduler message lock IRQ-safe
23ce696501fa drm/xe: Rework exec queue object on top of DRM dep
3cf712bc8329 drm/xe: Enable IRQ job put in DRM dep
87aa7c0041ff drm/xe: Use DRM dep queue kill semantics
f1cd25b53ec0 accel/amdxdna: Convert to drm_dep scheduler layer
-:47: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#47: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:47: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#47: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 391 lines checked
0addcc98864b drm/panthor: Convert to drm_dep scheduler layer
-:63: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#63: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:63: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#63: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 1001 lines checked


