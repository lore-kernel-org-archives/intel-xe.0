Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9E0D2444A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 17:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F7510E99B;
	Thu,  4 Dec 2025 17:30:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABAA10E99A;
 Thu,  4 Dec 2025 17:30:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D=3A_m?=
 =?utf-8?q?igrate_stolen_interface_to_parent_interface=2C_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Dec 2025 17:30:51 -0000
Message-ID: <176486945195.58702.10855530217508416192@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764868989.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764868989.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}: migrate stolen interface to parent interface, cleanups
URL   : https://patchwork.freedesktop.org/series/158508/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 654687fc3e45dbc56c991fcf3cf9c7e269be5231
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Dec 4 19:24:07 2025 +0200

    drm/{i915, xe}/stolen: make insert_node, area_address, area_size optional
    
    Since the stolen memory hooks are function pointers, make some of them
    optional instead of having to define them for xe.
    
    insert_node, area_address, and area_size are only needed on platforms
    not supported by xe.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b91a982bdeb8b2c13917d3726c86cfa57ff3202d drm-intel
cdcfe1eae0a9 drm/i915/fbc: let to_intel_display() do its generic magic
440eda47cab7 drm/xe/stolen: unify interface with i915
a65832710136 drm/{i915, xe}/stolen: move stolen memory handling to display parent interface
-:34: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:395:
+					  intel_parent_stolen_node_offset(display, fbc->compressed_fb),

-:40: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#40: FILE: drivers/gpu/drm/i915/display/intel_fbc.c:399:
+					  intel_parent_stolen_node_offset(display, fbc->compressed_llb),

-:226: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#226: FILE: drivers/gpu/drm/i915/display/intel_parent.c:89:
+int intel_parent_stolen_insert_node(struct intel_display *display, struct intel_stolen_node *node, u64 size,

-:269: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#269: FILE: drivers/gpu/drm/i915/display/intel_parent.c:132:
+u64 intel_parent_stolen_node_size(struct intel_display *display, const struct intel_stolen_node *node)

-:279: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#279: FILE: drivers/gpu/drm/i915/display/intel_parent.c:142:
+void intel_parent_stolen_node_free(struct intel_display *display, const struct intel_stolen_node *node)

-:284: CHECK:LINE_SPACING: Please don't use multiple blank lines
#284: FILE: drivers/gpu/drm/i915/display/intel_parent.c:147:
+
+

-:307: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#307: FILE: drivers/gpu/drm/i915/display/intel_parent.h:34:
+int intel_parent_stolen_insert_node(struct intel_display *display, struct intel_stolen_node *node, u64 size,

-:318: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#318: FILE: drivers/gpu/drm/i915/display/intel_parent.h:45:
+u64 intel_parent_stolen_node_size(struct intel_display *display, const struct intel_stolen_node *node);

-:320: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#320: FILE: drivers/gpu/drm/i915/display/intel_parent.h:47:
+void intel_parent_stolen_node_free(struct intel_display *display, const struct intel_stolen_node *node);

-:510: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#510: 
deleted file mode 100644

total: 0 errors, 9 warnings, 1 checks, 629 lines checked
654687fc3e45 drm/{i915, xe}/stolen: make insert_node, area_address, area_size optional
-:120: WARNING:LONG_LINE_COMMENT: line length of 104 exceeds 100 columns
#120: FILE: include/drm/intel/display_parent_interface.h:54:
+	int (*insert_node)(struct intel_stolen_node *node, u64 size, unsigned int align); /* Optional */

total: 0 errors, 1 warnings, 0 checks, 98 lines checked


