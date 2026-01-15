Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56DFD41175
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 11:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B110E11C;
	Thu, 15 Jan 2026 11:39:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E529510E11C;
 Thu, 15 Jan 2026 11:39:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/pcod?=
 =?utf-8?q?e=3A_move_display_pcode_calls_to_parent_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Jan 2026 11:39:11 -0000
Message-ID: <176847715191.156800.16493284898048237893@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260115113337.4079184-1-jani.nikula@intel.com>
In-Reply-To: <20260115113337.4079184-1-jani.nikula@intel.com>
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

Series: drm/{i915, xe}/pcode: move display pcode calls to parent interface (rev2)
URL   : https://patchwork.freedesktop.org/series/159877/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c39cdd074034ba6f5494370750cf6020f3a41ce
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jan 15 13:33:37 2026 +0200

    drm/{i915, xe}/pcode: move display pcode calls to parent interface
    
    Call the parent driver pcode functions through the parent interface
    function pointers instead of expecting both to have functions of the
    same name.
    
    In i915, add the interface to existing intel_pcode.[ch], while in xe
    move them to new display/xe_display_pcode.[ch] and build it only for
    CONFIG_DRM_XE_DISPLAY=y.
    
    Do not add separate write and write_timeout calls in the
    interface. Instead, handle the default 1 ms timeout in the
    intel_parent.c glue layer.
    
    This drops the last intel_pcode.h includes from display, and allows us
    to remove the corresponding xe compat header.
    
    v2: initialize .pcode in i915
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 733664f1edf3c01cc68e6dd0bbdb135158a98a1d drm-intel
3c39cdd07403 drm/{i915, xe}/pcode: move display pcode calls to parent interface
-:350: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#350: FILE: drivers/gpu/drm/i915/display/intel_parent.c:101:
+int intel_parent_pcode_write_timeout(struct intel_display *display, u32 mbox, u32 val, int timeout_ms)

-:363: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#363: FILE: drivers/gpu/drm/i915/display/intel_parent.c:114:
+	return display->parent->pcode->request(display->drm, mbox, request, reply_mask, reply, timeout_base_ms);

-:379: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#379: FILE: drivers/gpu/drm/i915/display/intel_parent.h:41:
+int intel_parent_pcode_write_timeout(struct intel_display *display, u32 mbox, u32 val, int timeout_ms);

-:547: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#547: 
deleted file mode 100644

total: 0 errors, 4 warnings, 0 checks, 524 lines checked


