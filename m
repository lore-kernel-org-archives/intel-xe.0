Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580F4D462B2
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A9A10E71D;
	Wed, 13 Nov 2024 14:42:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4810E1B4;
 Wed, 13 Nov 2024 14:42:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_PMU_support_for_singl?=
 =?utf-8?q?e_engine_busyness?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 14:42:23 -0000
Message-ID: <173150894339.3627300.5383347946231783514@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113045549.2390980-1-riana.tauro@intel.com>
In-Reply-To: <20241113045549.2390980-1-riana.tauro@intel.com>
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

Series: Add PMU support for single engine busyness
URL   : https://patchwork.freedesktop.org/series/141259/
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
commit b9be4b851151abcfed841754b1825fb5748d2bd7
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Nov 13 10:25:49 2024 +0530

    drm/xe/pmu: Add PMU support for engine busyness
    
    PMU provides two counters (<engine>-busy-ticks-gt<n>,
    <engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
    engine busyness, user must group these 2 counters using the perf_event
    group mechanism to ensure both counters are sampled together.
    
    To list engine busyness counters use the following
    
    ./perf list
      xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
      xe_0000_03_00.0/bcs0-total-ticks-gt0/              [Kernel PMU event]
      xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
      xe_0000_03_00.0/ccs0-total-ticks-gt0/              [Kernel PMU event]
    
    Engine busyness can then be calculated as below
    busyness % = (engine active ticks/total ticks) * 100
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
8521954a3a04 drm/xe/pmu: Enable PMU interface
-:25: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#25: 
Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

-:26: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#26: 
Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
new file mode 100644

total: 0 errors, 3 warnings, 0 checks, 734 lines checked
24d713a16e87 drm/xe/pmu: Add GT C6 events
aecffc8f4fd3 drm/xe/pmu: Add GT frequency events
b4fccfc0b661 drm/xe: add function to convert xe hw engine class to user class
e5167dd37fc3 drm/xe: Add single engine busyness support
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

-:511: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#511: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:220:
+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];

total: 0 errors, 2 warnings, 0 checks, 483 lines checked
6a9c01626e42 drm/xe/guc: Expose engine busyness only for supported GuC version
b9be4b851151 drm/xe/pmu: Add PMU support for engine busyness


