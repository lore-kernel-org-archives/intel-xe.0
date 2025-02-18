Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAA1C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 10:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F51510E361;
	Tue, 18 Feb 2025 10:17:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9AE10E662;
 Tue, 18 Feb 2025 10:17:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 10:17:35 -0000
Message-ID: <173987385544.3530460.17978002294992797276@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
In-Reply-To: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev5)
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
commit 0b57b43a264f4a8fd7c7fc24916159d09dbcbab0
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Feb 18 14:32:49 2025 +0530

    drm/i915/display: Add i915 hook for format_mod_supported_async
    
    Hook up the newly added plane function pointer
    format_mod_supported_async to populate the modifiers/formats supported
    by asynchronous flips.
    
    v5: Correct the if condition for modifier support check (Chaitanya)
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
f392c2cc7c55 drm/plane: Add new plane property IN_FORMATS_ASYNC
-:102: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#102: FILE: include/drm/drm_plane.h:567:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 0 warnings, 1 checks, 62 lines checked
535252b2196d drm/plane: modify create_in_formats to accommodate async
-:32: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#32: FILE: drivers/gpu/drm/drm_plane.c:199:
+						 uint32_t format,

total: 0 errors, 0 warnings, 1 checks, 72 lines checked
0b57b43a264f drm/i915/display: Add i915 hook for format_mod_supported_async
-:25: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#25: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:512:
 }
+static bool intel_plane_async_formats(struct intel_plane *plane, uint32_t format)

-:44: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#44: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:531:
+						   uint32_t format,

total: 0 errors, 0 warnings, 2 checks, 77 lines checked


