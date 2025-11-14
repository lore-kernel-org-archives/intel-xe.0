Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F446CE7AED
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 11:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105C910EA44;
	Fri, 14 Nov 2025 11:22:56 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DAF10EA3F;
 Fri, 14 Nov 2025 11:22:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_call_irq_and_?=
 =?utf-8?q?rps_through_the_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 11:22:54 -0000
Message-ID: <176311937485.55553.4423241672751940340@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1763115899.git.jani.nikula@intel.com>
In-Reply-To: <cover.1763115899.git.jani.nikula@intel.com>
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

Series: drm/i915: call irq and rps through the parent interface
URL   : https://patchwork.freedesktop.org/series/157576/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit effe9ae43ab103c2c1ec502ef6081c11b19536f8
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 14 12:26:49 2025 +0200

    drm/xe/rps: build RPS as part of xe
    
    Reduce the conditional compilation in i915 by building
    intel_display_rps.c as part of the xe module. This doesn't actually
    enable RPS on xe, because there's no parent interface implementation on
    xe side, but it's a step in the right direction.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 09454f8115d510182b41dd65a887e1eca1bce610 drm-intel
6369c392b75e drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
-:63: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:61:
+	WARN(1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",

total: 0 errors, 0 warnings, 1 checks, 203 lines checked
2826709d4bd6 drm/i915/display: convert the display irq interfaces to struct intel_display
97b7784107e0 drm/{i915, xe}/display: move irq calls to parent interface
-:416: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#416: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 511 lines checked
d060f4a25fc6 drm/i915: add .vgpu_active to parent interface
-:133: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#133: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
e91fa2bd8585 drm/i915: add .fence_support_legacy to parent interface
-:58: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_parent.c:42:
+	return display->parent->fence_support_legacy && display->parent->fence_support_legacy(display->drm);

-:93: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 65 lines checked
37ed77011b3e drm/i915/rps: store struct dma_fence in struct wait_rps_boost
1218b03e4aa1 drm/i915/rps: call RPS functions via the parent interface
f72d10269968 drm/i915/rps: postpone i915 fence check to boost
eb6a1e4cf71e drm/i915: add .fence_priority_display to parent interface
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
effe9ae43ab1 drm/xe/rps: build RPS as part of xe


