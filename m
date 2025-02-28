Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF9C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 09:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE96510EC43;
	Fri, 28 Feb 2025 09:41:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DE710EC43;
 Fri, 28 Feb 2025 09:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_userptr_rac?=
 =?utf-8?q?es_and_missed_validations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 09:41:23 -0000
Message-ID: <174073568368.3158727.4090734137524454635@b555e5b46a47>
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

Series: drm/xe: Fix userptr races and missed validations (rev2)
URL   : https://patchwork.freedesktop.org/series/145498/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a898eb97d287cfa653a814a80fba61099cc50b7
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
+ /mt/dim checkpatch 1e777b08d64779d75f6ee2059177dbc0d650d831 drm-intel
114b9c2292b0 drm/xe/vm: Validate userptr during gpu vma prefetching
02189da740cd drm/xe/vm: Fix a misplaced #endif
5db7e8ba57f3 drm/xe: Fix fault mode invalidation with unbind
2a898eb97d28 drm/xe: Add staging tree for VM binds


