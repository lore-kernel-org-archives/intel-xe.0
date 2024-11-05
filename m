Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5957D2B921
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 12:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455310E591;
	Tue,  5 Nov 2024 12:57:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EA910E591;
 Tue,  5 Nov 2024 12:57:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 12:57:03 -0000
Message-ID: <173081142369.1412099.16588456988438138028@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105102608.3912133-1-arun.r.murthy@intel.com>
In-Reply-To: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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

Series: Expose modifiers/formats supported by async flips
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
commit d664f755aab0f7b1765e75c9c7fd26bf078cf50e
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Nov 5 15:56:08 2024 +0530

    drm/i915/display: Add async supported formats/modifiers
    
    Add the formats/modifiers supported by asynchronous flips by the
    platform based on the plane capabilities.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 0f5cd39d188cbedacf9e764749b65a328d33c8ea drm-intel
1a42e9b8485f drm/plane: Add new plane property IN_FORMATS_ASYNC
-:158: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#158: FILE: include/drm/drm_plane.h:662:
+	uint32_t *async_format_types;

-:168: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u64' over 'uint64_t'
#168: FILE: include/drm/drm_plane.h:672:
+	uint64_t *async_modifiers;

total: 0 errors, 0 warnings, 2 checks, 137 lines checked
d1d4c672d055 drm/i915/fb: Add async field to the modifiers description
188bdbdde113 drm/i915/display: Add async_flip flag in get_modifiers
d664f755aab0 drm/i915/display: Add async supported formats/modifiers
-:49: WARNING:LONG_LINE: line length of 123 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2691:
+									      skl_get_plane_caps(dev_priv, pipe, plane_id),

-:52: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#52: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2694:
+								   skl_get_plane_caps(dev_priv, pipe, plane_id),

total: 0 errors, 2 warnings, 0 checks, 40 lines checked


