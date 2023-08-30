Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF038C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 05:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DB110E4B6;
	Wed, 30 Aug 2023 05:10:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 310C610E4B6;
 Wed, 30 Aug 2023 05:10:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2D499AADE1;
 Wed, 30 Aug 2023 05:10:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
Date: Wed, 30 Aug 2023 05:10:52 -0000
Message-ID: <169337225218.15233.1621766395677309245@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230830051544.369643-1-aravind.iddamsetty@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/pmu=3A_Enable_PMU_interface_=28rev5=29?=
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

Series: drm/xe/pmu: Enable PMU interface (rev5)
URL   : https://patchwork.freedesktop.org/series/119504/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1383c6d7721be86a6e524fcb82be577a20e1d9b6
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Wed Aug 30 10:45:44 2023 +0530

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
    
    Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
    Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 7af4e65956a8d0346547567b534d49acf30085e0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


