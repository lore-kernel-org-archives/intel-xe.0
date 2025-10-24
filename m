Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062DBCCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 09:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C8710EA15;
	Fri, 24 Oct 2025 09:38:23 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8517210EA0F;
 Fri, 24 Oct 2025 09:38:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_display_parent_interf?=
 =?utf-8?q?ace_for_runtime_pm_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 09:38:22 -0000
Message-ID: <176129870254.50995.13992183120672986019@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024093113.1119070-1-jouni.hogander@intel.com>
In-Reply-To: <20251024093113.1119070-1-jouni.hogander@intel.com>
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

Series: Use display parent interface for runtime pm (rev2)
URL   : https://patchwork.freedesktop.org/series/156308/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55d659e6c69c0c3becd412a64b551ff79f1832e7
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Oct 24 12:31:13 2025 +0300

    drm/xe/display: Use display parent interface for xe runtime pm
    
    Start using display parent interface for xe runtime pm.
    
    v2: keep xe_display_rpm.c
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch c840596036111afb71465977a49618cd19ca6e8b drm-intel
e3dad29e1781 drm/{i915, xe}/display: pass parent interface to display probe
-:71: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1651:
+						 const struct intel_display_parent_interface *parent)

-:102: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#102: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:317:
+						 const struct intel_display_parent_interface *parent);

-:240: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#240: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 172 lines checked
9867b024bc59 drm/{i915, xe}/display: Add display runtime pm parent interface
01492eb2bf16 drm/i915/display: Runtime pm wrappers for display parent interface
22fc676daaf3 drm/xe/display: Runtime pm wrappers for display parent interface
-:133: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#133: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
eadcab23d6fb drm/i915/display: Use display parent interface for i915 runtime pm
55d659e6c69c drm/xe/display: Use display parent interface for xe runtime pm


