Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC1AC021A9
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 01:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B57310E00D;
	Tue, 18 Feb 2025 01:12:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7810E00D;
 Tue, 18 Feb 2025 01:12:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/=7Bi915=2Cxe=7D=3A_Move_intel=5Fpch_under_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 01:12:22 -0000
Message-ID: <173984114250.3416424.15233399663390601599@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218010224.761209-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250218010224.761209-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/{i915,xe}: Move intel_pch under display
URL   : https://patchwork.freedesktop.org/series/144987/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a0bf0c5a54333d82e7d891b1b848b0271e81c09
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Feb 17 20:02:22 2025 -0500

    drm/i915/display: Convert intel_pch towards intel_display
    
    Now that intel_pch lives under display, let's begin its
    conversion towards struct intel_display.
    
    Move the pch_type to inside intel_display and convert the
    callers.
    
    While doing it, sort intel_display_core.h include list
    alphabetically.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch bc7a84cbc968ce97e581e9e3c2d26fb0ac106482 drm-intel
9114810b59de drm/{i915,xe}: Move intel_pch under display
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
rename from drivers/gpu/drm/i915/soc/intel_pch.c

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
3a0bf0c5a543 drm/i915/display: Convert intel_pch towards intel_display
-:471: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'display' - possible side-effects?
#471: FILE: drivers/gpu/drm/i915/display/intel_pch.h:49:
+#define HAS_PCH_LPT(display)			(INTEL_PCH_TYPE(display) == PCH_LPT_H || \
+						 INTEL_PCH_TYPE(display) == PCH_LPT_LP)

total: 0 errors, 0 warnings, 1 checks, 474 lines checked


