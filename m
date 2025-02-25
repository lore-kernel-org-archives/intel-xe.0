Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB91C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 07:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E21C897AC;
	Tue, 25 Feb 2025 07:54:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C102897AC;
 Tue, 25 Feb 2025 07:54:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 07:54:36 -0000
Message-ID: <174047007656.1886527.5806235113596256530@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev9)
URL   : https://patchwork.freedesktop.org/series/140934/
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
commit 93100dadedb746da4e814e8105366ddf26e296cf
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Feb 25 13:03:53 2025 +0530

    drm/i915/display: Add i915 hook for format_mod_supported_async
    
    Hook up the newly added plane function pointer
    format_mod_supported_async to populate the modifiers/formats supported
    by asynchronous flips.
    
    v5: Correct the if condition for modifier support check (Chaitanya)
    v6: Replace uint32_t/uint64_t with u32/u64 (Jani)
    v7: Move plannar check from intel_async_flip_check_hw() to
    intel_plane_format_mod_supported_async() (Ville)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
    Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
+ /mt/dim checkpatch 32ff724d21f3ec064db2d1a034c47a76d800382f drm-intel
4330aa389d6c drm/plane: Add new plane property IN_FORMATS_ASYNC
-:103: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#103: FILE: include/drm/drm_plane.h:567:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 0 warnings, 1 checks, 62 lines checked
75a47f862a36 drm/plane: modify create_in_formats to accommodate async
-:33: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#33: FILE: drivers/gpu/drm/drm_plane.c:198:
+						       bool (*format_mod_supported)(struct drm_plane *plane,

-:34: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#34: FILE: drivers/gpu/drm/drm_plane.c:199:
+						       bool (*format_mod_supported)(struct drm_plane *plane,
+						       u32 format,

total: 0 errors, 1 warnings, 1 checks, 72 lines checked
93100dadedb7 drm/i915/display: Add i915 hook for format_mod_supported_async
-:137: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#137: FILE: drivers/gpu/drm/i915/display/intel_display.c:6192:
+		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb->format->format,
+		    new_plane_state->hw.fb->modifier)) {

total: 0 errors, 0 warnings, 1 checks, 139 lines checked


