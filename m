Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66F2D43341
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 18:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D5C10E88A;
	Thu, 11 Dec 2025 18:54:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE8E10E88A;
 Thu, 11 Dec 2025 18:54:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/pani?=
 =?utf-8?q?c=3A_move_panic_handling_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 18:54:15 -0000
Message-ID: <176547925576.78542.15568381397783416579@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1765474612.git.jani.nikula@intel.com>
In-Reply-To: <cover.1765474612.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/panic: move panic handling to parent interface
URL   : https://patchwork.freedesktop.org/series/158820/
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
commit aaeb638c1c60f350ea8c402f9c94dc2ec21a202c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Dec 11 19:37:12 2025 +0200

    drm/{i915, xe}/panic: move panic handling to parent interface
    
    Move the panic handling to the display parent interface, making display
    more independent of i915 and xe driver implementations.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d8f645c04dad21f981669f0b65191cac664735f9 drm-intel
7afc107acb08 drm/i915/panic: move i915 specific panic implementation to i915
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
rename from drivers/gpu/drm/i915/display/intel_panic.c

total: 0 errors, 1 warnings, 0 checks, 29 lines checked
aaeb638c1c60 drm/{i915, xe}/panic: move panic handling to parent interface
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
deleted file mode 100644

-:77: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/intel_parent.c:55:
+int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic, struct drm_scanout_buffer *sb)

-:110: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#110: FILE: drivers/gpu/drm/i915/display/intel_parent.h:29:
+int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic, struct drm_scanout_buffer *sb);

total: 0 errors, 3 warnings, 0 checks, 247 lines checked


