Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D8E7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566A10E2A9;
	Tue,  3 Oct 2023 14:48:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2B5810E2A9;
 Tue,  3 Oct 2023 14:48:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A08ABAADF3;
 Tue,  3 Oct 2023 14:48:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 03 Oct 2023 14:48:33 -0000
Message-ID: <169634451365.4383.15290124827069567962@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <cover.1696343521.git.jani.nikula@intel.com>
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?/display=3A_clarify_display_configuration?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: xe/display: clarify display configuration
URL   : https://patchwork.freedesktop.org/series/124561/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f7f13b3519e9674feafd48a845122c7e815f116a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Oct 3 17:34:57 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    These checks no longer make sense, as has_display() has already been
    checked.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 02ab43e36623665d8644d46162bd4ec5eeb68489 drm-intel
8dc6e7fdf fixup! drm/xe/display: Implement display support
a0ac0b9a0 fixup! drm/xe/display: Implement display support
-:24: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#24: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:94:
+#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
+				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)

total: 0 errors, 0 warnings, 1 checks, 12 lines checked
88cf90ad6 fixup! drm/xe/display: Implement display support
8c4f40b79 fixup! drm/xe: Introduce Xe assert macros
eef6cf81e fixup! drm/xe/display: Implement display support
57ca09b14 fixup! drm/xe/display: Implement display support
69b028c80 fixup! drm/xe/display: Implement display support
9dead1467 fixup! drm/xe/display: Implement display support
4d313e85d fixup! drm/xe/display: Implement display support
f7f13b351 fixup! drm/xe/display: Implement display support


