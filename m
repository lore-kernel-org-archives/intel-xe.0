Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F10C021A0
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60EC10E26A;
	Wed, 12 Feb 2025 19:43:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E8B10E26A;
 Wed, 12 Feb 2025 19:43:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 19:43:44 -0000
Message-ID: <173938942433.1399223.15015768423084682189@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-0-dc182281dca3@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev4)
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
commit ff6d8cb82e1237a099dcf2fb00e9d6c8a5a26f10
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Feb 12 21:48:24 2025 +0530

    drm/i915/display: Add i915 hook for format_mod_supported_async
    
    Hook up the newly added plane function pointer
    format_mod_supported_async to populate the modifiers/formats supported
    by asynchronous flips.
    
    v5: Correct the if condition for modifier support check (Chaitanya)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch b9696aa14a67620661572e94f4141df2a4b6b5cd drm-intel
be2fed6eb856 drm/plane: Add new plane property IN_FORMATS_ASYNC
-:97: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#97: FILE: include/drm/drm_plane.h:567:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 0 warnings, 1 checks, 59 lines checked
b4625435fa2d drm/plane: modify create_in_formats to accommodate async
-:29: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#29: FILE: drivers/gpu/drm/drm_plane.c:196:
+						 uint32_t format,

total: 0 errors, 0 warnings, 1 checks, 81 lines checked
ff6d8cb82e12 drm/i915/display: Add i915 hook for format_mod_supported_async
-:23: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#23: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:512:
 }
+static bool intel_plane_async_formats(struct intel_plane *plane, uint32_t format)

-:42: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#42: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:531:
+						   uint32_t format,

total: 0 errors, 0 warnings, 2 checks, 77 lines checked


