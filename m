Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931FFC02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD7210E77E;
	Wed,  5 Feb 2025 11:12:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8CB10E1C2;
 Wed,  5 Feb 2025 11:12:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 11:12:39 -0000
Message-ID: <173875395989.1392100.15173023387638158722@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
In-Reply-To: <20250205-asyn-v4-0-9a5b018e359b@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev3)
URL   : https://patchwork.freedesktop.org/series/140934/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6d1ccc5266023f492c129b8bcc5a5d11b331b6ac
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Feb 5 15:57:19 2025 +0530

    drm/i915/display: Add i915 hook for format_mod_supported_async
    
    Hook up the newly added plane function pointer
    format_mod_supported_async to populate the modifiers/formats supported
    by asynchronous flips.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 5f025a38e4ddb453bfbf89d4ab37facf07427721 drm-intel
48aeae5a394c drm/plane: Add new plane property IN_FORMATS_ASYNC
-:99: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#99: FILE: include/drm/drm_plane.h:570:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 0 warnings, 1 checks, 63 lines checked
b6fc88bb64a7 drm/plane: modify create_in_formats to accommodate async
-:25: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#25: FILE: drivers/gpu/drm/drm_plane.c:197:
+						 uint32_t format,

total: 0 errors, 0 warnings, 1 checks, 70 lines checked
6d1ccc526602 drm/i915/display: Add i915 hook for format_mod_supported_async
-:21: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#21: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:514:
 }
+static bool intel_plane_async_formats(struct intel_plane *plane, uint32_t format)

-:40: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#40: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:533:
+						   uint32_t format,

total: 0 errors, 0 warnings, 2 checks, 77 lines checked


