Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E03CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 04:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B310E359;
	Thu, 23 Oct 2025 04:18:29 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192F10E359;
 Thu, 23 Oct 2025 04:18:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Disconnect_fences_from_Xe?=
 =?utf-8?q?_module?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 04:18:28 -0000
Message-ID: <176119310858.45219.8576563844648584557@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023040800.970283-1-matthew.brost@intel.com>
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
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

Series: Disconnect fences from Xe module
URL   : https://patchwork.freedesktop.org/series/156388/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca367c85e8be9500c3c0940213ac1a2312765511
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 22 21:08:00 2025 -0700

    drm/xe: Finish disconnect HW fences from module
    
    Be safe when dereferencing fence->xe.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 71929a54e8bb5da291d41a931d80c6c9160073dd drm-intel
b2b012945751 dma-buf: cleanup dma_fence_describe
-:36: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#36: FILE: drivers/dma-buf/dma-fence.c:1012:
+		timeline = driver = signaled = "";

-:42: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 1 checks, 23 lines checked
2dd59cef8cce dma-buf: rework stub fence initialisation
-:66: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 44 lines checked
c557a09594ef dma-buf: protected fence ops by RCU
-:226: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 191 lines checked
7180963aa207 dma-buf: detach fence ops on signal
-:93: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
73a03300d224 dma-buf: inline spinlock for fence protection
-:367: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'x' may be better as '(x)' to avoid precedence issues
#367: FILE: drivers/gpu/drm/drm_writeback.c:84:
+#define fence_to_wb_connector(x) container_of(x->extern_lock, \
 					      struct drm_writeback_connector, \
 					      fence_lock)

-:493: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#493: FILE: include/linux/dma-fence.h:71:
+		spinlock_t *extern_lock;

-:494: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#494: FILE: include/linux/dma-fence.h:72:
+		spinlock_t inline_lock;

-:545: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 3 checks, 426 lines checked
b77a69f9700f dma-buf: use inline lock for the stub fence
-:58: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 39 lines checked
86033617896a dma-buf: use inline lock for the dma-fence-array
-:40: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
b3adab78a864 dma-buf: use inline lock for the dma-fence-chain
-:45: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
3eeefe7be7e9 drm/sched: use inline locks for the drm-sched-fence
-:74: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: "Christian König" <ckoenig.leichtzumerken@gmail.com>' != 'Signed-off-by: Christian König <christian.koenig@amd.com>'

total: 0 errors, 1 warnings, 0 checks, 50 lines checked
66d6e4279f4f dma-fence: Fix selftest
248c9a9ad49f drm/xe: Disconnect the low hanging fences from Xe module
5965479537ce drm/xe: Drop HW fence slab
1934694ddb0b drm/xe: Promote xe_hw_fence_irq to an ref counted object
ca367c85e8be drm/xe: Finish disconnect HW fences from module


