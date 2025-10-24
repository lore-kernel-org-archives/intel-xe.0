Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA314CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D62710E013;
	Fri, 24 Oct 2025 22:27:17 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB21610E013;
 Fri, 24 Oct 2025 22:27:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_serialization_on_burs?=
 =?utf-8?q?t_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 22:27:16 -0000
Message-ID: <176134483669.54054.9870183309115034172@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024222047.1481039-1-matthew.brost@intel.com>
In-Reply-To: <20251024222047.1481039-1-matthew.brost@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/156517/
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
commit 37d4dcdf92255232641a0b6f6d6bda1baba598ad
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Oct 24 15:20:47 2025 -0700

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
+ /mt/dim checkpatch d827507f9c3c65785556819d50eb5131b2bf6a3a drm-intel
a2148260232b drm/xe: Add last fence attachment to TLB invalidation job queues
-:152: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__i' - possible side-effects?
#152: FILE: drivers/gpu/drm/xe/xe_exec_queue.h:17:
+#define for_each_tlb_inval(__i)	\
+	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
+	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)

total: 0 errors, 0 warnings, 1 checks, 174 lines checked
37d4dcdf9225 drm/xe: Decouple bind queue last fence from TLB invalidations


