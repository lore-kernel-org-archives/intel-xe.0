Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35B8D637B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 20:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD13110E1E0;
	Wed, 13 Nov 2024 20:40:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B77C10E1E0;
 Wed, 13 Nov 2024 20:40:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 20:40:03 -0000
Message-ID: <173153040304.3708786.6175265924235817131@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/139121/
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
commit b41e0636855fbad2c5eb22e3e981065369c38a66
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Nov 13 09:42:42 2024 -0800

    drm/xe/pmu: Add GT frequency events
    
    Define PMU events for GT frequency (actual and requested). This is
    a port from the i915 driver implementation, where an internal timer
    is used to aggregate GT frequencies over certain fixed interval.
    Following PMU events are being added-
    
      xe_0000_00_02.0/actual-frequency-gt0/              [Kernel PMU event]
      xe_0000_00_02.0/actual-frequency-gt1/              [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt0/           [Kernel PMU event]
      xe_0000_00_02.0/requested-frequency-gt1/           [Kernel PMU event]
    
    Standard perf commands can be used to monitor GT frequency-
      $ perf stat -e xe_0000_00_02.0/requested-frequency-gt0/ -I1000
    
         1.001175175                700 M    xe/requested-frequency-gt0/
         2.005891881                703 M    xe/requested-frequency-gt0/
         3.007318169                700 M    xe/requested-frequency-gt0/
    
    Actual/requested frequencies will be 0 when GT is suspended.
    
    v2: Checkpatch fix, moved timer code to this patch
    v3: Fix kunit issue
    v4: Checkpatch warning fixes
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch d8d960b20b0dc59b06c24fc210387b9c158edf70 drm-intel
e0d5305ad71a drm/xe/pmu: Enable PMU interface
-:23: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#23: 
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

-:24: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#24: 
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

-:115: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#115: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 734 lines checked
7a4941cf8376 drm/xe/pmu: Add GT C6 events
b41e0636855f drm/xe/pmu: Add GT frequency events


