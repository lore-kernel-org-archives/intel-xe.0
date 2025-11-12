Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6A8CCFA1A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 15:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6426410E0A9;
	Wed, 12 Nov 2025 15:29:17 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477EB10E0A9;
 Wed, 12 Nov 2025 15:29:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/irq?=
 =?utf-8?q?=3A_clarify_display_and_parent_driver_interfaces_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Nov 2025 15:29:16 -0000
Message-ID: <176296135628.45673.3352734568907993219@10055242dc62>
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

Series: drm/{i915, xe}/irq: clarify display and parent driver interfaces (rev3)
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
commit 8d560f9787342d45788c52715a7841efb039fe10
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Nov 12 16:18:24 2025 +0200

    drm/{i915,xe}/display: move irq calls to parent interface
    
    Add an irq parent driver interface for the .enabled and .synchronize
    calls. This lets us drop the dependency on i915_drv.h and i915_irq.h in
    multiple places, and subsequently remove the compat i915_irq.h and
    i915_irq.c files along with the display/ext directory from xe
    altogether.
    
    Introduce new intel_parent.[ch] as the wrapper layer to chase the
    function pointers and convert between generic and more specific display
    types.
    
    v2: Keep static wrappers in intel_display_irq.c (Ville)
    
    v3: Full blown wrappers in intel_parent.[ch] (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch bef8705a5dfd309ce7304ca98b11566045bc4018 drm-intel
883763eec3cc drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
-:63: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:61:
+	WARN(1,
+		 "Interrupt register 0x%x is not zero: 0x%08x\n",

total: 0 errors, 0 warnings, 1 checks, 203 lines checked
d6246550052d drm/i915/display: convert the display irq interfaces to struct intel_display
8d560f978734 drm/{i915,xe}/display: move irq calls to parent interface
-:416: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#416: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 511 lines checked


