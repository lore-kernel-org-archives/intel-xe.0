Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBEFC3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 18:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B92510E1A8;
	Tue, 20 May 2025 18:43:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EA410E1A8;
 Tue, 20 May 2025 18:43:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/bo=3A_add_GPU_memo?=
 =?utf-8?q?ry_trace_points?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juston Li" <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 18:43:22 -0000
Message-ID: <174776660203.6224.7855448963347406160@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520171650.771258-1-justonli@chromium.org>
In-Reply-To: <20250520171650.771258-1-justonli@chromium.org>
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

Series: drm/xe/bo: add GPU memory trace points
URL   : https://patchwork.freedesktop.org/series/149272/
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
commit 5cb4006098684fe7456ec5718c87131e179c012d
Author: Juston Li <justonli@chromium.org>
Date:   Tue May 20 17:16:20 2025 +0000

    drm/xe/bo: add GPU memory trace points
    
    Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
    global and per-process GPU memory usage.
    
    These are required by VSR on Android 12+ for reporting GPU driver memory
    allocations.
    
    Signed-off-by: Juston Li <justonli@chromium.org>
+ /mt/dim checkpatch 45abc70af791052c25beeb400aece4dab51020cd drm-intel
5cb400609868 drm/xe/bo: add GPU memory trace points
-:55: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#55: FILE: drivers/gpu/drm/xe/xe_bo.c:429:
+	uint64_t global_total_pages =

-:64: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#64: FILE: drivers/gpu/drm/xe/xe_bo.c:438:
+	uint64_t process_mem = atomic64_add_return(size, &xef->process_mem);

total: 0 errors, 0 warnings, 2 checks, 131 lines checked


