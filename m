Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E1FD3760
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 14:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F610E7BC;
	Wed, 25 Feb 2026 14:56:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD90410E7B9;
 Wed, 25 Feb 2026 14:56:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dpt=3A_refactori?=
 =?utf-8?q?ng=2C_move_to_parent_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 14:56:14 -0000
Message-ID: <177203137482.286940.13147751793760591596@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772030909.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772030909.git.jani.nikula@intel.com>
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

Series: drm/i915/dpt: refactoring, move to parent interface (rev2)
URL   : https://patchwork.freedesktop.org/series/161269/
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
commit ff9550e8abe66d7c99e4d34ddeaae5cce2c7f0a0
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 25 16:49:16 2026 +0200

    drm/i915/dpt: pass opaque struct intel_dpt around instead of i915_address_space
    
    struct i915_address_space is used in an opaque fashion in the display
    parent interface, but it's just one include away from being
    non-opaque. And anyway the name is rather specific.
    
    Switch to using the struct intel_dpt instead, which embeds struct
    i915_address_space anyway. With the definition hidden in i915_dpt.c,
    this can't be accidentally made non-opaque, and the type seems rather
    more generic anyway.
    
    We do have to add a new helper i915_dpt_to_vm(), as there's one case in
    intel_fb_pin_to_dpt() that requires direct access to struct
    i915_address_space. But this just underlines the point about opacity.
    
    Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86 drm-intel
e9175265ea51 drm/i915/dpt: move display/intel_dpt.c to i915_dpt.c
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
rename from drivers/gpu/drm/i915/display/intel_dpt.c

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
99d401a57a3c drm/i915/dpt: pass obj, size instead of framebuffer to intel_dpt_create()
92290bc9f75c drm/i915/dpt: move create/destroy to parent interface
-:175: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#175: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 212 lines checked
9ca9d5510f62 drm/i915/dpt: move suspend/resume to parent interface
c4496c345ffd drm/i915/dpt: remove display/intel_dpt.h
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
ed36ab33f407 drm/i915/dpt: drop _common from the DPT file names
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
rename from drivers/gpu/drm/i915/display/intel_dpt_common.c

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
066ff61c2906 drm/i915/dpt: switch to i915 runtime pm calls
28d3fb454806 drm/i915/dpt: rename i915 specific functions to i915_dpt_ prefix
4d32317d0de4 drm/i915/dpt: rename struct i915_dpt to intel_dpt
ff9550e8abe6 drm/i915/dpt: pass opaque struct intel_dpt around instead of i915_address_space


