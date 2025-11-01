Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8796ECCF9FE
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 02:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16F810E0AE;
	Sat,  1 Nov 2025 02:49:14 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEABF10E0AE;
 Sat,  1 Nov 2025 02:49:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_serialization_on_burs?=
 =?utf-8?q?t_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 01 Nov 2025 02:49:13 -0000
Message-ID: <176196535386.8093.6413929972230274310@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031234050.3043507-1-matthew.brost@intel.com>
In-Reply-To: <20251031234050.3043507-1-matthew.brost@intel.com>
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

Series: Fix serialization on burst of unbinds - v2
URL   : https://patchwork.freedesktop.org/series/156873/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 09aba60f15aa9dbbba0b74b2fdcc6f19a65630e7
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Oct 31 16:40:50 2025 -0700

    drm/xe: Remove last fence dependency check from binds and execs
    
    Eliminate redundant last fence dependency checks in exec and bind jobs,
    as they are now equivalent to xe_exec_queue_is_idle. Simplify the code
    by removing this dead logic.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 089e83683d58db86cc4c69d34fba3a96904e40e1 drm-intel
ea27a5b34ab2 drm/xe: Enforce correct user fence signaling order using
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Signed-of-by:' - perhaps 'Signed-off-by:'?
#19: 
Signed-of-by: Matthew Brost <matthew.brost@intel.com>

-:360: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 278 lines checked
c646042f8dae drm/xe: Attach last fence to TLB invalidation job queues
-:179: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#179: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__i)	\
+	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
+	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)

total: 0 errors, 0 warnings, 1 checks, 225 lines checked
6d0cacf8631a drm/xe: Decouple bind queue last fence from TLB invalidations
-:23: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Hellström <thomas.hellstrom@linux.intel.com'
#23: 
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com

total: 1 errors, 0 warnings, 0 checks, 505 lines checked
3777c63f725f drm/xe: Skip TLB invalidation waits in page fault binds
2c0be0cd36fd drm/xe: Disallow input fences on zero batch execs and zero binds
09aba60f15aa drm/xe: Remove last fence dependency check from binds and execs


