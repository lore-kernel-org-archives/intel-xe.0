Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1173FC369D3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 11:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF87210E3D7;
	Mon, 28 Apr 2025 11:29:18 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CFC10E3D7;
 Mon, 28 Apr 2025 11:29:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/alpm=3A_Introduc?=
 =?utf-8?q?e_has=5Falpm_to_simplify_alpm_check_in_enable/disable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 11:29:17 -0000
Message-ID: <174583975710.19587.6829102004684664870@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428095838.3154962-1-animesh.manna@intel.com>
In-Reply-To: <20250428095838.3154962-1-animesh.manna@intel.com>
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

Series: drm/i915/alpm: Introduce has_alpm to simplify alpm check in enable/disable
URL   : https://patchwork.freedesktop.org/series/148355/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b67d1894d695719716a8ab33cb5f2d88195fca7
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Mon Apr 28 15:28:38 2025 +0530

    drm/i915/alpm: Introduce has_alpm to simplify alpm check in enable/disable
    
    Simplify alpm check in enable/disable with has_alpm.
    Add a check for alpm during lobf disable which can be enabled
    with panel replay/psr2.
    
    Suggested-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 4dfede9f7f69716060d29d84a1267f893da9dbee drm-intel
2b67d1894d69 drm/i915/alpm: Introduce has_alpm to simplify alpm check in enable/disable
-:49: WARNING:LINE_SPACING: Missing a blank line after declarations
#49: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:424:
+			u32 alpm_ctl = intel_de_read(display, ALPM_CTL(display, cpu_transcoder));
+			if (alpm_ctl & ALPM_CTL_LOBF_ENABLE) {

-:51: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#51: FILE: drivers/gpu/drm/i915/display/intel_alpm.c:426:
+				intel_de_write(display, ALPM_CTL(display, cpu_transcoder), alpm_ctl);

total: 0 errors, 2 warnings, 0 checks, 66 lines checked


