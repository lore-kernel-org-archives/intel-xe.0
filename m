Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ADCFF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 13:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EDA10EC29;
	Tue, 28 Apr 2026 13:42:27 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B41610EC21;
 Tue, 28 Apr 2026 13:42:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Destroy_mutex_o?=
 =?utf-8?q?n_gpu=5Fbuddy=5Finit_failure_in_VRAM_manager_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 13:42:25 -0000
Message-ID: <177738374549.21512.4671549414336661969@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
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

Series: drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM manager init
URL   : https://patchwork.freedesktop.org/series/165619/
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
commit be233e4006226334d66d3f5ff25887aa96c38498
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Apr 28 16:02:03 2026 +0530

    drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM manager init
    
    In __xe_ttm_vram_mgr_init(), if gpu_buddy_init() fails, the function
    returns early without calling mutex_destroy() on mgr->lock which was
    previously initialized via mutex_init(). The normal cleanup path in
    xe_ttm_vram_mgr_fini() is registered via drmm_add_action_or_reset()
    only after gpu_buddy_init() succeeds, so it never runs for this error
    case.
    
    Add mutex_destroy() before the early return to properly clean up the
    initialized mutex.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM manager")
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch e066eb26712bca7174e694a358351c50a38661d6 drm-intel
be233e400622 drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM manager init
-:17: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")'
#17: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM manager")

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


