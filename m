Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B219C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 14:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F38110E693;
	Wed, 11 Jun 2025 14:37:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6AB10E69B;
 Wed, 11 Jun 2025 14:37:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_A_few_drm=5Fsyncobj_optim?=
 =?utf-8?q?isations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 14:37:39 -0000
Message-ID: <174965265923.67801.11121453847347317999@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
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

Series: A few drm_syncobj optimisations (rev3)
URL   : https://patchwork.freedesktop.org/series/149983/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b559824069e1a4aedf6cd3176350d238f1097157
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Jun 11 15:00:57 2025 +0100

    drm/syncobj: Add a fast path to drm_syncobj_array_find
    
    Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
    is relatively hot, but the 97% of the calls are for a single object. (~3%
    for two points, and never more than three points. While a more trivial
    workload like vkmark under Plasma is even more skewed to single point
    lookups.)
    
    Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
    pre-allocated stack array for those cases.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Reviewed-by: Maíra Canal <mcanal@igalia.com>
+ /mt/dim checkpatch 441e516a4359fedd83969b1b6a75194f096c11ba drm-intel
efc676cf41bc drm/syncobj: Remove unhelpful helper
111137eabe70 drm/syncobj: Do not allocate an array to store zeros when waiting
32cfb8848c30 drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
-:30: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#30: FILE: drivers/gpu/drm/drm_syncobj.c:1241:
+				  uint32_t count,

-:35: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#35: FILE: drivers/gpu/drm/drm_syncobj.c:1245:
+	uint32_t i;

total: 0 errors, 0 warnings, 2 checks, 62 lines checked
bc154e285bd3 drm/syncobj: Avoid temporary allocation in drm_syncobj_timeline_signal_ioctl
-:27: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#27: FILE: drivers/gpu/drm/drm_syncobj.c:1582:
+	uint64_t __user *points = u64_to_user_ptr(args->points);

-:28: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#28: FILE: drivers/gpu/drm/drm_syncobj.c:1583:
+	uint32_t i, j, count = args->count_handles;

total: 0 errors, 0 warnings, 2 checks, 77 lines checked
7c12a8727a50 drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
b559824069e1 drm/syncobj: Add a fast path to drm_syncobj_array_find
-:65: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#65: FILE: drivers/gpu/drm/drm_syncobj.c:1309:
+				   uint32_t count,

total: 0 errors, 0 warnings, 1 checks, 192 lines checked


