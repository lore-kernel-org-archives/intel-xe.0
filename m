Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32B0CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 07:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95EE10E4F2;
	Tue, 11 Nov 2025 07:40:14 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50C910E4F2;
 Tue, 11 Nov 2025 07:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/irq?=
 =?utf-8?q?=3A_clarify_display_and_parent_driver_interfaces_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 07:40:13 -0000
Message-ID: <176284681366.39852.4172825382936075976@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762846363.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762846363.git.jani.nikula@intel.com>
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

Series: drm/{i915, xe}/irq: clarify display and parent driver interfaces (rev2)
URL   : https://patchwork.freedesktop.org/series/157350/
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
commit 4c9ce8e8ac6fa9f6168c88d7e8dc7c66eea007ea
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Nov 11 09:34:04 2025 +0200

    drm/{i915, xe}/display: move irq calls to parent interface
    
    Add an irq parent driver interface for the .enabled and .synchronize
    calls. This lets us drop the dependency on i915_drv.h and i915_irq.h in
    multiple places, and subsequently remove the compat i915_irq.h and
    i915_irq.c files along with the display/ext directory from xe
    altogether.
    
    Use intel_irqs_enabled() and intel_synchronize_irq() static wrappers for
    parent interface calls in intel_display_irq.c while chasing the function
    pointers everywhere else. It's still a bit uncertain if we should
    universally have wrappers for the parent interface calls or not.
    
    v2: Keep static wrappers in intel_display_irq.c (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4ce351022716985e9c1dd18583acd4d3d149cb5b drm-intel
a5d8522d18e9 drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:61:
+	WARN(1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",

total: 0 errors, 0 warnings, 1 checks, 203 lines checked
a7997a261b5e drm/i915/display: convert the display irq interfaces to struct intel_display
4c9ce8e8ac6f drm/{i915, xe}/display: move irq calls to parent interface
-:501: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#501: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 439 lines checked


