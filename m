Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A93DC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 23:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6830210EB63;
	Fri,  8 Dec 2023 23:44:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4192610EB63;
 Fri,  8 Dec 2023 23:44:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3E12EAA3D8;
 Fri,  8 Dec 2023 23:44:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915=3A_move_display_info_related_macros_to_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 23:44:55 -0000
Message-ID: <170207909525.7325.12497133923042677393@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208204246.958662-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208204246.958662-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/i915: move display info related macros to display
URL   : https://patchwork.freedesktop.org/series/127584/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c11a4666645f2ea85f9ec75411fdf06f17be687a
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Dec 8 15:42:46 2023 -0500

    fixup! drm/xe/display: Implement display support
    
    Adjust to display changes that already landed on drm-next for a smooth
    rebase.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
f31c74c0b drm/i915: move display info related macros to display
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:105:
+#define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
+				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)

-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'i915' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:107:
+#define IS_DISPLAY_VER(i915, from, until) \
+	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))

total: 0 errors, 0 warnings, 2 checks, 35 lines checked
c11a46666 fixup! drm/xe/display: Implement display support


