Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E5C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B880910E031;
	Mon, 16 Jun 2025 07:12:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A0510E031;
 Mon, 16 Jun 2025 07:12:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Opportunistically_skip_TL?=
 =?utf-8?q?B_invalidaion_on_unbind_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Jun 2025 07:12:53 -0000
Message-ID: <175005797395.80934.15218359683542572983@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250616063024.2059829-1-matthew.brost@intel.com>
In-Reply-To: <20250616063024.2059829-1-matthew.brost@intel.com>
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

Series: Opportunistically skip TLB invalidaion on unbind (rev2)
URL   : https://patchwork.freedesktop.org/series/150257/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b666efe99091c74cda10d172c296943ae4693a47
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Sun Jun 15 23:30:24 2025 -0700

    drm/xe: Opportunistically skip TLB invalidaion on unbind
    
    If a range or VMA is invalidated and scratch page is disabled, there
    is no reason to issue a TLB invalidation on unbind, skip TLB
    innvalidation is this condition is true. This is an opportunistic check
    as it is done without the notifier lock, thus it possible for the range
    to be invalidated after this check is performed.
    
    This should improve performance of the SVM garbage collector, for
    example, xe_exec_system_allocator --r many-stride-new-prefetch, went
    ~20s to ~9.5s on a BMG.
    
    v2:
     - Use helper for valid check (Thomas)
    v3:
     - Avoid skipping TLB invalidation if PTEs are removed at a higher
       level than the range
     - Never skip TLB invalidations for VMA
     - Drop Himal's RB
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3449755a2544ecd7b6b2c81bafd992596ac7a086 drm-intel
9aacf1ccf37b drm/xe: Add xe_vm_has_valid_gpu_mapping helper
-:143: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'tile' may be better as '(tile)' to avoid precedence issues
#143: FILE: drivers/gpu/drm/xe/xe_vm.h:394:
+#define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
+	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))

total: 0 errors, 0 warnings, 1 checks, 102 lines checked
b666efe99091 drm/xe: Opportunistically skip TLB invalidaion on unbind


