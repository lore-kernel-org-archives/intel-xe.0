Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33FCC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 20:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6C310E2B9;
	Thu, 24 Jul 2025 20:04:17 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3809810E2B9;
 Thu, 24 Jul 2025 20:04:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hw=5Fengine=5Fgrou?=
 =?utf-8?q?p=3A_Avoid_call_kfree=28=29_for_drmm=5Fkzalloc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 20:04:17 -0000
Message-ID: <175338745724.187925.18350329383788703717@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724193854.1124510-2-shuicheng.lin@intel.com>
In-Reply-To: <20250724193854.1124510-2-shuicheng.lin@intel.com>
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

Series: drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()
URL   : https://patchwork.freedesktop.org/series/152094/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 19d63b8b12c1749f0ac41be67def65322c574f1e
Author: Shuicheng Lin <shuicheng.lin@intel.com>
Date:   Thu Jul 24 19:38:55 2025 +0000

    drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()
    
    Memory allocated with drmm_kzalloc() should not be freed using kfree(), as it
    is managed by the DRM subsystem. The memory will be automatically freed when
    the associated drm_device is released.
    These 3 group pointers are allocated using drmm_kzalloc() in hw_engine_group_alloc(),
    so they don't require manual deallocation.
    
    Fixes: 67979060740f ("drm/xe/hw_engine_group: Fix potential leak")
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch e84ae65b0196f8c961dcc7f9149912d60bc28a68 drm-intel
19d63b8b12c1 drm/xe/hw_engine_group: Avoid call kfree() for drmm_kzalloc()
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Memory allocated with drmm_kzalloc() should not be freed using kfree(), as it

total: 0 errors, 1 warnings, 0 checks, 46 lines checked


