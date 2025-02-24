Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C2C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 23:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6380A10E075;
	Mon, 24 Feb 2025 23:19:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B9E10E075;
 Mon, 24 Feb 2025 23:19:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_reduce_displa?=
 =?utf-8?q?y_dependencies_on_core?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 23:19:46 -0000
Message-ID: <174043918648.1760365.12269607799909450689@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740412806.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740412806.git.jani.nikula@intel.com>
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

Series: drm/i915: reduce display dependencies on core
URL   : https://patchwork.freedesktop.org/series/145340/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a08b0f03fc094319c65f86503b9e08f375bc7c47
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Feb 24 18:00:49 2025 +0200

    drm/i915: split out i915_gtt_view_types.h from i915_vma_types.h
    
    In the interest of limiting the display dependencies on i915 core
    headers, split out i915_gtt_view_types.h from i915_vma_types.h, and only
    include the new header from intel_display_types.h.
    
    Reuse the new header from xe compat code too, failing build if partial
    view is used in display code.
    
    Side note: Why would we ever have set enum i915_gtt_view_type values to
    size of each type?! What an insane hack.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0bd853a9790bbe9c4ccf3bf2c521958d1df41d54 drm-intel
55542eeb556e drm/i915: relocate intel_plane_ggtt_offset() to intel_atomic_plane.c
a08b0f03fc09 drm/i915: split out i915_gtt_view_types.h from i915_vma_types.h
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 144 lines checked


