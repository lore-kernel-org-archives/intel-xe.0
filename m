Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C41CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B32B10E207;
	Fri, 24 Oct 2025 15:53:12 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0E10E207;
 Fri, 24 Oct 2025 15:53:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_serialization_on_burs?=
 =?utf-8?q?t_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 15:53:10 -0000
Message-ID: <176132119092.51928.1437223744487222757@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024152323.1281242-1-matthew.brost@intel.com>
In-Reply-To: <20251024152323.1281242-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/156486/
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
commit f7a2c7d6dddf73fa4de9a55b6b939a5570df2a5d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Oct 24 08:23:23 2025 -0700

    drm/xe: Decouple bind queue last fence from TLB invalidations
    
    Separate the bind queue's last fence to apply only to the bind job,
    rather than combining it with associated TLB invalidation jobs. This
    avoids unnecessary serialization of bind jobs on prior TLB
    invalidations.
    
    Since user fence signaling depends on the completion of both bind and
    TLB invalidation jobs, their fences are merged later in the bind
    pipeline to preserve correct signaling order.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 60a51825a1d699df170dfa797b099112e3a02de4 drm-intel
3fd8a17f0ea7 drm/xe: Add last fence attachment to TLB invalidation job queues
-:150: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#150: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__i)	\
+	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
+	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)

total: 0 errors, 0 warnings, 1 checks, 172 lines checked
f7a2c7d6dddf drm/xe: Decouple bind queue last fence from TLB invalidations
-:220: WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#220: FILE: drivers/gpu/drm/xe/xe_sync.c:339:
+			return &cf->base;
+		} else {

total: 0 errors, 1 warnings, 0 checks, 301 lines checked


