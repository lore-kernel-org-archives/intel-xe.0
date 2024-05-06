Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEE4C25B5C
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 11:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456F10EF9F;
	Mon,  6 May 2024 11:14:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7482710EE94;
 Mon,  6 May 2024 11:14:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_More_fb_pinning?=
 =?utf-8?q?_optimizations=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 11:14:39 -0000
Message-ID: <171499407947.1939725.14741506747820432042@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506103604.146146-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240506103604.146146-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: More fb pinning optimizations.
URL   : https://patchwork.freedesktop.org/series/133227/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9afe94b23060c1c2814d3ae55fd04d8bead50de0
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon May 6 12:36:04 2024 +0200

    drm/xe/display: Re-use display vmas when possible
    
    i915 has this really nice, infrastructure where everything becomes
    complicated, GGTT needs eviction, etc..
    
    Lets not do that, and make the dumbest possible interface instead.
    Try to retrieve the VMA from old_plane_state, or intel_fbdev if kernel
    fb.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 5a43da669cdb9b8df66e32a661b09cd9c52e35f2 drm-intel
7fcfe1788f78 drm/xe: Remove safety check from __xe_ttm_stolen_io_mem_reserve_stolen
9d395436a31c drm/xe/display: Preparations for preallocating dpt bo
9cad23d0d509 drm/xe: Use simple xchg to cache DPT
9afe94b23060 drm/xe/display: Re-use display vmas when possible
-:175: ERROR:CODE_INDENT: code indent should use tabs where possible
#175: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:457:
+^I            sizeof(new_plane_state->view.gtt))) {$

total: 1 errors, 0 warnings, 0 checks, 157 lines checked


