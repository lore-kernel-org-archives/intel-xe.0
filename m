Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1B1C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 19:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330E1134AF;
	Tue, 30 Jan 2024 19:49:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68B1134AF;
 Tue, 30 Jan 2024 19:49:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_fdinfo_shared_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Deucher, Alexander" <alexander.deucher@amd.com>
Date: Tue, 30 Jan 2024 19:49:30 -0000
Message-ID: <170664417005.824484.12163316756771513692@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: fdinfo shared stats
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
commit 66fdc544c419c5f57ae7e2cad06286f4827a9032
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Jan 30 11:12:35 2024 -0500

    drm/xe: Update shared stats to use the new gem helper
    
    Switch to using the new gem shared memory stats helper
    rather than hand rolling it.
    
    Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+ /mt/dim checkpatch 885282acc78abc72046bfe6cd677f329fc8263cd drm-intel
d6d4419cc Documentation/gpu: Update documentation on drm-shared-*
d915fe995 drm: add drm_gem_object_is_shared_for_memory_stats() helper
-:36: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'obj->handle_count > 1'
#36: FILE: drivers/gpu/drm/drm_gem.c:1520:
+	if ((obj->handle_count > 1) || obj->dma_buf)

total: 0 errors, 0 warnings, 1 checks, 26 lines checked
9eb369cfb drm: update drm_show_memory_stats() for dma-bufs
2a426763c drm/amdgpu: add shared fdinfo stats
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
b31cf6190 drm/i915: Update shared stats to use the new gem helper
66fdc544c drm/xe: Update shared stats to use the new gem helper


