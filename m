Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE927EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 13:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C72E10E03F;
	Tue, 27 Jun 2023 13:05:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4627A10E03F;
 Tue, 27 Jun 2023 13:05:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43C87A00CC;
 Tue, 27 Jun 2023 13:05:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@intel.com>
Date: Tue, 27 Jun 2023 13:05:00 -0000
Message-ID: <168787110027.2458.18274681136673355468@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pmu=3A_Enable_PMU_interface_=28rev2=29?=
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

Series: drm/xe/pmu: Enable PMU interface (rev2)
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
commit 599be1fe6c1e4819af3f217d845c675722ea0b9f
Author: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Date:   Tue Jun 27 17:51:13 2023 +0530

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
    
    perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
               time             counts unit events
         1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
         9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
        10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
        10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
    
    The pmu base implementation is taken from i915.
    
    v2:
    Store last known value when device is awake return that while the GT is
    suspended and then update the driver copy when read during awake.
    
    Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
+ /mt/dim checkpatch f135580b567158b23349db5544259730dfb91e78 drm-intel
da50f9f65 drm/xe: Get GT clock to nanosecs
599be1fe6 drm/xe/pmu: Enable PMU interface
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:23: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#23: 
     1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/

-:41: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#41: 
Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

-:42: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#42: 
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

-:193: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#193: 
new file mode 100644

-:198: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#198: FILE: drivers/gpu/drm/xe/xe_pmu.c:1:
+/*

-:199: WARNING:SPDX_LICENSE_TAG: Misplaced SPDX-License-Identifier tag - use line 1 instead
#199: FILE: drivers/gpu/drm/xe/xe_pmu.c:2:
+ * SPDX-License-Identifier: MIT

-:231: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#231: FILE: drivers/gpu/drm/xe/xe_pmu.c:34:
+	XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));

-:753: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#753: FILE: drivers/gpu/drm/xe/xe_pmu.c:556:
+	XE_BUG_ON(!pmu->base.event_init);

-:767: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#767: FILE: drivers/gpu/drm/xe/xe_pmu.c:570:
+	XE_BUG_ON(!pmu->base.event_init);

total: 0 errors, 9 warnings, 0 checks, 974 lines checked


