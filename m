Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F598C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054B210E87E;
	Thu,  7 Dec 2023 11:20:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A709010E87E;
 Thu,  7 Dec 2023 11:20:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 99441A0169;
 Thu,  7 Dec 2023 11:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_remaining_ifdefs_i?=
 =?utf-8?q?n_hack_patch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Thu, 07 Dec 2023 11:20:22 -0000
Message-ID: <170194802262.28722.12433226158605361971@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
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

Series: Handle remaining ifdefs in hack patch
URL   : https://patchwork.freedesktop.org/series/127488/
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
commit f331b8e54af4a3fa6bc525ff03c4ab41ea721138
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Dec 7 13:17:06 2023 +0200

    fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
    
    We are defining I915_TILING_X and  I915_TILING_Y as 0. No need for these
    ifdefs anymore.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 668d13abebbbc3812de86be1f8477475e1d90728 drm-intel
dc3540371 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
4e5b4b3b6 drm/i915/display: Use i915_gem_object_get_dma_address to get dma address
9836a90b1 fixup! drm/xe/display: Implement display support
c9cff33b7 fixup! drm/xe/display: Implement display support
-:23: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#23: FILE: drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:21:
+static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
+					  u32 ofs, u64 *ptr, u32 size)

total: 0 errors, 0 warnings, 1 checks, 35 lines checked
5db29bde9 fixup! drm/xe/display: Implement display support
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

-:21: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#21: FILE: drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h:1:
+/* Empty */

total: 0 errors, 2 warnings, 0 checks, 1 lines checked
ff468d81e fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
83587665f fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
a39df42b3 fixup! drm/xe/display: Implement display support
f331b8e54 fixup! FIXME: drm/i915/display: Remaining changes to make xe compile


