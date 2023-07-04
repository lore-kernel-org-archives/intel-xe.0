Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2CEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 17:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415D110E304;
	Tue,  4 Jul 2023 17:28:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69A8E10E304;
 Tue,  4 Jul 2023 17:28:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 65A0DA47E9;
 Tue,  4 Jul 2023 17:28:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Tue, 04 Jul 2023 17:28:21 -0000
Message-ID: <168849170141.28590.14102772452896473839@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704153243.2489821-1-jani.nikula@intel.com>
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/display=3A_reuse_soc/_code_from_i915?=
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

Series: drm/xe/display: reuse soc/ code from i915
URL   : https://patchwork.freedesktop.org/series/120181/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d5a4b5d4f65500d963704908c6e3f17ecd143ab6
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Jul 4 18:32:43 2023 +0300

    fixup! drm/xe/display: Implement display support
    
    Use soc/intel_pch.[ch] from i915 instead of copy-paste.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch cd26cb9c94f4f04586f04fca4e94181c53854c46 drm-intel
33518cc52 drm/i915/dram: replace __raw_uncore_read32() with intel_uncore_read_fw()
8f4e8a910 drm/xe/mmio: add xe_mmio_read16()
a4e7de957 fixup! drm/xe/display: Implement display support
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

-:65: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#65: FILE: drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h:1:
+#include "../../../i915/soc/intel_dram.h"

total: 0 errors, 2 warnings, 0 checks, 66 lines checked
d5a4b5d4f fixup! drm/xe/display: Implement display support
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

-:54: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#54: FILE: drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h:1:
+#include "../../../i915/soc/intel_pch.h"

total: 0 errors, 2 warnings, 0 checks, 37 lines checked


