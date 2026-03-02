Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD9EB3640
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 23:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5467510E09D;
	Mon,  2 Mar 2026 23:14:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FBB10E09D;
 Mon,  2 Mar 2026 23:14:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/fron?=
 =?utf-8?q?tbuffer=3A_refactor=2C_move_calls_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 23:14:47 -0000
Message-ID: <177249328784.305661.16309928106951226211@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772475391.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772475391.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/frontbuffer: refactor, move calls to parent interface
URL   : https://patchwork.freedesktop.org/series/162448/
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
commit 974874cc7a265d8822971286f696eb27570242fb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Mar 2 20:17:39 2026 +0200

    drm/i915/frontbuffer: reduce fb for frontbuffer abbreviation usage
    
    Using fb for frontbuffer is a bit misleading, as framebuffer is the more
    common fb. Reduce fb usage in frontbuffer function naming.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch df73f8b4c9fc3c0a2668cf84f7e6ce887bc672bc drm-intel
bfa3d8fe38cd drm/i915/gem: relocate __i915_gem_object_{flush, invalidate}_frontbuffer()
c60a2ac7cc5f drm/i915/gem: unify i915 gem object frontbuffer function names
523122fb4aac drm/i915/overlay: convert from struct intel_frontbuffer to i915_frontbuffer
6ecde1fa7132 drm/intel: fix @dpt kernel-doc for parent interface
1ca1aa7f14f5 drm/{i915, xe}/frontbuffer: move frontbuffer handling to parent interface
-:146: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#146: FILE: drivers/gpu/drm/i915/display/intel_parent.c:55:
+struct intel_frontbuffer *intel_parent_frontbuffer_get(struct intel_display *display, struct drm_gem_object *obj)

-:161: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#161: FILE: drivers/gpu/drm/i915/display/intel_parent.c:70:
+void intel_parent_frontbuffer_flush_for_display(struct intel_display *display, struct intel_frontbuffer *front)

-:186: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#186: FILE: drivers/gpu/drm/i915/display/intel_parent.h:29:
+struct intel_frontbuffer *intel_parent_frontbuffer_get(struct intel_display *display, struct drm_gem_object *obj);

-:189: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#189: FILE: drivers/gpu/drm/i915/display/intel_parent.h:32:
+void intel_parent_frontbuffer_flush_for_display(struct intel_display *display, struct intel_frontbuffer *front);

-:385: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#385: 
new file mode 100644

total: 0 errors, 5 warnings, 0 checks, 411 lines checked
59460e9785dd drm/i915/frontbuffer: call parent interface directly
974874cc7a26 drm/i915/frontbuffer: reduce fb for frontbuffer abbreviation usage


