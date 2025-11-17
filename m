Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28B1CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA45E10E3E3;
	Mon, 17 Nov 2025 09:23:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D928C10E3E3;
 Mon, 17 Nov 2025 09:23:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_call_irq_and_?=
 =?utf-8?q?rps_through_the_parent_interface_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 09:23:20 -0000
Message-ID: <176337140088.356.5156015255449654859@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1763370930.git.jani.nikula@intel.com>
In-Reply-To: <cover.1763370930.git.jani.nikula@intel.com>
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

Series: drm/i915: call irq and rps through the parent interface (rev5)
URL   : https://patchwork.freedesktop.org/series/157576/
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
commit 9dd06756ea2263c382ef6aafbec0d6bc61eb2a82
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 17 11:16:17 2025 +0200

    drm/xe/rps: build RPS as part of xe
    
    Reduce the conditional compilation in i915 by building
    intel_display_rps.c as part of the xe module. This doesn't actually
    enable RPS on xe, because there's no parent interface implementation on
    xe side, but it's a step in the right direction.
    
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b2e41c70a5eeddce427dc6df02508b6856eb4a11 drm-intel
ee8ae87ea1ce drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
-:63: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:61:
+	WARN(1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",

total: 0 errors, 0 warnings, 1 checks, 203 lines checked
0b3b6a050336 drm/i915/display: convert the display irq interfaces to struct intel_display
7298136fe287 drm/{i915,xe}/display: move irq calls to parent interface
-:420: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#420: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 511 lines checked
3a5bc8655bc1 drm/i915: add .vgpu_active to parent interface
-:137: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#137: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
134e6678a8d8 drm/i915: add .has_fenced_regions to parent interface
-:64: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#64: FILE: drivers/gpu/drm/i915/display/intel_parent.c:42:
+	return display->parent->has_fenced_regions && display->parent->has_fenced_regions(display->drm);

-:99: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#99: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 65 lines checked
0e95a98e3a69 drm/i915/rps: store struct dma_fence in struct wait_rps_boost
6e69436fdf81 drm/i915/rps: call RPS functions via the parent interface
6581f5448cfc drm/i915/rps: postpone i915 fence check to boost
f0e5546a700f drm/i915: add .fence_priority_display to parent interface
-:101: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#101: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
9dd06756ea22 drm/xe/rps: build RPS as part of xe


