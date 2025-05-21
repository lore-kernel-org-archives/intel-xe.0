Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67E8C54E90
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 22:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6881F10E031;
	Wed, 21 May 2025 22:48:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E6010E74A;
 Wed, 21 May 2025 22:48:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bo=3A_add_GPU_memo?=
 =?utf-8?q?ry_trace_points_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juston Li" <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 May 2025 22:48:52 -0000
Message-ID: <174786773216.11643.7941372400673753356@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250521224239.856298-1-justonli@chromium.org>
In-Reply-To: <20250521224239.856298-1-justonli@chromium.org>
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

Series: drm/xe/bo: add GPU memory trace points (rev2)
URL   : https://patchwork.freedesktop.org/series/149272/
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
commit 524a3f8db2dba46b53fef8e21ef4acc7cd88c927
Author: Juston Li <justonli@chromium.org>
Date:   Wed May 21 22:42:35 2025 +0000

    drm/xe/bo: add GPU memory trace points
    
    Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
    global and per-process GPU memory usage.
    
    These are required by VSR on Android 12+ for reporting GPU driver memory
    allocations.
    
    v2:
     - Use u64 as preferred by checkpatch (Tvrtko)
     - Fix errors in comments/Kconfig description (Tvrtko)
     - drop redundant "CONFIG_" in Kconfig
    
    Signed-off-by: Juston Li <justonli@chromium.org>
    Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch 1cdbbaf657b0574686c1c15035b370d3fcad7fca drm-intel
524a3f8db2db drm/xe/bo: add GPU memory trace points


