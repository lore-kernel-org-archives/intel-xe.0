Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479FCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 09:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90F910E6C3;
	Wed, 24 Sep 2025 09:10:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492410E6C3;
 Wed, 24 Sep 2025 09:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/gem=3A_add_i915?=
 =?utf-8?q?=5Fgem=5Ffence=5Fwait=5Fpriority=5Fdisplay=28=29_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 09:10:28 -0000
Message-ID: <175870502840.360964.9811178520877460683@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250924085129.146173-1-jani.nikula@intel.com>
In-Reply-To: <20250924085129.146173-1-jani.nikula@intel.com>
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

Series: drm/i915/gem: add i915_gem_fence_wait_priority_display() helper
URL   : https://patchwork.freedesktop.org/series/154943/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da158411b60bb4081989749ae9b5ea151e6f8fa7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Sep 24 11:51:29 2025 +0300

    drm/i915/gem: add i915_gem_fence_wait_priority_display() helper
    
    Add i915_gem_fence_wait_priority_display() helper to wait with
    I915_PRIORITY_DISPLAY. This drops the intel_plane.c dependency on
    i915_scheduler_types.h, and allows us to remove the compat header from
    xe.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 53ee7e373ce454dc86b39ac27aa84d95c536b670 drm-intel
da158411b60b drm/i915/gem: add i915_gem_fence_wait_priority_display() helper
-:91: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#91: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 54 lines checked


