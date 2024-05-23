Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88F3C25B79
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 22:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92810EF1E;
	Thu, 23 May 2024 22:09:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6B010EF1E;
 Thu, 23 May 2024 22:09:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Expan?=
 =?utf-8?q?d_runtime=5Fpm_protection_to_atomic_commit_work?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 22:09:23 -0000
Message-ID: <171650216377.2170280.10699829530564984758@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523220318.25446-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240523220318.25446-1-rodrigo.vivi@intel.com>
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

Series: drm/i915/display: Expand runtime_pm protection to atomic commit work
URL   : https://patchwork.freedesktop.org/series/133992/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3f5f4fa8c77b012b9392955060a1305e23a9db71
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu May 23 18:03:18 2024 -0400

    drm/i915/display: Expand runtime_pm protection to atomic commit work
    
    Xe memory management relies on outer bound callers of runtime PM
    protection and it will warn us when some is missing:
    
    <4> [274.904535] xe 0000:00:02.0: Missing outer runtime PM protection
    <4> [274.905051]  ? xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    <4> [274.905118]  xe_ggtt_remove_node+0x28/0x90 [xe]
    <4> [274.905164]  __xe_unpin_fb_vma+0x91/0x120 [xe]
    <4> [274.905234]  intel_plane_unpin_fb+0x19/0x30 [xe]
    <4> [274.905306]  intel_cleanup_plane_fb+0x3d/0x50 [xe]
    <4> [274.905391]  drm_atomic_helper_cleanup_planes+0x49/0x70 [drm_kms_helper]
    <4> [274.905407]  intel_atomic_cleanup_work+0x69/0xd0 [xe]
    
    The atomic commit helpers in i915 display are already protected.
    However, they return the wakeref right before scheduling the thread
    work items, what can lead to unprotected memory accesses.
    
    Hence, expand the protections to the work items.
    
    An alternative way would be to keep the state->wakeref, returning
    them only at the workers. But this could lead in unbalanced scenarios
    if workers gets canceled. So, the preference was to keep it simple
    and get a new reference inside the thread.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1385623a20ad940dab90bfaa4bc01fe599506e09 drm-intel
3f5f4fa8c77b drm/i915/display: Expand runtime_pm protection to atomic commit work
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
<4> [274.905391]  drm_atomic_helper_cleanup_planes+0x49/0x70 [drm_kms_helper]

total: 0 errors, 1 warnings, 0 checks, 31 lines checked


