Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2193EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 04:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F8010E095;
	Mon, 19 Jun 2023 04:50:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8BE1210E095;
 Mon, 19 Jun 2023 04:50:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 51162A7DFF;
 Mon, 19 Jun 2023 04:50:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@intel.com>
Date: Mon, 19 Jun 2023 04:50:58 -0000
Message-ID: <168715025832.16529.18004550656833860760@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230619045128.3716798-1-aravind.iddamsetty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pmu=3A_Enable_PMU_interface?=
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

Series: drm/xe/pmu: Enable PMU interface
URL   : https://patchwork.freedesktop.org/series/119504/
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
commit 9b47915a1aa2b2c58a6109a6bf6bc4d9f3944516
Author: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Date:   Mon Jun 19 10:21:28 2023 +0530

    drm/xe/pmu: Enable PMU interface
    
    There are a set of engine group busyness counters provided by HW which are
    perfect fit to be exposed via PMU perf events.
    
    BSPEC: 46559, 46560, 46722, 46729
    
    events can be listed using:
    perf list
      xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
      xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
      xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
      xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
      xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
    
    and can be read using:
    perf stat -e "xe_0000_03_00.0/render-group-busy-gt0/" -I 1000
               time             counts unit events
         1.001343319                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
         2.011523336                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
         3.014168811                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
         4.016671838                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
         5.018363448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
         6.020125417 18446743376875220992 ns xe_0000_03_00.0/render-group-busy-gt0/
         7.021584533 18446744073708230656 ns xe_0000_03_00.0/render-group-busy-gt0/
         8.029878236       696835650983 ns xe_0000_03_00.0/render-group-busy-gt0/
         9.032367313                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
        10.034799448                  0 ns xe_0000_03_00.0/render-group-busy-gt0/
    
    The pmu base implementation is taken from i915.
    
    Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
+ /mt/dim checkpatch 8bf305693c7aa4cadfa30d28ce9ed635711142d3 drm-intel
0c7f872ab drm/xe: Get GT clock to nanosecs
9b47915a1 drm/xe/pmu: Enable PMU interface
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:22: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#22: 
     1.001343319                  0 ns xe_0000_03_00.0/render-group-busy-gt0/

-:35: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#35: 
Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

-:36: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#36: 
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

-:173: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#173: 
new file mode 100644

-:178: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#178: FILE: drivers/gpu/drm/xe/xe_pmu.c:1:
+/*

-:179: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#179: FILE: drivers/gpu/drm/xe/xe_pmu.c:2:
+ * SPDX-License-Identifier: MIT

-:640: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#640: FILE: drivers/gpu/drm/xe/xe_pmu.c:463:
+	XE_BUG_ON(!pmu->base.event_init);

-:654: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#654: FILE: drivers/gpu/drm/xe/xe_pmu.c:477:
+	XE_BUG_ON(!pmu->base.event_init);

total: 0 errors, 8 warnings, 0 checks, 831 lines checked


