Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D550CEDE987
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DE710E259;
	Thu, 14 Sep 2023 06:50:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD78810E259;
 Thu, 14 Sep 2023 06:50:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CE295AADDA;
 Thu, 14 Sep 2023 06:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Thu, 14 Sep 2023 06:50:20 -0000
Message-ID: <169467422084.29164.8197954897187232504@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230914061317.1024579-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pmu=3A_Enable_PMU_interface_=28rev7=29?=
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

Series: drm/xe/pmu: Enable PMU interface (rev7)
URL   : https://patchwork.freedesktop.org/series/119504/
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
commit 9090a705399b79efd309d3e2cf013c423e320644
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Thu Sep 14 11:43:17 2023 +0530

    drm/xe/pmu: Enable PMU interface
    
    There are a set of engine group busyness counters provided by HW which are
    perfect fit to be exposed via PMU perf events.
    
    BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
    
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
    
    v3:
    1. drop init_samples, as storing counters before going to suspend should
    be sufficient.
    2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
    dropped helpers to store and read samples.
    3. use xe_device_mem_access_get_if_ongoing to check if device is active
    before reading the OA registers.
    4. dropped format attr as no longer needed
    5. introduce xe_pmu_suspend to call engine_group_busyness_store
    6. few other nits.
    
    v4: minor nits.
    
    v5: take forcewake when accessing the OAG registers
    
    v6:
    1. drop engine_busyness_sample_type
    2. update UAPI documentation
    
    v7:
    1. update UAPI documentation
    2. drop MEDIA_GT specific change for media busyness counter.
    
    Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch baea10eb27d49a2b8a526d87a70532ab201d140b drm-intel
729c7d23e drm/xe: Get GT clock to nanosecs
8653ca7e6 drm/xe: Use spinlock in forcewake instead of mutex
-:90: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#90: FILE: drivers/gpu/drm/xe/xe_force_wake_types.h:79:
+	spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 64 lines checked
9090a7053 drm/xe/pmu: Enable PMU interface
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
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

-:64: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#64: 
Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

-:65: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#65: 
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

-:213: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#213: 
new file mode 100644

total: 0 errors, 4 warnings, 0 checks, 903 lines checked


