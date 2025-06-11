Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA39C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 23:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EAB10E750;
	Wed, 11 Jun 2025 23:50:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65E310E750;
 Wed, 11 Jun 2025 23:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_gpu/trace=3A_make_TRACE=5FGPU=5FMEM_configurable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juston Li" <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 23:50:41 -0000
Message-ID: <174968584193.69531.17715248066286379640@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611225145.1739201-1-justonli@chromium.org>
In-Reply-To: <20250611225145.1739201-1-justonli@chromium.org>
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

Series: series starting with [v4,1/2] gpu/trace: make TRACE_GPU_MEM configurable
URL   : https://patchwork.freedesktop.org/series/150125/
State : success

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
commit 80599d52a570a8ba5efc3c4fbafe885b657ec27c
Author: Juston Li <justonli@chromium.org>
Date:   Wed Jun 11 15:51:24 2025 -0700

    drm/xe/bo: add GPU memory trace points
    
    Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
    memory usage.
    
    These are required by VSR on Android 12+ for reporting GPU driver memory
    allocations.
    
    v3:
     - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
       per-driver Kconfig (Lucas)
    
    v2:
     - Use u64 as preferred by checkpatch (Tvrtko)
     - Fix errors in comments/Kconfig description (Tvrtko)
     - drop redundant "CONFIG" in Kconfig
    
    Signed-off-by: Juston Li <justonli@chromium.org>
    Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b drm-intel
3d47da7f1952 gpu/trace: make TRACE_GPU_MEM configurable
80599d52a570 drm/xe/bo: add GPU memory trace points


