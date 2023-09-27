Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E80E80AA0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2721A10E399;
	Wed, 27 Sep 2023 07:34:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23FD610E399;
 Wed, 27 Sep 2023 07:34:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 20125A03D2;
 Wed, 27 Sep 2023 07:34:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 27 Sep 2023 07:34:35 -0000
Message-ID: <169580007512.20756.8741894948083097295@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
In-Reply-To: <20230927073125.3825836-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Xe?=
 =?utf-8?q?_dma_fence_handling_on_atomic_commit?=
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

Series: Xe dma fence handling on atomic commit
URL   : https://patchwork.freedesktop.org/series/124312/
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
commit fe093a51d78fe7fa84c9c84fee7580b6078092f0
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Sep 27 10:31:25 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    Add i915_sw_fence.h compatibility header and implement sw fence
    interfaces for display code usage.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
1bfb1e4df Revert "FIXME: drm/i915: fence stuff"
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '3e04b3baaaeb2ef9f7d9e5f26239b5c41061faf2', maybe rebased or not pulled?
#9: 
This reverts commit 3e04b3baaaeb2ef9f7d9e5f26239b5c41061faf2.

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
b3309b47a drm/i915/display: Move fence completion wait away from display code
-:93: CHECK:LINE_SPACING: Please don't use multiple blank lines
#93: FILE: drivers/gpu/drm/i915/i915_sw_fence.c:615:
+
+

total: 0 errors, 0 warnings, 1 checks, 97 lines checked
fe093a51d fixup! drm/xe/display: Implement display support
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:44: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#44: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h:1:
+/*

-:45: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#45: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h:2:
+ * SPDX-License-Identifier: MIT

-:77: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#77: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h:34:
+};
+static inline void i915_sw_fence_init(struct i915_sw_fence *fence, i915_sw_fence_notify_t fn)

-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h:54:
+static inline int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
+				  struct dma_fence *dma,

-:115: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#115: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h:72:
+static inline int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
+				    struct dma_resv *resv,

total: 0 errors, 3 warnings, 3 checks, 125 lines checked


