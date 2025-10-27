Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C94CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEBE10E547;
	Mon, 27 Oct 2025 18:33:16 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77B210E547;
 Mon, 27 Oct 2025 18:33:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_serialization_on_burs?=
 =?utf-8?q?t_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 18:33:14 -0000
Message-ID: <176158999487.59673.3287155950077649475@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027182737.2358096-1-matthew.brost@intel.com>
In-Reply-To: <20251027182737.2358096-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/156606/
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
commit 9da96369df122f71cc08cd1d093551b842f676af
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 27 11:27:37 2025 -0700

    drm/xe: Remove last fence dependecy check from binds
    
    The last fence dependency check for binds is now equivalent to
    xe_exec_queue_is_idle and is redundant, so remove this dead code.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a8f3783a2ccf78b04e48cf235f03629b80ffa3e0 drm-intel
95fe6436443c drm/xe: Add last fence attachment to TLB invalidation job queues
-:169: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#169: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__i)	\
+	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
+	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)

total: 0 errors, 0 warnings, 1 checks, 223 lines checked
26a4087ca598 drm/xe: Decouple bind queue last fence from TLB invalidations
59e5ded2429a drm/xe: Do not wait on TLB invalidations in page fault binds
7f8d734b767f drm/xe: Don't allow in fences on zero batch exec or zero binds
9da96369df12 drm/xe: Remove last fence dependecy check from binds


