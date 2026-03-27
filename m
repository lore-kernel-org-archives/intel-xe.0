Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25EF10BA43C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 08:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B8B10E35C;
	Fri, 27 Mar 2026 08:26:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6C910E0E3;
 Fri, 27 Mar 2026 08:26:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_reclaim_to_the_dmem_c?=
 =?utf-8?q?group_controller?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 08:26:00 -0000
Message-ID: <177459996003.404950.14241092905315733700@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327081600.4885-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260327081600.4885-1-thomas.hellstrom@linux.intel.com>
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

Series: Add reclaim to the dmem cgroup controller
URL   : https://patchwork.freedesktop.org/series/163970/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 15b809cf5f895b449941f471fd9df6958021d555
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Mar 27 09:16:00 2026 +0100

    drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
    
    Register the VRAM manager with the dmem cgroup reclaim infrastructure
    so that lowering dmem.max below current VRAM usage triggers TTM
    eviction rather than failing with -EBUSY.
    
    Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
    as the TTM reclaim path passes a NULL place in cgroup drain mode.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch a748e8ef327c92c865410957509417b30f026304 drm-intel
5396b03267e5 cgroup/dmem: Return error when setting max below current usage
-:14: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 44 lines checked
4906968a231c cgroup/dmem: Add reclaim callback for lowering max below current usage
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#22: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#22: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 165 lines checked
34a61b9a5a27 drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
-:26: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:26: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:127: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#127: FILE: drivers/gpu/drm/ttm/ttm_bo.c:679:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 1 errors, 1 warnings, 1 checks, 207 lines checked
0571172946e7 drm/xe: Wire up dmem cgroup reclaim for VRAM manager
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#13: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 31 lines checked
15b809cf5f89 drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 1 errors, 1 warnings, 0 checks, 29 lines checked


