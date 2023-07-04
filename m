Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1B0EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6BE10E12D;
	Tue,  4 Jul 2023 15:39:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F3B310E12A;
 Tue,  4 Jul 2023 15:39:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7B42FAADEC;
 Tue,  4 Jul 2023 15:39:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 04 Jul 2023 15:39:02 -0000
Message-ID: <168848514250.28591.8063674571962300526@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230704145907.7-1-francois.dugast@intel.com>
In-Reply-To: <20230704145907.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_license_identifier_to_compat_headers?=
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

Series: drm/xe: Add license identifier to compat headers
URL   : https://patchwork.freedesktop.org/series/120177/
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
commit 6786b1269a44007471455439085f1844ef0d403c
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Jul 4 14:59:07 2023 +0000

    drm/xe: Add license identifier to compat headers
    
    Ensure the license is correctly identified using SPDX license
    identifiers in compat header files.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch cd26cb9c94f4f04586f04fca4e94181c53854c46 drm-intel
6786b1269 drm/xe: Add license identifier to compat headers
-:16: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h', please use '/*' instead
#16: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h:1:
+// SPDX-License-Identifier: MIT

-:16: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#16: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h:1:
+// SPDX-License-Identifier: MIT

-:27: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h', please use '/*' instead
#27: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h:1:
+// SPDX-License-Identifier: MIT

-:27: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#27: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h:1:
+// SPDX-License-Identifier: MIT

-:38: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h', please use '/*' instead
#38: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h:1:
+// SPDX-License-Identifier: MIT

-:38: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#38: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h:1:
+// SPDX-License-Identifier: MIT

-:49: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h', please use '/*' instead
#49: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h:1:
+// SPDX-License-Identifier: MIT

-:49: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#49: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h:1:
+// SPDX-License-Identifier: MIT

-:60: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h', please use '/*' instead
#60: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h:1:
+// SPDX-License-Identifier: MIT

-:60: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#60: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h:1:
+// SPDX-License-Identifier: MIT

-:73: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h', please use '/*' instead
#73: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h:1:
+// SPDX-License-Identifier: MIT

-:73: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#73: FILE: drivers/gpu/drm/xe/compat-i915-headers/i915_vma_types.h:1:
+// SPDX-License-Identifier: MIT

-:86: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h', please use '/*' instead
#86: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h:1:
+// SPDX-License-Identifier: MIT

-:86: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#86: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h:1:
+// SPDX-License-Identifier: MIT

-:97: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h', please use '/*' instead
#97: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h:1:
+// SPDX-License-Identifier: MIT

-:97: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#97: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h:1:
+// SPDX-License-Identifier: MIT

-:108: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h', please use '/*' instead
#108: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h:1:
+// SPDX-License-Identifier: MIT

-:108: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#108: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h:1:
+// SPDX-License-Identifier: MIT

-:119: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h', please use '/*' instead
#119: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:1:
+// SPDX-License-Identifier: MIT

-:119: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#119: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:1:
+// SPDX-License-Identifier: MIT

-:132: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h', please use '/*' instead
#132: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:1:
+// SPDX-License-Identifier: MIT

-:132: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#132: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:1:
+// SPDX-License-Identifier: MIT

-:145: WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for 'drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h', please use '/*' instead
#145: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h:1:
+// SPDX-License-Identifier: MIT

-:145: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#145: FILE: drivers/gpu/drm/xe/compat-i915-headers/vlv_sideband_reg.h:1:
+// SPDX-License-Identifier: MIT

total: 0 errors, 24 warnings, 0 checks, 80 lines checked


