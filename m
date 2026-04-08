Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331810F9951
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 15:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594A10E51A;
	Wed,  8 Apr 2026 15:28:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E8A10E51A;
 Wed,  8 Apr 2026 15:28:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_move_fence_ti?=
 =?utf-8?q?meout_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 15:28:09 -0000
Message-ID: <177566208961.443324.11915762631112818112@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1775661609.git.jani.nikula@intel.com>
In-Reply-To: <cover.1775661609.git.jani.nikula@intel.com>
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

Series: drm/i915: move fence timeout to parent interface
URL   : https://patchwork.freedesktop.org/series/164553/
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
commit c2f3c2d10ec9dca7344f3f711ed24f4c93f8506f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 8 18:21:49 2026 +0300

    drm/i915: move fence timeout to display parent interface
    
    i915 has the Kconfig option DRM_I915_FENCE_TIMEOUT, defaulting to 10
    seconds. xe doesn't use it, instead defaulting to MAX_SCHEDULE_TIMEOUT.
    
    There was an attempt to unify the behaviour by switching to
    dma_fence_wait() which defaults to MAX_SCHEDULE_TIMEOUT, but that
    resulted in CI failures. See the link below.
    
    Move the fence timeout to the optional parent interface, retaining
    existing behaviour for each driver. With this, we can drop the xe compat
    i915_config.h header.
    
    While at it, order the declarations in intel_parent.h the same way as in
    the struct.
    
    Link: https://lore.kernel.org/r/20251113155332.789554-1-jani.nikula@intel.com
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch f074368a55893ee121ba2920497b6c25e265d190 drm-intel
e02ab7457e5f drm/i915: convert i915_fence_timeout() into a proper function
c2f3c2d10ec9 drm/i915: move fence timeout to display parent interface
-:123: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#123: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 80 lines checked


