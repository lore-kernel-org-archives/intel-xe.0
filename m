Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7175AD64072
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 18:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAC310E277;
	Fri,  8 Nov 2024 18:26:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C860110E277;
 Fri,  8 Nov 2024 18:26:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pmu=3A_PMU_interfa?=
 =?utf-8?q?ce_for_Xe_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 18:26:29 -0000
Message-ID: <173109038981.1428955.15540936363158033644@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev4)
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
commit 18d5e995636c8d99f5c3ecd0413d6714f3cd7f19
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Fri Nov 8 10:15:12 2024 -0800

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
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 7881884ed71da8aae8eb6b6e910c2fbce09a7436 drm-intel
09c14406fa60 drm/xe/pmu: Enable PMU interface
-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 732 lines checked
b50c3fc9768d drm/xe/pmu: Add GT C6 events
18d5e995636c drm/xe/pmu: Add GT frequency events
-:104: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#104: FILE: drivers/gpu/drm/xe/xe_pmu.c:145:
+			     BITS_PER_TYPE(typeof_member(struct xe_pmu,
+					   enable)) - 1);

total: 0 errors, 0 warnings, 1 checks, 405 lines checked


