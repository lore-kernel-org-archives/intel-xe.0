Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D6D5B170
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73F10E664;
	Mon, 15 Dec 2025 17:31:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0358910E642;
 Mon, 15 Dec 2025 17:31:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_c?=
 =?utf-8?q?lean_up_and_deduplicate_initial_plane_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 17:31:37 -0000
Message-ID: <176581989789.90193.12536018704025572041@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1765812266.git.jani.nikula@intel.com>
In-Reply-To: <cover.1765812266.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}: clean up and deduplicate initial plane handling
URL   : https://patchwork.freedesktop.org/series/159031/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 214c2b5a0abf919fc69947ae86b2e72fdfd37bfe
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Dec 15 17:28:29 2025 +0200

    drm/i915: drop dependency on struct intel_display from i915 initial plane
    
    The i915 core initial plane handling doesn't actually need struct
    intel_display for anything. Switch to i915 specific data structures in
    i915 core code.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 342b565445c93d6fb5221aa9c23be20d65fa16f2 drm-intel
3c5e632a3cd2 drm/i915: move display/intel_plane_initial.c to i915_initial_plane.c
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
rename from drivers/gpu/drm/i915/display/intel_plane_initial.c

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
ad48ee1ee7de drm/xe/display: rename xe_plane_initial.c to xe_initial_plane.c
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
rename from drivers/gpu/drm/xe/display/xe_plane_initial.c

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
52d1f13c13bb drm/i915: rename intel_plane_initial.h to intel_initial_plane.h
-:78: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#78: 
rename from drivers/gpu/drm/i915/display/intel_plane_initial.h

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
e7b6c8e9f73d drm/{i915, xe}: move initial plane calls to parent interface
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
7aa7e6bef831 drm/{i915, xe}: deduplicate intel_initial_plane_config() between i915 and xe
1e82b8803897 drm/{i915, xe}: deduplicate plane_config_fini() between i915 and xe
4a3a74655761 drm/{i915, xe}: start deduplicating intel_find_initial_plane_obj() between i915 and xe
4ac5ee4b427b drm/i915: return plane_state from intel_reuse_initial_plane_obj()
cbd2143fdeb0 drm/xe: return plane_state from intel_reuse_initial_plane_obj()
58d98965a878 drm/i915: further deduplicate intel_find_initial_plane_obj()
-:367: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#367: FILE: include/drm/intel/display_parent_interface.h:35:
+	struct drm_gem_object *(*alloc_obj)(struct drm_crtc *crtc, struct intel_initial_plane_config *plane_config);

total: 0 errors, 1 warnings, 0 checks, 327 lines checked
f99ce4ccd042 drm/{i915, xe}: deduplicate intel_alloc_initial_plane_obj() FB modifier checks
2689ff7548c1 drm/{i915,xe}: deduplicate initial plane setup
d21420b5dfbb drm/{i915, xe}: pass struct drm_plane_state instead of struct drm_crtc to ->setup
-:90: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#90: FILE: include/drm/intel/display_parent_interface.h:37:
+	int (*setup)(struct drm_plane_state *plane_state, struct intel_initial_plane_config *plane_config,

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
41ce8c189931 drm/{i915, xe}: pass struct drm_device instead of drm_device to ->alloc_obj
-:100: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#100: FILE: include/drm/intel/display_parent_interface.h:36:
+	struct drm_gem_object *(*alloc_obj)(struct drm_device *drm, struct intel_initial_plane_config *plane_config);

total: 0 errors, 1 warnings, 0 checks, 69 lines checked
214c2b5a0abf drm/i915: drop dependency on struct intel_display from i915 initial plane


