Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B5AC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 05:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D644010E288;
	Tue, 13 Feb 2024 05:29:27 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECACD10E288;
 Tue, 13 Feb 2024 05:29:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fdinfo_shared_stats_=28re?=
 =?utf-8?q?v3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Deucher" <alexander.deucher@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 05:29:25 -0000
Message-ID: <170780216596.1183349.15713387508686938909@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212210428.851952-1-alexander.deucher@amd.com>
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
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

Series: fdinfo shared stats (rev3)
URL   : https://patchwork.freedesktop.org/series/129322/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1a8d6cb72092470c5e2e1c2eb1557d43630bf348
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Mon Feb 12 16:04:28 2024 -0500

    drm/xe: Update shared stats to use the new gem helper
    
    Switch to using the new gem shared memory stats helper
    rather than hand rolling it.
    
    Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+ /mt/dim checkpatch e370df7a4fb4125cb8eee1b00ff1592808ed9786 drm-intel
e7099122f Documentation/gpu: Update documentation on drm-shared-*
ee6b491c2 drm: add drm_gem_object_is_shared_for_memory_stats() helper
9043ac054 drm: update drm_show_memory_stats() for dma-bufs
7603c809c drm/amdgpu: add shared fdinfo stats
-:23: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#23: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:100:
+	drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1024UL);
 	                                                               ^

-:24: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#24: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:101:
+	drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1024UL);
 	                                                             ^

-:25: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#25: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c:102:
+	drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1024UL);
 	                                                             ^

-:80: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#80: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:142:
+	uint64_t vram_shared;

-:86: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#86: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:148:
+	uint64_t gtt_shared;

-:90: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#90: FILE: drivers/gpu/drm/amd/amdgpu/amdgpu_object.h:152:
+	uint64_t cpu_shared;

total: 0 errors, 0 warnings, 6 checks, 64 lines checked
c91195e91 drm/i915: Update shared stats to use the new gem helper
1a8d6cb72 drm/xe: Update shared stats to use the new gem helper


