Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CD2FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 07:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33E210EA37;
	Tue, 28 Apr 2026 07:38:25 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981D10EA37;
 Tue, 28 Apr 2026 07:38:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_reclaim_to_the_dmem_c?=
 =?utf-8?q?group_controller_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 07:38:24 -0000
Message-ID: <177736190467.17344.13918284234494402905@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428073116.15687-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260428073116.15687-1-thomas.hellstrom@linux.intel.com>
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

Series: Add reclaim to the dmem cgroup controller (rev2)
URL   : https://patchwork.freedesktop.org/series/163970/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 741a1588f644e57de14683f293aefb827bc4e65c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Apr 28 09:31:16 2026 +0200

    drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
    
    Register the VRAM manager with the dmem cgroup reclaim infrastructure
    so that lowering dmem.max below current VRAM usage triggers TTM
    eviction rather than failing with -EBUSY.
    
    Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
    as the TTM reclaim path passes a NULL place in cgroup drain mode.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch aea2c496abcf55b647c14fe720bfc4ea555aac6a drm-intel
d04bda77b402 cgroup/dmem: Add reclaim callback for lowering max below current usage
-:33: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#33: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 154 lines checked
001ae3695590 drm/ttm: Hook up a cgroup-aware reclaim callback for the dmem controller
-:26: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-:127: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#127: FILE: drivers/gpu/drm/ttm/ttm_bo.c:679:
+	evict_walk.try_low = evict_walk.hit_low = false;

total: 0 errors, 1 warnings, 1 checks, 207 lines checked
e1418b9dff32 drm/xe: Wire up dmem cgroup reclaim for VRAM manager
-:13: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#13: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
741a1588f644 drm/amdgpu: Wire up dmem cgroup reclaim for VRAM manager
-:16: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 29 lines checked


