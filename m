Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC75BD4922B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 14:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F29B10E835;
	Fri, 12 Dec 2025 14:23:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0510E835;
 Fri, 12 Dec 2025 14:23:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_cl?=
 =?utf-8?q?ean_up_parent_interface_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 14:23:03 -0000
Message-ID: <176554938308.81112.15109710991102471274@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1765548786.git.jani.nikula@intel.com>
In-Reply-To: <cover.1765548786.git.jani.nikula@intel.com>
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

Series: drm/{i915,xe}: clean up parent interface definitions
URL   : https://patchwork.freedesktop.org/series/158862/
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
commit 17666960df2eb4ae441025caae08561dc0397350
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Dec 12 16:14:09 2025 +0200

    drm/i915/display: group and sort the parent interface wrappers better
    
    Aligning with the parent interface struct definitions, also group and
    sort the parent interface wrappers to improve clarity on where to add
    new stuff.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 39f65c105d5b1af093f9df6f3dc688a642f96456 drm-intel
c59db7662605 drm/intel: fix parent interface kernel-doc
2e9bb09fdd37 drm/intel: group individual funcs in parent interface
2f90b70842dd drm/intel: sort parent interface struct definitions and members
322f75b240f9 drm/i915: sort parent interface initialization
22582831961c drm/xe: sort parent interface initialization
17666960df2e drm/i915/display: group and sort the parent interface wrappers better
-:53: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_parent.c:68:
+int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic, struct drm_scanout_buffer *sb)

-:104: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_parent.c:191:
+	return display->parent->has_fenced_regions && display->parent->has_fenced_regions(display->drm);

total: 0 errors, 2 warnings, 0 checks, 136 lines checked


