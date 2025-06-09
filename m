Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C4BC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 14:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC110E405;
	Mon,  9 Jun 2025 14:59:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4BD10E3FC;
 Mon,  9 Jun 2025 14:59:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_A_few_drm=5Fsyncobj_optim?=
 =?utf-8?q?isations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 14:59:55 -0000
Message-ID: <174948119557.60673.4648632423747304986@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250609113313.75395-1-tvrtko.ursulin@igalia.com>
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

Series: A few drm_syncobj optimisations
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
commit f158ec20e24258945114bf8cbbd9d79a6bfcb4df
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Jun 9 12:33:13 2025 +0100

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
+ /mt/dim checkpatch 40c78d0f4b5d532ada0e4a0a82bb219397796164 drm-intel
82aded96dc2d drm/syncobj: Remove unhelpful helper
a8008724c118 drm/syncobj: Do not allocate an array to store zeros when waiting
b5f176aae8b1 drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
-:30: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#30: FILE: drivers/gpu/drm/drm_syncobj.c:1244:
+				  uint32_t count,

-:35: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#35: FILE: drivers/gpu/drm/drm_syncobj.c:1248:
+	uint32_t i;

total: 0 errors, 0 warnings, 2 checks, 62 lines checked
aa0b99f2777a drm/syncobj: Use put_user in drm_syncobj_query_ioctl
e770aac554d5 drm/syncobj: Avoid temporary allocation in drm_syncobj_timeline_signal_ioctl
-:27: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#27: FILE: drivers/gpu/drm/drm_syncobj.c:1585:
+	uint64_t __user *points = u64_to_user_ptr(args->points);

-:28: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#28: FILE: drivers/gpu/drm/drm_syncobj.c:1586:
+	uint32_t i, j, count = args->count_handles;

total: 0 errors, 0 warnings, 2 checks, 82 lines checked
15ec48c58316 drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
f158ec20e242 drm/syncobj: Add a fast path to drm_syncobj_array_find
-:65: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#65: FILE: drivers/gpu/drm/drm_syncobj.c:1308:
+				   uint32_t count,

total: 0 errors, 0 warnings, 1 checks, 192 lines checked


