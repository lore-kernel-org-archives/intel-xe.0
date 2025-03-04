Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E84C021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 19:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16AA10E473;
	Tue,  4 Mar 2025 19:31:28 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313710E473;
 Tue,  4 Mar 2025 19:31:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_userptr_rac?=
 =?utf-8?q?es_and_missed_validations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 19:31:27 -0000
Message-ID: <174111668759.709723.14146164124540351252@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/xe: Fix userptr races and missed validations (rev3)
URL   : https://patchwork.freedesktop.org/series/145498/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0e065e7fc7a503d5e87f2d2781c5e1fc719d16dd
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 96c2e45067f77729ca913d5e1baaffa3a98bf6dd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Feb 28 08:30:58 2025 +0100

    drm/xe: Add staging tree for VM binds
    
    Concurrent VM bind staging and zapping of PTEs from a userptr notifier
    do not work because the view of PTEs is not stable. VM binds cannot
    acquire the notifier lock during staging, as memory allocations are
    required. To resolve this race condition, use a staging tree for VM
    binds that is committed only under the userptr notifier lock during the
    final step of the bind. This ensures a consistent view of the PTEs in
    the userptr notifier.
    
    A follow up may only use staging for VM in fault mode as this is the
    only mode in which the above race exists.
    
    v3:
     - Drop zap PTE change (Thomas)
     - s/xe_pt_entry/xe_pt_entry_staging (Thomas)
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: <stable@vger.kernel.org>
    Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
    Fixes: a708f6501c69 ("drm/xe: Update PT layer with better error handling")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch ff2d693d88726e29a1d87291105135c31c21fa26 drm-intel
5cadb1c9c24b drm/xe/vm: Validate userptr during gpu vma prefetching
afbc5c264991 drm/xe/vm: Fix a misplaced #endif
2f1e5efe2ce2 drm/xe: Fix fault mode invalidation with unbind
96c2e45067f7 drm/xe: Add staging tree for VM binds


